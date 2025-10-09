'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { supabase } from '../lib/supabaseClient'

export default function RootRedirect() {
  const router = useRouter()

  useEffect(() => {
    const checkSession = async () => {
      const { data } = await supabase.auth.getSession()
      if (data.session) {
        router.replace('/dashboard')
      } else {
        router.replace('/login')
      }
    }
    checkSession()
  }, [router])

  return (
    <main className="flex items-center justify-center min-h-screen bg-gray-50 text-gray-600">
      <p>Comprobando sesión...</p>
    </main>
  )
}
