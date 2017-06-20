#!/bin/bash

function main()
{
    script_dir=${current-script-directory}
    link_dest=$script_dir
    link_origin=$HOME/.config/termite

    echo ""
    echo "Preparing local environment for configs inside cloned git repo."
    echo ""

    echo "First checking to see if previous config exists."
    echo ""

    if [ -e $link_origin ]; then
        echo "Previous config exists, deleting..."
        rm -rf  $link_origin
        echo ""
    fi

    echo "Linking termite config folder to dotfiles location"
    echo ""
    ln -s $link_dest $link_origin
    
    echo ""
    echo "Done preparing environment for new termite configs"
    echo ""

}

function current-script-directory()
{
    # foolproof way to figure out where this script is placed
    source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
          dir="$( cd -P "$( dirname "$source" )" && pwd )"
          source="$(readlink "$source")"
          # if $source was a relative symlink, we need to resolve it relative
          # to the path where the symlink file was located
          [[ $source != /* ]] && source="$dir/$source"
    done
    dir="$( cd -P "$( dirname "$source" )" && pwd )" #dir now has the script locat'n
    echo $dir
}

# execute the main function to make forward declarations valid
main
