#!/bin/bash
#Purpose = Backup of Important Data

source ./utils.sh

main() {
    local src_dir=$1;
    local tgt_dir=$2;

    local backup_name=$(generate_backup_name);

    echo "[INFO] Started: SOURCE = '$src_dir' ; TARGET = '$tgt_dir'";
    local backup_path=$(create_backup $src_dir $tgt_dir $backup_name);
    echo "[SUCCESS] Backup generated: $backup_path";

    echo "[SUCCESS] Backup Complete"
}


if [ $# -eq 3 ]; then
    BACKUP_NAME=$3-$BACKUP_NAME;
fi

if [ $# -eq 2 -o $# -eq 3 ]; then
    main $@
else
    echo "Two arguments: Source Directory and Target Directory are expected.";
    echo "Pass these are arguments";
    echo "Optionally, 3rd Argument Tag can also be passed";
fi
