#!/bin/bash
# ===========================================
#  DÍA 4 · CONECTAR PROYECTO CON SUPABASE
# ===========================================

echo "🚀 Iniciando configuración de Supabase para HomeAI..."

# Verificar login
supabase projects list

# Crear nuevo proyecto (si no existe)
echo "🧠 Creando proyecto Supabase (HomeAI)..."
supabase projects create "HomeAI" --region eu-central-1

# Enlazar entorno local
echo "🔗 Vinculando entorno local al proyecto..."
supabase link --project-ref fzqashphkvepegkewwhf

# Crear archivo .env con las claves
echo "🔐 Configurando variables de entorno..."
echo "SUPABASE_URL=https://fzqashphkvepegkewwhf.supabase.co" > .env
echo "SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6cWFzaHBoa3ZlcGVna2V3d2hmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk5MzU3OTgsImV4cCI6MjA3NTUxMTc5OH0.ridVqm4ed_v8mH-HiHcm8pwbQjohRLQtU2kaLC-jgO4" >> .env

# Añadir .env al gitignore
echo ".env" >> .gitignore

# Crear carpeta de migraciones
mkdir -p supabase/migrations

# Verificar conexión
echo "🧩 Verificando conexión con Supabase..."
supabase status

echo "✅ Día 4 completado: entorno local conectado correctamente con Supabase."
