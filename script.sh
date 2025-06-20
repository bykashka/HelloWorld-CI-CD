#!/bin/bash

# Вийти при помилці
set -e

# Каталог з папками
BASE_DIR="files2"

# Цикл з 0000 до 0100
for i in $(seq 0 100); do
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
