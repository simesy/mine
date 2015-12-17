# Include the other files relative to this.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Stuff for the prompt, useful functions and colours.
source $DIR/bashrc_prompt.sh

# Aliases
source $DIR/bashrc_aliases.sh

# Add composer commands to the path.
export PATH="$HOME/.composer/vendor/bin:$PATH"
