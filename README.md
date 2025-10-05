pip install mido # 🎸 MusicMake - Linux Music Production Studio Manager 

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Linux-blue.svg)](https://www.linux.org/)

> **Session-Management für Linux-Musiker**  
> _TUXPLAYER Edition - Where Code Meets Creativity_ 🎵

---

# ✨ Features

## 🎨 TUXPLAYER-Style Terminal-UI
Farbiges, animiertes Interface mit Zinker-Effekten und motivierenden Texten.

![Terminal UI](screenshots/terminal-ui.png)

### 💥 BOOM-Effekt beim Session-Start
Epischer Countdown (5–4–3–2–1) für deine Recording-Sessions.

![BOOM Effect](screenshots/boom-effect.png)

### 📁 Automatische Projektstruktur
Beim Erstellen eines neuen Projekts werden automatisch folgende Ordner angelegt:

Drums/ - Für Drum-Spuren und Patterns  
Guitar_Rhythm/ - Rhythmus-Gitarren  
Guitar_Lead/ - Lead-Gitarren und Solos  
Bass/ - Bass-Aufnahmen  
Vocals/ - Gesangs-Tracks  
FX_Master/ - Mastering und Effekte  
Noten_und_Lyrics/ - MuseScore-Dateien und Liedtexte

🚀 **Multi-Programm-Launcher**  
Starte alle deine Tools mit einem Klick:

Hydrogen - Drum Machine / Pattern Sequencer  
Bitwig Studio - Digital Audio Workstation (DAW)  
MuseScore - Notensatz und Komposition  
Guitarix - Guitar Amp Simulation & Effects  
QPWGraph - Audio/MIDI Connection Manager

🎼 **MIDI zu LilyPond Konverter**  
Das mitgelieferte `midi2score.py` konvertiert MIDI-Dateien in professionelle Notenschrift:

- Kompatibel mit MuseScore und LilyPond  
- Automatische Notenerkennung  
- Einfache Kommandozeilen-Nutzung

📦 **Installation**  
System-Voraussetzungen:

- Linux (Kernel 4.0+)  
- Bash 4.0+  
- Python 3.8+ (für MIDI-Konverter)

**Audio-Programme installieren:**  
Arch Linux / Manjaro / CachyOS:  
```bash
sudo pacman -S hydrogen musescore guitarix qpwgraph
yay -S bitwig-studio
Fedora:

bash
Code kopieren
sudo dnf install hydrogen musescore guitarix qpwgraph
Ubuntu / Debian:

bash
Code kopieren
sudo apt install hydrogen musescore guitarix qpwgraph
Python-Abhängigkeiten (für MIDI-Konverter):

bash
Code kopieren
pip install -r requirements.txt
🎮 Verwendung
Neue Session starten:

bash
Code kopieren
./musicmake.sh
Wähle [1] Neue Session starten

Gib einen Projektnamen ein

Warte auf den BOOM-Countdown

Wähle die Programme aus, die gestartet werden sollen

Bestehendes Projekt öffnen:

bash
Code kopieren
./musicmake.sh
Wähle [2] Bestehendes Projekt öffnen

Wähle dein Projekt aus der Liste

MIDI konvertieren:

bash
Code kopieren
./midi2score.py mein_song.mid
./midi2score.py mein_song.mid noten.ly
musescore noten.ly
📁 Projektstruktur nach Erstellung eines Projekts:

javascript
Code kopieren
~/MusicMake_Projects/
└── Mein_Projekt/
    ├── Drums/
    ├── Guitar_Rhythm/
    ├── Guitar_Lead/
    ├── Bass/
    ├── Vocals/
    ├── FX_Master/
    └── Noten_und_Lyrics/
        ├── MuseScore/
        └── Lyrics/
🐛 Troubleshooting
Programme werden nicht gefunden:

bash
Code kopieren
which hydrogen bitwig-studio musescore guitarix qpwgraph
Python mido fehlt:

bash
Code kopieren
pip install mido
🤝 Contributing
Pull Requests sind willkommen!

Fork das Repository

Erstelle einen Feature-Branch

Commit deine Änderungen

Push zum Branch

Öffne einen Pull Request

📜 Lizenz
MIT License
Copyright (c) 2025 TUXPLAYER Community (@Tuxplayers)
Siehe LICENSE für Details.

👥 Credits
Entwickelt von: TUXPLAYER Community
GitHub: @Tuxplayers
Repository: https://github.com/Tuxplayers/musikstudio

Rock on! Keep making music! 🎵🤘
Test
Test
