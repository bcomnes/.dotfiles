var fs = require('fs')
var path = require('path')
var parallelLimit = require('run-parallel-limit')
var waterfall = require('run-waterfall')
var truthy = require('@bret/truthy')
var os = require('os')
var sliced = require('sliced')

var log = require('log-errback')

var proto = {
  src: path.join(os.homedir(), '.dotfiles', 'home'),
  dest: os.homedir(),

  status: function status (cb) {
    waterfall([
      fs.readdir.bind(null, this.src), // (cb) => (err, fileNames)
      getFileNames.bind(null, this.src, this.dest),
      gatherStats
    ], cb)
  },

  link: function link (opts, cb) {
    var self = this
    var defaults = {
      action: 'overwrite'
    // "overwrite_all"
    // "backup"
    // "backup_all"
    // "skip"
    }
    var options = Object.assign({}, defaults, opts)
    self.status()
  }
}

function linkyDink (opts) {
  if (!opts) opts = {}
  var instance = Object.create(proto)
  return Object.assign(instance, opts)
}

//
// processFileNames
// (fileNames, cb) => (err, paths)
function getFileNames (src, dest, fileNames, cb) {
  var paths = fileNames.map(genPaths.bind(null, src, dest))
  process.nextTick(cb, null, paths)
}

function genPaths (srcDir, destDir, fileName) {
  var src = resolveJoin(srcDir, fileName)
  var dest = resolveJoin(destDir, '.' + fileName)
  var relative = path.relative(path.dirname(dest), src)
  var link = relative.indexOf('../..') === -1 ? relative : src

  return {
    name: fileName,
    src: src,
    dest: dest,
    relative: relative,
    link: link
  }
}

//
// resolveJoin
// join and resolve n segments
function resolveJoin (segment1, segment2 /* etc */) {
  var paths = sliced(arguments)
  return path.resolve(path.join.apply(null, paths))
}

//
// gatherStats
// (paths, cb) => (err, stats)
function gatherStats (filePaths, cb) {
  var fileStatters = filePaths.map(makeStatters)
  parallelLimit(fileStatters, 5, cb)
}

function makeStatters (filePath) {
  function statter (cb) {
    statFile(filePath, cb)
  }
  return statter
}

//
// statFile
// stats files and adds the status object
function statFile (file, cb) {
  fs.lstat(file.dest, function withStats (err, stats) {
    if (err && err.code !== 'ENOENT') return cb(err)
    var fileStats = file
    fileStats.stats = stats || null
    fileStats.exists = truthy(stats)
    cb(null, fileStats)
  })
}

//
// prepareDest
// (stats, cb) => (err, preResults)
function prepareDest (stats, cb) {
}

//
// symlink
// (preResults, cb) => (err, results)
function symlink (stats, cb) {
}

module.exports = linkyDink

var linky = linkyDink()

linky.status(log.sync)
