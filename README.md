# 🎓 Pasaporte Docente — V1 Lite
### Sistema Inteligente de Asistencia Gamificada con Pasaporte Digital y Escáner Continuo por Voz

[![Licencia](https://img.shields.io/badge/Licencia-CC%20BY--NC--SA%204.0-amber.svg)](LICENSE)
[![Versión](https://img.shields.io/badge/Versión-1.0.0%20Lite-emerald.svg)](#)
[![Google Cloud](https://img.shields.io/badge/Google%20Firebase-Spark%20(100%25%20Gratis)-blue.svg)](#)
[![Agentic-First](https://img.shields.io/badge/Instalación-Agentic%20(1--Clic)-purple.svg)](#)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Salvador%20Alm%C3%A1nzar-0A66C2.svg?logo=linkedin)](https://www.linkedin.com/in/salvador-almanzar/)

> **Creado y conceptualizado por el Prof. Salvador Almánzar**  
> *Instituto Politécnico Nacional (IPN) — Escuela Superior de Comercio y Administración (ESCA Santo Tomás)*

---

## 💡 El Problema vs La Solución

* **El Problema:** Pasar lista tradicionalmente en papel a 30-40 alumnos consume entre 12 y 15 minutos por sesión. En un semestre, esto representa **más de 10 horas de clase perdidas**, además del riesgo constante de alumnos que firman por otros o se comparten capturas de pantalla.
* **La Solución:** **Pasaporte Docente** transforma la asistencia en una experiencia diplomática gamificada. Cada alumno porta en su celular un *Pasaporte Digital* con código QR único, y el profesor pasa lista en **menos de 30 segundos** utilizando su cámara en modo ráfaga con **confirmación por voz en tiempo real**.

---

## ⚡ Instalación Automática Asistida por IA (Zero-Code)

Este repositorio está diseñado bajo el estándar **Agentic-First**. No necesitas ser programador ni saber de servidores.

Si utilizas **Claude Code**, **Antigravity**, **Cursor** o **Codex**, simplemente copia y pega este comando:

```text
Instala y despliega Pasaporte Docente desde https://github.com/salmanzarg/pasaporte-docente
```

El agente de IA leerá automáticamente el protocolo [AGENTS.md](AGENTS.md) y:
1. Te saludará y te pedirá tu nombre, materia e institución.
2. Abrirá una pestaña para conectar tu cuenta habitual de Google (Firebase Gratuito).
3. Creará tu base de datos protegida con reglas de ciberseguridad.
4. Desplegará la aplicación y te entregará tus enlaces listos para proyectar en clase.

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

## 👨‍🏫 Autoría y Créditos

Este sistema fue concebido, diseñado y desarrollado originalmente por el **Prof. Salvador Almánzar**, docente en la **Escuela Superior de Comercio y Administración (ESCA Santo Tomás)** del **Instituto Politécnico Nacional (IPN)**, México.

* **Perfil Profesional y Contacto:** [LinkedIn - Salvador Almánzar](https://www.linkedin.com/in/salvador-almanzar/)
* **Objetivo Académico:** Impulsar la innovación pedagógica en la educación superior mediante herramientas digitales accesibles que devuelvan el tiempo valioso de clase a los docentes.
* **Colaboraciones:** Abierto a conferencias, talleres de transformación digital docente e implementaciones institucionales.

---

## 📜 Licencia

Este proyecto está bajo la licencia **Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)**.  
Eres libre de utilizarlo, compartirlo y adaptarlo en tu aula escolar, siempre que mantengas la **atribución visible al autor original (Salvador Almánzar)** y no se utilice con fines comerciales de reventa sin autorización expresa.
