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

### Shell Config System

Shell config is split across several layered collections inside `configs/`. Only **executable** files are sourced — the executable bit acts as an enable/disable toggle for individual snippets.

```
configs/
├── profile             # Login shell entry point shared by bash and zsh.
│                       # Sets DEFAULT_PATH for idempotent re-sourcing, runs profile.d/.
├── bash_profile        # Bash login: sources profile, then bashrc if interactive.
├── zprofile            # Zsh login: sources profile.
├── bashrc              # Bash interactive: runs rc.d/ + bashrc.d/.
├── zshrc               # Zsh interactive: runs rc.d/ + zshrc.d/.
│
├── profile.d/          # LOGIN — non-interactive setup shared by bash and zsh.
│   │                   # PATH additions, exported env vars, tool initializers.
│   │                   # Runs once at login; avoid anything requiring a prompt.
│   ├── platform.sh     # Orchestrator: detects OS, runs darwin/ or linux/.
│   ├── ...             # Cross-platform PATH and env var snippets.
│   ├── darwin/         # macOS-only login config.
│   └── linux/          # Linux-only login config.
│
├── rc.d/               # INTERACTIVE — aliases and functions for bash and zsh.
│   │                   # Anything that works in both shells and only makes sense
│   │                   # in an interactive session goes here.
│   ├── platform.sh     # Orchestrator: detects OS, runs darwin/ or linux/.
│   ├── ...             # Cross-platform aliases and functions.
│   ├── darwin/         # macOS-only interactive config.
│   └── linux/          # Linux-only interactive config.
│
├── bashrc.d/           # INTERACTIVE — bash-only config.
│   │                   # Bash prompt, bash completion, bash-specific syntax.
│   ├── platform.sh     # Orchestrator.
│   ├── ...             # Cross-platform bash snippets.
│   └── darwin/         # macOS-only bash config.
│
└── zshrc.d/            # INTERACTIVE — zsh-only config.
    │                   # Zsh prompt, compinit, ZLE keybindings, zsh completions.
    ├── platform.sh     # Orchestrator.
    ├── ...             # Cross-platform zsh snippets.
    └── darwin/         # macOS-only zsh config.
```

#### Which collection does my snippet belong in?

| | bash+zsh | bash only | zsh only |
|---|---|---|---|
| **login / non-interactive** (PATH, env vars) | `profile.d/` | — | — |
| **interactive** (aliases, functions, prompts) | `rc.d/` | `bashrc.d/` | `zshrc.d/` |

Add a `darwin/` or `linux/` subdirectory variant for platform-specific overrides at any layer.

### Git Filters (Secret Redaction)

Sensitive values in tracked files (API keys, tokens) are automatically redacted on commit via git clean/smudge filters. The bootstrap script sets this up automatically. After bootstrapping, replace any `REDACTED` placeholders in `configs/config/zed/settings.json` with your real credentials. See [git-filters/SECRET-MANAGEMENT.md](git-filters/SECRET-MANAGEMENT.md) for full details.

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
