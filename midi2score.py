#!/usr/bin/env python3
"""
midi2score.py
Liest alle .mid/.midi Dateien in einem Projektordner (rekursiv),
konvertiert mit music21 zu MusicXML (.musicxml) und öffnet die Dateien in MuseScore (wenn vorhanden).
Autor: Heiko Schäfer (TUXPLAYER) - Template
Erstellt: {}
""".format(__import__("datetime").datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

import os
import sys
import subprocess
from pathlib import Path

try:
    from music21 import converter, environment
except Exception as e:
    print("Fehler: music21 ist nicht installiert oder konnte nicht geladen werden.")
    print("Installiere mit: pip install music21")
    sys.exit(2)

def find_midis(project_path):
    p = Path(project_path)
    mids = list(p.rglob("*.mid")) + list(p.rglob("*.midi"))
    return mids

def convert_midi_to_musicxml(midi_path, out_dir):
    print(f"Konvertiere {midi_path} ...")
    score = converter.parse(str(midi_path))
    # Name output
    out_name = midi_path.with_suffix(".musicxml").name
    out_path = Path(out_dir) / out_name
    score.write('musicxml', fp=str(out_path))
    print(f"-> {out_path}")
    return out_path

def open_in_musescore(path):
    # Versuche mscore/ museScore Befehle
    for cmd in ("mscore", "musescore", "musescore4"):
        if shutil_which(cmd):
            print(f"Öffne {path} in {cmd}")
            subprocess.Popen([cmd, str(path)])
            return
    print("MuseScore nicht gefunden im PATH; öffne nicht automatisch.")

def shutil_which(cmd):
    from shutil import which
    return which(cmd) is not None

def main():
    import argparse
    parser = argparse.ArgumentParser(description="Konvertiert MIDI in MusicXML (music21).")
    parser.add_argument("--project", "-p", required=True, help="Pfad zum Projektordner mit MIDIs")
    args = parser.parse_args()
    proj = Path(args.project)
    if not proj.exists():
        print("Projektpfad existiert nicht:", proj); sys.exit(1)
    mids = find_midis(proj)
    if not mids:
        print("Keine MIDI-Dateien gefunden in", proj); sys.exit(0)
    out_dir = proj / "Noten_und_Lyrics" / "MusicXML"
    out_dir.mkdir(parents=True, exist_ok=True)
    for m in mids:
        try:
            out = convert_midi_to_musicxml(m, out_dir)
        except Exception as e:
            print("Fehler beim Konvertieren:", e)
    # optionally open converted files
    # for xml in out_dir.glob("*.musicxml"):
    #     open_in_musescore(xml)

if __name__ == "__main__":
    main()
