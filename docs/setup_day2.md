# 🧩 DÍA 2 — Sesión tras reiniciar y configuración de VS Code

A continuación se detalla la sesión real de terminal después de reiniciar el sistema y configurar el comando `code`, así como la creación y prueba del archivo `.prettierrc`.

---

## ⚙️ Comandos ejecutados

```bash
Last login: Wed Oct  8 17:35:28 on ttys001

# Acceder a la carpeta del proyecto
cd VSCode_Python/
cd HomeAI/

# Verificar que el comando "code" está disponible
code -v
# Resultado:
# 1.99.3
# 17baf841131aa23349f217ca7c570c76ee87b957
# arm64

# Abrir el proyecto en VS Code
cd /Users/javiermartinezvelasco/VSCode_Python/HomeAI
code .

# Crear archivo de configuración de Prettier
echo '{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 2,
  "printWidth": 100
}' > .prettierrc

# Crear archivo de prueba para verificar el formateo
cd /Users/javiermartinezvelasco/VSCode_Python/HomeAI
echo "console.log(\"Hola Mundo\");" > test.js

# Eliminar el archivo de prueba tras verificar el formato
rm test.js

