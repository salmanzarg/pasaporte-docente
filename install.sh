#!/usr/bin/env bash

# ==============================================================================
# 🎓 PASAPORTE DOCENTE CLI — Asistente de Instalación Autónoma
# Creado de forma independiente por Salvador Almánzar
# Licencia: MIT
# ==============================================================================

set -e

# Paleta de colores ANSI de alta visibilidad
C_RESET="\033[0m"
C_BOLD="\033[1m"
C_GOLD="\033[38;5;220m"
C_CYAN="\033[38;5;39m"
C_GREEN="\033[38;5;42m"
C_ROSE="\033[38;5;203m"
C_SLATE="\033[38;5;244m"
C_BG_CARD="\033[48;5;235m"

clear

# Banner de bienvenida estilo retro / terminal futurista
echo -e "${C_GOLD}${C_BOLD}"
cat << "EOF"
  ██████╗  █████╗ ███████╗ █████╗ ██████╗  ██████╗ ██████╗ ████████╗███████╗
  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
  ██████╔╝███████║███████╗███████║██████╔╝██║   ██║██████╔╝   ██║   █████╗  
  ██╔═══╝ ██╔══██║╚════██║██╔══██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══╝  
  ██║     ██║  ██║███████║██║  ██║██║     ╚██████╔╝██║  ██║   ██║   ███████╗
  ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
EOF
echo -e "${C_RESET}"
echo -e "  ${C_CYAN}${C_BOLD}Sistema de Asistencia Inteligente, Códigos QR y Gamificación en el Aula${C_RESET}"
echo -e "  ${C_SLATE}Creado por ${C_BOLD}Salvador Almánzar${C_RESET}${C_SLATE} • Licencia MIT (Open Source)${C_RESET}"
echo -e "  ${C_GOLD}────────────────────────────────────────────────────────────────────────${C_RESET}\n"

# Redirigir entrada interactiva desde la terminal si se ejecuta vía pipe (curl ... | bash)
if [ ! -t 0 ]; then
  exec < /dev/tty 2>/dev/null || true
fi

# Detección de entorno (si se ejecuta vía curl o clonado)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [[ ! -f "$REPO_DIR/public/index.html" ]]; then
  echo -e "${C_CYAN}📦 Descargando repositorio oficial desde GitHub...${C_RESET}"
  if command -v git &> /dev/null; then
    if [[ -d "pasaporte-docente" ]]; then
      echo -e "${C_CYAN}🔄 Actualizando carpeta existente 'pasaporte-docente'...${C_RESET}"
      cd pasaporte-docente
      git pull origin main 2>/dev/null || true
      REPO_DIR="$(pwd)"
    else
      git clone https://github.com/salmanzarg/pasaporte-docente.git pasaporte-docente
      cd pasaporte-docente
      REPO_DIR="$(pwd)"
    fi
  else
    echo -e "${C_ROSE}❌ Error: Se requiere 'git' para clonar el proyecto.${C_RESET}"
    exit 1
  fi
fi

echo -e "${C_GREEN}${C_BOLD}¡Hola, Profesor(a)! 👋${C_RESET}"
echo -e "Vamos a personalizar y dejar listo su Pasaporte Docente en menos de 1 minuto.\n"

# Preguntas interactivas con valores sugeridos
read -r -p "$(echo -e "${C_BOLD}1. Su Nombre Completo:${C_RESET} [ej. Profa. María Elena]: ")" PROF_NAME
PROF_NAME="${PROF_NAME:-Prof. Docente}"

read -r -p "$(echo -e "${C_BOLD}2. Su Institución o Escuela:${C_RESET} [ej. UNAM / IPN / Tec de Monterrey]: ")" PROF_INST
PROF_INST="${PROF_INST:-Mi Institución Educativa}"

read -r -p "$(echo -e "${C_BOLD}3. Nombre de su Asignatura:${C_RESET} [ej. Comercio Internacional]: ")" PROF_SUBJECT
PROF_SUBJECT="${PROF_SUBJECT:-Cátedra Principal}"

read -r -p "$(echo -e "${C_BOLD}4. Siglas de la Materia (opcional):${C_RESET} [ej. ERAP]: ")" PROF_SIGLAS
PROF_SIGLAS="${PROF_SIGLAS:-DOC}"

echo -e "\n${C_CYAN}⚙️  Escribiendo configuración personalizada en public/config.js...${C_RESET}"

cat > "$REPO_DIR/public/config.js" << EOF
// Configuración personalizada generada por Pasaporte Docente CLI
// Creado de manera independiente por Salvador Almánzar (Licencia MIT)

window.DOCENTE_CONFIG = {
  profesor: "${PROF_NAME}",
  institucion: "${PROF_INST}",
  materia: "${PROF_SUBJECT}",
  siglas: "${PROF_SIGLAS}",
  ciclo: "${YEAR:-$(date +%Y)}",
  colorPrimario: "#1E293B",
  colorSecundario: "#D4AF37",
  creditos: "Desarrollado y conceptualizado por Salvador Almánzar",
  firebase: null
};
EOF

# Sincronizar también con la raíz si existe
cp "$REPO_DIR/public/config.js" "$REPO_DIR/config.js" 2>/dev/null || true

echo -e "${C_GREEN}✅ Configuración guardada exitosamente.${C_RESET}\n"

# Menú de acciones inmediatas
echo -e "${C_GOLD}${C_BOLD}¿Qué desea hacer a continuación?${C_RESET}"
echo -e "  ${C_BOLD}[1]${C_RESET} ${C_CYAN}Probar en mi computadora ahora mismo (Servidor Local)${C_RESET}"
echo -e "  ${C_BOLD}[2]${C_RESET} ${C_GREEN}Subir a mi nube gratuita de Google (Firebase Deploy)${C_RESET}"
echo -e "  ${C_BOLD}[3]${C_RESET} Salir por ahora (Ya está todo configurado)"
echo ""
read -r -p "Seleccione una opción [1-3]: " USER_CHOICE

case "$USER_CHOICE" in
  1)
    echo -e "\n${C_CYAN}🚀 Levantando servidor local en el puerto 5000...${C_RESET}"
    echo -e "${C_SLATE}Presione Ctrl + C para detener el servidor cuando termine.${C_RESET}\n"
    if command -v python3 &> /dev/null; then
      echo -e "${C_GREEN}Abriendo en su navegador: http://localhost:5000${C_RESET}"
      open "http://localhost:5000/public/" 2>/dev/null || true
      python3 -m http.server 5000
    elif command -v npx &> /dev/null; then
      npx -y serve public
    else
      echo -e "${C_GOLD}Puede abrir directamente con doble clic el archivo: ${REPO_DIR}/public/index.html${C_RESET}"
    fi
    ;;
  2)
    echo -e "\n${C_CYAN}🔐 Iniciando conexión con Google Firebase (Plan Gratuito Spark)...${C_RESET}"
    if command -v npx &> /dev/null; then
      npx -y firebase-tools@latest login
      echo -e "\n${C_CYAN}📋 Seleccione o cree su proyecto de Firebase:${C_RESET}"
      npx -y firebase-tools@latest use --add || true
      echo -e "\n${C_CYAN}🚀 Desplegando en su propia nube de Google...${C_RESET}"
      npx -y firebase-tools@latest deploy --only hosting,firestore
      echo -e "\n${C_GREEN}${C_BOLD}🎉 ¡FELICIDADES! Su app está en internet y lista para usarse en clase.${C_RESET}"
    else
      echo -e "${C_ROSE}Se requiere Node.js / npx para el despliegue automático de Firebase.${C_RESET}"
    fi
    ;;
  *)
    echo -e "\n${C_GREEN}¡Listo! Sus archivos están listos en:${C_RESET} ${REPO_DIR}/public/"
    echo -e "Puede abrir ${C_BOLD}public/index.html${C_RESET} en su navegador en cualquier momento.\n"
    ;;
esac
