#!/bin/bash
set -e

echo "🚀 HomeAI · Día 6 — Limpieza, commit y versionado"

# Ir a la raíz del proyecto
cd "$(dirname "$0")/.."

# 1️⃣ Crear o actualizar .gitignore
cat > .gitignore <<'IGNORE'
# Node / Next.js
node_modules
.next
out
dist

# Env files
.env.local
.env

# Temporary / system files
tmp.json
.DS_Store

# Logs
*.log
npm-debug.log*
pnpm-debug.log*

# VSCode
.vscode
IGNORE
echo "✅ .gitignore actualizado."

# 2️⃣ Eliminar archivos temporales innecesarios
rm -rf tmp.json .next node_modules .DS_Store || true
echo "🧹 Archivos temporales eliminados."

# 3️⃣ Añadir archivos válidos al staging
git add apps/web/.gitignore \
        apps/web/app \
        apps/web/components \
        apps/web/lib \
        apps/web/public \
        apps/web/eslint.config.mjs \
        apps/web/next.config.* \
        apps/web/postcss.config.* \
        apps/web/tailwind.config.* \
        apps/web/tsconfig.json \
        docs/setup_day5.md \
        docs/setup_day6.md \
        scripts/setup_day6.sh \
        scripts/finalize_day6.sh \
        supabase/migrations \
        .gitignore \
        apps/web/package.json \
        apps/web/app/globals.css

# 4️⃣ Crear commit
git commit -m "✅ Día 6: Proyecto limpio, consistente y documentado"

# 5️⃣ Crear etiqueta de versión
git tag -a "day6" -m "Checkpoint del Día 6: autenticación y whitelist completadas"

# 6️⃣ Mostrar resumen
echo
git status -s
echo
echo "🏷️  Tag 'day6' creado localmente."

# 7️⃣ Preguntar si hacer push
read -p "¿Quieres subir los cambios y el tag a GitHub? (y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  git push origin main
  git push origin day6
  echo "✅ Cambios y tag 'day6' subidos correctamente a GitHub."
else
  echo "ℹ️  Cambios y tag creados localmente. Sube manualmente con:"
  echo "    git push origin main && git push origin day6"
fi
