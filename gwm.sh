gwm() {
    case $1 in
    "help" )
        echo
        echo "Go Workspance Manager"
        echo
        echo "Usage:"
        echo "    gwm help                    Show this message"
        echo "    gwm work                    Set the current directory as the Go workspace"
        echo "    gwm link                    TODO: Link an external source repository into this workspace"
        echo
    ;;

    "work" )
        mkdir -p $(pwd)/bin
        mkdir -p $(pwd)/src
        export GOPATH=$(pwd)
        export PATH=$PATH:$GOPATH/bin

        echo
        echo "Go workspace set to $GOPATH"
        echo
    ;;
    esac
}
