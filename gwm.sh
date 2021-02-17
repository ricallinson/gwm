# Traverse up in directory tree to find containing folder.
gwm_find_up() {
  local path
  path=$1
  while [ "$path" != "" ] && [ ! -d "$path/$2" ]; do
    path=${path%/*}
  done
  echo "$path"
}

gwm_find_src() {
  local dir
  dir="$(gwm_find_up $1 'src')"
  if [ -e "$dir/src" ]; then
    echo "$dir/src"
  fi
}

gwm_resolve() {
    cd "$1" 2>/dev/null || return $?  # cd to desired directory; if fail, quell any error messages but return exit status
    echo "`pwd -P`" # output full, link-resolved path
}

gwm_gvm_use() {
    if hash gvm 2>/dev/null; then
        local version
        version=$(gvm list 2>&1 | tail -2 | sed 's/[^a-z0-9.]*//g')
        echo 
        gvm use $version
    fi
}

gwm() {
    case $1 in
    "help" )
        echo
        echo "Go Workspace Manager"
        echo
        echo "Usage:"
        echo
        echo "    gwm help                    Show this message"
        echo "    gwm here                    Set the current directory as the Go workspace"
        echo "    gwm current                 Display currently activated workspace directory"
        echo "    gwm version                 The version of Go Workspace Manager installed"
        echo
    ;;

    "here" )
        local wPath
        if [ -z $2 ]; then
            wPath=$(gwm_find_src $PWD)
            wPath=${wPath%/*}
        else
            wPath="`gwm_resolve \"$2\"`"
        fi
        if [ -z $wPath ]; then
            echo
            echo "This command must be run in a Go workspace"
            echo
            return 0
        fi
        mkdir -p $wPath/bin
        mkdir -p $wPath/src
        gwm_gvm_use
        export GOPATH=$wPath
        export PATH=$PATH:$GOPATH/bin
        export GO111MODULE="off"

        echo
        echo "Workspace set to $GOPATH"
        echo
    ;;

    "current" )
        echo
        echo "Workspace set to $GOPATH"
        echo
    ;;

    "version" )
        echo
        echo "Go Workspace Manager v0.0.1"
        echo
    ;;

    esac
}
