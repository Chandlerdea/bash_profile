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
#
# Author:  Marc Palmer
# Twitter: https://twitter.com/marcpalmerdev
# Blog:    https://marcpalmer.net
#
# This is a .bash_profile file that you can write to your home directory to give
# you a custom shell prompt that will include the git branch and status of your
# current working dir as well as the current Xcode version.
#
# This is really handy when you're running multiple Xcode versions on your machine and have to run
# command line builds such as carthage, fastlane or cocoapods which can fail or do the
# wrong thing and waste a lot of time if xcode-select is not using the version of Xcode tools you expect.

#
# These git parts were verbatim copied from http://ezprompt.net
#

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

# Parse out version from xcodebuild's plist based on output of xcode-select
# Thanks to @danielpunkass for the performance improvement that avoids executing "xcodebuild -version"
function parse_xcode_version {
	echo `plutil -p \`xcode-select -p\`/../Info.plist | grep -e CFBundleShortVersionString | sed 's/[^0-9\.]*//g'`
}

# Set the prompt to include colored Xcode version and git status.
# We use a light blue bg and the hammer emoji to signal that the version information is about Xcode
# This sets the prompt to expand to "<user>:<working-dir> 🔨<xcode-version> [<git-info>]$ "
export PS1="___________________  | \u @ \w \[\033[46m\] 🔨\[\033[30m\]\`parse_xcode_version\` \[\033[00m\] \`parse_git_branch\` \n| => "
#export PS1="___________________    | \w @ \h (\u) \n| => "
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

alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias f='open -a Finder'
alias ~='cd ~'
alias c='clear'
alias cdv='cd ~/Development'
alias reload='source ~/.bash_profile'

# --------------------------
# 3. Git
# --------------------------

eval "$(hub alias -s)"

# --------------------------
# 3. APPLE DEVELOPMENT
# --------------------------
## Starts recording the simulator.
recsim() {
    xcrun simctl io booted recordVideo "$1.mp4"
}

function viewControllerKit() {
	swift run --package-path ~/Development/Personal/GitHub/ViewControllerKit ViewControllerKit $1 $2 $3 $4
}

alias mkvc='viewControllerKit'

# --------------------------
# 4. WEB DEVELOPMENT
# --------------------------

# --------------------------
# Java
# --------------------------
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_171)

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
