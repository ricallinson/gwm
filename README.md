# Go Workspace Manager

Super simple workspace manager for the Go programming language.

## Manual Install

For manual install create a folder somewhere in your filesystem with the gwm.sh file inside it. I put mine in a folder called _~/.gwm_.

Or if you have git installed, then just clone it:

    git clone git@github.com:ricallinson/gwm.git ~/.gwm

To activate gwm, you need to source it from your shell:

    source ~/.gwm/gwm.sh

I always add this line to my _~/.bashrc_, _~/.profile_, or _~/.zshrc_ file to have it automatically sourced upon login.

## Usage

    gwm help

Show the commands help message.

    gwm here ~/some/dir

Sets the given directory as the Go workspace it finds existing `bin` and `src` directories. If [GVM](https://github.com/moovweb/gvm) is installed the latest version of Go will be made active.

    gwm here .

Sets the current directory as the Go workspace creating `bin` and `src` directories if not found. If [GVM](https://github.com/moovweb/gvm) is installed the latest version of Go will be made active.

    gwm here

Walks up the directory structure until it finds an existing Go workspace defined by having `bin` and `src` directories. If [GVM](https://github.com/moovweb/gvm) is installed the latest version of Go will be made active.

    gwm current

Display currently activated workspace directory.

    gwm version

The version of Go Workspace Manager installed.
