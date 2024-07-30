
# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

# Alias's for multiple directory listings
alias ll='ls -FGlhp' 
alias ll.='ls -FGlAhp' 
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd.='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'
alias ....='cd ../../../'          
alias c='clear'
# Change directory aliases
alias home='cd ~'
alias gr='grep -iRnI'                       # Looks through every file in directory for the word given
alias bashProfile='sublime ~/.bash_profile'
alias bashrc='sublime ~/.bashrc'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Enable Git tab completion
if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

cd() {
    if [[ "$1" == "UNSW" ]]; then
        builtin cd ~/Desktop/UNSW
    else
        builtin cd "$@"
    fi
    ll
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/joelabraham/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/joelabraham/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/joelabraham/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/joelabraham/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
export PATH=$PATH:$HOME/.os161-toolchain/bin
alias bmake="bmake -m ~/.os161-toolchain/share/mk"

alias python='python3'
alias ctags='/usr/local/bin/ctags'
