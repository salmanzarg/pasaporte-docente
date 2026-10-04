// ==============================================================================
// 🎓 PASAPORTE DOCENTE — Configuración de Entorno Local y Nube
// Creado de manera independiente por Salvador Almánzar (Licencia MIT)
// ==============================================================================

window.DOCENTE_CONFIG = {
  // Datos del docente y asignatura
  profesor: "Prof(a). Docente Titular",
  institucion: "Mi Institución Educativa",
  materia: "Cátedra Principal",
  siglas: "DOC",
  ciclo: new Date().getFullYear().toString(),
  colorPrimario: "#1E293B",
  colorSecundario: "#D4AF37",
  creditos: "Desarrollado y conceptualizado por Salvador Almánzar",

  // 🔐 Sincronización en la Nube (Google Cloud Firestore - Spark Plan Gratuito)
  // Deje este valor en `null` para operar 100% en Modo Local (los datos se guardan
  // de forma segura en la memoria de su navegador sin necesidad de internet).
  //
  // Si desea habilitar la nube gratuita de Google para sincronizar su celular y laptop:
  // reemplace `null` por el objeto de configuración que le entrega Firebase Console:
  /*
  firebase: {
    apiKey: "AIzaSy...",
    authDomain: "su-proyecto.firebaseapp.com",
    projectId: "su-proyecto",
    storageBucket: "su-proyecto.firebasestorage.app",
    messagingSenderId: "123456789",
    appId: "1:123456789:web:abcdef"
  }
  */
  firebase: null
};
