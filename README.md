# 🎓 Pasaporte Docente — V1 Lite
### Sistema Inteligente de Asistencia Gamificada con Pasaporte Digital y Escáner Continuo por Voz

[![Licencia](https://img.shields.io/badge/Licencia-MIT-amber.svg)](LICENSE)
[![Versión](https://img.shields.io/badge/Versión-1.0.0%20Lite-emerald.svg)](#)
[![Google Cloud](https://img.shields.io/badge/Google%20Firebase-Spark%20(100%25%20Gratis)-blue.svg)](#)
[![Agentic-First](https://img.shields.io/badge/Instalación-Agentic%20(1--Clic)-purple.svg)](#)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Salvador%20Alm%C3%A1nzar-0A66C2.svg?logo=linkedin)](https://www.linkedin.com/in/salvador-almanzar/)

> **Creado, diseñado y desarrollado de forma independiente por Salvador Almánzar**

---

## 💡 El Problema vs La Solución

* **El Problema:** Pasar lista tradicionalmente en papel a 30-40 alumnos consume entre 12 y 15 minutos por sesión. En un semestre, esto representa **más de 10 horas de clase perdidas**, además del riesgo constante de alumnos que firman por otros o se comparten capturas de pantalla.
* **La Solución:** **Pasaporte Docente** transforma la asistencia en una experiencia diplomática gamificada. Cada alumno porta en su celular un *Pasaporte Digital* con código QR único, y el profesor pasa lista en **menos de 30 segundos** utilizando su cámara en modo ráfaga con **confirmación por voz en tiempo real**.

---

## ⚡ Instalación en 1 Clic (Agentic & CLI)

Este repositorio está diseñado bajo el estándar **Agentic-First** para docentes y desarrolladores:

### Opción A: Con Asistentes de IA (Zero-Code)
Si utilizas **Claude Code**, **Antigravity**, **Cursor** o **Codex**, simplemente copia y pega este comando en el chat de tu agente:

```text
Instala y despliega Pasaporte Docente desde https://github.com/salmanzarg/pasaporte-docente
```

El agente de IA leerá automáticamente el protocolo [AGENTS.md](AGENTS.md), te pedirá tus datos en español sencillo y lo desplegará en tu propia nube gratuita de Google.

### Opción B: CLI Oficial desde tu Terminal (Mac, Linux o WSL)
Ejecuta este comando universal para iniciar el instalador interactivo:

```bash
curl -fsSL https://raw.githubusercontent.com/salmanzarg/pasaporte-docente/main/install.sh | bash
```

---

## 🚀 Características Principales (Versión 1 Lite)

### 1. 📱 Portal del Alumno: Pasaporte Diplomático
* Aplicación web móvil progresiva (PWA): los alumnos pueden *"Agregar a Pantalla de Inicio"* en iPhone y Android sin instalar nada de la App Store.
* Generación de código QR de alta resolución con folio, matrícula y rol del estudiante.
* Totalmente desacoplada del panel del profesor para garantizar la privacidad y seguridad.

### 2. 📷 Escáner Continuo en Modo Ráfaga
* Escaneo ininterrumpido sin necesidad de tocar la pantalla: los alumnos pasan su celular frente a tu cámara y el sistema los registra a velocidad de 1 segundo por persona.
* **Confirmación por Voz en Vivo (Text-to-Speech Offline):** El dispositivo del profesor anuncia en voz alta el nombre de cada alumno registrado (*"Mariana Gómez, presente"*), eliminando de raíz cualquier intento de suplantación de identidad.
* Reglas automáticas de tolerancia y retardo calculadas al segundo con el reloj oficial de clase.

### 3. 🛡️ Ciberseguridad Militar Integrada (Security by Design)
* **Reglas de Servidor en Cloud Firestore ([firestore.rules](firestore.rules)):** Los alumnos nunca pueden modificar listas ni notas ajenas; las peticiones están blindadas criptográficamente.
* **Cabeceras HTTP de Protección:** Prevención estricta contra inyecciones de código (XSS), robo de clics (Anti-Clickjacking con CSP) y sniffing.
* **Cero pérdida de datos:** Sincronización continua entre `localStorage` y la nube de Google Firebase.

### 4. 📊 Analítica y Exportación
* Dashboard ejecutivo con métricas de asistencia acumulada, semáforos de riesgo y gráfica de cumplimiento del 80% reglamentario.
* Descarga de cortes diarios y actas en Excel con un solo clic.

---

## 🧭 Estructura del Proyecto

```
pasaporte-docente/
├── AGENTS.md               # Protocolo autónomo para asistentes de IA (Claude / Antigravity)
├── LICENSE                 # Licencia CC BY-NC-SA 4.0 con atribución
├── README.md               # Documentación y guía oficial
├── firebase.json           # Configuración de hosting, rewrites y cabeceras de seguridad
├── firestore.rules         # Reglas de ciberseguridad de Cloud Firestore
├── firestore.indexes.json  # Índices optimizados para consultas
└── public/                 # Aplicación Web para producción
    ├── index.html          # Panel Docente Ejecutivo (Dashboard maestro)
    ├── registro.html       # Portal de Acreditación del Pasaporte del Alumno
    ├── config.template.js  # Plantilla de personalización de materia e institución
    └── manifest.json       # Manifiesto PWA para instalación en celulares
```

---

## 🛠️ Instalación Manual para Desarrolladores

Si prefieres desplegar manualmente mediante la terminal:

```bash
# 1. Clonar el repositorio
git clone https://github.com/salmanzarg/pasaporte-docente.git
cd pasaporte-docente

# 2. Iniciar sesión en Firebase (Plan Spark 100% Gratuito)
npx -y firebase-tools@latest login

# 3. Inicializar o vincular tu proyecto
npx -y firebase-tools@latest use --add

# 4. Desplegar base de datos y hosting
npx -y firebase-tools@latest deploy --only hosting,firestore
```

---

## 🔮 Hoja de Ruta (Roadmap hacia V2 Pro)

| Característica | V1 Lite (Gratis / Open Source) | V2 Pro (Próximamente) |
| :--- | :---: | :---: |
| **Grupos Activos** | 1 Grupo Permanente | Grupos y materias ilimitadas (ej. 3NV1, 3NV2, 4NV5) |
| **Pasaporte QR y Escáner por Voz** | ✅ Sí | ✅ Sí |
| **Alertas a Alumnos** | Manual | 📲 Notificaciones automáticas por WhatsApp / Email |
| **Comparativa entre Salones** | N/A | 📊 Analítica comparativa de puntualidad multigrupo |
| **Actas Oficiales** | Descarga CSV/Excel | 📑 Formato automatizado compatible con SAES / SIAE / Moodle |

---

## 👨‍💻 Autoría y Propiedad Intelectual

Este sistema es una obra de software concebida, diseñada y desarrollada de manera independiente por **Salvador Almánzar** con recursos propios.

* **Creador y Titular de Derechos:** Salvador Almánzar
* **Perfil Profesional y Contacto:** [LinkedIn - Salvador Almánzar](https://www.linkedin.com/in/salvador-almanzar/)
* **Colaboraciones:** Abierto a talleres, consultoría educativa e implementaciones para colegios y universidades.

---

## 📜 Licencia

Este proyecto está bajo la licencia **MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.  
Eres libre de utilizarlo, modificarlo y compartirlo, manteniendo siempre el aviso de copyright y la atribución al autor original (**Salvador Almánzar**).
