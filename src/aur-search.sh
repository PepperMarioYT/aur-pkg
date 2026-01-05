#!/bin/bash

aur_search() {
    local pkg="$1"
    if [ -z "$pkg" ]; then
        echo "Usage: $0 search <package>"
        return 1
    fi

    local aur_url=$(jq -r '.aur_url' config.json)

    curl -s "$aur_url/rpc/?v=5&type=search&arg=$pkg" | \
        jq -r '.results[] | "\(.Name) - \(.Version) : \(.Description)"'
}
