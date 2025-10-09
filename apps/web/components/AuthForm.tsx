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

  // 🧱 Whitelist local de emails permitidos
  const allowedEmails = [
    'martinezvelascojavie@gmail.com',
    'javiermartinez57@gmail.com',
    'isamv_93@hotmail.com',
'isabelvelascop@gmail.com'
  ]

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setMessage(null)

    const normalizedEmail = email.trim().toLowerCase()

    // 🚫 Bloquea si no está en la lista blanca
    if (!allowedEmails.includes(normalizedEmail)) {
      setMessage('Este correo no está autorizado para acceder a la aplicación.')
      setLoading(false)
      return
    }

    if (!normalizedEmail.includes('@') || !normalizedEmail.includes('.')) {
      setMessage('Introduce un correo válido.')
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
      if (!error)
        setMessage('Revisa tu correo para confirmar tu cuenta ✉️')
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
        <input
          type="email"
          placeholder="Tu correo"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="w-full border p-2 rounded"
        />
        <input
          type="password"
          placeholder="Contraseña"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          className="w-full border p-2 rounded"
        />
        <button
          disabled={loading}
          className="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700"
        >
          {loading ? 'Procesando...' : mode === 'signup' ? 'Registrarse' : 'Entrar'}
        </button>
      </form>
      <p className="mt-4 text-sm text-center text-gray-700">
        {mode === 'signup' ? (
          <>
            ¿Ya tienes cuenta?{' '}
            <button onClick={() => setMode('login')} className="text-indigo-600 underline">
              Inicia sesión
            </button>
          </>
        ) : (
          <>
            ¿No tienes cuenta?{' '}
            <button onClick={() => setMode('signup')} className="text-indigo-600 underline">
              Regístrate
            </button>
          </>
        )}
      </p>
      {message && <p className="mt-4 text-center text-gray-700 text-sm">{message}</p>}
    </div>
  )
}
