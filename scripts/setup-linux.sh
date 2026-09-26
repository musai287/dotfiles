#!/bin/bash

# =========================================================================
# SCRIPT DI INSTALLAZIONE DOTFILES (Fedora / Debian / Ubuntu)
# =========================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BLUE}=======================================${NC}"
echo -e "${GREEN}    🐧 Setup Dotfiles Linux di Sethy   ${NC}"
echo -e "${BLUE}=======================================${NC}\n"

# ---------------------------------------------------------
# RILEVAMENTO SISTEMA OPERATIVO
# ---------------------------------------------------------
if command -v apt >/dev/null 2>&1; then
    echo -e "${GREEN}Sistema rilevato: Debian/Ubuntu (apt)${NC}"
    PKG_UPDATE="sudo apt update"
    PKG_INSTALL="sudo apt install -y"
elif command -v dnf >/dev/null 2>&1; then
    echo -e "${GREEN}Sistema rilevato: Fedora (dnf)${NC}"
    PKG_UPDATE="sudo dnf check-update"
    PKG_INSTALL="sudo dnf install -y"
else
    echo -e "${RED}Errore: Gestore pacchetti non supportato. Usa Fedora o Debian/Ubuntu.${NC}"
    exit 1
fi

echo -e "${YELLOW}Aggiorno i repository...${NC}"
$PKG_UPDATE >/dev/null 2>&1

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
# INSTALLAZIONI E SYMLINK
# ---------------------------------------------------------

# --- ZSH & POWERLEVEL10K ---
if ask "Zsh, Oh My Zsh, Powerlevel10k e Plugin"; then
    echo -e "${BLUE}Installazione pacchetti Zsh...${NC}"
    $PKG_INSTALL zsh git curl
    
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${BLUE}Installazione Oh My Zsh...${NC}"
        RUNZSH=no CHSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        echo -e "${BLUE}Installazione Powerlevel10k...${NC}"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi

    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi

    echo -e "${BLUE}Creazione symlink per Zsh...${NC}"
    link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    link_file "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    
    sudo chsh -s $(which zsh) $USER
fi

# --- NEOVIM ---
if ask "Neovim e dipendenze (Ripgrep, GCC, ecc.)"; then
    echo -e "${BLUE}Installazione dipendenze Neovim...${NC}"
    $PKG_INSTALL neovim ripgrep gcc make unzip xclip

    echo -e "${BLUE}Creazione symlink per Neovim...${NC}"
    link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
fi

# --- TMUX ---
if ask "Tmux"; then
    echo -e "${BLUE}Installazione Tmux...${NC}"
    $PKG_INSTALL tmux

    echo -e "${BLUE}Creazione symlink per Tmux...${NC}"
    link_file "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"
fi

# --- KITTY TERMINAL ---
if ask "Kitty Terminal"; then
    echo -e "${BLUE}Installazione Kitty...${NC}"
    $PKG_INSTALL kitty

    echo -e "${BLUE}Creazione symlink per Kitty...${NC}"
    link_file "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
fi
# --- YAZI & GLOW ---
if ask "Yazi (File manager), Glow (Markdown) e FFmpeg"; then
    echo -e "${BLUE}Installazione Yazi, Glow e dipendenze multimediali...${NC}"
    
    if command -v dnf >/dev/null 2>&1; then
        # Setup per Fedora
        sudo dnf copr enable -y lihaohong/yazi
        sudo sh -c 'echo -e "[charm]\nname=Charm\nbaseurl=https://repo.charm.sh/yum/\nenabled=1\ngpgcheck=1\ngpgkey=https://repo.charm.sh/yum/gpg.key" > /etc/yum.repos.d/charm.repo'
        $PKG_INSTALL yazi ffmpeg glow
    elif command -v apt >/dev/null 2>&1; then
        # Setup per Debian/Ubuntu
        $PKG_INSTALL ffmpeg curl gpg
        # Repository ufficiale per Glow
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
        echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
        sudo apt update && sudo apt install -y glow
        # Avviso per Yazi (su apt non c'è una repo ufficiale, meglio usare cargo)
        echo -e "${YELLOW}Nota: Per installare Yazi su Debian/Ubuntu, esegui successivamente: cargo install --locked yazi-fm yazi-cli${NC}"
    fi

    echo -e "${BLUE}Creazione symlink per Yazi...${NC}"
    link_file "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
fi
# ---------------------------------------------------------
# FINE
# ---------------------------------------------------------
echo -e "\n${GREEN}=======================================${NC}"
echo -e "${GREEN}      Setup completato con successo!   ${NC}"
if [ -d "$BACKUP_DIR" ] && [ "$(ls -A $BACKUP_DIR)" ]; then
    echo -e "${YELLOW}I backup delle vecchie config sono in: $BACKUP_DIR${NC}"
fi
echo -e "${GREEN}=======================================${NC}"
if ask "Vuoi avviare Zsh ora per completare il setup?"; then
    exec zsh
fi
