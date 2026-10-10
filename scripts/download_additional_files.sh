#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

download_and_extract() {
    local url="$1"
    local output_dir="$2"
    local file_name="$3"

    if [ -f "$output_dir/$file_name" ]; then
        echo "$file_name già presente, salto il download."
    else
        echo "Scarico $file_name..."
        curl -L "$url&download=1" -o "$output_dir/$file_name"
    fi

    echo "Estraggo $file_name..."
    unzip -q -o "$output_dir/$file_name" -d "$output_dir"
    rm "$output_dir/$file_name"

    echo "$file_name completato."
}

download_and_extract \
    "https://unimi2013-my.sharepoint.com/:u:/g/personal/michele_antonazzi_unimi_it/ETBSSzNN_-lGk2gLD37elNQBKVHg9KqfoXgQL7GJRCdIbA?e=wGgVuz" \
    "dataset" \
    "annotations.zip"

download_and_extract \
    "https://unimi2013-my.sharepoint.com/:u:/g/personal/michele_antonazzi_unimi_it/ETR0ryc4_35BsWtrbMLRk6wBnciDHdiooDssGCAlWZeLEQ?e=eQacRL" \
    "dataset" \
    "robot.zip"

download_and_extract \
    "https://unimi2013-my.sharepoint.com/:u:/g/personal/michele_antonazzi_unimi_it/EQ5N8j82LpFCgqLHmfxrG2ABSU7A0QPh-uQaBb3i_BY9Ug?e=wSGPy5" \
    "." \
    "people_models.zip"

download_and_extract \
    "https://unimi2013-my.sharepoint.com/:u:/g/personal/michele_antonazzi_unimi_it/Ea1QEFWjA-hKuExp1OGUyaMBJZgTnhjUh1ykPX6mqaNsSQ?e=rEH8uj" \
    "." \
    "vehicles_models.zip"

echo "Tutti i download e le estrazioni sono completati."