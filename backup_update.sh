#!/bin/bash
#Purpose = Update Existing TAR Archive

source ./utils.sh

main() {
    local tar_dir=$1;
    local tar_name=$2;
    local src_dir=$3;
    local new_tar_name=$(generate_backup_name);

    echo "[INFO] Initialized TARGET = '$tar_dir/$tar_name' ; SOURCE = '$src_dir'";
    update_tar $tar_dir $tar_name $src_dir;
    echo "[SUCCESS] Backup Updated";
}

if [ $# -eq 3 ]; then
    main $@
else
    echo "Three arguments: Existing Tar Parent Directory, Existing Tar Name, Source Folder.";
    echo "Pass these are arguments";
fi