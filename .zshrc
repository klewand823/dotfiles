# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/klewand/.zshrc"

autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select
zmodload zsh/complist

# End of lines added by compinstall
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# to mimic fish's auto-completion by pressing Ctrl+F
bindkey '^F' autosuggest-accept

# variables
export VM=gkgapp0300.ger.corp.intel.com
export PATH=/usr/lib/cargo/bin:/usr/lib/llvm-14/bin:$HOME/work/cmdTools:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/bin/nvim-linux64/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/work/go/bin:$PATH
export EDITOR="nvim"
export PYENV_ROOT="$HOME/.pyenv"
export BAT_THEME="Catppuccin-mocha"
export userdomain="WORKGROUP"
export USERNAME="klewand"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# aliases
alias ..="cd .."
alias exa="exa -1 --group-directories-first"
alias ll="ls -l"
alias la="ls -A"
alias vim="nvim"
alias vi="nvim"
alias cb="git branch | fzf | xargs git checkout"
alias vm="ssh klewand@$VM"
alias sc="ssh zsc2-login.zsc2.intel.com"
alias mu="$HOME/work/go/bin/manifestui"
alias wp="python $HOME/work/cmdTools/worktree_proj.py"
alias cat="batcat"
alias lg="lazygit"
alias tree="ls --tree -L2 -D"
alias resy="repoutil.sh sync"
alias recl="repoutil.sh clean"
alias reha="repoutil.sh hash"
alias rebr="repoutil.sh branch"
alias umr="git -C /opt/bios/CrManifest pnt"
#alias osclt="$ONE_SOURCE_BUNDLE/OneSourceCommandLineTooling/bin/osclt"
alias workmode="kinit && mount_rclone.sh"
alias bbuilder="podman run -it -v/opt/bios:/opt/bios bios"
alias ggrep="git log --grep"
alias ezrc="$EDITOR ~/.zshrc"
alias cl="clear"
alias hist="cat ~/.histfile | fzf"
alias notes="nvim ~/notes.md"

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Ctrl arrowszprofile
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# direnv hook
eval "$(direnv hook zsh)"

# zoxide
eval "$(zoxide init zsh)"

# custom functions
new_branch() {
  git checkout -b pull_request/klewand823/`date +"%Y-%m-%d_%H-%M"`/$1
}

biosid() {
  find ./$1 -type f -iname BiosId.env -exec echo File: {} \; -execdir tail -6 {} \;
}

qc() {
  py CrTools/ccg-tools/QualityCheck/QualityCheck.py -W . -R firmware.boot.uefi.iafw.intel -p $1 -i ../qc.ini
}

sync_notes() {
  rsync -r --progress ~/AppFlowy ~/OneDrive
}

gh_commit() {
  xdg-open "https://github.com/intel-restricted/firmware.boot.uefi.iafw.intel/commit/$1"
}

hsd() {
  xdg-open "https://hsdes.intel.com/appstore/article/#/$1"
}

vm_mount() {
  sshfs klewand@gkgapp0300.ger.corp.intel.com:D:/ ~/vm
}

eval "$(starship init zsh)"
