#!/bin/bash

for file in $(git diff --cached --name-only); do
    if [[ $file == *.txt ]]; then
        if tail -n 1 "$file" | grep -q "Автор:"; then
            echo "$file соответствует формату и имеет подпись"
        else
            echo "Ошибка: $file соответствует формату, но не имеет подписи"
            exit 1
        fi
    else
        echo "Ошибка: $file не соответствует формату!"
        exit 1
    fi
done