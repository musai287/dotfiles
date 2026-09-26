#!/bin/bash

# =========================================================================
# SCRIPT DI INSTALLAZIONE DOTFILES (macOS)
# =========================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BLUE}=======================================${NC}"
echo -e "${GREEN}    🍏 Setup Dotfiles Mac di Sethy     ${NC}"
echo -e "${BLUE}=======================================${NC}\n"

# ---------------------------------------------------------
# FUNZIONI DI SUPPORTO
# ---------------------------------------------------------
ask() {
    local prompt="$1"
    while true; do
        read -p "$(echo -e ${YELLOW}"Vuoi installare e configurare $prompt? [s/N]: "${NC})" yn
        case $yn in
            [Ss]* ) return 0;;
            [Nn]* | "" ) return 1;;
            * ) echo -e "${RED}Rispondi 's' o 'n'.${NC}";;
        esac
    done
}

link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ "$(readlink "$dest")" = "$src" ]; then
            echo -e "${GREEN}  ✓ Symlink già corretto: $dest${NC}"
            return
        else
            echo -e "${YELLOW}  ! Backup config esistente: $dest${NC}"
            mkdir -p "$BACKUP_DIR"
            mv "$dest" "$BACKUP_DIR/"
        fi
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo -e "${GREEN}  ✓ Creato: $dest -> $src${NC}"
}

# ---------------------------------------------------------
# 1. HOMEBREW (Obbligatorio su Mac)
# ---------------------------------------------------------
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew non trovato. Installazione in corso...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Aggiunge brew al PATH temporaneamente per lo script (sui Mac Apple Silicon)
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo -e "${GREEN}Homebrew è già installato.${NC}"
    echo -e "${BLUE}Aggiorno Homebrew...${NC}"
    brew update >/dev/null 2>&1
fi

# ---------------------------------------------------------
# INSTALLAZIONI E SYMLINK (Interattivi)
# ---------------------------------------------------------

# --- FONT ---
if ask "Nerd Fonts (JetBrains Mono per icone e terminale)"; then
    echo -e "${BLUE}Installazione font...${NC}"
    brew install --cask font-jetbrains-mono-nerd-font
fi

# --- ZSH & POWERLEVEL10K ---
if ask "Zsh, Oh My Zsh, Powerlevel10k e Plugin"; then
    echo -e "${BLUE}Installazione pacchetti base...${NC}"
    brew install zsh curl git

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${BLUE}Installazione Oh My Zsh...${NC}"
        RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
    
    # Powerlevel10k
    if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
        echo -e "${BLUE}Installazione Powerlevel10k...${NC}"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    fi

    # Plugin
    [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
    [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

    echo -e "${BLUE}Creazione symlink per Zsh...${NC}"
    link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo -e "${YELLOW}Imposto Zsh come shell di default (potrebbe chiedere la password)...${NC}"
        chsh -s $(which zsh)
    fi
fi

# --- NEOVIM ---
if ask "Neovim e dipendenze (Ripgrep, ecc.)"; then
    echo -e "${BLUE}Installazione Neovim e tool di ricerca...${NC}"
    # Su Mac gcc/make sono inclusi in Xcode Command Line Tools, che brew installa.
    brew install neovim ripgrep

    echo -e "${BLUE}Creazione symlink per Neovim...${NC}"
    link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
fi

# --- TMUX ---
if ask "Tmux e plugin (TPM, Catppuccin)"; then
    echo -e "${BLUE}Installazione Tmux...${NC}"
    brew install tmux

    echo -e "${BLUE}Configurazione Tmux e Plugin Manager...${NC}"
    mkdir -p "$HOME/.config/tmux/.tmux/plugins"
    
    if [ ! -d "$HOME/.config/tmux/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/.tmux/plugins/tpm"
    fi
    if [ ! -d "$HOME/.config/tmux/.tmux/plugins/catppuccin" ]; then
        git clone https://github.com/catppuccin/tmux "$HOME/.config/tmux/.tmux/plugins/catppuccin"
    fi

    # Symlink per tmux.conf dal tuo repo alla cartella .config/tmux
    link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.config/tmux/tmux.conf"
fi

# --- KITTY TERMINAL ---
if ask "Kitty Terminal"; then
    echo -e "${BLUE}Installazione Kitty...${NC}"
    brew install --cask kitty

    echo -e "${BLUE}Creazione symlink per Kitty...${NC}"
    link_file "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
fi
# --- YAZI & GLOW ---
if ask "Yazi (File manager), Glow (Markdown) e FFmpeg"; then
    echo -e "${BLUE}Installazione Yazi, Glow e FFmpeg...${NC}"
    brew install yazi ffmpeg glow

    echo -e "${BLUE}Creazione symlink per Yazi...${NC}"
    link_file "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
fi
# ---------------------------------------------------------
# FINE
# ---------------------------------------------------------
echo -e "\n${GREEN}=======================================${NC}"
echo -e "${GREEN}      Setup macOS completato!          ${NC}"
if [ -d "$BACKUP_DIR" ] && [ "$(ls -A $BACKUP_DIR)" ]; then
    echo -e "${YELLOW}I backup delle vecchie config sono in: $BACKUP_DIR${NC}"
fi
echo -e "${GREEN}=======================================${NC}"
echo -e "👉 ${YELLOW}Ricorda: dentro tmux, premi 'Ctrl+B' poi 'Shift+I' per installare i plugin.${NC}"

if ask "Vuoi avviare Zsh ora per caricare tutte le novità?"; then
    exec zsh
fi
