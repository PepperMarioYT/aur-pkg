#!/bin/bash

aur_list() {
    local build_dir=$(jq -r '.build_dir' config.json)

    if [ ! -d "$build_dir" ]; then
        echo "No build directory found at $build_dir"
        return 1
    fi

    echo "Installed AUR packages in $build_dir:"
    for dir in "$build_dir"/*; do
        if [ -d "$dir/.git" ]; then
            echo "- $(basename "$dir")"
        fi
    done
}
