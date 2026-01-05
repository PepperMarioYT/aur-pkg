#!/bin/bash

aur_install() {
    local pkg="$1"
    if [ -z "$pkg" ]; then
        echo "Usage: $0 install <package>"
        return 1
    fi

    local aur_url=$(jq -r '.aur_url' config.json)
    local build_dir=$(jq -r '.build_dir' config.json)
    local install_flags=$(jq -r '.install_flags' config.json)

    mkdir -p "$build_dir"
    cd "$build_dir" || return 1

    echo "Cloning $pkg from AUR..."
    git clone "$aur_url/$pkg.git" || { echo "Clone failed"; return 1; }

    cd "$pkg" || return 1
    echo "Building and installing $pkg..."
    makepkg $install_flags
}
