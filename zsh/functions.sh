#!/bin/zsh
##### FUNCTIONS
function cdcs() {
	if [[ $# -eq 0 ]]; then
		cd "/Users/benjaminzhuang/Desktop/CSE_major_courses"
	else
		cd "/Users/benjaminzhuang/Desktop/CSE_major_courses/CSE_$1"
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
	if [[ $# -eq 0 ]]; then
		rm ~/Desktop/Screen\ Shot*
	else
		for format in $@; do
			cd ~/Desktop && ls | grep -Ei "$format" | xargs rm
		done
	fi
}

# backups nvim config
function backup() {
	echo "Backup nvim configs"
	pushd . >/dev/null
	cp -rf ~/.config/nvim ~/backups/.
	cd ~/backups/nvim
	rm -rf .git .github
	popd >/dev/null
}
