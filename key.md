# Cheatsheet Dotfiles

Di seguito trovi tutte le tue scorciatoie organizzate e pronte per essere salvate come file `KEYBINDINGS.md` o `README.md` nella tua repository. 

## 🐱 Kitty (Terminale)

| Scorciatoia | Azione |
| :--- | :--- |
| `Super + ,` | Apri il file di configurazione nell'editor |
| `Super + r` | Ricarica la configurazione al volo |

---

## 🪟 Tmux

*Nota: La maggior parte di questi comandi richiede la pressione del tasto `Prefix` prima di essere eseguita.*

### Gestione Finestre e Pannelli
| Scorciatoia | Azione |
| :--- | :--- |
| `r` | Ricarica il file di configurazione (`tmux.conf`) |
| `\|` | Dividi il pannello verticalmente (mantiene il percorso attuale) |
| `-` | Dividi il pannello orizzontalmente (mantiene il percorso attuale) |
| `j` *(ripetibile)* | Espandi il pannello verso il basso (di 5 celle) |
| `k` *(ripetibile)* | Espandi il pannello verso l'alto (di 5 celle) |
| `l` *(ripetibile)* | Espandi il pannello verso destra (di 5 celle) |
| `h` *(ripetibile)* | Espandi il pannello verso sinistra (di 5 celle) |
| `m` *(ripetibile)* | Massimizza/Ripristina il pannello corrente (Zoom) |
| `n` | Crea una nuova sessione (con prompt per il nome) |
| `f` *(ripetibile)* | Lancia lo script `tmux-sessionizer` in una nuova finestra |

### Popup Fluttuanti
| Scorciatoia | Azione |
| :--- | :--- |
| `Ctrl + y` | Apri **Yazi** (File manager) in popup |
| `Ctrl + t` | Apri terminale rapido (**Zsh**) in popup (80%) |
| `Ctrl + g` | Apri **Lazygit** in popup |
| `Ctrl + m` | Apri **rmpc** (Musica) in popup |
| `F` | Apri un altro terminale **Zsh** in popup (bordi arrotondati, 85%) |
| `N` | Apri **Neovim** in popup |
| `d` | Apri il menu di configurazione centrale |

### Modalità Copia (Vi-mode)
| Scorciatoia | Azione |
| :--- | :--- |
| `v` | Entra in modalità copia |
| `v` | Inizia la selezione del testo (una volta in copy-mode) |
| `y` | Copia la selezione (una volta in copy-mode) |

---

## 📝 Neovim

### 🧭 Movimento e Interfaccia
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `Ctrl + d` | Normal | Scorri giù di mezza pagina (mantiene il cursore al centro) |
| `Ctrl + u` | Normal | Scorri su di mezza pagina (mantiene il cursore al centro) |
| `n` / `N` | Normal | Risultato ricerca successivo/precedente (centrato) |
| `Ctrl + c` | Normal | Pulisci l'evidenziazione della ricerca |
| `Ctrl + c` | Insert | Equivalente a `Esc` |
| `<leader>u` | Normal | Attiva/Disattiva cronologia **Undotree** |
| `<leader>ee` | Normal | Apri file explorer (**MiniFiles**) |
| `<leader>cw` | Normal | Rimuovi gli spazi bianchi a fine riga (**MiniTrailspace**) |

### ✂️ Modifica Testo
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `J` / `K` | Visual | Sposta le righe selezionate in giù / in su |
| `J` | Normal | Unisci la riga sottostante (mantiene il cursore fermo) |
| `<` / `>` | Visual | Riduci/Aumenta l'indentazione (mantenendo la selezione) |
| `p` / `<leader>p`| Visual | Incolla testo senza sovrascrivere il registro di copia |
| `<leader>Y` | Normal | Copia negli appunti di sistema |
| `<leader>d` | Normal/Visual | Elimina testo senza salvarlo nel registro |
| `x` | Normal | Elimina carattere senza salvarlo nel registro |
| `<leader>s` | Normal | Trova e sostituisci la parola sotto il cursore |
| `<leader>x` | Normal | Rendi il file corrente eseguibile (`chmod +x`) |
| `<leader>f` | Normal | Formatta il file corrente |
| `sj` / `sk` | Normal/Visual | Unisci (`sj`) o dividi (`sk`) gli argomenti (**MiniSplitJoin**) |
| `<leader>xe` | Normal/Visual | Avvolgi con abbreviazione (**Emmet**) |

### 🪟 Finestre (Splits) e Schede (Tabs)
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `<leader>sv` | Normal | Dividi finestra verticalmente |
| `<leader>sh` | Normal | Dividi finestra orizzontalmente |
| `<leader>se` | Normal | Rendi le divisioni di uguale dimensione |
| `<leader>sx` | Normal | Chiudi la divisione corrente |
| `<leader>to` | Normal | Apri una nuova scheda |
| `<leader>tx` | Normal | Chiudi la scheda corrente |
| `<leader>tn` | Normal | Vai alla scheda successiva |
| `<leader>tp` | Normal | Vai alla scheda precedente |
| `<leader>tf` | Normal | Apri il buffer corrente in una nuova scheda |

### 🧠 LSP, Diagnostica e Debug
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `gD` | Normal | Vai alla dichiarazione |
| `gd` | Normal | Vai alla definizione (Telescope) |
| `gR` | Normal | Trova riferimenti (Telescope) |
| `gi` | Normal | Trova implementazioni (Telescope) |
| `gt` | Normal | Trova definizioni di tipo (Telescope) |
| `K` | Normal | Mostra documentazione all'hover |
| `Ctrl + h` | Insert | Mostra la firma della funzione (Signature help) |
| `<leader>vca` | Normal/Visual| Mostra le Code Actions disponibili |
| `<leader>rn` | Normal | Rinomina variabile ovunque |
| `<leader>D` | Normal | Mostra diagnostica del buffer (Telescope) |
| `<leader>d` | Normal | Mostra diagnostica in una finestra fluttuante |
| `<leader>rs` | Normal | Riavvia il server LSP |
| `<leader>db` | Normal | Inserisci/Rimuovi Breakpoint di debug |
| `<leader>dc` | Normal | Avvia/Continua l'esecuzione di debug |

### 🌳 Navigazione (Telescope, Harpoon, Oil)
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `-` | Normal | Apri la directory padre in **Oil** |
| `<leader>-` | Normal | Apri **Oil** in una finestra fluttuante |
| `<leader>pr` | Normal | Cerca file recenti (**Telescope**) |
| `<leader>ths` | Normal | Selettore Tema (**Telescope**) |
| `<leader>a` | Normal | Aggiungi file ad **Harpoon** |
| `Ctrl + e` | Normal | Apri menu **Harpoon** |
| `Ctrl + y / i / n / s` | Normal | Naviga velocemente tra i file salvati in **Harpoon** |
| `Ctrl + Shift + N/P` | Normal | File successivo/precedente in **Harpoon** |
| `]t` / `[t` | Normal | Vai al commento TODO successivo/precedente |

### 🌿 Git (Fugitive & Gitsigns)
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `<leader>gg` | Normal | Apri Git status |
| `<leader>t` | Normal | Push verso origin (`Git push -u origin`) |
| `]h` / `[h` | Normal | Passa alla modifica (hunk) successiva / precedente |
| `<leader>gs` | Normal/Visual| Metti in stage l'hunk (o la selezione) |
| `<leader>gr` | Normal/Visual| Resetta l'hunk (o la selezione) |
| `<leader>gS` | Normal | Metti in stage l'intero buffer |
| `<leader>gR` | Normal | Resetta l'intero buffer |
| `<leader>gu` | Normal | Annulla lo stage dell'hunk |
| `<leader>gp` | Normal | Anteprima dell'hunk (diff locale) |
| `<leader>gbl` | Normal | Mostra il "Blame" completo per la riga corrente |
| `<leader>gB` | Normal | Attiva/Disattiva il Blame laterale per tutte le righe |
| `<leader>gd` / `<leader>gD`| Normal | Esegui il diff del file corrente / della working tree |
| `ih` | Object/Visual| Seleziona l'intero hunk corrente |

### 🖥️ Varie
| Tasto/Scorciatoia | Modalità | Azione |
| :--- | :--- | :--- |
| `Ctrl + f` | Normal | Avvia `tmux-sessionizer` direttamente da Neovim |
| `zR` | Normal | Apri tutti i "folds" (UFO) |
| `zM` | Normal | Chiudi tutti i "folds" (UFO) |
| `Space c/` | Normal/Term | Apri popup del terminale interno a Neovim |
| `Esc Esc` | Terminal | Esci dalla modalità interattiva del terminale Neovim |
