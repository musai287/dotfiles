#!/bin/bash

echo "🦾 Setup Dotfiles Linux (tmux + zsh + nvim + plugin + font)"

# 1. Installa pacchetti base (Aggiunti wget, unzip, neovim e ripgrep)
echo "💡 Installo i pacchetti base..."
if command -v dnf &> /dev/null; then
    sudo dnf install -y git tmux zsh curl wget unzip neovim ripgrep
elif command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y git tmux zsh curl wget unzip neovim ripgrep
else
    echo "❌ Gestore pacchetti non supportato (usa apt o dnf)."
    exit 1
fi

# 2. Installa JetBrains Mono Nerd Font (Metodo manuale universale per Linux)
echo "💡 Installo JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
if [ ! -d "$FONT_DIR/JetBrainsMono" ]; then
    mkdir -p "$FONT_DIR/JetBrainsMono"
    wget -qO /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -q /tmp/JetBrainsMono.zip -d "$FONT_DIR/JetBrainsMono"
    rm /tmp/JetBrainsMono.zip
    fc-cache -fv
else
    echo "✔️ Font già installato."
fi

# 3. Symlink tmux.conf
echo "💡 Configuro tmux..."
mkdir -p ~/.config/tmux
rm -f ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf

# 4. Installa TPM e Catppuccin (Idempotente)
mkdir -p ~/.config/tmux/.tmux/plugins
if [ ! -d ~/.config/tmux/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/.tmux/plugins/tpm
fi
if [ ! -d ~/.config/tmux/.tmux/plugins/catppuccin ]; then
    git clone https://github.com/catppuccin/tmux ~/.config/tmux/.tmux/plugins/catppuccin
fi

# 5. Symlink Neovim (Cruciale per il nostro setup!)
echo "💡 Configuro Neovim..."
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# 6. Symlink zshrc
echo "💡 Configuro Zsh..."
rm -f ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 7. Installa Oh My Zsh (Fix: Installazione silenziosa e non bloccante)
if [ ! -d ~/.oh-my-zsh ]; then
    echo "💡 Installo Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "💡 Installo Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

# 8. Installa plugin Oh My Zsh
echo "💡 Installo plugin per Zsh..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 9. Imposta zsh come shell di default
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "💡 Imposto Zsh come shell di default (potrebbe chiedere la password)..."
    chsh -s $(which zsh)
fi

echo ""
echo "✅ Setup completato!"
echo "👉 Riavvia il terminale o digita 'zsh' per applicare le modifiche."
echo "👉 Dentro tmux, premi: Ctrl+B poi Shift+I per installare tutti i plugin."
echo ""
