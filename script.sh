#!/bin/bash

# Вийти при помилці
set -e

# Каталог з папками
BASE_DIR="files"

# Цикл з 0008 до 0230
for i in $(seq 8 230); do
  DIR="$BASE_DIR/$(printf "%04d" $i)"
  
  # Якщо директорії немає — пропускаємо
  if [ ! -d "$DIR" ]; then
    echo "Пропущено: $DIR (немає)"
    continue
  fi

  echo "▶️ Додаю: $DIR"
  git add "$DIR"

  echo "📝 Коміт..."
  git commit -m "Add $DIR"

  echo "🚀 Пушу..."
  git push origin master

  echo "✅ Готово: $DIR"
  echo "----------------------------"
done

echo "🎉 Усі папки запушено!"
