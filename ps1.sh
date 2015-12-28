#!/bin/bash

# ps1
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt#Professional_prompts
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export PS1="\[\e[33;1;32m\]\h:\[\e[33;1;34m\]\W \u\[\e[1;32m\]\$\[\e[0m\] "
