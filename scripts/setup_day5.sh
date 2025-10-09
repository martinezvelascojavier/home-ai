#!/bin/bash
# ==========================================================
#  DÍA 5 · BASE DE DATOS INICIAL + AUTENTICACIÓN DE USUARIOS
# ==========================================================

echo "🚀 Iniciando configuración del Día 5..."

# 1. Crear tablas principales (Devices, Documents, Document Chunks)
echo "🧱 Creando esquema inicial en Supabase..."
supabase db push || echo "ℹ️  Si falla, pega el SQL en el editor web de Supabase y ejecuta manualmente."

# 2. Configurar autenticación por email
echo "🔐 Configurando autenticación..."
echo "Asegúrate de habilitar 'Email / Password' en Auth > Providers en el panel web de Supabase."

# 3. Añadir SDK de Supabase a la app web
cd apps/web
pnpm add @supabase/supabase-js

# 4. Crear cliente Supabase para el frontend
mkdir -p lib
cat > lib/supabaseClient.ts <<'EOC'
import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = process.env.SUPABASE_URL
const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY

if (!SUPABASE_URL || !SUPABASE_ANON_KEY) {
  console.error('❌ Faltan variables de entorno: SUPABASE_URL o SUPABASE_ANON_KEY')
  process.exit(1)
}

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)
EOC

# 5. Test de conexión
cat > lib/testConnection.ts <<'EOC'
import { supabase } from './supabaseClient.js'
async function testConnection() {
  console.log('🔍 Verificando conexión con Supabase...')
  const { data, error } = await supabase.from('devices').select('*').limit(1)
  if (error) console.error('❌ Error de conexión:', error.message)
  else console.log('✅ Conexión exitosa. Datos:', data)
}
testConnection()
EOC

# 6. Test de autenticación
cat > lib/authService.ts <<'EOC'
import { supabase } from './supabaseClient.js'

export async function signUp(email: string, password: string) {
  const { data, error } = await supabase.auth.signUp({ email, password })
  if (error) console.error('❌ Error al registrar usuario:', error.message)
  else console.log('✅ Usuario registrado:', data.user?.email)
}

export async function signIn(email: string, password: string) {
  const { data, error } = await supabase.auth.signInWithPassword({ email, password })
  if (error) console.error('❌ Error al iniciar sesión:', error.message)
  else console.log('✅ Sesión iniciada para:', data.user?.email)
}

export async function signOut() {
  const { error } = await supabase.auth.signOut()
  if (error) console.error('❌ Error al cerrar sesión:', error.message)
  else console.log('👋 Sesión cerrada correctamente.')
}
EOC

cat > lib/testAuth.ts <<'EOC'
import { signUp, signIn, signOut } from './authService.js'

async function run() {
  const email = 'tu.email.real@gmail.com'
  const password = 'Prueba1234!'
  console.log('🚀 Probando autenticación con Supabase...')
  await signUp(email, password)
  await signIn(email, password)
  await signOut()
}
run().catch(console.error)
EOC

# 7. Agregar scripts al package.json
npx json -I -f package.json -e 'this.scripts={
  "test:connection":"tsx lib/testConnection.ts",
  "test:auth":"tsx lib/testAuth.ts"
}'

echo "✅ Día 5 completado."
