# Semana 10 — Proyecto integrador

## Descripción

Cierras el modelo de tu dominio. No hay diagrama nuevo: compruebas que las doce vistas cuentan el mismo sistema, trazas cada caso de uso hasta sus clases y diagramas, pasas el modelo por la revisión de un compañero y lo defiendes ante el instructor.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Detectar desde la terminal contradicciones entre el diagrama de clases y las demás vistas
- Decidir, ante una contradicción, qué vista dice la verdad del dominio y corregir la otra
- Construir una matriz de trazabilidad de casos de uso a clases y diagramas, y leerla en las dos direcciones
- Encontrar clases huérfanas y casos de uso poco explicados, y declarar los huecos
- Revisar el modelo de otra persona y registrar hallazgos como problemas, no como soluciones
- Resolver hallazgos con un motivo del dominio y aplicar las correcciones
- Defender decisiones de modelado con su alternativa y su motivo, en un guion de 10 minutos

## Prerrequisitos

- Semana 09 completada (tu modelo pasa `./scripts/verificar-semana.sh 09`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))
- Un compañero de la cohorte, con otro dominio, para la revisión por pares

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Coherencia entre vistas](1-teoria/01-coherencia-entre-vistas.md) | 15 min |
| — | Teoría | [Trazabilidad](1-teoria/02-trazabilidad.md) | 15 min |
| — | Teoría | [Revisión por pares y defensa](1-teoria/03-revision-y-defensa.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-coherencia-clases-y-secuencia](2-practicas/lab-01-coherencia-clases-y-secuencia/README.md) | 60 min |
| 2 | Lab | [lab-02-coherencia-estados-objetos-y-paquetes](2-practicas/lab-02-coherencia-estados-objetos-y-paquetes/README.md) | 60 min |
| 3 | Lab | [lab-03-matriz-de-trazabilidad](2-practicas/lab-03-matriz-de-trazabilidad/README.md) | 60 min |
| 4 | Lab | [lab-04-revision-por-pares](2-practicas/lab-04-revision-por-pares/README.md) | 60 min |
| 5 | Lab | [lab-05-defensa-de-decisiones](2-practicas/lab-05-defensa-de-decisiones/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-modelo-roto](2-practicas/lab-06-depurar-modelo-roto/README.md) | 60 min |
| — | Proyecto | [Modelo completo y defensa](3-proyecto/README.md) | 3 h |

**Total: 10 horas**, más los 10 minutos de la defensa.

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Coherencia entre clases y secuencia
[60 min] lab-02 — Coherencia entre estados, objetos, paquetes y clases
[60 min] lab-03 — Matriz de trazabilidad
[60 min] lab-04 — Revisión por pares
[60 min] lab-05 — Defensa de decisiones
[60 min] lab-06 — Depurar un modelo roto
[3 h]    Proyecto: modelo completo y defensa
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 10
```

Output esperado al terminar: `17/17 comprobaciones superadas.` Después, la defensa en directo con el instructor.

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 09 — De UML a código y patrones](../week-09-de_uml_a_codigo_y_patrones/README.md) | **Semana 10 — Proyecto integrador** | — |

[← Volver al índice del bootcamp](../README.md)
