# 📝 Decisión: Esquema de Nombres de Directorios de Semana

**Fecha**: 21 de marzo de 2026
**Tipo**: Decisión de arquitectura de repositorio (ADR)
**Estado**: ✅ Implementado

---

## Contexto

Los directorios de sesión del bootcamp seguían el esquema `week-XX` sin ninguna
indicación del tema que contenían. Esto obligaba a abrir cada `README.md` para
saber de qué trataba cada semana.

---

## Decisión

Se adopta el esquema:

```
week-XX-tema_principal
```

Donde `tema_principal` se extrae **únicamente** del encabezado principal del
`README.md` de cada semana, convertido a snake_case en minúsculas.

### Nombres resultantes

| Anterior  | Nuevo                                           | Fuente del tema                          |
| --------- | ----------------------------------------------- | ---------------------------------------- |
| `week-01` | `week-01-fundamentos_y_diagramas_estructurales` | `# Sesión 1: Fundamentos y Diagramas Estructurales` |
| `week-02` | `week-02-diagramas_de_comportamiento`           | `# Sesión 2: Diagramas de Comportamiento`           |

---

## Reglas de Nomenclatura

1. El número sigue con cero: `week-01`, `week-02`, etc.
2. El separador entre número y tema es un guión simple: `-`.
3. El tema principal va en snake_case: espacios → `_`, todo en minúsculas.
4. Se eliminan caracteres especiales (tildes, signos de puntuación).
5. La fuente canónica es **exclusivamente** el `h1` del `README.md` de la semana.

---

## Archivos Actualizados

Se actualizaron **todas** las referencias de ruta en los siguientes archivos:

| Archivo | Cambios |
| ------- | ------- |
| `README.md` | Badge nav, árbol de estructura, link inicio rápido |
| `README_EN.md` | Links a sesión 1 |
| `bootcamp/week-01-.../README.md` | Árbol interno, link de navegación |
| `bootcamp/week-02-.../README.md` | Árbol interno, link de navegación |
| `bootcamp/week-01-.../5-glosario/README.md` | Link cruzado al glosario de semana 2 |
| `bootcamp/week-02-.../5-glosario/README.md` | Link cruzado al glosario de semana 1 |
| `_docs/plan-estudios.md` | Todos los links a teoría, prácticas y proyecto |
| `_scripts/export-pdf.sh` | Argumentos del script y case statement |
| `CONTRIBUTING.md` | Ejemplos de scope en Conventional Commits |
| `_docs/guia-desarrollo-contenidos.md` | Ejemplos de scope en commits |
| `.github/copilot-instructions.md` | Árbol de estructura del proyecto |

### Notas sobre archivos NO actualizados

Los siguientes archivos en `_docs/` describen una **estructura legacy** (`modulos/`)
previa a la reorganización del repositorio. Sus referencias a `week-01`/`week-02`
están bajo `modulos/week-01/` (ruta que nunca existió en la estructura `bootcamp/`),
por lo que quedan fuera del alcance de este cambio:

- `_docs/RESUMEN-EJECUTIVO.md`
- `_docs/REORGANIZACION.md`
- `_docs/INVENTARIO-COMPLETO.md`
- `_docs/INDICE-NAVEGACION.md`

---

## Justificación

- **Legibilidad**: El nombre del directorio comunica inmediatamente su contenido.
- **Consistencia**: Sigue el mismo patrón que otros proyectos del canal (snake_case).
- **Alineación con copilot-instructions.md**: La guía de desarrollo ya tenía este
  esquema documentado en el campo "Estructura de Módulos" de las instrucciones.

---

## Verificación Post-Cambio

```bash
# Verificar cero referencias a los nombres anteriores (deben dar salida vacía)
grep -rn --include="*.md" --include="*.sh" 'bootcamp/week-01/' . | grep -v "week-01-"
grep -rn --include="*.md" --include="*.sh" 'bootcamp/week-02/' . | grep -v "week-02-"
grep -rn --include="*.md" --include="*.sh" '\.\./week-01/' . | grep -v "week-01-"
grep -rn --include="*.md" --include="*.sh" '\.\./week-02/' . | grep -v "week-02-"
```

Resultado: ✅ Sin coincidencias (cero enlaces rotos).
