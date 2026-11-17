# Semana 04 — Casos de uso

## Descripción

Empieza la fase de comportamiento. Describes para qué sirve tu sistema: qué actores lo usan, qué objetivos consiguen con él y dónde está su límite. Después escribes la especificación textual de los casos más importantes, paso a paso, enlazada con el diagrama de clases.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Identificar actores como roles externos y dibujar el límite del sistema
- Nombrar casos de uso en nivel de objetivo y descartar pasos, pantallas y CRUD
- Usar `<<include>>` y `<<extend>>` en la dirección correcta, con punto de extensión y condición
- Aplicar la generalización de actores y de casos de uso, y saber cuándo basta un flujo alternativo
- Escribir la especificación textual de un caso de uso con flujos alternativos y trazabilidad al modelo
- Depurar un diagrama de casos de uso mal modelado

## Prerrequisitos

- Semana 03 completada (tu modelo pasa `./scripts/verificar-semana.sh 03`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Actores y casos de uso](1-teoria/01-actores-y-casos-de-uso.md) | 15 min |
| — | Teoría | [Include, extend y generalización](1-teoria/02-include-extend-y-generalizacion.md) | 15 min |
| — | Teoría | [Especificación textual](1-teoria/03-especificacion-textual.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-actores-y-limite-del-sistema](2-practicas/lab-01-actores-y-limite-del-sistema/README.md) | 60 min |
| 2 | Lab | [lab-02-casos-de-uso-con-objetivo](2-practicas/lab-02-casos-de-uso-con-objetivo/README.md) | 60 min |
| 3 | Lab | [lab-03-include-y-extend](2-practicas/lab-03-include-y-extend/README.md) | 60 min |
| 4 | Lab | [lab-04-generalizacion-de-actores-y-casos](2-practicas/lab-04-generalizacion-de-actores-y-casos/README.md) | 60 min |
| 5 | Lab | [lab-05-especificacion-textual](2-practicas/lab-05-especificacion-textual/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-casos-de-uso-rotos](2-practicas/lab-06-depurar-casos-de-uso-rotos/README.md) | 60 min |
| — | Proyecto | [Casos de uso de tu dominio](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Actores y límite del sistema
[60 min] lab-02 — Casos de uso con nivel de objetivo
[60 min] lab-03 — Include y extend
[60 min] lab-04 — Generalización de actores y casos de uso
[60 min] lab-05 — Especificación textual
[60 min] lab-06 — Depurar casos de uso rotos
[3 h]    Proyecto: casos de uso de tu dominio
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 04
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 03 — Relaciones y diagrama de objetos](../week-03-relaciones_y_diagrama_de_objetos/README.md) | **Semana 04 — Casos de uso** | [Semana 05 — Diagrama de actividades](../week-05-diagrama_de_actividades/README.md) |

[← Volver al índice del bootcamp](../README.md)
