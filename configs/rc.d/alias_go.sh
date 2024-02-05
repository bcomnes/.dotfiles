
function gogo() {
    if [[ -n "$GOPATH" ]]; then
        cd "$GOPATH/src/github.com/bcomnes"
    else
        echo "GOPATH is not set."
    fi
}
