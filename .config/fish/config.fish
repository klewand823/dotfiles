set fish_greeting

fish_add_path /usr/lib/cargo/bin
fish_add_path /usr/lib/llvm-14/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/work/go/bin
fish_add_path $HOME/github/klewand-tools/cmdTools
fish_add_path $HOME/github/klewand-tools/gorepo/bin

set -x MANPAGER "nvim +Man!"
set -x MANWIDTH 999

set -x EDITOR "nvim"
set -x PYENV_ROOT "$HOME/.pyenv"
set -x BAT_THEME "Catppuccin-mocha"
set -x userdomain "WORKGROUP"
set -x USERNAME "klewand"

set -x http_proxy http://proxy-dmz.intel.com:912/
set -x https_proxy http://proxy-dmz.intel.com:912/
set -x no_proxy intel.com,.intel.com,localhost,127.0.0.1,192.168.0.0/16,10.0.0.0/8

# aliases
alias .. "cd .."
alias ls "eza --group-directories-first -h"
alias ll "eza --group-directories-first -lh"
alias la "eza --group-directories-first -lAh"
alias vim "nvim"
alias vi "nvim"
alias cat "batcat"
alias lg "lazygit"
alias tree "ls --tree -L2 -D"
alias umr "git -C /opt/bios/CrManifest pnt"
#alias osclt "$ONE_SOURCE_BUNDLE/OneSourceCommandLineTooling/bin/osclt"
alias workmode "kinit && mount_rclone.sh"
alias ggrep "git log --grep"
alias cl "clear"

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook fish)" # direnv hook
eval "$(zoxide init fish)" # zoxide hook
eval "$(starship init fish)" # starship hook
fzf --fish | source # fzf integration

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function new_branch
  git checkout -b pull_request/klewand823/$(date +"%Y-%m-%d_%H-%M")/$(echo $argv | sed 's/ /_/gi')
end

function biosid
  find ./$1 -type f -iname BiosId.env -exec echo File: {} \; -execdir tail -6 {} \;
end

function qc
  pyenv activate quality_check
  set -x TEAMCITY_BUILD_PROPERTIES_FILE "../teamcity.props"
  env PYTHONPATH=/opt/bios/CrTools python CrTools/ccg-tools/QualityCheck/QualityCheck.py -W . -R firmware.boot.uefi.iafw.intel -p $argv[1] -i ../qc.ini
  set -u TEAMCITY_BUILD_PROPERTIES_FILE
  pyenv deactivate
end

function gh_commit
  xdg-open "https://github.com/intel-restricted/firmware.boot.uefi.iafw.intel/commit/$argv[1]"
end

function hsd
  xdg-open "https://hsdes.intel.com/appstore/article/#/$argv[1]"
end

function gen_header
  python3 launchers/main.py header_diff osxml_header_compare --od ~/work/osxml/output --ifd ~/work/osxml/output/ifd --osbrd ~/work/onesourcebundle/latest --aord ~/work/osxml --su $1 $2
end


