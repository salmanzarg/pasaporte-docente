#!/usr/bin/env bash

# ==============================================================================
# 🎓 PASAPORTE DOCENTE CLI — Asistente de Instalación Autónoma
# Creado de forma independiente por Salvador Almánzar
# Licencia: MIT
# Versión: 1.2.0 (Enterprise Grade / CLIG Compliant)
# ==============================================================================

set -eo pipefail

VERSION="1.2.0"

# 1. Respeto al Estándar NO_COLOR (https://no-color.org) y TTY
if [ -n "$NO_COLOR" ] || [ ! -t 1 ]; then
  C_RESET=""
  C_BOLD=""
  C_GOLD=""
  C_CYAN=""
  C_GREEN=""
  C_ROSE=""
  C_SLATE=""
else
  C_RESET="\033[0m"
  C_BOLD="\033[1m"
  C_GOLD="\033[38;5;220m"
  C_CYAN="\033[38;5;39m"
  C_GREEN="\033[38;5;42m"
  C_ROSE="\033[38;5;203m"
  C_SLATE="\033[38;5;244m"
fi

# 2. Manejador de Señales Limpio (POSIX Signals)
cleanup() {
  local exit_code=$?
  printf "%b" "${C_RESET}"
  if [ "$exit_code" -ne 0 ] && [ "$exit_code" -ne 130 ]; then
    printf "%b\n" "${C_ROSE}⚠️  El instalador finalizó con código de error ($exit_code).${C_RESET}" >&2
  fi
  exit "$exit_code"
}
trap 'printf "%b\n" "\n${C_ROSE}🛑 Instalación cancelada por el usuario.${C_RESET}"; exit 130' INT TERM
trap cleanup EXIT

# 3. Función de Ayuda (--help) y Versión (--version)
show_help() {
  cat << EOF
Pasaporte Docente CLI v${VERSION}
Asistente de instalación autónoma y despliegue para docentes.

USO:
  install.sh [OPCIONES]

OPCIONES:
  -n, --name <NOMBRE>       Nombre completo del docente (ej. "Profa. Elena Gómez")
  -s, --school <ESCUELA>    Nombre de la institución o escuela (ej. "UNAM FES Acatlán")
  -m, --subject <MATERIA>   Nombre de la materia o asignatura (ej. "Comercio Internacional")
      --siglas <SIGLAS>     Siglas cortas de la materia (ej. "CI")
  -p, --port <PUERTO>       Puerto local para pruebas (por defecto: busca desde 5000)
  -y, --yes                 Modo no-interactivo (acepta valores y omite preguntas)
      --serve               Levanta automáticamente el servidor local tras configurar
      --deploy              Inicia el despliegue automático a Google Firebase
  -h, --help                Muestra esta ayuda y termina
  -v, --version             Muestra la versión instalada y termina

EJEMPLOS:
  # Instalación interactiva guiada (por defecto):
  curl -fsSL https://raw.githubusercontent.com/salmanzarg/pasaporte-docente/main/install.sh | bash

  # Instalación 100% automatizada (Zero-Prompt / CI / Agentes):
  ./install.sh --name "Prof. Juan Carlos" --school "IPN ESCA" --subject "Economía" --yes --serve
EOF
}

show_version() {
  echo "pasaporte-docente CLI version ${VERSION}"
}

# 4. Parseo de Banderas y Argumentos (CLI Arguments)
NON_INTERACTIVE=false
AUTO_SERVE=false
AUTO_DEPLOY=false
CUSTOM_PORT=""
PROF_NAME=""
PROF_INST=""
PROF_SUBJECT=""
PROF_SIGLAS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -v|--version)
      show_version
      exit 0
      ;;
    -n|--name)
      PROF_NAME="$2"
      shift 2
      ;;
    -s|--school)
      PROF_INST="$2"
      shift 2
      ;;
    -m|--subject)
      PROF_SUBJECT="$2"
      shift 2
      ;;
    --siglas)
      PROF_SIGLAS="$2"
      shift 2
      ;;
    -p|--port)
      CUSTOM_PORT="$2"
      shift 2
      ;;
    -y|--yes|--non-interactive)
      NON_INTERACTIVE=true
      shift
      ;;
    --serve)
      AUTO_SERVE=true
      shift
      ;;
    --deploy)
      AUTO_DEPLOY=true
      shift
      ;;
    *)
      printf "%b\n" "${C_ROSE}❌ Opción desconocida: $1${C_RESET}" >&2
      printf "%b\n" "Ejecute '${C_BOLD}./install.sh --help${C_RESET}' para ver todas las opciones disponibles." >&2
      exit 2
      ;;
  esac
done

# 5. Redirigir entrada interactiva desde la terminal si se ejecuta vía pipe (curl ... | bash)
if [ ! -t 0 ] && [ "$NON_INTERACTIVE" = false ]; then
  exec < /dev/tty 2>/dev/null || true
fi

# Limpiar pantalla solo en modo interactivo en TTY
if [ -t 1 ] && [ "$NON_INTERACTIVE" = false ]; then
  clear 2>/dev/null || true
fi

# Banner visual futurista
printf "%b" "${C_GOLD}${C_BOLD}"
cat << "EOF"
  ██████╗  █████╗ ███████╗ █████╗ ██████╗  ██████╗ ██████╗ ████████╗███████╗
  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
  ██████╔╝███████║███████╗███████║██████╔╝██║   ██║██████╔╝   ██║   █████╗  
  ██╔═══╝ ██╔══██║╚════██║██╔══██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══╝  
  ██║     ██║  ██║███████║██║  ██║██║     ╚██████╔╝██║  ██║   ██║   ███████╗
  ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
EOF
printf "%b\n" "${C_RESET}"
printf "%b\n" "  ${C_CYAN}${C_BOLD}Sistema de Asistencia Inteligente, Códigos QR y Gamificación en el Aula${C_RESET}"
printf "%b\n" "  ${C_SLATE}Creado por ${C_BOLD}Salvador Almánzar${C_RESET}${C_SLATE} • Licencia MIT (Open Source) • v${VERSION}${C_RESET}"
printf "%b\n\n" "  ${C_GOLD}────────────────────────────────────────────────────────────────────────${C_RESET}"

# 6. Detección Inteligente del Repositorio
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [[ ! -f "$REPO_DIR/public/index.html" ]]; then
  printf "%b\n" "${C_CYAN}📦 Descargando repositorio oficial desde GitHub...${C_RESET}"
  if command -v git &> /dev/null; then
    if [[ -d "pasaporte-docente" ]]; then
      printf "%b\n" "${C_CYAN}🔄 Actualizando carpeta existente 'pasaporte-docente'...${C_RESET}"
      cd pasaporte-docente
      git pull origin main 2>/dev/null || true
      REPO_DIR="$(pwd)"
    else
      git clone https://github.com/salmanzarg/pasaporte-docente.git pasaporte-docente
      cd pasaporte-docente
      REPO_DIR="$(pwd)"
    fi
  else
    printf "%b\n" "${C_ROSE}❌ Error: Se requiere 'git' instalado para clonar el proyecto.${C_RESET}" >&2
    exit 1
  fi
fi

# 7. Preguntas Interactivas (con valores por defecto y bypass para --yes)
if [ "$NON_INTERACTIVE" = false ]; then
  printf "%b\n" "${C_GREEN}${C_BOLD}¡Hola, Profesor(a)! 👋${C_RESET}"
  printf "%b\n\n" "Vamos a personalizar su Pasaporte Docente en menos de 1 minuto."

  if [ -z "$PROF_NAME" ]; then
    read -r -p "$(printf "%b" "${C_BOLD}1. Su Nombre Completo:${C_RESET} [ej. Profa. María Elena]: ")" INP_NAME || true
    PROF_NAME="${INP_NAME:-Prof(a). Docente Titular}"
  fi

  if [ -z "$PROF_INST" ]; then
    read -r -p "$(printf "%b" "${C_BOLD}2. Su Institución o Escuela:${C_RESET} [ej. UNAM / IPN / Tec de Monterrey]: ")" INP_INST || true
    PROF_INST="${INP_INST:-Mi Institución Educativa}"
  fi

  if [ -z "$PROF_SUBJECT" ]; then
    read -r -p "$(printf "%b" "${C_BOLD}3. Nombre de su Asignatura:${C_RESET} [ej. Comercio Internacional]: ")" INP_SUBJ || true
    PROF_SUBJECT="${INP_SUBJ:-Cátedra Principal}"
  fi

  if [ -z "$PROF_SIGLAS" ]; then
    read -r -p "$(printf "%b" "${C_BOLD}4. Siglas de la Materia (opcional):${C_RESET} [ej. ERAP]: ")" INP_SIGLAS || true
    PROF_SIGLAS="${INP_SIGLAS:-DOC}"
  fi
else
  PROF_NAME="${PROF_NAME:-Prof(a). Docente Titular}"
  PROF_INST="${PROF_INST:-Mi Institución Educativa}"
  PROF_SUBJECT="${PROF_SUBJECT:-Cátedra Principal}"
  PROF_SIGLAS="${PROF_SIGLAS:-DOC}"
fi

# 8. Sanitización de Cadenas para JavaScript (Prevención de syntax injection)
sanitize_js() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g' | tr -d '\r'
}

SAFE_NAME="$(sanitize_js "$PROF_NAME")"
SAFE_INST="$(sanitize_js "$PROF_INST")"
SAFE_SUBJ="$(sanitize_js "$PROF_SUBJECT")"
SAFE_SIGLAS="$(sanitize_js "$PROF_SIGLAS")"
CURRENT_YEAR="$(date +%Y)"

printf "\n%b\n" "${C_CYAN}⚙️  Escribiendo configuración personalizada en public/config.js...${C_RESET}"

TMP_CONFIG="$REPO_DIR/public/.config.js.tmp"
cat > "$TMP_CONFIG" << EOF
// ==============================================================================
// 🎓 PASAPORTE DOCENTE — Configuración Generada por CLI
// Creado de manera independiente por Salvador Almánzar (Licencia MIT)
// ==============================================================================

window.DOCENTE_CONFIG = {
  profesor: "${SAFE_NAME}",
  institucion: "${SAFE_INST}",
  materia: "${SAFE_SUBJ}",
  siglas: "${SAFE_SIGLAS}",
  ciclo: "${CURRENT_YEAR}",
  colorPrimario: "#1E293B",
  colorSecundario: "#D4AF37",
  creditos: "Desarrollado originalmente por Salvador Almánzar",
  firebase: null
};
EOF

# Escritura atómica para evitar corrupción de archivos
mv -f "$TMP_CONFIG" "$REPO_DIR/public/config.js"
cp -f "$REPO_DIR/public/config.js" "$REPO_DIR/config.js" 2>/dev/null || true

printf "%b\n\n" "${C_GREEN}✅ Configuración guardada y blindada exitosamente.${C_RESET}"

# 9. Función de Detección Dinámica de Puertos Libres (Evita conflicto con AirPlay 5000 en macOS)
find_available_port() {
  local target_port="${1:-5000}"
  while lsof -Pi :"$target_port" -sTCP:LISTEN -t >/dev/null 2>&1; do
    target_port=$((target_port + 1))
  done
  echo "$target_port"
}

open_in_browser() {
  local url="$1"
  if command -v open &>/dev/null; then
    open "$url" 2>/dev/null || true
  elif command -v xdg-open &>/dev/null; then
    xdg-open "$url" 2>/dev/null || true
  fi
}

start_local_server() {
  local port
  if [ -n "$CUSTOM_PORT" ]; then
    port="$CUSTOM_PORT"
  else
    port="$(find_available_port 5000)"
  fi

  printf "\n%b\n" "${C_CYAN}🚀 Iniciando servidor local en el puerto ${port}...${C_RESET}"
  printf "%b\n\n" "${C_SLATE}Presione Ctrl + C para detener el servidor cuando termine.${C_RESET}"

  local target_url="http://localhost:${port}/public/"
  printf "%b\n" "${C_GREEN}Abriendo en su navegador: ${target_url}${C_RESET}"
  open_in_browser "$target_url"

  if command -v python3 &>/dev/null; then
    python3 -m http.server "$port"
  elif command -v npx &>/dev/null; then
    npx -y serve -l "$port" public
  else
    printf "%b\n" "${C_GOLD}Puede abrir directamente con doble clic el archivo: ${REPO_DIR}/public/index.html${C_RESET}"
  fi
}

start_firebase_deploy() {
  printf "\n%b\n" "${C_CYAN}🔐 Iniciando conexión con Google Firebase (Plan Gratuito Spark)...${C_RESET}"
  if command -v npx &>/dev/null; then
    npx -y firebase-tools@latest login
    printf "\n%b\n" "${C_CYAN}📋 Seleccione o cree su proyecto de Firebase:${C_RESET}"
    npx -y firebase-tools@latest use --add || true
    printf "\n%b\n" "${C_CYAN}🚀 Desplegando en su propia nube privada de Google...${C_RESET}"
    npx -y firebase-tools@latest deploy --only hosting,firestore
    printf "\n%b\n" "${C_GREEN}${C_BOLD}🎉 ¡FELICIDADES! Su app está en internet y lista para operar en clase.${C_RESET}"
  else
    printf "%b\n" "${C_ROSE}Se requiere Node.js / npx para el despliegue automático de Firebase.${C_RESET}" >&2
    exit 1
  fi
}

# 10. Ejecución Directa por Banderas o Menú Interactivo
if [ "$AUTO_SERVE" = true ]; then
  start_local_server
  exit 0
elif [ "$AUTO_DEPLOY" = true ]; then
  start_firebase_deploy
  exit 0
elif [ "$NON_INTERACTIVE" = true ]; then
  printf "%b\n" "${C_GREEN}Instalación desatendida completada exitosamente.${C_RESET}"
  exit 0
fi

# Menú Interactivo Estándar
printf "%b\n" "${C_GOLD}${C_BOLD}¿Qué desea hacer a continuación?${C_RESET}"
printf "%b\n" "  ${C_BOLD}[1]${C_RESET} ${C_CYAN}Probar en mi computadora ahora mismo (Servidor Local)${C_RESET}"
printf "%b\n" "  ${C_BOLD}[2]${C_RESET} ${C_GREEN}Subir a mi nube gratuita de Google (Firebase Deploy)${C_RESET}"
printf "%b\n\n" "  ${C_BOLD}[3]${C_RESET} Salir por ahora (Ya está todo configurado)"

read -r -p "Seleccione una opción [1-3]: " USER_CHOICE || true

case "$USER_CHOICE" in
  1)
    start_local_server
    ;;
  2)
    start_firebase_deploy
    ;;
  *)
    printf "\n%b\n" "${C_GREEN}¡Listo! Sus archivos están listos en:${C_RESET} ${REPO_DIR}/public/"
    printf "%b\n\n" "Puede abrir ${C_BOLD}public/index.html${C_RESET} en su navegador en cualquier momento."
    ;;
esac
