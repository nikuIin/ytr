#!/bin/bash

# Определяем путь к ytr.py относительно скрипта
SCRIPT_DIR="/Users/ivanaleksandrovci/cli-tools/ytr"
YTR_PATH="$SCRIPT_DIR/ytr.py"

# Проверяем наличие ytr.py
if [ ! -f "$YTR_PATH" ]; then
    echo "Error: ytr.py not found at $YTR_PATH"
    exit 1
fi

# Проверяем, передан ли флаг -w и аргумент
if [ "$1" = "-w" ] && [ -n "$2" ]; then
    uv run --quiet "$YTR_PATH" -w "$2"
else
    # Проверяем, что команда вызвана без аргументов или с некорректными
    if [ $# -eq 0 ] && [ "$1" != "-w" ]; then
        uv run "$YTR_PATH"
    else
        echo "Usage: ytr [-w word]"
        exit 1
    fi
fi
