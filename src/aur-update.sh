#!/bin/bash

aur_update() {
    local build_dir=$(jq -r '.build_dir' config.json)
    local install_flags=$(jq -r '.install_flags' config.json)

    if [ ! -d "$build_dir" ]; then
        echo "No build directory found at $build_dir"
        return 1
    fi

    for dir in "$build_dir"/*; do
        if [ -d "$dir/.git" ]; then
            echo "Updating $(basename "$dir")..."
            cd "$dir" || continue
            git pull
            makepkg $install_flags
        fi
    done
}
