# Semana 01 — Fundamentos de UML y PlantUML

## Descripción

Aprendes para qué sirve modelar, qué diagramas define UML 2.5.1 y cómo elegir el adecuado para cada pregunta. Montas el laboratorio PlantUML en Docker, escribes y depuras tus primeros diagramas como código y arrancas el modelo de tu dominio con su modelo conceptual.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Explicar cuándo modelar con UML aporta y cuándo no
- Clasificar los 14 diagramas de UML 2.5.1 y elegir uno por la pregunta que responde
- Renderizar, validar y depurar diagramas PlantUML en el contenedor del bootcamp
- Leer diagramas de clases, secuencia y estados escritos por otros
- Construir un modelo conceptual a partir de una narrativa del negocio
- Compartir estilo entre diagramas con `!include` y revisar cambios con `git diff`

## Prerrequisitos

- Programar con orientación a objetos en algún lenguaje (clases, objetos, herencia)
- Docker con Compose v2, git y jq ([setup del entorno](../../docs/setup-entorno.md))
- Tu dominio asignado por el instructor (lo necesitas para el proyecto)

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Para qué modelar](1-teoria/01-para-que-modelar.md) | 15 min |
| — | Teoría | [Taxonomía de UML](1-teoria/02-taxonomia-uml.md) | 15 min |
| — | Teoría | [PlantUML en el laboratorio](1-teoria/03-plantuml-en-el-laboratorio.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-laboratorio-plantuml](2-practicas/lab-01-laboratorio-plantuml/README.md) | 60 min |
| 2 | Lab | [lab-02-depurar-diagramas-rotos](2-practicas/lab-02-depurar-diagramas-rotos/README.md) | 60 min |
| 3 | Lab | [lab-03-elegir-el-diagrama](2-practicas/lab-03-elegir-el-diagrama/README.md) | 60 min |
| 4 | Lab | [lab-04-leer-diagramas](2-practicas/lab-04-leer-diagramas/README.md) | 60 min |
| 5 | Lab | [lab-05-modelo-conceptual](2-practicas/lab-05-modelo-conceptual/README.md) | 60 min |
| 6 | Lab | [lab-06-estilo-include-y-exportacion](2-practicas/lab-06-estilo-include-y-exportacion/README.md) | 60 min |
| — | Proyecto | [Portada y modelo conceptual de tu dominio](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Laboratorio PlantUML
[60 min] lab-02 — Depurar diagramas rotos
[60 min] lab-03 — Elegir el diagrama
[60 min] lab-04 — Leer diagramas
[60 min] lab-05 — Modelo conceptual
[60 min] lab-06 — Estilo común, include y exportación
[3 h]    Proyecto: portada y modelo conceptual de tu dominio
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 01
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| — | **Semana 01 — Fundamentos de UML y PlantUML** | [Semana 02 — Diagrama de clases](../week-02-diagrama_de_clases/README.md) |

[← Volver al índice del bootcamp](../README.md)
