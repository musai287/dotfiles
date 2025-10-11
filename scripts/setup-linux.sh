#!/bin/bash

echo "🦾 Setup Dotfiles Linux (tmux + zsh + plugin)"

# 1. Installa pacchetti base
if command -v dnf &> /dev/null; then
    sudo dnf install -y git tmux zsh curl fontawesome-fonts
elif command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y git tmux zsh curl fonts-font-awesome
fi

# 2. Symlink tmux.conf
mkdir -p ~/.config/tmux
rm -f ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf

# 3. Installa TPM (plugin manager tmux)
mkdir -p ~/.config/tmux/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/.tmux/plugins/tpm

# 4. Installa Catppuccin (tema tmux)
git clone https://github.com/catppuccin/tmux ~/.config/tmux/.tmux/plugins/catppuccin

# 5. Symlink zshrc
rm -f ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 6. Installa Oh My Zsh + Powerlevel10k
if [ ! -d ~/.oh-my-zsh ]; then
    echo "💡 Installo Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "💡 Installo Powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

# 7. Installa plugin Oh My Zsh
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 8. Imposta zsh come shell di default
chsh -s $(which zsh)

echo ""
echo "✅ Setup completato!"
echo "Apri una nuova shell con 'zsh' e un nuovo tmux con 'tmux'."
echo "Dentro tmux, premi: Ctrl+B poi Shift+I per installare tutti i plugin tmux!"
echo ""
