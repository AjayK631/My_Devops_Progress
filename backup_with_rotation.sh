#!/bin/bash

src="/home/ubuntu/Devops_batch6/Linux_Projects"
dst="/home/ubuntu/Devops_batch6/backup"

curr_date=$(date "+%Y-%m-%d-%H-%M-%S")

bkp_file="$dst"/backup_"$curr_date".tar.gz

tar czf $bkp_file -P $src 
