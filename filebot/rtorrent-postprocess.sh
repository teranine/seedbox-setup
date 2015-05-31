#!/bin/bash
TORRENT_PATH=$1
TORRENT_NAME=$2
TORRENT_LABEL=$3

filebot -script fn:amc --output "$HOME/Media" --log-file amc.log --action duplicate --conflict override -non-strict --def music=y artwork=y "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=$TORRENT_LABEL" &
