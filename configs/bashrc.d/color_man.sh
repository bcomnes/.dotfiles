# Colored Man pages
# https://wiki.archlinux.org/index.php/Man_page#Colored_man_pages
man() {
    env LESS_TERMCAP_mb=$'\E[1;31m' \
    LESS_TERMCAP_md=$'\E[1;36m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[01;44;33m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[1;32m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    man "$@"
}
