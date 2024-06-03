parse_pattern() {
  sed 's/ /[\\s_-]/g' <<< "$1"
}

_find() {
  local type="$1"
  local pattern_target="$(parse_pattern "$2")"
  local pattern_other="$(parse_pattern "$3")"
  local directory="$4"

  if [[ "$5" == all ]]; then
    local limit=""
  else
    local limit="--max-results "$5""
  fi

  fdfind --type "$type" --ignore-case $limit --regex "$pattern_target" "$directory" \
    | grep -P --ignore-case "$pattern_other"
}

find_albums() {
  _find d "$@"
}

find_songs() {
  _find f "$@"
}

message_empty() {
  echo "No $1 found with pattern"
}
