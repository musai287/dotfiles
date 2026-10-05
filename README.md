# Dotfiles — Linux & macOS

EN / IT

---

## English

Short description
My personal dotfiles for Linux (Fedora/Debian) and macOS. This repository centrally manages configurations for Zsh, Tmux, Neovim, Kitty, and Yazi. The included interactive setup scripts automate symlinking and install required packages, plugins, and themes idempotently.

Stack
- **Shell & Multiplexer:** Zsh (Oh My Zsh, Powerlevel10k), Tmux (TPM, Catppuccin)
- **Editor:** Neovim
- **Terminal & File Manager:** Kitty, Yazi (with FFmpeg for media previews)
- **Documentation:** Glow (Markdown renderer)

Quick install
1. Clone the repo:
```bash
git clone https://github.com/musai287/dotfiles.git ~/dotfiles
```

2. Run the interactive setup script based on your OS:

**For Linux (Fedora / Debian / Ubuntu):**
```bash
bash ~/dotfiles/scripts/setup-linux.sh
```

**For macOS (Apple Silicon / Intel):**
```bash
bash ~/dotfiles/scripts/setup-mac.sh
```

Notes & safety
- Read the setup scripts before executing them. They can install packages (via `dnf`, `apt`, or `brew`) and create symlinks.
- The scripts are interactive and idempotent: you can choose exactly what to install, and existing local configurations will be automatically backed up (e.g., `~/dotfiles_backup_...`).

What the setup scripts do
- Install Homebrew (on macOS) and required system packages.
- Install Zsh, Tmux, Kitty, Neovim, Yazi, Glow, and FFmpeg.
- Optionally configure Oh My Zsh and Powerlevel10k.
- Create symlinks from this repo to your local `~/.config` and home directories.

Contributing / Updating
- To update your local setup after remote changes:
  - `git pull` the latest changes.
  - Re-run the setup script to refresh symlinks safely.

License
This repository is licensed under the MIT License — see LICENSE file.

---

## Italiano

Descrizione breve
I miei dotfiles personali per Linux (Fedora/Debian) e macOS. Questa repository centralizza le configurazioni per Zsh, Tmux, Neovim, Kitty e Yazi. Gli script di setup interattivi automatizzano la creazione dei symlink e l'installazione di pacchetti, plugin e temi in modo sicuro.

Stack
- **Shell & Multiplexer:** Zsh (Oh My Zsh, Powerlevel10k), Tmux (TPM, Catppuccin)
- **Editor:** Neovim
- **Terminale & File Manager:** Kitty, Yazi (con FFmpeg per le anteprime video)
- **Documentazione:** Glow (Renderizzazione Markdown)

Installazione rapida
1. Clona la repo:
```bash
git clone [https://github.com/musai287/dotfiles.git](https://github.com/musai287/dotfiles.git) ~/dotfiles
```

2. Esegui lo script interattivo in base al tuo sistema operativo:

**Per Linux (Fedora / Debian / Ubuntu):**
```bash
bash ~/dotfiles/scripts/setup-linux.sh
```

**Per macOS (Apple Silicon / Intel):**
```bash
bash ~/dotfiles/scripts/setup-mac.sh
```

Note & sicurezza
- Leggi gli script di setup prima di eseguirli. Possono installare pacchetti (tramite `dnf`, `apt` o `brew`) e creare symlink.
- Gli script sono interattivi e idempotenti: puoi scegliere esattamente cosa installare. Se hai già dei file di configurazione, lo script creerà un backup automatico in una cartella sicura (es. `~/dotfiles_backup_...`).

Cosa fanno gli script
- Installano Homebrew (su macOS) e i pacchetti di sistema necessari.
- Installano Zsh, Tmux, Kitty, Neovim, Yazi, Glow e FFmpeg.
- Configurano opzionalmente Oh My Zsh e Powerlevel10k.
- Creano i symlink dalla repository alle cartelle `~/.config` e alla home.

Contribuire / Aggiornamenti
- Per aggiornare la tua installazione locale dopo aver fatto modifiche:
  - Scarica gli aggiornamenti con `git pull`.
  - Riesegui lo script di setup per aggiornare i symlink in totale sicurezza.

Licenza
Questa repo è rilasciata sotto la licenza MIT — vedi il file LICENSE.
