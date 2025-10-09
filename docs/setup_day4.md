# 🧭 Día 4 — Conexión del proyecto con Supabase

Durante este día se configuró la integración entre el monorepo **Home AI** y la plataforma **Supabase**, estableciendo las bases para la gestión de datos, autenticación y almacenamiento.

---

## 🧩 Acciones realizadas

| Nº | Acción / Tarea | Explicación no técnica | Código ejecutado | Qué hace técnicamente |
|----|----------------|------------------------|------------------|-----------------------|
| 1 | Verificar login en Supabase | Asegura que la CLI local esté autenticada en la cuenta de Supabase. | `supabase projects list` | Comprueba los proyectos accesibles desde la CLI. |
| 2 | Crear nuevo proyecto remoto | Crea una base de datos Postgres y APIs REST en la nube para HomeAI. | `supabase projects create "HomeAI" --region eu-central-1` | Genera un proyecto llamado *HomeAI* en la región Frankfurt. |
| 3 | Vincular entorno local con el proyecto | Enlaza el repositorio local con el proyecto remoto mediante su ID. | `supabase link --project-ref fzqashphkvepegkewwhf` | Crea `/supabase/config.toml` y conecta el CLI con la base de datos. |
| 4 | Configurar variables de entorno | Guarda las claves de conexión sin exponerlas públicamente. | `echo "SUPABASE_URL=..." > .env` + `echo "SUPABASE_ANON_KEY=..." >> .env` | Genera el archivo `.env` con la URL y la clave anónima del proyecto. |
| 5 | Añadir `.env` al `.gitignore` | Evita que las credenciales se suban a GitHub. | `echo ".env" >> .gitignore` | Excluye el archivo del control de versiones. |
| 6 | Crear carpeta de migraciones | Prepara el entorno para guardar scripts SQL futuros. | `mkdir -p supabase/migrations` | Crea la estructura donde se almacenarán los cambios en la base de datos. |
| 7 | Verificar conexión con Supabase | Comprueba que el enlace y la base de datos estén activos. | `supabase status` | Muestra el estado actual del proyecto conectado. |

---

## ✅ Resultado final

- Proyecto **Home AI** conectado con su instancia Supabase en la nube.  
- Archivo `.env` creado con variables seguras.  
- `.gitignore` actualizado para proteger las claves.  
- Entorno preparado para crear tablas y buckets (Día 5).  

---

📅 **Próximo paso:** definir el esquema de base de datos (`devices`, `documents`, `document_chunks`) y habilitar `pgvector` para embeddings.
