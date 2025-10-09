#!/bin/bash
set -e

echo "🏗️  HomeAI · Día 6 — Next.js + Supabase Auth setup"

# 1️⃣ Ir a la app principal
cd ../apps/web

# 2️⃣ Instalar dependencias base (Next.js, React, Tailwind, Supabase)
pnpm add next@15 react@18.3.1 react-dom@18.3.1 \
  @supabase/supabase-js@2.75.0 @supabase/ssr@0.5.2

# 3️⃣ Instalar dependencias de desarrollo
pnpm add -D tailwindcss@3.4.18 postcss autoprefixer @types/react

# 4️⃣ Configuración de Tailwind
cat > tailwind.config.js <<'CONFIG'
/** @type {import('tailwindcss').Config} */
export default {
  content: ["./app/**/*.{js,ts,jsx,tsx}"],
  theme: { extend: {} },
  plugins: [],
}
CONFIG

# 5️⃣ Configuración de PostCSS
cat > postcss.config.mjs <<'CONFIG'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
CONFIG

# 6️⃣ CSS global básico
cat > app/globals.css <<'CSS'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --background: #ffffff;
  --foreground: #171717;
}

body {
  background: var(--background);
  color: var(--foreground);
  font-family: Arial, Helvetica, sans-serif;
}
CSS

# 7️⃣ Cliente Supabase
mkdir -p lib
cat > lib/supabaseClient.ts <<'TS'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
TS

# 8️⃣ Formulario de login con whitelist
mkdir -p components
cat > components/AuthForm.tsx <<'TSX'
'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { supabase } from '../lib/supabaseClient'

export default function AuthForm() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [mode, setMode] = useState<'login' | 'signup'>('login')
  const [message, setMessage] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  const allowedEmails = [
    'tucorreo@gmail.com',
    'maria@gmail.com',
    'familia@example.com'
  ]

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setMessage(null)
    const normalizedEmail = email.trim().toLowerCase()

    if (!allowedEmails.includes(normalizedEmail)) {
      setMessage('Este correo no está autorizado para acceder a la aplicación.')
      setLoading(false)
      return
    }

    let error
    if (mode === 'signup') {
      const { error: signupError } = await supabase.auth.signUp({
        email: normalizedEmail,
        password,
      })
      error = signupError
      if (!error) setMessage('Revisa tu correo para confirmar tu cuenta ✉️')
    } else {
      const { data, error: loginError } = await supabase.auth.signInWithPassword({
        email: normalizedEmail,
        password,
      })
      error = loginError
      if (!error) {
        setMessage('Inicio de sesión correcto ✅')
        setTimeout(() => router.push('/dashboard'), 800)
      }
    }
    if (error) setMessage(error.message)
    setLoading(false)
  }

  return (
    <div className="w-full max-w-sm bg-white rounded-2xl p-6 shadow">
      <h1 className="text-2xl font-semibold text-center mb-6">
        {mode === 'signup' ? 'Crear cuenta' : 'Iniciar sesión'}
      </h1>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input type="email" placeholder="Tu correo"
          value={email} onChange={(e) => setEmail(e.target.value)}
          className="w-full border p-2 rounded" />
        <input type="password" placeholder="Contraseña"
          value={password} onChange={(e) => setPassword(e.target.value)}
          className="w-full border p-2 rounded" />
        <button disabled={loading}
          className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700">
          {loading ? 'Procesando...' : mode === 'signup' ? 'Registrarse' : 'Entrar'}
        </button>
      </form>
      <p className="mt-4 text-sm text-center text-gray-700">
        {mode === 'signup'
          ? <>¿Ya tienes cuenta? <button onClick={() => setMode('login')} className="text-indigo-600 underline">Inicia sesión</button></>
          : <>¿No tienes cuenta? <button onClick={() => setMode('signup')} className="text-indigo-600 underline">Regístrate</button></>}
      </p>
      {message && <p className="mt-4 text-center text-gray-700 text-sm">{message}</p>}
    </div>
  )
}
TSX

# 9️⃣ Crear la página de login
mkdir -p app/login
cat > app/login/page.tsx <<'TSX'
import AuthForm from '../../components/AuthForm'

export default function LoginPage() {
  return (
    <main className="flex min-h-screen items-center justify-center bg-gray-50">
      <AuthForm />
    </main>
  )
}
TSX

echo "✅ Setup Día 6 completado correctamente."
