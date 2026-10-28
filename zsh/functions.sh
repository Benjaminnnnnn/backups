#!/bin/bash
##### FUNCTIONS
function cdcs() {
	if [[ $# -eq 0 ]]; then
		cd "/Users/benjaminzhuang/Desktop/CSE_major_courses" || return
	else
		cd "/Users/benjaminzhuang/Desktop/CSE_major_courses/CSE_$1" || return
	fi
}

function attu() {
	if [[ $# -eq 0 ]]; then
		ssh "zhuanz3@attu.cs.washington.edu"
	else
		ssh "zhuanz3@attu$1.cs.washington.edu"
	fi
}

# log in to attu with the nlp jupyter server port number
function nlp() {
	if [[ $# -eq 1 ]]; then
		ssh -L "8888:127.0.0.1:$1" "zhuanz3@nlpg00.cs.washington.edu"
	else
		ssh "zhuanz3@nlpg00.cs.washington.edu"
	fi
}

function clearscreen() {
	local format
	if [[ $# -eq 0 ]]; then
		find "$HOME/Desktop" -maxdepth 1 -type f -name 'Screen Shot*' -exec rm -- {} +
	else
		for format in "$@"; do
			find "$HOME/Desktop" -maxdepth 1 -type f -name 'Screen Shot*' -iname "*$format*" -exec rm -- {} + || return
		done
	fi
}

# backups nvim config
function backup() {
	echo "Backup nvim configs"
	mkdir -p "$HOME/backups" || return
	cp -R "$HOME/.config/nvim" "$HOME/backups/"
}

openx() {
  if [ -z "$1" ]; then
    echo "Usage: openx <url-or-path>"
    return 1
  fi

  arg="$1"
  browser="Brave Browser"

  # URLs → open in browser directly
  if [[ "$arg" =~ ^https?:// ]]; then
    open -a "$browser" "$arg"
    return
  fi

  # Resolve filesystem path
  resolved=$(realpath "$arg" 2>/dev/null)
  if [ ! -e "$resolved" ]; then
    echo "Error: '$arg' not found."
    return 1
  fi

  # Convert spaces to %20 for file:// URL
  encoded="${resolved// /%20}"
  url="file://$encoded"

  # Force open in browser
  open -a "$browser" "$url"
}
  
