# 🧩 Día 3 — Creación del Monorepo (Home AI)

En este día se estableció la **arquitectura modular base** del proyecto Home AI, compatible con microservicios y gestionada mediante **pnpm workspaces**.

---

## 🧱 Estructura general del proyecto

```plaintext
home-ai/
├── apps/
│   └── web/              # Aplicación web principal (Next.js)
├── services/
│   ├── ingest/           # Servicio de ingestión de documentos
│   └── chat/             # Servicio de chat y respuestas IA
├── packages/
│   ├── db/               # Módulo compartido de base de datos
│   └── ui/               # Librería de componentes UI
├── scripts/              # Scripts de configuración
├── docs/                 # Documentación diaria
├── pnpm-workspace.yaml   # Configuración del workspace
├── tsconfig.json         # Configuración global de TypeScript
└── package.json          # Definición raíz del workspace
