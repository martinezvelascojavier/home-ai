#!/bin/bash
# ===========================================
#  DÍA 3 · CREAR ESTRUCTURA MONOREPO (Home AI)
# ===========================================

echo "🏗️  Creando estructura base del monorepo Home AI..."

# 1. Crear carpetas principales
mkdir -p apps/web services/ingest services/chat packages/db packages/ui

# 2. Inicializar proyecto raíz (si no existe)
if [ ! -f package.json ]; then
  pnpm init
fi

# 3. Definir workspaces
cat > pnpm-workspace.yaml <<'YAML'
packages:
  - "apps/*"
  - "services/*"
  - "packages/*"
YAML

# 4. Instalar dependencias globales
pnpm add -Dw typescript ts-node @types/node

# 5. Configurar TypeScript global
cat > tsconfig.json <<'JSON'
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "Node",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "strict": true,
    "baseUrl": ".",
    "paths": {
      "@db/*": ["packages/db/*"],
      "@ui/*": ["packages/ui/*"]
    }
  },
  "include": ["apps", "services", "packages"]
}
JSON

# 6. Crear package.json en subcarpetas
for dir in apps/web services/ingest services/chat packages/db packages/ui
do
  mkdir -p $dir
  cat > $dir/package.json <<EOL
{
  "name": "$(basename $dir)",
  "version": "1.0.0",
  "main": "index.ts",
  "license": "MIT"
}
EOL
done

# 7. Crear README básicos
echo "# Web App" > apps/web/README.md
echo "# Document Ingest Service" > services/ingest/README.md
echo "# Chat Service" > services/chat/README.md
echo "# Database Package" > packages/db/README.md
echo "# UI Package" > packages/ui/README.md

echo "✅ Monorepo configurado correctamente para el proyecto Home AI."
