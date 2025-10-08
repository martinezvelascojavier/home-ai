#!/bin/bash
# ===========================================
#  DÍA 1 · CREAR Y CONECTAR EL REPOSITORIO
# ===========================================

echo "🧱 Creando estructura inicial del proyecto HomeAI..."

cd ~/VSCode_Python || exit
mkdir -p HomeAI && cd HomeAI || exit

git init
echo "# Home AI" > README.md
echo "MVP de manuales inteligentes para gestionar los manuales, costes y configuraciones del hogar." >> README.md

cat > .gitignore << 'XEOF'
node_modules/
.env*
.supabase/
.DS_Store
XEOF

git add .
git commit -m "chore: initial commit with README and .gitignore"
git remote add origin git@github.com:martinezvelascojavier/home-ai.git
git branch -M main
git push -u origin main

echo "✅ Repositorio inicial configurado y subido a GitHub."
