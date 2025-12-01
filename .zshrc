# Only run fastfetch when zsh was started by sshd
if [[ -n $SSH_TTY || -n $SSH_CONNECTION ]]; then
  fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load Custom exports, aliases, and secrets
[[ -f ~/.zsh_exports ]] && source ~/.zsh_exports
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

# Add user functions to the top of fpath. This ensures that user functions
# always take priority over system or plugin-defined ones.
fpath=(~/.zsh_functions $fpath)

# Autoload all my custom functions
for f in ~/.zsh_functions/*; do
  autoload -Uz "${f:t}"
done

# Escape to enter vim normal mode -> Press 'v' to enter neovim to edit command
# Press :wq to send verbatim command to zsh
bindkey -v
bindkey -M vicmd 'v' edit-command-line

# veto certain commands before they are written to file
zshaddhistory() {
  integer maxlen=${HISTORY_COMMAND_MAX_LENGTH:-500}

  (( ${#1} > maxlen )) && return 1	# veto long entries
  [[ $1 == 'gpt '* ]] && return 1   # veto gpt entries
  return 0						              # accept everything else
}
export PATH="$HOME/.local/share/Steam/steamapps/common/Aseprite:$PATH"
