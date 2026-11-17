# Semana 05 — Diagrama de actividades

## Descripción

Pasas del qué al cómo. Modelas el flujo de trabajo del proceso núcleo de tu dominio: en qué orden pasan las cosas, dónde se decide, qué ocurre en paralelo, quién hace cada paso y qué objetos cambian de estado por el camino.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Modelar un proceso con acciones bien nombradas, nodo inicial y los dos tipos de final
- Escribir decisiones con guardas entre corchetes, excluyentes y exhaustivas, y bucles
- Distinguir decisión de fork y cerrar cada uno con su pareja (fusión o join)
- Repartir las acciones en particiones, una por responsable
- Usar nodos de objeto con estado, señales y eventos, trazados hacia el diagrama de clases
- Depurar un diagrama de actividad roto, en sintaxis y en modelado

## Prerrequisitos

- Semana 04 completada (tu modelo pasa `./scripts/verificar-semana.sh 04`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Acciones, decisiones y finales](1-teoria/01-acciones-y-decisiones.md) | 15 min |
| — | Teoría | [Concurrencia y particiones](1-teoria/02-concurrencia-y-particiones.md) | 15 min |
| — | Teoría | [Objetos y señales](1-teoria/03-objetos-y-senales.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-acciones-y-decisiones](2-practicas/lab-01-acciones-y-decisiones/README.md) | 60 min |
| 2 | Lab | [lab-02-bucles-y-guardas](2-practicas/lab-02-bucles-y-guardas/README.md) | 60 min |
| 3 | Lab | [lab-03-fork-y-join](2-practicas/lab-03-fork-y-join/README.md) | 60 min |
| 4 | Lab | [lab-04-particiones](2-practicas/lab-04-particiones/README.md) | 60 min |
| 5 | Lab | [lab-05-objetos-y-senales](2-practicas/lab-05-objetos-y-senales/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-actividades-rotas](2-practicas/lab-06-depurar-actividades-rotas/README.md) | 60 min |
| — | Proyecto | [Actividad del proceso núcleo](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Acciones y decisiones
[60 min] lab-02 — Bucles y guardas
[60 min] lab-03 — Fork y join
[60 min] lab-04 — Particiones
[60 min] lab-05 — Objetos y señales
[60 min] lab-06 — Depurar actividades rotas
[3 h]    Proyecto: actividad del proceso núcleo
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 05
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 04 — Casos de uso](../week-04-casos_de_uso/README.md) | **Semana 05 — Diagrama de actividades** | [Semana 06 — Secuencia y comunicación](../week-06-secuencia_y_comunicacion/README.md) |

[← Volver al índice del bootcamp](../README.md)
