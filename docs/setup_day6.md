# 🧭 HomeAI · Día 6 — Autenticación con Supabase

En este día configuramos la base del sistema de autenticación de **HomeAI**, conectando el frontend en Next.js con Supabase como backend seguro.

---

## 🎯 Objetivo
Implementar el inicio de sesión y registro de usuarios con correo y contraseña, conectarlo al backend de Supabase y asegurar que solo correos autorizados puedan acceder a la aplicación.

---

## 🏗️ Proceso realizado

1. **Inicialización del entorno web**
   - Se configuró la aplicación `apps/web` con Next.js 15, TailwindCSS y TypeScript.
   - Se creó un cliente Supabase (`supabaseClient.ts`) conectado al proyecto remoto existente.

2. **Instalación de dependencias principales**
   - Se añadieron Next.js, React, Tailwind, PostCSS y Supabase SDK.

3. **Configuración visual**
   - Se definió la estructura base de estilos con TailwindCSS.
   - Se creó la página de `/login` con un diseño limpio y centrado.

4. **Autenticación con Supabase**
   - Se implementó un formulario con opciones de registro e inicio de sesión.
   - Se validan los correos y contraseñas antes de enviarlos al backend.
   - El sistema redirige automáticamente al dashboard al iniciar sesión.

5. **Whitelist de seguridad**
   - Se añadió una lista local de correos permitidos para prevenir accesos no autorizados durante la fase de desarrollo.

6. **Verificación**
   - Se comprobó el flujo completo: registro, confirmación de correo, inicio de sesión y sesión persistente mientras el servidor local está activo.

---

## 🔒 Resultados
- La aplicación puede registrar y autenticar usuarios reales.
- Los correos no autorizados son bloqueados antes de llegar al backend.
- El flujo de usuario está totalmente integrado con Supabase Auth.

---

## 🚀 Próximos pasos (Día 7)
- Añadir **Supabase Storage** para gestionar archivos por usuario autenticado.
- Implementar el **middleware de sesión persistente** para proteger rutas como `/dashboard`.


---

## 🧰 Errores comunes y soluciones (Día 6)

| Nº | Problema detectado | Causa probable | Solución aplicada |
|:--:|:--|:--|:--|
| 1 | `Module not found: Can't resolve 'tailwindcss'` | Tailwind no instalado localmente o conflicto de workspace. | Reinstalación local (`pnpm add -D tailwindcss@3.4.18 postcss autoprefixer`) y regeneración de `postcss.config.mjs`. |
| 2 | Error `Unknown font Geist` | Tipografía no incluida en `next/font/google`. | Sustitución por fuente del sistema y limpieza de imports en `layout.tsx`. |
| 3 | El enlace mágico abre la página por defecto de Next.js | Supabase redirigía a `/` en lugar de `/dashboard`. | Añadida variable `NEXT_PUBLIC_SUPABASE_REDIRECT_URL` con ruta personalizada. |
| 4 | No llegan correos de confirmación | Configuración incompleta de Auth o dominio no validado. | Verificación de “Enable Email provider” en Auth y ajuste de `Site URL` a `http://localhost:3000`. |
| 5 | El login no redirige al dashboard | El formulario no gestionaba la sesión activa. | Incorporado `router.push('/dashboard')` tras login exitoso. |
| 6 | Usuarios no autorizados intentan registrarse | Supabase aceptaba cualquier correo en desarrollo. | Implementada whitelist local de correos permitidos en `AuthForm.tsx`. |

---

✨ **Resumen del Día 6:**
La app ya dispone de un flujo de autenticación completo y seguro con Supabase, validación visual en Next.js 15 y control de acceso mediante lista blanca. Se eliminan errores de compilación y se establecen las bases para manejar sesiones persistentes y archivos por usuario en los próximos días.

