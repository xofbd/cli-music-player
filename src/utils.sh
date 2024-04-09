#!/bin/bash

parse_pattern() {
  echo $(sed 's/ /[\\s_-]/g' <<< "$1")
}

find_songs() {
  pattern_song="$(parse_pattern "$1")"
  pattern_other="$(parse_pattern "$2")"

  fdfind --type f --ignore-case --regex "$pattern_song" "$3" | grep --ignore-case "$pattern_other"
}

find_albums() {
  pattern_album=$(parse_pattern "$1")
  pattern_other=$(parse_pattern "$2")

  fdfind --type d --ignore-case --regex "$pattern_album" "$3" | grep --ignore-case "$pattern_other"
}

message_empty() {
  echo "No $1 found with pattern"
}
