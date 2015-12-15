#!/bin/bash

cd $LFS/sources

source_url=http://www.linuxfromscratch.org/lfs/view/stable/
wget ${source_url}wget-list -O source-list
wget ${source_url}md5sums -O source-list.md5

wget --input-file=source-list --continue
md5sum -c source-list.md5
