#!/bin/bash

# Constants
BACKUP_NAME=Backup

# Common Utility Functions
generate_backup_name() {
    local filename=$BACKUP_NAME-$(_generate_datestamp).tgz;
    echo $filename;
}

_generate_datestamp() {
    echo $(date +"%d-%b-%Y");
}

# Backup Functions
create_backup () {
    local src_dir=$1;
    local tgt_dir=$2;
    local backup_name=$3;
    tar --exclude=$src_dir/$backup_name -cf $tgt_dir/$backup_name $src_dir;
}

move_backup() {
    local backup_loc=$1/$3;
    local tgt_dir=$2;
    mv $backup_loc $tgt_dir;
}

delete_previous_backups() {
    local bkp_tgt_dir=$1;
    local backup_files_regex=$BACKUP_NAME-*.tgz;
    rm $bkp_tgt_dir/$backup_files_regex;   
}

# TAR Update functions
update_tar() {
    local tar_dir=$1;
    local tar_name=$2;
    local src_dir=$3;

    tar --exclude=$tar_dir/$tar_name -uf $tar_dir/$tar_name $src_dir;
}

rename_tar() {
    local tar_dir=$1;
    local tar_name=$2;
    local new_name=$3;

    mv $tar_dir/$tar_name $tar_dir/$new_name;
}
