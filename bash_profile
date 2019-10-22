export PATH=~/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
	source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

declare -A GIT_PS1_PATH_SHORTENER

if [ -f "$DIR/ps1-shortener.local" ]; then
  source "$DIR/ps1-shortener.local"
fi
export GIT_PS1_PATH_SHORTENER

if [ -f "$DIR/git-ps1.sh" ]; then
	source "$DIR/git-ps1.sh"
fi

source "$DIR/bash_aliases"