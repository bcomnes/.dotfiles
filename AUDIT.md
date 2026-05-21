# Dotfiles Audit

Legend: `[x]` = executable (loaded), `[ ]` = not executable (skipped), `[?]` = potential issue

## Loading Chain

```
login shell
  ~/.profile           → profile.d/  (PATH, env vars; bash+zsh shared)
  ~/.bash_profile      → ~/.profile + ~/.bashrc (bash login)
  ~/.zprofile          → ~/.profile (zsh login)

interactive shell
  ~/.bashrc            → rc.d/ + bashrc.d/
  ~/.zshrc             → rc.d/ + zshrc.d/
```

Each `.d/` dir has a `platform.sh` that runs `darwin/` or `linux/` scripts.
Only **executable** files are sourced.

---

## Entry Points (not loaded via run_scripts, not executable by design)

| File | Notes |
|------|-------|
| `profile` | Shared login: sets DEFAULT_PATH, runs profile.d/ |
| `bash_profile` | Bash login: sources profile + bashrc |
| `zprofile` | Zsh login: sources profile |
| `bashrc` | Bash interactive: runs rc.d/ + bashrc.d/ |
| `zshrc` | Zsh interactive: runs rc.d/ + zshrc.d/ — [?] has a stale pnpm block appended at bottom that duplicates profile.d/darwin/path_pnpm.sh |
| `screenrc` | GNU Screen config |
| `tmux.conf` | tmux config |
| `vimrc` | Vim config |
| `nvmrc` | Node version pin |

---

## profile.d/ — login shell, PATH + env vars, bash+zsh shared

### Cross-platform
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `platform.sh` | [x] | Runs darwin/ or linux/ subscripts | |
| `path_bin.sh` | [x] | Adds ~/.dotfiles/bin and ~/bin to PATH | |
| `path_go.sh` | [x] | Sets GOPATH, adds to PATH, turns off GOTELEMETRY | |

### profile.d/darwin/
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `1_homebrew.sh` | [x] | Homebrew shellenv, sets PATH, adds sbin | Numeric prefix forces it first; sbin folded in from deleted brew-sbin.sh |
| `node_cache.sh` | [x] | Sets NODE_COMPILE_CACHE | |
| `xdg_config.sh` | [x] | Sets XDG_CONFIG_HOME/CACHE_HOME/DATA_HOME | |
| `path_rbenv.sh` | [ ] | `rbenv init - zsh` | Disabled — zsh-specific command doesn't belong in shared profile.d |
| `path-orbstack.sh` | [x] | Adds OrbStack bin to PATH | |
| `path-pear.sh` | [ ] | Adds PEAR bin to PATH | Disabled — not sure if still needed |
| ~~`darwin/path_pnpm.sh`~~ | — | Moved to cross-platform `profile.d/path_pnpm.sh`; fixed hardcoded `/Users/bret` → `$HOME` | |
| ~~`path-homebrew_go.sh`~~ | — | Deleted — stale, had its own "is this still needed?" comment | |
| `path-nvm.sh` | [ ] | Sets up NVM | Disabled — using pnpm/node directly |
| `path_deno.sh` | [ ] | Adds ~/.deno/bin to PATH | Disabled — using deno? |
| `path_ruby.sh` | [ ] | Adds Homebrew ruby bin to PATH | Disabled — using rbenv instead |
| `ssh-load-keychain.sh` | [ ] | `ssh-add --apple-load-keychain` | Disabled — intentional? |

### profile.d/linux/
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `gnome_keyring.sh` | [x] | Starts gnome-keyring-daemon | |
| `path_npm.sh` | [x] | Sets NPM_CONFIG_PREFIX, adds global npm bin to PATH | |
| `path_gem.sh` | [ ] | Adds Ruby gem bin to PATH | Disabled |

---

## rc.d/ — interactive shell, aliases + functions, bash+zsh shared

### Cross-platform
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `platform.sh` | [x] | Runs darwin/ or linux/ subscripts | |
| `editor.sh` | [x] | `EDITOR=vim` | [?] Env var — arguably belongs in profile.d. darwin/editor.sh (disabled) overrides this |
| `alias-npm-clean.sh` | [x] | npm/yarn/pnpm clean aliases | |
| `color_man.sh` | [x] | Colorized man pages | |
| `rtouch.sh` | [x] | `rtouch` function (mkdir -p + touch) | |
| ~~`rc.d/disable-husky.sh`~~ | — | Moved to `profile.d/disable-husky.sh` — env var belongs at login | |
| ~~`alias_go.sh`~~ | — | Deleted — `gogo` function was unused | |
| `ssl.sh` | [ ] | openssl utility functions | Disabled — intentional? |

### rc.d/darwin/
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `alias-brew-shortcuts.sh` | [x] | `check-for-updates`, `system-update` aliases | |
| `alias-color_ls.sh` | [x] | `ls -G` alias | |
| ~~`darwin/alias-k8s.sh`~~ | — | Moved to cross-platform `rc.d/alias-k8s.sh` | |
| `alias-linux_lsbk.sh` | [x] | `lsblk` → diskutil alias | |
| `alias-linux_sudoedit.sh` | [x] | `sudoedit` → `sudo -e` alias | |
| `alias-md5sum.sh` | [x] | `md5sum` → `gmd5sum` alias | [?] Assumes GNU coreutils installed |
| ~~`darwin/alias-terraform.sh`~~ | — | Moved to cross-platform `rc.d/alias-terraform.sh` | |
| `alias-youtube-dl.sh` | [x] | `youtube-dl` → yt-dlp alias | |
| ~~`safe-rm.sh`~~ | — | Deleted — safe-rm not installed | |
| `sudo_ps1.sh` | [x] | Sets SUDO_PS1 | |
| `editor.sh` | [x] | Sets EDITOR=vim, VISUAL=zed --wait, GIT_EDITOR=zed --wait | Enabled; overrides cross-platform rc.d/editor.sh on macOS |
| `aws-gumcast.sh` | [ ] | Sets AWS_PROFILE=gumcast | Disabled — [?] env var, belongs in profile.d if enabled |
| ~~`command_not_found.sh`~~ | — | Deleted | |
| ~~`rc.d/darwin/swift.sh`~~ | — | Moved to `bashrc.d/darwin/swift.sh` (disabled) — uses bash `complete` | |

### rc.d/linux/
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `alias-color_ls.sh` | [x] | `ls --color=auto` alias | |
| `darwin_alias.sh` | [x] | Maps macOS commands to Linux equivalents (open, pbcopy, etc.) | |

---

## bashrc.d/ — interactive, bash-specific

### Cross-platform
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `platform.sh` | [x] | Runs darwin/ or linux/ subscripts | |
| `ps1.sh` | [x] | Bash prompt with git branch | |
| ~~`screen.sh`~~ | — | Deleted — GNU Screen no longer in use | |

---

## zshrc.d/ — interactive, zsh-specific

### Cross-platform
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `platform.sh` | [x] | Runs darwin/ or linux/ subscripts | |
| `ps1.sh` | [x] | Zsh prompt (exit code indicator) | |
| `autocomplete.sh` | [x] | `compinit` with case-insensitive matching | |

### zshrc.d/darwin/
| File | Loaded | What it does | Notes |
|------|--------|--------------|-------|
| `zsh-completion.sh` | [x] | Adds Homebrew zsh-completions to FPATH | |
| `alias-fix-compaudit.sh` | [x] | `fix-compaudit` alias | |
| `keybindings.sh` | [x] | Option+arrow word-jump bindings for emacs+viins keymaps | Newly added |
