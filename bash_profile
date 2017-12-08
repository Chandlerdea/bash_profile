#
#
#
# 1. ENVIRONMENT CONFIGURATION
# 2. MAKE TERMINAL BETTER
# 3. APPLE DEVELOPMENT
# 4. WEB DEVELOPMENT
#
# —————————————————————————————————————————————————————————————————

# —————————————————————————————
# 1. ENVIRONMENT CONFIGURATION
# —————————————————————————————

# Change Prompt
# —————————————————————————————————————————————————————————————
export PS1="___________________    | \w @ \h (\u) \n| => "
export PS2="| => "

# Set Paths
# ———————————————————————————————————————————————————————————————————-
# export PATH="/user/local/bin:$PATH""~/.cargo/bin"

# Add color to terminal
# from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# --------------------------------------------------------------------------
export CLICOLOR=1
export LACOLORS=ExFxBxDxCxegedabagacad

# Set default editor
# ———————————————————
# export EDITOR=/usr/bin/nano

# ssh
# ------------------
export SSH_KEY_PATH="~/.ssh/dsa_id"

# ---------------------------
# 2. MAKE TERMINAL BETTER
# ---------------------------


# --------------------------
# 3. APPLE DEVELOPMENT
# --------------------------

# --------------------------
# 4. WEB DEVELOPMENT
# --------------------------

# Heroku
# --------------------
alias runtbstaging='heroku run rails console --app thebenefit-staging'


export PATH="$HOME/.cargo/bin:$PATH"
