#!/bin/bash

set -e

echo "🔤 Installing Japanese and Korean fonts..."
# Buat direktori fonts jika belum ada
mkdir -p ~/.fonts

# Download font dari URL GitHub raw file
curl -L -o ~/.fonts/NotoSansJP-VariableFont_wght.ttf https://github.com/gilang-arya/custom-scripts/blob/main/assets/fonts/NotoSansJP-VariableFont_wght.ttf?raw=true
curl -L -o ~/.fonts/NotoSansKR-VariableFont_wght.ttf https://github.com/gilang-arya/custom-scripts/blob/main/assets/fonts/NotoSansKR-VariableFont_wght.ttf?raw=true

echo "Fonts are successfully downloaded to the ~/.fonts folder"

echo "🌐 Set Japanese and Korean locales..."

# Tambahkan locale ke /etc/locale.gen jika belum ada
echo "ja_JP.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen

echo "ko_KR.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen

echo "🛠️ Running locale-gen..."
sudo locale-gen

echo "🧭 Displays available locales:"
locale -a | grep -E 'ja_JP|ko_KR'

echo "✅ Installation complete!"
