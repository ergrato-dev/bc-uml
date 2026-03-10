# 🤝 Guía de Contribución — Bootcamp UML

¡Las contribuciones son bienvenidas! Este es un proyecto educativo de código abierto.

---

## 📋 Áreas de Contribución

- ✨ Ejercicios adicionales o variantes de dominio
- 📚 Mejoras en documentación y claridad
- 🐛 Corrección de errores en diagramas o código PlantUML
- 🎨 Recursos visuales (diagramas SVG)
- 🌐 Traducciones al inglés u otros idiomas
- 📹 Videos tutoriales o referencias externas

---

## 🔄 Cómo Contribuir

1. Haz un **fork** del repositorio
2. Crea tu rama: `git checkout -b feat/descripcion-breve`
3. Realiza tus cambios aplicando las convenciones del proyecto
4. Usa **Conventional Commits**:
   ```
   feat(week-01): add ejercicio de herencia múltiple
   fix(week-02): corregir diagrama de secuencia login
   docs: actualizar glosario sesión 1
   ```
5. Haz push: `git push origin feat/descripcion-breve`
6. Abre un **Pull Request** describiendo los cambios

---

## 📐 Convenciones

### Archivos Markdown

- Nombres en minúsculas con guiones: `01-introduccion-uml.md`
- Encabezados jerárquicos: `#`, `##`, `###`
- Tablas para comparativas y listados estructurados
- Bloques de código PlantUML con triple backtick y `plantuml`

### Diagramas SVG

- Tema oscuro: fondo `#1a1a1a`, texto claro
- Formato vectorial (no rasterizado)
- Nombres descriptivos: `clase-sintaxis.svg`, `estados-pedido.svg`

### Código PlantUML

- Incluir `@startuml` / `@enduml`
- Comentarios en español
- Indentación consistente de 2 espacios

---

## ✅ Checklist antes del PR

- [ ] Los cambios son coherentes con el nivel del módulo
- [ ] Los diagramas PlantUML son válidos y renderizables
- [ ] El Markdown pasa validación básica (sin links rotos)
- [ ] Los SVGs mantienen el estilo del proyecto (dark theme)
- [ ] Contenido en español (código en inglés si aplica)

---

## 📄 Licencia

Al contribuir, aceptas que tus cambios se distribuirán bajo la [Licencia MIT](LICENSE).
