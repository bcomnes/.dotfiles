#!/bin/zsh
# Explicit keybindings for terminals that start zsh in viins mode instead of emacs (e.g. Zed).
# Ghostty/Terminal.app use emacs keymap which has these by default; Zed uses viins which doesn't.
#
# To diagnose missing bindings across terminals:
#   bindkey                                          # dump all active bindings
#   bindkey | grep -E 'word|kill|beginning|end'     # filter to navigation/editing
# Run in each terminal and compare — anything in emacs but not viins needs to be added here.
#
# To identify which keymap is active:
#   bindkey -lL main                                 # shows which keymap 'main' is aliased to
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^[^?" backward-kill-word
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M viins "^K" kill-line
bindkey -M viins "^N" down-line-or-history
bindkey -M viins "^P" up-line-or-history
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "^Y" yank
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[b" backward-word
bindkey -M viins "^[d" kill-word
bindkey -M viins "^[." insert-last-word
bindkey -M viins "^[^?" backward-kill-word
