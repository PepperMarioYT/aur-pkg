#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

source "$SCRIPT_DIR/aur-search.sh"
source "$SCRIPT_DIR/aur-install.sh"
source "$SCRIPT_DIR/aur-update.sh"
source "$SCRIPT_DIR/aur-list.sh"

case "$1" in
    search) aur_search "$2" ;;
    install) aur_install "$2" ;;
    update) aur_update ;;
    list) aur_list ;;
    *) echo "Usage: $0 {search|install|update|list} [package]" ;;
esac
