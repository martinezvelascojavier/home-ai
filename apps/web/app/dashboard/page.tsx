'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { supabase } from '../../lib/supabaseClient'

export default function DashboardPage() {
  const [user, setUser] = useState<any>(null)
  const router = useRouter()

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      if (data?.user) {
        setUser(data.user)
      } else {
        router.push('/login')
      }
    })
  }, [router])

  const handleLogout = async () => {
    await supabase.auth.signOut()
    router.push('/login')
  }

  return (
    <main className="flex flex-col items-center justify-center min-h-screen bg-gray-50 text-gray-800">
      {user ? (
        <div className="bg-white p-6 rounded-2xl shadow-md text-center">
          <h1 className="text-2xl font-semibold mb-4">Bienvenido 👋</h1>
          <p className="text-gray-700 mb-6">{user.email}</p>
          <button
            onClick={handleLogout}
            className="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700"
          >
            Cerrar sesión
          </button>
        </div>
      ) : (
        <p>Cargando sesión...</p>
      )}
    </main>
  )
}
