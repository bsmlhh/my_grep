#!/bin/bash

usage() {
  echo "Usage: $0 [-n] [-v] search_string filename"
  echo
  echo "Options:"
  echo "  -vn   print lines that do not match and number of the line"
  echo "  -n    Show line numbers for matching lines"
  echo "  -v    Invert match (show lines that do NOT match)"
  echo "  --help   Show this help message"
  exit 1
}

# Check for --help
if [[ "$1" == "--help" ]]; then
  usage
fi

# Default option values
show_line_number=false
invert_match=false

# Parse options using getopts
while getopts ":nv" opt; do
  case $opt in
    n)
      show_line_number=true
      ;;
    v)
      invert_match=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      ;;
  esac
done

shift $((OPTIND -1))

# Remaining arguments
search_string="$1"
filename="$2"

# Validate input
if [[ -z "$search_string" || -z "$filename" ]]; then
  echo "Error: Missing search string or filename."
  usage
fi

if [[ ! -f "$filename" ]]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

line_number=0

while IFS= read -r line; do
  ((line_number++))

  # Case insensitive search
  if echo "$line" | grep -iq "$search_string"; then
    matched=true
  else
    matched=false
  fi

  # Invert match logic
  if $invert_match; then
    if $matched; then
      continue
    fi
  else
    if ! $matched; then
      continue
    fi
  fi

  # Print the output
  if $show_line_number; then
    echo "${line_number}:$line"
  else
    echo "$line"
  fi

done < "$filename"

