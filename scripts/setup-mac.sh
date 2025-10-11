#!/bin/bash

echo "🍏 Dotfiles Mac Setup (tmux + zsh + plugin + font)"

# 1. Installa Homebrew se non c'è
if ! command -v brew &> /dev/null; then
    echo "💡 Installo Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Installa pacchetti base
brew install git tmux zsh curl fontconfig

# 3. Installa Nerd Fonts (JetBrains Mono)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# 4. Symlink tmux.conf
mkdir -p ~/.config/tmux
rm -f ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf

# 5. Installa TPM
mkdir -p ~/.config/tmux/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/.tmux/plugins/tpm

# 6. Installa Catppuccin
git clone https://github.com/catppuccin/tmux ~/.config/tmux/.tmux/plugins/catppuccin

# 7. Symlink zshrc
rm -f ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 8. Installa Oh My Zsh + Powerlevel10k
if [ ! -d ~/.oh-my-zsh ]; then
    echo "💡 Installo Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "💡 Installo Powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

# 9. Installa plugin Oh My Zsh
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 10. Imposta zsh come shell di default
chsh -s $(which zsh)

echo ""
echo "✅ Setup completato!"
echo "Apri una nuova shell con 'zsh' e un nuovo tmux con 'tmux'."
echo "Dentro tmux, premi: Ctrl+B poi Shift+I per installare tutti i plugin tmux!"
echo ""
