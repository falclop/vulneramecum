# Hoja de Ruta del Proyecto: Gestor de Vulnerabilidades

Aplicación web para gestionar vulnerabilidades de código (C# / JavaScript), con visualización, búsqueda, edición y ejemplos prácticos.

---

## Fase 1: Infraestructura básica
**Objetivo:** Tener un sistema funcional que liste y muestre vulnerabilidades

1. Crear solución Blazor Server (`VulnTracker`)
2. Configurar conexión a base de datos (`appsettings.json`)
3. Crear modelos C#:
   - `Vulnerability`
   - `VulnerabilityImage`
   - `Example`
4. Crear `AppDbContext` con EF Core
5. Implementar `VulnerabilityService.cs` (CRUD)
6. Crear componentes Blazor:
   - `VulnerabilityList.razor`
   - `VulnerabilityDetail.razor`

---

## Fase 2: Carga y edición
**Objetivo:** Administrar el contenido desde la web

7. Crear formulario `AddEditVulnerability.razor`
   - Inclusión dinámica de múltiples imágenes y ejemplos
8. Implementar carga de imágenes (`/wwwroot/uploads`)
9. Añadir validaciones con `DataAnnotations`

---

## Fase 3: Visualización avanzada
**Objetivo:** UI intuitiva y navegación potente

10. Filtros por:
    - Lenguaje
    - Severidad
    - Texto libre
11. Galería de imágenes ordenada (`OrderIndex`)
12. Estadísticas simples:
    - Total por severidad/lenguaje
    - Últimas modificadas

---

## Fase 4: Gestión de usuarios (opcional)
**Objetivo:** Controlar acceso por roles

13. Autenticación con ASP.NET Identity
14. Roles:
    - Admin: CRUD completo
    - ReadOnly: solo lectura
    - (Opcional) Editor: alta de entradas

---

## Fase 5: Extras y refinamiento
**Objetivo:** Ampliar usabilidad y mantenimiento

15. Exportar vulnerabilidad a PDF o Markdown
16. Carga inicial desde PDF/Excel → SQL o JSON (`SeedData`)
17. Backup / importador desde JSON
18. Testing:
    - xUnit para lógica de negocio
    - UI tests manuales o automatizados

---

## ✅ MVP (mínimo producto viable)
- Listado navegable de vulnerabilidades
- Detalle con imágenes y ejemplos
- Filtros básicos
- Carga desde interfaz web

