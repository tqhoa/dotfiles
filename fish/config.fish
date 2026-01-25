set fish_greeting ""
set fish_color_valid_path
set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g fish_autosuggestion_enabled 1
set -g fish_color_autosuggestion 444444


set -x NODE_NO_WARNINGS 1
# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias cat bat
alias vim nvim
alias vi nvim

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
#set -g GOPATH $HOME/go
#set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end
set --universal nvm_default_version v21.7.1

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
end

#set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
#if test -f $LOCAL_CONFIG
#    source $LOCAL_CONFIG
#end
