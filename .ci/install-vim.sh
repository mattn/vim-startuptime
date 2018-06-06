#!/bin/bash

set -ev

case "$TRAVIS_OS_NAME" in
    linux)
        if [ -x "$HOME/vim/bin/vim" ]; then
            echo "Will use cache at $HOME/vim"
            exit 0
        fi
        git clone --depth 1 --single-branch https://github.com/vim/vim /tmp/vim
        cd /tmp/vim
        ./configure --prefix="${HOME}/vim" --with-features=huge --enable-fail-if-missing
        make -j2
        make install
        ;;
    osx)
        brew install macvim --with-override-system-vim
        ;;
    *)
        echo "Unknown OS: $TRAVIS_OS_NAME"
        exit 1
        ;;
esac
