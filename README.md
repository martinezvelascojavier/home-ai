# 🏡 Home AI — MVP de manuales inteligentes para el hogar

**Home AI** es un proyecto modular diseñado para centralizar toda la información doméstica (manuales de electrodomésticos, planos, costes, configuraciones y más) en una única aplicación inteligente.  
El objetivo es crear un asistente capaz de responder preguntas sobre cualquier dispositivo o instalación del hogar, utilizando IA y un sistema de ingestión de documentos conectado a Supabase.

---

## 🚀 Estado actual — Día 3

Durante los tres primeros días del plan de desarrollo de 30 días se ha logrado:

| Día | Objetivo | Resultado |
|-----|-----------|------------|
| **1** | Inicialización del repositorio y configuración de GitHub | Repositorio `home-ai` creado, conexión verificada y entorno de trabajo establecido. |
| **2** | Preparación del entorno de desarrollo | Instalados y configurados Node.js, PNPM, Supabase CLI, VS Code y Prettier. |
| **3** | Creación del monorepo base | Arquitectura modular implementada con `pnpm workspaces`, configuración global de TypeScript y estructura inicial para microservicios. |

---

## 🧩 Arquitectura actual

```plaintext
home-ai/
├── apps/
│   └── web/              # Interfaz principal (Next.js)
├── services/
│   ├── ingest/           # Servicio de ingestión (PDF, OCR, embeddings)
│   └── chat/             # Servicio de preguntas y respuestas IA
├── packages/
│   ├── db/               # Conexión y consultas a Supabase
│   └── ui/               # Componentes visuales reutilizables
├── scripts/              # Scripts de configuración por día
├── docs/                 # Documentación diaria del progreso
├── pnpm-workspace.yaml   # Configuración de workspaces
├── tsconfig.json         # Configuración global de TypeScript
└── package.json          # Definición raíz del proyecto
⚙️ Próximos pasos
Día 4: conectar el monorepo con un proyecto Supabase y crear las variables de entorno locales.

Día 5: diseñar las tablas iniciales (devices, documents, document_chunks) y habilitar pgvector para búsqueda semántica.

Día 6: iniciar la app web con Next.js y Tailwind para el primer flujo de subida de documentos.

✨ Home AI: tu casa, pero con inteligencia.

