# Dotpiles

Thees are my dotfiles.  Here is an overview:

## Installing:

Download them from github.

```console
$ cd ~
$ git clone git@github.com:bcomnes/.dotfiles.git
```

Bootstrap a ssh keys probably.

Symlink the dotfiles

```console
$ cd ~/.dotfiles/
$ ./install/bret-dk
```

Create or edit the host installer to include the various steps you want.

## References

I did a few clever and simple bash things that I have found to be extremely bullet proof and simple.  They have survived mostly over the course of like 4-5 installs, which is a personal record.

- [.bashrc.d](https://gist.github.com/bcomnes/5053fca2d7be573c0abd): fragment based bashrc files
- [os_diff.sh](https://gist.github.com/bcomnes/13711d12237e866de5ca): target specific platforms with bash
