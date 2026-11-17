# Semana 06 — Secuencia y comunicación

## Descripción

Pasas del proceso a los objetos. Modelas qué objetos colaboran para cumplir un caso de uso de tu dominio, qué mensajes se envían y en qué orden, con sus flujos alternativos como fragmentos. Por el camino descubres las operaciones que le faltaban a tu diagrama de clases.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Elegir el tipo de lifeline correcto: actor, boundary, control u objeto del dominio
- Distinguir mensajes síncronos, respuestas, asíncronos, de creación y de destrucción
- Representar los flujos alternativos de un caso de uso con `alt`, `opt`, `loop`, `break`, `par` y `ref`
- Escribir guardas UML en PlantUML sin que se conviertan en enlaces
- Redibujar una secuencia como diagrama de comunicación con numeración decimal
- Trazar cada mensaje hacia una operación de `02-clases.puml` y cada diagrama hacia su caso de uso
- Depurar un diagrama de secuencia roto, en sintaxis y en modelado

## Prerrequisitos

- Semana 05 completada (tu modelo pasa `./scripts/verificar-semana.sh 05`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Lifelines y mensajes](1-teoria/01-lifelines-y-mensajes.md) | 15 min |
| — | Teoría | [Fragmentos combinados](1-teoria/02-fragmentos.md) | 15 min |
| — | Teoría | [Diagrama de comunicación](1-teoria/03-comunicacion.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-lifelines-y-mensajes](2-practicas/lab-01-lifelines-y-mensajes/README.md) | 60 min |
| 2 | Lab | [lab-02-asincronos-creacion-y-destruccion](2-practicas/lab-02-asincronos-creacion-y-destruccion/README.md) | 60 min |
| 3 | Lab | [lab-03-fragmentos-alt-y-opt](2-practicas/lab-03-fragmentos-alt-y-opt/README.md) | 60 min |
| 4 | Lab | [lab-04-loop-break-par-y-ref](2-practicas/lab-04-loop-break-par-y-ref/README.md) | 60 min |
| 5 | Lab | [lab-05-diagrama-de-comunicacion](2-practicas/lab-05-diagrama-de-comunicacion/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-secuencias-rotas](2-practicas/lab-06-depurar-secuencias-rotas/README.md) | 60 min |
| — | Proyecto | [Secuencia y comunicación de un caso de uso](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Lifelines y mensajes
[60 min] lab-02 — Asíncronos, creación y destrucción
[60 min] lab-03 — Fragmentos alt y opt
[60 min] lab-04 — loop, break, par y ref
[60 min] lab-05 — Diagrama de comunicación
[60 min] lab-06 — Depurar secuencias rotas
[3 h]    Proyecto: secuencia y comunicación de un caso de uso
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 06
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 05 — Diagrama de actividades](../week-05-diagrama_de_actividades/README.md) | **Semana 06 — Secuencia y comunicación** | [Semana 07](../week-07-maquinas_de_estados/README.md) |

[← Volver al índice del bootcamp](../README.md)
