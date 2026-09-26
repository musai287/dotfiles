if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

fpath=(${fpath:#/opt/homebrew/share/zsh/site-functions})
fpath=(${fpath:#/opt/homebrew/share/zsh/site-functions/*})

source $ZSH/oh-my-zsh.sh

for p in $fpath; do
  [[ -d "$p" ]] || fpath=(${fpath:#$p})
done

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"

alias runSito="cd ~/robeCAHC/ProvaSito && python3 -m http.server 8000"
alias pydoc="python3 -m pydoc"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v tmux &>/dev/null && [ -z "$TMUX" ] && [ -t 1 ]; then
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    session_name="iterm-${ITERM_SESSION_ID:(-8)}"
  else
    session_name="term-$$"
  fi
  
  if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name"
  fi
  
  exec tmux attach -t "$session_name"
fi

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
