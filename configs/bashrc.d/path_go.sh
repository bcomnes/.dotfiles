# Enable go path
# https://github.com/bcomnes/goref#configure

if [ -d $HOME/go ];
  then export GOPATH=$HOME/go ;
  export PATH=$PATH:$GOPATH/bin ;
fi

function gogo () {
    cd $GOPATH/src/github.com/bcomnes
}

export GOPROXY=https://proxy.golang.org
