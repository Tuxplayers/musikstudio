#!/usr/bin/env bash
# ================================================================
# musicmake.sh – Starte Metal-Projekt
# ================================================================
# Host: $(hostname)
# Start: $(date +"%A, %d.%m.%Y %H:%M:%S")
# Version: 1.1.0
# Autor: Heiko Schäfer [TUXPLAYER] - http://tuxhs.de
# Zweck: Vollständiges Projektgerüst starten + Timer + Thinker GUI
# ================================================================

# Farben für Terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Thinker Spinner Funktion
spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Countdown Funktion
countdown() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        printf "\r⏳ Projekt startet in: %2d Sekunden..." $seconds
        sleep 1
        ((seconds--))
    done
    echo -e "\n💥 BOOM! Let's rock!"
}

# Session-Timer
session_timer() {
    SECONDS=0
    while true; do
        printf "\r⏱ Session läuft: %02d:%02d:%02d" $((SECONDS/3600)) $((SECONDS%3600/60)) $((SECONDS%60))
        sleep 1
    done
}

# Projektname abfragen
echo -e "${CYAN}🎸 Neues Projekt oder bestehendes öffnen?${RESET}"
read -p "Projektname eingeben: " new_proj
PROJECT_DIR="$HOME/Musik/TUXPLAYER_Arbeitsplatz/Projekte/$new_proj"

# Ordner erstellen falls nicht vorhanden
mkdir -p "$PROJECT_DIR"/{Drums,Guitar_Rhythm,Guitar_Lead,Bass,Vocals,FX_Master,Noten_und_Lyrics/{MuseScore,Lyrics}}
echo -e "${GREEN}✅ Projekt bereit: $PROJECT_DIR${RESET}"

# Countdown starten
countdown 5 &

# Thinker Spinner starten während Programme starten
(
    sleep 5  # Simuliere Ladezeit
) &
spinner

# Hier die Programme starten (Pfad anpassen!)
MUSCORE="/usr/bin/mscore"
BITWIG="/usr/bin/bitwig-studio"
GUITARX="/usr/bin/guitarx"
QPWGRAPH="/usr/bin/qpwgraph"

[[ -x "$MUSCORE" ]] && "$MUSCORE" &
[[ -x "$BITWIG" ]] && "$BITWIG" &
[[ -x "$GUITARX" ]] && "$GUITARX" &
[[ -x "$QPWGRAPH" ]] && "$QPWGRAPH" &

# Session-Timer starten
session_timer
