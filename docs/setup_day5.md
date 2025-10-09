# 🧭 Día 5 — Base de datos inicial + Autenticación

Hoy se configuró la **base de datos principal** y el **sistema de autenticación** de Home AI.  
Se crearon las tablas esenciales (`devices`, `documents`, `document_chunks`) y se añadió soporte de registro e inicio de sesión mediante Supabase Auth.

## ⚙️ Pasos realizados

1. **Creación del esquema SQL** en el editor de Supabase (estructura de dispositivos, manuales y fragmentos).
2. **Instalación del SDK** `@supabase/supabase-js` en la app web.
3. **Configuración del cliente Supabase** para conectar con las variables del entorno local (`.env`).
4. **Pruebas de conexión** mediante `pnpm --filter web run test:connection`.
5. **Implementación de autenticación por email y contraseña** con registro, login y logout.
6. **Prueba de autenticación** usando `pnpm --filter web run test:auth`.

## 🧩 Resultado

El proyecto ya puede:

- Conectarse correctamente a su base de datos remota.
- Crear y verificar usuarios mediante Supabase Auth.
- Ejecutar operaciones de prueba directamente desde scripts de desarrollo.

**Estado final:** la base y seguridad del sistema están listas para construir funciones como carga de manuales, indexación y chat IA.
