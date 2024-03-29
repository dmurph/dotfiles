export PATH=~/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export BASH_COMPLETION_COMPAT_DIR="/opt/homebrew/etc/bash_completion.d"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

declare -A GIT_PS1_PATH_SHORTENER
declare -A GIT_PS1_HOST_SHORTENER

if [ -f "$DIR/ps1-shortener.local" ]; then
  source "$DIR/ps1-shortener.local"
fi
export GIT_PS1_PATH_SHORTENER
export GIT_PS1_HOST_SHORTENER

if [ -f "$DIR/git-ps1.sh" ]; then
	source "$DIR/git-ps1.sh"
fi

source "$DIR/bash_aliases"
