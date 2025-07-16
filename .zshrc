typeset -g PROMPT_EOL_MARK=''

# Load environment variables with direnv
eval "$(direnv hook zsh)"

# Custom exports
# Exports -> Aliases -> Functions
if [ -f ~/.zsh_exports ]; then
  source ~/.zsh_exports
fi

# Detect environment. If $VIM or $VIMRUNTIME or $NVIM_LISTEN_ADDRESS is set,
# you know we're likely invoked from inside Vim or Neovim.
if [[ -n "$VIM" || -n "$VIMRUNTIME" || -n "$NVIM_LISTEN_ADDRESS" ]]; then
  
  # Minimal config here
  setopt NO_MONITOR  # so it doesn't complain about 'monitor'
  
  # Source our aliases
  [ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
  
  # Export the VIM variables to the child shell
  for var in NVIM_LISTEN_ADDRESS VIM VIMRUNTIME; do
    if [[ -n "${(P)var}" ]]; then
      export $var
    fi
  done
  
  # Add user functions to the top of fpath. This ensures that user functions
  # always take priority of system or plugin-defined ones.
  fpath=(~/.zsh_functions $fpath)
  
  # Autoload all my custom functions
  for f in ~/.zsh_functions/*; do
    autoload -Uz "${f:t}"
  done

else
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  
  # If you come from bash you might have to change your $PATH.
  # export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
  
  # Path to your Oh My Zsh installation.
  export ZSH="$HOME/.oh-my-zsh"
  
  # Set name of the theme to load --- if set to "random", it will
  # load a random theme each time Oh My Zsh is loaded, in which case,
  # to know which specific one was loaded, run: echo $RANDOM_THEME
  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  ZSH_THEME="powerlevel10k/powerlevel10k"
  
  # Set list of themes to pick from when loading at random
  # Setting this variable when ZSH_THEME=random will cause zsh to load
  # a theme from this variable instead of looking in $ZSH/themes/
  # If set to an empty array, this variable will have no effect.
  # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
  
  # Uncomment the following line to use case-sensitive completion.
  # CASE_SENSITIVE="true"
  
  # Uncomment the following line to use hyphen-insensitive completion.
  # Case-sensitive completion must be off. _ and - will be interchangeable.
  # HYPHEN_INSENSITIVE="true"
  
  # Uncomment one of the following lines to change the auto-update behavior
  # zstyle ':omz:update' mode disabled  # disable automatic updates
  zstyle ':omz:update' mode auto      # update automatically without asking
  # zstyle ':omz:update' mode reminder  # just remind me to update when it's time
  
  # Uncomment the following line to change how often to auto-update (in days).
  zstyle ':omz:update' frequency 1
  
  # Uncomment the following line if pasting URLs and other text is messed up.
  # DISABLE_MAGIC_FUNCTIONS="true"
  
  # Uncomment the following line to disable colors in ls.
  # DISABLE_LS_COLORS="true"
  
  # Uncomment the following line to disable auto-setting terminal title.
  # DISABLE_AUTO_TITLE="true"
  
  # Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="true"
  
  # Uncomment the following line to display red dots whilst waiting for completion.
  # You can also set it to another string to have that shown instead of the default red dots.
  # e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
  # Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
  COMPLETION_WAITING_DOTS="true"
  
  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  # DISABLE_UNTRACKED_FILES_DIRTY="true"
  
  # Uncomment the following line if you want to change the command execution time
  # stamp shown in the history command output.
  # You can set one of the optional three formats:
  # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  # or set a custom format using the strftime function format specifications,
  # see 'man strftime' for details.
  # HIST_STAMPS="mm/dd/yyyy"
  
  # Would you like to use another custom folder than $ZSH/custom?
  # ZSH_CUSTOM=/path/to/new-custom-folder
  
  # Which plugins would you like to load?
  # Standard plugins can be found in $ZSH/plugins/
  # Custom plugins may be added to $ZSH_CUSTOM/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
  
  source $ZSH/oh-my-zsh.sh
  
  # User configuration
  
  # export MANPATH="/usr/local/man:$MANPATH"
  
  # You may need to manually set your language environment
  # export LANG=en_US.UTF-8
  
  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim' # consider using 'vim' if system is too slow
  else
    export EDITOR='nvim'
  fi
  
  # Compilation flags
  # export ARCHFLAGS="-arch $(uname -m)"
  
  # Set personal aliases, overriding those provided by Oh My Zsh libs,
  # plugins, and themes. Aliases can be placed here, though Oh My Zsh
  # users are encouraged to define aliases within a top-level file in
  # the $ZSH_CUSTOM folder, with .zsh extension. Examples:
  # - $ZSH_CUSTOM/aliases.zsh
  # - $ZSH_CUSTOM/macos.zsh
  # For a full list of active aliases, run `alias`.
  #
  # Example aliases
  # alias zshconfig="mate ~/.zshrc"
  # alias ohmyzsh="mate ~/.oh-my-zsh"
  
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  
  # Add path to pipx modules
  #export PATH="$HOME/.local/bin:$PATH"
  
  # Source our aliases
  [ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
  
  # Add user functions to the top of fpath. This ensures that user functions
  # always take priority of system or plugin-defined ones.
  fpath=(~/.zsh_functions $fpath)
  
  # Autoload all my custom functions
  for f in ~/.zsh_functions/*; do
    autoload -Uz "${f:t}"
  done
  
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet 
  
  bindkey -v
  bindkey -M vicmd 'v' edit-command-line
  
  # don’t save lines longer than HISTORY_COMMAND_MAX_LENGTH chars
  zshaddhistory() {
    (( ${#1} > HISTORY_COMMAND_MAX_LENGTH )) && return 1    # veto long entries
    [[ $1 == gpt\ * ]] && return 1                          # veto gpt entries
    return 0                       # accept everything else
  }
  # End normal initialization
fi

[[ -o interactive ]] && fastfetch
