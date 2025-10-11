# Dotfiles Setup (tmux + zsh) per Linux

## Prerequisiti
- Git
- Tmux
- Zsh
- (Opzionale: Oh My Zsh, Powerlevel10k, Nerd Fonts)

## Istruzioni rapide

1. **Clona la repo dei dotfiles**
    ```bash
    git clone https://github.com/tuoutente/dotfiles.git ~/dotfiles
    ```

2. **Esegui lo script di setup**
    ```bash
    bash ~/dotfiles/scripts/setup-linux.sh
    ```

3. **Avvia zsh e tmux**
    ```bash
    zsh
    tmux
    ```

---

## Cosa fa lo script?

- Installa zsh, tmux e le dipendenze principali (Fedora)
- Installa Oh My Zsh e Powerlevel10k se vuoi
- Crea i symlink tra la repo e le directory di configurazione
- Installa TPM e Catppuccin per tmux
- Ti guida a installare i plugin tmux via TPM

---

## Aggiornamenti

Quando cambi qualcosa nei dotfiles:
- Modifica nella repo
- Committa e pusha
- Esegui di nuovo lo script per aggiornare i symlink

---

