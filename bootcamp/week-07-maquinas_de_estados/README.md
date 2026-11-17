# Semana 07 — Máquinas de estados

## Descripción

Pasas de la colaboración entre objetos a la vida de uno solo. Modelas el ciclo de vida de la entidad principal de tu dominio: en qué estados puede estar, qué eventos la hacen cambiar y qué hace al entrar, al salir y mientras está en cada estado. Por el camino, los estados se alinean con su enumeración y los eventos con sus operaciones.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Decidir qué clases de un dominio necesitan una máquina de estados
- Escribir transiciones con la etiqueta `evento [guarda] / acción` en el orden UML
- Distinguir eventos de llamada, de señal, de cambio (`when`) y de tiempo (`after`)
- Usar `entry`, `exit` y `do`, y elegir entre transición interna y autotransición
- Agrupar estados en un compuesto y recordar el subestado con historia `[H]` y `[H*]`
- Usar el pseudoestado choice y las regiones concurrentes
- Trazar los estados hacia una enumeración y los eventos hacia operaciones de `02-clases.puml`
- Depurar una máquina de estados rota, en sintaxis y en modelado

## Prerrequisitos

- Semana 06 completada (tu modelo pasa `./scripts/verificar-semana.sh 06`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Estados y transiciones](1-teoria/01-estados-y-transiciones.md) | 15 min |
| — | Teoría | [Actividades internas](1-teoria/02-actividades-internas.md) | 15 min |
| — | Teoría | [Estados compuestos e historia](1-teoria/03-compuestos-e-historia.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-estados-y-transiciones](2-practicas/lab-01-estados-y-transiciones/README.md) | 60 min |
| 2 | Lab | [lab-02-guardas-acciones-y-choice](2-practicas/lab-02-guardas-acciones-y-choice/README.md) | 60 min |
| 3 | Lab | [lab-03-actividades-internas](2-practicas/lab-03-actividades-internas/README.md) | 60 min |
| 4 | Lab | [lab-04-estados-compuestos-e-historia](2-practicas/lab-04-estados-compuestos-e-historia/README.md) | 60 min |
| 5 | Lab | [lab-05-de-la-clase-a-la-maquina](2-practicas/lab-05-de-la-clase-a-la-maquina/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-maquinas-rotas](2-practicas/lab-06-depurar-maquinas-rotas/README.md) | 60 min |
| — | Proyecto | [Máquina de estados de una entidad](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Estados y transiciones
[60 min] lab-02 — Guardas, acciones y choice
[60 min] lab-03 — Actividades internas
[60 min] lab-04 — Estados compuestos e historia
[60 min] lab-05 — De la clase a la máquina
[60 min] lab-06 — Depurar máquinas rotas
[3 h]    Proyecto: máquina de estados de una entidad
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 07
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 06 — Secuencia y comunicación](../week-06-secuencia_y_comunicacion/README.md) | **Semana 07 — Máquinas de estados** | [Semana 08](../week-08-componentes_paquetes_y_despliegue/README.md) |

[← Volver al índice del bootcamp](../README.md)
