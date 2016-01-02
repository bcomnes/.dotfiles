var fs = require('fs')
var path = require('path')
// var map = require('map-async')
var waterfall = require('run-waterfall')
var os = require('os')

var dotfilesPath = path.join(__dirname, 'home')

waterfall([
  fs.readdir.bind(null, dotfilesPath),
  processFileNames
], logger)

function logger (err, results) {
  var args = [].slice.call(arguments)
  args.shift() // shift out errors
  if (err) console.error(err)
  if (args) args.forEach(arg => console.log(arg))
  console.log('done')
}

function processFileNames (fileNames, cb) {
  var paths = fileNames.map((fileName) => {
    var src = resolveJoin(dotfilesPath, fileName)
    var dest = resolveJoin(os.homedir(), '.' + fileName)
    var relative = simpleRelative(dest, src)

    return {
      name: fileName,
      src: src,
      dest: dest,
      relative: relative
    }
  })

  cb(null, paths)
}

function resolveJoin (segment1, segment2 /* etc */) {
  var paths = [].slice.call(arguments)
  return path.resolve(path.join.apply(null, paths))
}

function simpleRelative (dest, src) {
  // calcualte relative path between dest and src
  var relative = path.relative(path.dirname(dest), src)
  // return resolved src if dest is behind the src
  if (relative.indexOf('..') > -1) return src
  // else return the simple relative path
  return relative
}

function statFile (filename, cb) {
  var fullPath = path.join(home, filename)
  fs.lstat(fullPath, function withStats (err, stats) {
    if (err && err.code !== 'ENOENT') return cb(err)
    var results = {
      filename: filename,
      exists: truthy(stats),
      stats: stats || null
    }
    cb(null, results)
  })
}
