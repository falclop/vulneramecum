# 📚 Vulneramecum

**Vulneramecum** es una guía interactiva de vulnerabilidades de código surgidas durante el análisis estático de aplicaciones, especialmente usando herramientas como Checkmarx. Está diseñada como una herramienta de uso personal para revisar rápidamente incidencias comunes, con ejemplos reales, soluciones recomendadas e imágenes explicativas.

---

## 💡 Planteamiento de la aplicación

La aplicación nace de la necesidad de contar con una **guía ágil, visual y personalizable** que centralice vulnerabilidades detectadas en distintos proyectos, para facilitar su comprensión y resolución en entornos de desarrollo y auditoría de seguridad.

---

## 🔧 Stack tecnológico

- **Framework principal:** ASP.NET Core 6 (Blazor Server)
- **Lenguaje backend:** C#
- **ORM:** Entity Framework Core 6
- **Base de datos:** SQL Server
- **Frontend:** Bootstrap 5 + componentes Blazor
- **Gestión de imágenes:** Sistema de ficheros local (referencia por rutas)

---

## 🧱 Estructura del proyecto

vulneramecum/
├── Data/ # Modelos de entidad y AppDbContext
├── Pages/ # Componentes Blazor (.razor)
├── Service/ # Lógica de negocio y acceso a datos
├── wwwroot/ # Estáticos (CSS, imágenes, etc.)
├── appsettings.json # Configuración de cadena de conexión
├── Program.cs # Bootstrap del servidor ASP.NET Core
└── README.md # Este archivo

---

## 🔁 Flujo de usuario

```mermaid
    flowchart TD
    A[Inicio ("/")] --> B[Lista de vulnerabilidades]
    B --> C[Buscar / Filtrar por texto, lenguaje, severidad]
    B --> D[Ver detalles de una vulnerabilidad]
    D --> E[Ejemplos visuales y casos reales]
    B --> F[Añadir nueva vulnerabilidad]
    F --> G[Formulario con imágenes y ejemplos]
    G --> H[Guardar en DB y volver a la lista]
```

## ✅ Funcionalidades principales

    ✅ Listado de vulnerabilidades con filtro dinámico

    ✅ Formulario para creación con múltiples imágenes y ejemplos

    ✅ Vista de detalle con confirmación de eliminación

    ✅ Subida de imágenes y preview en frontend

    ✅ Almacenamiento eficiente y persistente

    ✅ Seguridad básica mediante clave local fuera de control de versiones

    ✅ Código limpio, comentado y mantenible

## 📌 TODOs y próximas mejoras

    Crear base de datos y relaciones (vulnerabilidad ↔ imágenes ↔ ejemplos)

    Crear interfaz Blazor visual y responsive

    Filtrado dinámico de resultados

    Confirmación antes de eliminación

    Manejo robusto de subida de imágenes

    Autenticación más sólida (login/clave con hash)

    Validaciones detalladas en formularios

    Exportar/Importar base de vulnerabilidades

    Soporte multilenguaje (es/en)

    Mejora estética con diseño AdminLTE o plantilla pro

## 🚀 Despliegue

La aplicación puede ser desplegada en:

    IIS (como aplicación .NET Core)

    Azure App Service

    Docker (con volumen compartido para imágenes)

    Raspberry Pi (modo local, producción personal)

    Se recomienda revisar la configuración en appsettings.json y asegurar la cadena de conexión antes del despliegue.

## 👨‍💻 Autor

    Proyecto desarrollado por @falclop con cariño y café ☕