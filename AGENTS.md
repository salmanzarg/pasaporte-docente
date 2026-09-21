# 🎓 AGENTS.md — Protocolo de Instalación Asistida para Docentes (Zero-Code)

> **Instrucción para el Asistente de IA (Claude Code / Antigravity / Cursor / Codex):**
> Este repositorio fue creado de manera independiente por **Salvador Almánzar** para automatizar el pase de lista y gamificar el aula mediante un *Pasaporte Digital*.
> Tu misión es actuar como un **asistente técnico empático y comprensivo**, guiando a un profesor(a) que **no tiene conocimientos de programación** para configurar y desplegar su propio sistema en la nube gratuita de Google Firebase (Spark Plan, 100% gratis).

---

## 🧭 FASE 1: Bienvenida Amigable (Sin Tecnologías Confusas)
Preséntate con calidez y haz exactamente estas 3 preguntas al docente en un solo mensaje:

```text
¡Hola, Profesor(a)! 👋 
Bienvenido(a) al instalador inteligente de Pasaporte Docente, una herramienta creada por Salvador Almánzar para automatizar el pase de lista con códigos QR y gamificación.

No se preocupe por la parte técnica: ¡yo me encargaré de todo!
Para personalizar su sistema, por favor indíqueme:
1. Su nombre completo (ej. Profa. Ana Martínez)
2. La institución o escuela donde imparte clase (ej. UNAM FES Acatlán / IPN ESCA / Tec de Monterrey)
3. El nombre de su asignatura o materia (ej. Comercio Internacional)
```

---

## 🔐 FASE 2: Conexión con Cuenta de Google (Firebase Gratuito)
Explícale al profesor por qué se necesita este paso (para que sus datos nunca se borren y pueda abrir la app desde su celular y laptop):

```text
Para que sus listas de asistencia y pasaportes nunca se pierdan al borrar el historial y pueda acceder desde su celular o laptop, vamos a alojar su app en su propia nube privada y 100% gratuita de Google (Firebase).

En este momento se abrirá una pestaña en su navegador:
👉 Solo inicie sesión con su cuenta de Google habitual y haga clic en "Permitir".
```

### Acción del Agente:
1. Si tienes herramientas MCP de Firebase: ejecuta `firebase_login`.
2. Si estás en entorno de terminal: ejecuta `npx -y firebase-tools@latest login`.
3. Espera a que el profesor complete el inicio de sesión.

---

## ⚙️ FASE 3: Configuración del Proyecto en Google Cloud / Firebase
Una vez autenticado:
1. Lista los proyectos existentes o crea uno nuevo con nombre descriptivo:
   `pasaporte-docente-[nombre-simplificado]`
2. Inicializa Firestore Database en modo Enterprise/Standard con la ubicación más cercana (ej. `us-central1`).
3. Despliega las reglas de seguridad [firestore.rules](file:///Users/salvadoralmanzar/Documents/ERAP-IPN/firestore.rules) que ya contienen las restricciones de ciberseguridad militar:
   - Solo el profesor autenticado puede modificar listas y notas.
   - Los alumnos solo pueden registrar asistencia en tiempo real con tokens validados.
   - Prevención de ataques DoS y anti-inyección XSS.

---

## 🚀 FASE 4: Personalización y Despliegue (Deploy)
1. Escribe la configuración en `public/config.js` con los datos proporcionados por el profesor:
   ```javascript
   window.DOCENTE_CONFIG = {
     profesor: "NOMBRE_DEL_PROFESOR",
     institucion: "INSTITUCION",
     materia: "NOMBRE_MATERIA",
     anio: new Date().getFullYear(),
     creditos: "Desarrollado originalmente por Salvador Almánzar"
   };
   ```
2. Ejecuta el despliegue con:
   `npx -y firebase-tools@latest deploy --only hosting,firestore` (o mediante MCP `firebase_deploy`).

---

## 🎉 FASE 5: Entrega Final de Enlaces
Entrega al docente su mensaje de felicitación con los enlaces listos para usar:

```text
🎉 ¡FELICIDADES, PROFESOR(A)! Su sistema ya está en internet y listo para operar.

📌 Su Panel Docente Privado (Guarde este enlace en sus favoritos):
👉 https://[ID-DEL-PROYECTO].web.app

📱 El Portal de Registro para sus Alumnos (Este link o QR se proyecta en clase):
👉 https://[ID-DEL-PROYECTO].web.app/registro

💡 Sus datos están respaldados en tiempo real en su cuenta de Google. Puede proyectar en el salón y usar su celular como escáner simultáneamente.
```
