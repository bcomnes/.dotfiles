# Dotpiles

Thees are my dotfiles.  Here is an overview:

## Installing:

Run

```sh
./bootstrap/install-dotfiles.sh
```

to install and update dotfiles, however boot strapping is a more involved process.
See [`procedure.sh`](./procedure.sh) for a series of notes on how to do this.

## Structure

- *configs*: Any top level file or folder in `configs` is symlinked to ~/ and prefixed with a `.`.  Any conflicts are moved to `foo.bk` if it is a file, or `foo.symbk` if its a symlink conflict.  If you see conflict warnings, you should handle those sooner than later since the conflict management is backup destructive.
- *ssh*: SSH is a weird beast, since its so crucial to the boostrapping process and also contains vital secrets.  We symlink files from inside `ssh` to inside `~/.ssh/` instead of the whole folder. We also update `authorized_keys` from github.

### Brew file

Periodically dump a brew file:

```console
cd ~/.dotfiles
brew bundle dump # dump whats installed
brew bundle cleanup # clean the brew file
brew bundle check # check the status
```

To install, run:

```cosole
brew bundle
```

## References

I did a few clever and simple bash things that I have found to be extremely bullet proof and simple.  They have survived mostly over the course of like 4-5 installs, which is a personal record.

- [.bashrc.d](https://gist.github.com/bcomnes/5053fca2d7be573c0abd): fragment based bashrc files
- [os_diff.sh](https://gist.github.com/bcomnes/13711d12237e866de5ca): target specific platforms with bash

## Unifi hostname fix

- ssh into USG
-  remove the offending hostname from `/etc/hosts` with `vi`
- reload dsnmasq `/etc/init.d/dnsmasq force-reload`
