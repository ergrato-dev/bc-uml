# Lab 01 — Laboratorio PlantUML

⏱ Duración estimada: ~60 min

## Objetivo

Construir el laboratorio Docker y renderizar tu primer diagrama con PlantUML.

## Contexto

- Todo el bootcamp corre en el contenedor `uml`, con PlantUML 1.2026.9: así tu resultado es igual al del autograding.
- El repositorio está montado dentro del contenedor: lo que generas ahí aparece en tu equipo.
- Repasa [PlantUML en el laboratorio](../../1-teoria/03-plantuml-en-el-laboratorio.md) si un comando no te suena.

## Paso a paso

0. Desde la raíz del repositorio (la carpeta `bc-uml` que clonaste), construye la imagen. La primera vez tarda unos minutos:

   ```bash
   docker compose build
   ```

   Output (las últimas líneas; el resto varía):

   ```
    Image bc-uml-lab:1.2026.9 Built
   ```

   Si falla con `permission denied` sobre el socket de Docker, tu usuario no está en el grupo `docker`: revisa [setup del entorno](../../../../docs/setup-entorno.md).

1. Comprueba la versión sin abrir un shell:

   ```bash
   docker compose run --rm uml plantuml -version
   ```

   Output (las tres primeras líneas):

   ```
   PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
   Build Version: 1.2026.9
   ```

   Más abajo aparece `GraphViz: dot - graphviz version 2.43.0 (0)`: Graphviz dibuja los diagramas de clases.

2. Abre un shell dentro del contenedor y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   ```

   El prompt cambia a algo como `ubuntu@3f2a9c1d7e44:/bc-uml$` (el número cambia en cada ejecución). Ya estás dentro. Ahora:

   ```bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-01-laboratorio-plantuml
   ```

   Todos los comandos siguientes van en este shell. Para salir al final: `exit`.

3. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/hola.puml; echo $?
   ```

   Output:

   ```
   0
   ```

   ```bash
   ls starter
   ```

   Output:

   ```
   hola.puml  hola.svg
   ```

   En tu equipo, abre `bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-01-laboratorio-plantuml/starter/hola.svg` en el navegador: tres cajas (`Member`, `Loan`, `Book`) unidas por dos líneas con los nombres `requests` y `lends`.

4. Pregunta a PlantUML qué ve en el archivo:

   ```bash
   plantuml -syntax < starter/hola.puml
   ```

   Output:

   ```
   CLASS
   (3 entities)
   ```

   `CLASS`: dedujo que es un diagrama de clases. `3 entities`: tres clases.

5. **TODO 1** de `starter/hola.puml`: declara la clase `Author` y asóciala con `Book`. Edita el archivo en tu equipo (con el editor que quieras) y escribe, antes de `@enduml`:

   ```plantuml
   class Author
   Author -- Book : writes
   ```

   Borra las dos líneas de comentario del TODO. Comprueba en el shell del contenedor:

   ```bash
   plantuml -syntax < starter/hola.puml
   ```

   Output:

   ```
   CLASS
   (4 entities)
   ```

6. Valida sin generar imagen y vuelve a renderizar:

   ```bash
   plantuml -checkonly starter/hola.puml; echo $?
   plantuml -tsvg starter/hola.puml
   ```

   Output del primero: `0`. El segundo no imprime nada `(sin salida)`. Recarga `hola.svg` en el navegador: aparece `Author` unido a `Book` con `writes`.

7. Sal del contenedor:

   ```bash
   exit
   ```

   `hola.svg` sigue en tu equipo: no se versiona (`.gitignore`), el `.puml` es la fuente.

## Criterios de éxito

- [ ] `docker compose run --rm uml plantuml -version` imprime `PlantUML version 1.2026.9`
- [ ] `plantuml -syntax < starter/hola.puml` imprime `CLASS` y `(4 entities)`
- [ ] `plantuml -checkonly starter/hola.puml; echo $?` imprime `0`
- [ ] `hola.svg` muestra 4 clases y 3 asociaciones con nombre

## Reto extra

Genera también un PNG (`plantuml -tpng starter/hola.puml`) y compara tamaños con `ls -l starter`. ¿Por qué el SVG se ve nítido con cualquier zoom y el PNG no?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Depurar diagramas rotos](../lab-02-depurar-diagramas-rotos/README.md) → |

[↑ Semana 01](../../README.md)
