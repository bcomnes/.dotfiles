# Enable go path
# https://github.com/bcomnes/goref#configure

if [ -d $HOME/go ];
  then export GOPATH=$HOME/go ;
  export PATH=$PATH:$GOPATH/bin ;
fi

# export GOPROXY=https://proxy.golang.org
