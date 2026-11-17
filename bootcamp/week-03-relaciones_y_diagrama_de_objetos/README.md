# Semana 03 — Relaciones y diagrama de objetos

## Descripción

Unes las clases de la semana 02 con las seis relaciones de UML: asociación con multiplicidad, agregación, composición, generalización, realización y dependencia, más la clase asociación. Después compruebas el modelo con un diagrama de objetos: una situación concreta que tiene que poder existir según el diagrama de clases.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Dibujar asociaciones con nombre, roles y multiplicidad en los dos extremos
- Decidir entre composición, agregación y asociación con la prueba del borrado
- Modelar jerarquías con generalización sin repetir lo heredado, e interfaces con realización
- Distinguir asociación navegable, dependencia y clase asociación
- Dibujar un diagrama de objetos y usarlo para comprobar las multiplicidades
- Depurar un diagrama con relaciones mal modeladas

## Prerrequisitos

- Semana 02 completada (tu diagrama de clases pasa `./scripts/verificar-semana.sh 02`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Asociaciones y multiplicidad](1-teoria/01-asociaciones-y-multiplicidad.md) | 20 min |
| — | Teoría | [Generalización, realización y dependencia](1-teoria/02-generalizacion-realizacion-y-dependencia.md) | 12 min |
| — | Teoría | [Diagrama de objetos](1-teoria/03-diagrama-de-objetos.md) | 13 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-asociaciones-y-multiplicidad](2-practicas/lab-01-asociaciones-y-multiplicidad/README.md) | 60 min |
| 2 | Lab | [lab-02-agregacion-y-composicion](2-practicas/lab-02-agregacion-y-composicion/README.md) | 60 min |
| 3 | Lab | [lab-03-generalizacion-y-realizacion](2-practicas/lab-03-generalizacion-y-realizacion/README.md) | 60 min |
| 4 | Lab | [lab-04-clase-asociacion-y-dependencia](2-practicas/lab-04-clase-asociacion-y-dependencia/README.md) | 60 min |
| 5 | Lab | [lab-05-diagrama-de-objetos](2-practicas/lab-05-diagrama-de-objetos/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-relaciones-rotas](2-practicas/lab-06-depurar-relaciones-rotas/README.md) | 60 min |
| — | Proyecto | [Relaciones y objetos de tu dominio](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Asociaciones y multiplicidad
[60 min] lab-02 — Agregación y composición
[60 min] lab-03 — Generalización y realización
[60 min] lab-04 — Clase asociación, navegabilidad y dependencia
[60 min] lab-05 — Diagrama de objetos
[60 min] lab-06 — Depurar relaciones rotas
[3 h]    Proyecto: relaciones y objetos de tu dominio
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 03
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 02 — Diagrama de clases](../week-02-diagrama_de_clases/README.md) | **Semana 03 — Relaciones y diagrama de objetos** | [Semana 04 — Casos de uso](../week-04-casos_de_uso/README.md) |

[← Volver al índice del bootcamp](../README.md)
