# Cheatsheet Dotfiles & Workspace

Questo documento contiene sia le scorciatoie personalizzate (Custom) sia i comandi nativi (Default) più importanti per navigare l'ambiente di sviluppo.

## 🐱 Kitty (Terminale)

| Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `Super + ,` | Custom | Apri il file di configurazione nell'editor |
| `Super + r` | Custom | Ricarica la configurazione al volo |
| `Ctrl + Shift + t` | Default | Apri una nuova Tab (Workspace) |
| `Ctrl + Shift + Enter`| Default | Apri una nuova finestra affiancata nello stesso Tab |
| `Ctrl + Shift + q` | Default | Chiudi la Tab o finestra corrente |
| `Ctrl + Shift + → / ←`| Default | Passa alla Tab successiva / precedente |
| `Ctrl + Shift + Alt + t`| Default | Rinomina la Tab corrente |

---

## 🪟 Tmux
*Nota: Tutti i comandi (tranne i popup) richiedono la pressione del tasto `Prefix` (`Ctrl + b` di default) prima di essere eseguiti.*

### 🏢 Gestione Workspace (Sessioni e Finestre)
| Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `n` | Custom | Crea una **nuova sessione** (con prompt per il nome) |
| `f` *(ripetibile)* | Custom | Lancia `tmux-sessionizer` in una nuova finestra |
| `s` | Default | Mostra la lista interattiva di tutte le sessioni |
| `w` | Default | Mostra l'albero interattivo di sessioni e finestre |
| `d` | Default | Scollega (Detach) la sessione corrente (lasciandola in background) |
| `$` | Default | Rinomina la sessione corrente |
| `c` | Default | Crea una **nuova finestra** (Tab) |
| `,` | Default | Rinomina la finestra corrente |
| `p` | Default | Passa alla finestra (Tab) precedente *(Nota: 'n' è stato sovrascritto, usa 'w' per navigare)* |
| `&` | Default | Chiudi (Kill) la finestra corrente |

### 🔲 Gestione Pannelli (Splits)
| Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `r` | Custom | Ricarica il file di configurazione (`tmux.conf`) |
| `\|` | Custom | Dividi il pannello verticalmente (mantiene il percorso) |
| `-` | Custom | Dividi il pannello orizzontalmente (mantiene il percorso) |
| `j / k / l / h` | Custom | Espandi il pannello verso Giù/Su/Destra/Sinistra (di 5 celle) |
| `m` *(ripetibile)* | Custom | Massimizza/Ripristina il pannello corrente (Zoom) |
| `x` | Default | Chiudi (Kill) il pannello corrente |
| `o` | Default | Salta al pannello successivo |

### 🚀 Popup Fluttuanti
| Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `Ctrl + y` | Custom | Apri **Yazi** (File manager) in popup |
| `Ctrl + t` | Custom | Apri terminale rapido (**Zsh**) in popup (80%) |
| `Ctrl + g` | Custom | Apri **Lazygit** in popup |
| `Ctrl + m` | Custom | Apri **rmpc** (Musica) in popup |
| `F` | Custom | Apri terminale **Zsh** in popup (bordi arrotondati, 85%) |
| `N` | Custom | Apri **Neovim** in popup |
| `d` | Custom | Apri il menu di configurazione centrale |

### 📋 Modalità Copia (Vi-mode)
| Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `v` | Custom | Entra in modalità copia / Inizia selezione |
| `y` | Custom | Copia la selezione |

---

## 📝 Neovim

### 🪟 Finestre (Splits) e Schede (Tabs)
| Tasto/Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `:tabe [file]` / `:tabnew`| Default | Apri un file in una **nuova scheda** (Tab) |
| `<leader>to` | Custom | Apri una nuova scheda vuota |
| `<leader>tx` / `:tabc` | Entrambi| Chiudi la scheda corrente |
| `<leader>tn` / `:tabn` | Entrambi| Vai alla scheda successiva |
| `<leader>tp` / `:tabp` | Entrambi| Vai alla scheda precedente |
| `<leader>tf` | Custom | Apri il buffer corrente in una nuova scheda |
| `:vsp [file]` | Default | Dividi verticalmente aprendo un file |
| `:sp [file]` | Default | Dividi orizzontalmente aprendo un file |
| `<leader>sv` | Custom | Dividi finestra verticalmente |
| `<leader>sh` | Custom | Dividi finestra orizzontalmente |
| `<leader>se` | Custom | Rendi le divisioni di uguale dimensione |
| `<leader>sx` / `:q` | Entrambi| Chiudi la divisione corrente |
| `Ctrl + w` + `h/j/k/l` | Default | Spostati tra le finestre divise |

### 🧭 Movimento e Interfaccia
| Tasto/Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `Ctrl + d` / `Ctrl + u` | Custom | Scorri giù/su di mezza pagina (centrato) |
| `n` / `N` | Custom | Risultato ricerca successivo/precedente (centrato) |
| `Ctrl + c` | Custom | Pulisci evidenziazione ricerca / Equivalente a Esc |
| `<leader>ee` | Custom | Apri file explorer (**MiniFiles**) |
| `-` | Custom | Apri la directory corrente in **Oil** |
| `Space c/` | Custom | Apri popup del terminale interno |
| `Esc Esc` | Custom | Esci dalla modalità interattiva del terminale |

### ✂️ Modifica Testo
| Tasto/Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `J` / `K` | Custom | Sposta le righe selezionate in giù / in su (Visual) |
| `<` / `>` | Custom | Riduci/Aumenta l'indentazione (Visual) |
| `p` / `<leader>p` | Custom | Incolla senza sovrascrivere il registro di copia |
| `<leader>Y` | Custom | Copia negli appunti di sistema |
| `<leader>s` | Custom | Trova e sostituisci la parola sotto il cursore |
| `<leader>x` | Custom | Rendi il file corrente eseguibile (`chmod +x`) |
| `<leader>f` | Custom | Formatta il file corrente |

### 🧠 Navigazione Progetto e LSP (Telescope & Harpoon)
| Tasto/Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `<leader>pr` | Custom | Cerca file recenti (**Telescope**) |
| `<leader>ths` | Custom | Selettore Tema (**Telescope**) |
| `<leader>a` | Custom | Aggiungi file ad **Harpoon** |
| `Ctrl + e` | Custom | Apri menu **Harpoon** |
| `Ctrl + y / i / n / s`| Custom | Naviga velocemente nei primi 4 file di Harpoon |
| `gD` / `gd` | Custom | Vai alla dichiarazione / definizione |
| `gR` / `gi` | Custom | Trova riferimenti / implementazioni |
| `K` | Custom | Mostra documentazione all'hover |
| `<leader>rn` | Custom | Rinomina variabile ovunque |
| `<leader>d` | Custom | Mostra diagnostica errori in finestra fluttuante |

### 🌿 Git (Fugitive & Gitsigns)
| Tasto/Scorciatoia | Tipo | Azione |
| :--- | :--- | :--- |
| `<leader>gg` | Custom | Apri Git status |
| `<leader>t` | Custom | Push verso origin (`Git push -u origin`) |
| `]h` / `[h` | Custom | Passa alla modifica (hunk) successiva / precedente |
| `<leader>gs` / `<leader>gr`| Custom | Stage / Reset della modifica sotto il cursore |
| `<leader>gd` | Custom | Esegui il diff del file corrente |
