#!/bin/bash
# ===========================================
#  DÍA 2 · CONFIGURAR ENTORNO DE DESARROLLO
# ===========================================

echo "⚙️  Instalando y configurando entorno para HomeAI..."

brew install nvm
mkdir -p ~/.nvm

# Añadir a ~/.zshrc:
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

source ~/.zshrc
nvm install 20
nvm use 20
echo "20" > .nvmrc

brew install pnpm
pnpm -v

brew install supabase/tap/supabase
supabase -v
supabase login
supabase projects list

cat > .env.example << 'XEOF'
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
OPENAI_API_KEY=
XEOF

cp .env.example .env.local

echo '{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 2,
  "printWidth": 100
}' > .prettierrc

echo "✅ Entorno configurado correctamente."
