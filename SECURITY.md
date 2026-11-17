# Política de Seguridad

## Versiones Soportadas

| Versión | Soportada |
| ------- | --------- |
| main    | Sí        |

## Reportar una vulnerabilidad

Si descubres una vulnerabilidad de seguridad en este material o en los scripts del repositorio, te pedimos que la reportes de manera responsable.

### NO hacer público el reporte

Por favor, **NO** abras un issue público para reportar vulnerabilidades de seguridad.

### Cómo reportar

1. **Abre un Security Advisory privado** en GitHub:
   - Ve a la pestaña "Security" del repositorio
   - Haz clic en "Report a vulnerability"
   - Completa el formulario con los detalles

2. **Incluye en tu reporte**:
   - Descripción detallada de la vulnerabilidad
   - Pasos para reproducir el problema
   - Impacto potencial
   - Sugerencias de solución (si las tienes)

### Tiempo de respuesta

- **Confirmación inicial**: 48 horas
- **Evaluación**: 7 días
- **Resolución**: Dependiendo de la severidad

---

## Qué se considera vulnerabilidad en este repositorio

Este es material educativo, no un servicio en producción. Cuentan como vulnerabilidad:

- **Un secreto real comiteado** en cualquier archivo del repositorio.
- **Un ejemplo que envía diagramas a un servidor externo** (el servidor público de plantuml.com, un visor online) sin avisarlo: un diagrama de un sistema real filtra su diseño.
- **Un script de `scripts/` con inyección de comandos** o borrado fuera de su directorio.
- **Una imagen Docker o un jar sin versión fijada** (PlantUML se fija por versión y hash SHA-256 en `lab/Dockerfile`).

## Prácticas de seguridad que enseña este bootcamp

### Renderiza en local

Todo diagrama se renderiza dentro del contenedor `uml`. Nunca pegues el `.puml` de un sistema real en un renderizador online: el texto del diagrama viaja al servidor.

### Nunca modeles datos reales

Los diagramas de objetos y los ejemplos usan datos inventados. Nunca copies datos personales reales a un `.puml`.

## Dependencias

Este bootcamp referencia:

- PlantUML 1.2026.9 y Java 21 (ver [`docs/stack-versions.md`](docs/stack-versions.md))
- Docker con Compose v2 para el laboratorio y el autograding
- bash, jq y shellcheck para los scripts de verificación

---

Gracias por ayudar a mantener este proyecto seguro.
