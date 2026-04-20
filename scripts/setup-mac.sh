#!/bin/bash

echo "🍏 Dotfiles Mac Setup (tmux + zsh + nvim + plugin + font)"

# 1. Installa Homebrew se non c'è
if ! command -v brew &> /dev/null; then
    echo "💡 Installo Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Installa pacchetti base (Aggiunto neovim e ripgrep)
echo "💡 Installo i pacchetti base..."
brew install git tmux zsh curl neovim ripgrep fontconfig

# 3. Installa Nerd Fonts (JetBrains Mono) - Fix: tap deprecato
echo "💡 Installo i font..."
brew install --cask font-jetbrains-mono-nerd-font

# 4. Symlink tmux.conf
echo "💡 Configuro tmux..."
mkdir -p ~/.config/tmux
rm -f ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf

# 5. Installa TPM e Catppuccin
mkdir -p ~/.config/tmux/.tmux/plugins
if [ ! -d ~/.config/tmux/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/.tmux/plugins/tpm
fi
if [ ! -d ~/.config/tmux/.tmux/plugins/catppuccin ]; then
    git clone https://github.com/catppuccin/tmux ~/.config/tmux/.tmux/plugins/catppuccin
fi

# 6. Symlink Neovim (La nostra nuova aggiunta!)
echo "💡 Configuro Neovim..."
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# 7. Symlink zshrc
echo "💡 Configuro Zsh..."
rm -f ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 8. Installa Oh My Zsh (Fix: Installazione silenziosa)
if [ ! -d ~/.oh-my-zsh ]; then
    echo "💡 Installo Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Installa Powerlevel10k
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "💡 Installo Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

# 9. Installa plugin Oh My Zsh
echo "💡 Installo plugin per Zsh..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 10. Imposta zsh come shell di default (solo se non lo è già)
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "💡 Imposto Zsh come shell di default (potrebbe chiedere la password)..."
    chsh -s $(which zsh)
fi

echo ""
echo "✅ Setup completato!"
echo "👉 Apri una nuova shell per vedere i cambiamenti."
echo "👉 Dentro tmux, premi: Ctrl+B poi Shift+I per installare tutti i plugin."
echo ""
