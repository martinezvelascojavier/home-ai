# 🧭 Acciones realizadas en Visual Studio Code — Día 2

Este documento resume todas las acciones llevadas a cabo dentro de **Visual Studio Code** durante el Día 2 del proyecto **HomeAI**, una vez configurado el entorno de desarrollo local.

---

## 🪄 1. Verificación del comando `code`

Tras reiniciar la terminal, se verificó que el comando `code` estaba disponible, lo que permite abrir VS Code desde la línea de comandos.

**Acción realizada:**
- Se ejecutó `code -v` para confirmar la versión instalada.
- El sistema devolvió la versión `1.99.3 (arm64)`, confirmando que el comando estaba correctamente instalado en el PATH.

**Resultado:**
VS Code puede abrirse directamente desde el proyecto usando:
```bash
code .
⚙️ 2. Creación del archivo .prettierrc
Desde VS Code se creó el archivo .prettierrc en la raíz del repositorio para establecer las reglas de formato del proyecto.

Contenido del archivo:

json
Copiar código
{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 2,
  "printWidth": 100
}
Propósito:

Mantener un formato uniforme en todo el código.

Eliminar puntos y coma innecesarios.

Usar comillas simples.

Definir una sangría de 2 espacios y un ancho máximo de 100 caracteres.

🧩 3. Configuración interna de VS Code
Dentro del editor se realizaron las siguientes configuraciones:

Activar el formato automático al guardar:

Cmd + , → buscar Format on Save → activar la casilla.

Establecer el formateador por defecto:

Cmd + Shift + P → Default Formatter → seleccionar Prettier – Code Formatter.

Instalar extensiones recomendadas:

Prettier – Code Formatter (esbenp.prettier-vscode)

ESLint (dbaeumer.vscode-eslint)

Tailwind CSS IntelliSense (bradlc.vscode-tailwindcss)

Supabase (supabase.supabase-vscode)

GitHub Pull Requests & Issues (github.vscode-pull-request-github)

(Opcionales: Error Lens, Code Spell Checker)

🧪 4. Verificación de Prettier
Se creó un archivo temporal test.js con:

js
Copiar código
console.log( "Hola Mundo" ) ;
Al guardar el archivo (Cmd + S), el código se formateó automáticamente a:

js
Copiar código
console.log('Hola Mundo')
Tras confirmar el funcionamiento de Prettier, se eliminó el archivo test.js.

✅ 5. Resultado final
El comando code funciona desde la terminal.

El proyecto HomeAI se abre correctamente con code ..

El archivo .prettierrc está configurado en la raíz del proyecto.

Prettier aplica formato automáticamente al guardar archivos.

VS Code tiene activadas las extensiones y configuraciones básicas necesarias.

Última actualización: 8 de octubre de 2025
Autor: Javier Martínez Velasco
