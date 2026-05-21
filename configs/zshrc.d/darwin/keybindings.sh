#!/bin/zsh
# Explicit word-jump bindings for terminals that don't set them (e.g. Zed).
# Covers both emacs and vi insert keymaps since the active one varies by terminal.
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[b" backward-word
