# Guía de Desarrollo de Contenidos

> Cómo agregar o modificar material en el Bootcamp UML siguiendo los
> estándares del proyecto.

---

## Convenciones Generales

### Idioma

| Elemento                                     | Idioma                                        |
| -------------------------------------------- | --------------------------------------------- |
| Documentación (`.md`)                        | **Español**                                   |
| Código PlantUML — clases, métodos, atributos | **Inglés**                                    |
| Comentarios dentro de `.puml`                | Español                                       |
| Nombres de archivo                           | Minúsculas, guiones: `01-introduccion-uml.md` |

### Nomenclatura de Archivos

```
# Teoría
01-nombre-tema.md       # numerados con cero

# Ejercicios
ejercicio-01-tema/
  README.md
  starter.puml
  solucion.puml

# Proyecto
starter/
  nombre-proyecto.puml
```

---

## Estructura de un Archivo de Teoría

Cada archivo en `1-teoria/` debe seguir esta plantilla:

```markdown
# Título del Tema

> ⏱️ Duración estimada: **XX minutos** | 📹 [Video recomendado](enlace)

## Objetivos

Al finalizar esta sección podrás:

- [ ] Objetivo 1
- [ ] Objetivo 2

---

## Contenido

[Desarrollo del contenido con ejemplos PlantUML]

---

## Resumen

[Tabla resumen con los puntos clave]

---

## Navegación

← [Archivo anterior](anterior.md) | [Archivo siguiente](siguiente.md) →
```

---

## Estructura de un Ejercicio Práctico

### README.md del ejercicio

```markdown
# Ejercicio XX — Tema: Descripción

> ⏱️ Duración: **XX minutos** | Nivel: **Básico/Intermedio/Avanzado**

## 🎯 Objetivo

[Descripción breve]

## 📋 Enunciado

[Descripción del problema con tablas de actores/clases/estados]

## ✅ Criterios de Evaluación

| Criterio  | Puntaje     |
| --------- | ----------- |
| ...       | XX pts      |
| **Total** | **100 pts** |

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio
- [`solucion.puml`](solucion.puml) — Solución de referencia
```

### starter.puml

- Incluir siempre el skinparam del tema dark
- Agregar comentarios `TODO:` con instrucciones claras
- No dejar el diagrama en blanco; dar la estructura mínima
- Verificar que el archivo renderiza en PlantUML (aunque esté incompleto)

### solucion.puml

- Diagrama completo y correcto
- Comentarios explicando decisiones de diseño no obvias
- Verificar que renderiza sin errores

---

## Skinparam Dark Theme Estándar

Usar este skinparam en todos los diagramas `.puml`:

```plantuml
skinparam backgroundColor #1a1a1a
skinparam classBorderColor #8b5cf6
skinparam classBackgroundColor #2d2d2d
skinparam classFontColor #e2e8f0
skinparam arrowColor #94a3b8
skinparam noteFontColor #e2e8f0
skinparam noteBackgroundColor #1e293b
skinparam noteBorderColor #475569
```

Para diagramas específicos, adaptar los prefijos:

- `state*` para diagramas de estados
- `sequence*` para diagramas de secuencia
- `actor*` / `usecase*` para casos de uso
- `activity*` para actividades

---

## Agregar una Nueva Sesión

Si el bootcamp se expande a una sesión 3:

1. Crear la estructura de directorios:

```bash
mkdir -p bootcamp/sesion-3/{0-assets,1-teoria,2-practicas,3-proyecto/starter,4-recursos/{webgrafia,videografia,ebooks-free},5-glosario}
```

2. Copiar los SVGs relevantes a `0-assets/`
3. Crear `README.md` y `rubrica-evaluacion.md` siguiendo el patrón de sesiones anteriores
4. Actualizar `_docs/plan-estudios.md` con la nueva sesión
5. Actualizar el `README.md` raíz con la nueva entrada en la tabla

---

## Agregar un Nuevo Ejercicio

1. Crear la carpeta: `bootcamp/sesion-X/2-practicas/ejercicio-0N-tema/`
2. Crear `README.md`, `starter.puml`, y `solucion.puml`
3. Actualizar la tabla de ejercicios en `bootcamp/sesion-X/README.md`
4. Actualizar la rúbrica en `rubrica-evaluacion.md` si es necesario

---

## Agregar un Nuevo SVG

Los SVGs deben seguir el tema dark del proyecto:

- Fondo: `#1a1a1a`
- Bordes: `#8b5cf6` (púrpura)
- Texto: `#e2e8f0`
- Flechas: `#94a3b8`

SVGs de diagramas van en `bootcamp/week-XX/0-assets/`, numerados por orden de aparición en la teoría.
El logo del bootcamp va en `_assets/logo-uml-course.svg`.

---

## Conventional Commits

Este proyecto usa Conventional Commits para el historial de Git:

| Prefijo     | Uso                                                |
| ----------- | -------------------------------------------------- |
| `feat:`     | Nuevo contenido (tema, ejercicio, proyecto)        |
| `fix:`      | Corrección de errores en diagramas o texto         |
| `docs:`     | Mejora de documentación sin nuevo contenido        |
| `refactor:` | Reorganización de archivos sin cambio de contenido |
| `style:`    | Cambios de formato (whitespace, skinparam)         |

Ejemplo:

```
feat(week-02-diagramas_de_comportamiento): agregar ejercicio-04-actividades con starter y solucion
docs(glosario): ampliar definición de estado compuesto
fix(week-01-fundamentos_y_diagramas_estructurales): corregir sintaxis starter ejercicio-02
```

---

## Checklist para revisión de PR

Antes de solicitar revisión de un PR:

- [ ] Los archivos `.puml` renderizan sin errores en PlantUML
- [ ] Los nombres de archivo siguen las convenciones del proyecto
- [ ] El skinparam del tema dark está presente en todos los `.puml`
- [ ] El README del ejercicio/módulo tiene la tabla de criterios con 100 pts total
- [ ] Los TODOs del starter son suficientemente guiados (no ambiguos)
- [ ] La solución refleja exactamente lo pedido en el enunciado
- [ ] El commit usa Conventional Commits
