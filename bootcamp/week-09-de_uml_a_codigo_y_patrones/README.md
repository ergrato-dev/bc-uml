# Semana 09 — De UML a código y patrones

## Descripción

Compruebas que tu modelo se puede programar: traduces el diagrama de clases a un esqueleto en tu lenguaje y lees código ajeno para reconstruir su diagrama. Después aplicas a tu dominio uno de cuatro patrones GoF (Strategy, Observer, Factory Method o Adapter), con sus roles marcados en UML y su código.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Traducir clases, atributos, operaciones, enumeraciones e interfaces a código en tu lenguaje
- Convertir navegabilidad, multiplicidad, composición y dependencia en campos, colecciones y parámetros
- Reconstruir un diagrama de clases a partir de código y decidir qué no pasa al diagrama
- Comprobar desde la terminal que el código y el diagrama tienen las mismas clases, miembros y herencias
- Modelar Strategy, Observer, Factory Method y Adapter con sus roles como estereotipos
- Reconocer en tu modelo el problema que resuelve un patrón, y cuándo no hace falta ninguno
- Depurar un patrón roto en sintaxis, en roles y relaciones, y en su correspondencia con el código

## Prerrequisitos

- Semana 08 completada (tu modelo pasa `./scripts/verificar-semana.sh 08`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))
- Un lenguaje orientado a objetos instalado en tu equipo para compilar el código (opcional: el contenedor no lo necesita)

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Del diagrama al código](1-teoria/01-del-diagrama-al-codigo.md) | 15 min |
| — | Teoría | [Del código al diagrama](1-teoria/02-del-codigo-al-diagrama.md) | 15 min |
| — | Teoría | [Patrones GoF en UML](1-teoria/03-patrones-gof-en-uml.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-del-diagrama-al-codigo](2-practicas/lab-01-del-diagrama-al-codigo/README.md) | 60 min |
| 2 | Lab | [lab-02-del-codigo-al-diagrama](2-practicas/lab-02-del-codigo-al-diagrama/README.md) | 60 min |
| 3 | Lab | [lab-03-strategy](2-practicas/lab-03-strategy/README.md) | 60 min |
| 4 | Lab | [lab-04-observer](2-practicas/lab-04-observer/README.md) | 60 min |
| 5 | Lab | [lab-05-adapter-y-factory-method](2-practicas/lab-05-adapter-y-factory-method/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-patrones-rotos](2-practicas/lab-06-depurar-patrones-rotos/README.md) | 60 min |
| — | Proyecto | [De UML a código y patrones](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Del diagrama al código
[60 min] lab-02 — Del código al diagrama
[60 min] lab-03 — Strategy
[60 min] lab-04 — Observer
[60 min] lab-05 — Adapter y Factory Method
[60 min] lab-06 — Depurar patrones rotos
[3 h]    Proyecto: de UML a código y patrones
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 09
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 08 — Componentes, paquetes y despliegue](../week-08-componentes_paquetes_y_despliegue/README.md) | **Semana 09 — De UML a código y patrones** | [Semana 10 — Proyecto integrador](../week-10-proyecto_integrador/README.md) |

[← Volver al índice del bootcamp](../README.md)
