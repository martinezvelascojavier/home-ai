#!/bin/bash
# ===========================================
#  DÍA 2 · CONFIGURAR ENTORNO DE DESARROLLO
# ===========================================

echo "⚙️  Instalando y configurando entorno para HomeAI..."

# --- Paso 1: NVM y Node ---
brew install nvm
mkdir -p ~/.nvm

# Añadir configuración manualmente al final de ~/.zshrc si no existe:
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

source ~/.zshrc
nvm install 20
nvm use 20
echo "20" > .nvmrc

# --- Paso 2: PNPM ---
brew install pnpm
pnpm -v

# --- Paso 3: Supabase CLI ---
brew install supabase/tap/supabase
supabase -v

# Login manual (abre navegador)
supabase login
supabase projects list

# Crear archivos de entorno
cat > .env.example << 'XEOF'
# --- Claves públicas (frontend) ---
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=

# --- Claves privadas (backend/local) ---
SUPABASE_SERVICE_ROLE_KEY=
OPENAI_API_KEY=
XEOF

cp .env.example .env.local

# --- Paso 4: Configuración de VS Code ---
echo '{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 2,
  "printWidth": 100
}' > .prettierrc

echo "✅ Entorno configurado con Node 20, PNPM y Supabase CLI."
echo "💡 Abre VS Code con: code ."
