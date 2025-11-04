```markdown
# Dotfiles (tmux + zsh) — Linux

EN / IT

---

## English

Short description
Dotfiles for Linux to configure tmux, zsh and Neovim, plus helper scripts. Setup script automates symlinks and installs a few optional plugins/themes.

Prerequisites
- Git
- Tmux
- Zsh
- (Optional) Oh My Zsh, Powerlevel10k, Nerd Fonts

Quick install
1. Clone the repo:
```bash
git clone https://github.com/musai287/dotfiles.git ~/dotfiles
```

2. Inspect the setup script before running it:
```bash
less ~/dotfiles/scripts/setup-linux.sh
```

3. Run the setup script:
```bash
bash ~/dotfiles/scripts/setup-linux.sh
```

Notes & safety
- Read the setup script before executing it. The script can create symlinks and install packages — make sure you agree with the changes.
- If you want to test without changing files, create a backup of your current configs or run the script on a test machine/container.
- Consider using the `--dry-run` option if present (or run the script step by step).

What the setup script does
- Installs zsh, tmux and some dependencies (tested on Fedora).
- Optionally installs Oh My Zsh and Powerlevel10k.
- Creates symlinks from this repo to your config directories.
- Installs TPM and Catppuccin theme for tmux and helps you install tmux plugins via TPM.

Contributing / Updating
- Make changes on a branch and open a PR.
- To update your local setup after changes:
  - Commit & push changes to the repo.
  - Re-run the setup script to refresh symlinks.

License
This repository is licensed under the MIT License — see LICENSE file.

---

## Italiano

Descrizione breve
Dotfiles per Linux per configurare tmux, zsh e Neovim, con alcuni script di supporto. Lo script di setup automatizza la creazione di symlink e l'installazione di plugin/temi opzionali.

Prerequisiti
- Git
- Tmux
- Zsh
- (Opzionale) Oh My Zsh, Powerlevel10k, Nerd Fonts

Installazione rapida
1. Clona la repo:
```bash
git clone https://github.com/musai287/dotfiles.git ~/dotfiles
```

2. Controlla lo script di setup prima di eseguirlo:
```bash
less ~/dotfiles/scripts/setup-linux.sh
```

3. Esegui lo script di setup:
```bash
bash ~/dotfiles/scripts/setup-linux.sh
```

Note & sicurezza
- Leggi lo script di setup prima di eseguirlo. Lo script può creare symlink e installare pacchetti — verifica che le azioni siano sicure per il tuo sistema.
- Se vuoi provare senza modificare i file attuali, fai un backup delle configurazioni o esegui lo script in una macchina/container di test.
- Se implementi un'opzione `--dry-run`, usala per simulare l'esecuzione.

Cosa fa lo script
- Installa zsh, tmux e alcune dipendenze (testato su Fedora).
- Installa opzionalmente Oh My Zsh e Powerlevel10k.
- Crea symlink dalla repo alle directory di configurazione.
- Installa TPM e il tema Catppuccin per tmux e guida all'installazione dei plugin via TPM.

Contribuire / Aggiornamenti
- Lavora su un branch e apri una pull request.
- Per aggiornare la tua installazione locale dopo modifiche:
  - Committa e pusha le modifiche nella repo.
  - Riesegui lo script di setup per aggiornare i symlink.

Licenza
Questa repo è rilasciata sotto la licenza MIT — vedi il file LICENSE.
```
