#!/bin/bash


cd $(dirname $0)
SCRIPT_ROOT_DIR=$(pwd)
SCRIPT_CONF_DIR=$SCRIPT_ROOT_DIR/config
CONF_DIR=$HOME/.config

# symlink files that go into $HOME
root_file_list=($(find $SCRIPT_ROOT_DIR -maxdepth 1 -type f ! -iname install.sh))

for file in "${root_file_list[@]}"; do
    ln -sf $file $HOME/$(basename $file)
done

# symlink folders that go into $HOME/.config
conf_folder_list=($(find $SCRIPT_CONF_DIR -mindepth 1 -maxdepth 1 -type d))

for folder in "${conf_folder_list[@]}"; do
    ln -sf $folder $CONF_DIR/$(basename $folder)
done