# Simple colors and git status related functions.

COLOR_RED="\033[0;91m"
COLOR_YELLOW="\033[0;93m"
COLOR_GREEN="\033[0;32m"
COLOR_PURPLE="\033[0;95m"
COLOR_BLUE="\033[0;94m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function __git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_PURPLE
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_YELLOW
  fi
}

function __git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "{$branch}"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "{$commit}"
  fi
}

# Set a decent default that is git friendly.
export PS1="\[$COLOR_WHITE\][\u]\[\$(__git_color)\] \$(__git_branch) \[$COLOR_YELLOW\]\w\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "
