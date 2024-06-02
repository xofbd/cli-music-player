parse_pattern() {
  sed 's/ /[\\s_-]/g' <<< "$1"
}

find_songs() {
  local pattern_song="$(parse_pattern "$1")"
  local pattern_other="$(parse_pattern "$2")"
  local directory="$3"

  if [[ "$4" == all ]]; then
    local limit=""
  else
    local limit="--max-results "$4""
  fi

  fdfind --type f --ignore-case $limit --regex "$pattern_song" "$directory" | grep -P --ignore-case "$pattern_other"
}

find_albums() {
  local pattern_album="$(parse_pattern "$1")"
  local pattern_other="$(parse_pattern "$2")"
  local directory="$3"

  if [[ "$4" == all ]]; then
    local limit=""
  else
    local limit="--max-results "$4""
  fi

  fdfind --type d --ignore-case $limit --regex "$pattern_album" "$directory" | grep -P --ignore-case "$pattern_other"
}

message_empty() {
  echo "No $1 found with pattern"
}
