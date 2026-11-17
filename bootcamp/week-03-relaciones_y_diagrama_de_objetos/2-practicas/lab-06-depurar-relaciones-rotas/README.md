# Lab 06 — Depurar relaciones rotas

⏱ Duración estimada: ~60 min

## Objetivo

Reparar un diagrama de clases que no renderiza y, una vez que renderiza, corregir sus errores de modelado en las relaciones.

## Contexto

- `starter/cine.puml` tiene **2 errores de sintaxis** y al menos **8 errores de modelado** en las relaciones. Las clases y sus miembros están bien: no los toques.
- `plantuml -syntax` cuenta las líneas desde 0; `plantuml -tsvg` las cuenta desde 1.
- Usa la tabla "Qué relación elegir" de [Generalización, realización y dependencia](../../1-teoria/02-generalizacion-realizacion-y-dependencia.md).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-06-depurar-relaciones-rotas
   ```

1. Renderiza:

   ```bash
   plantuml -tsvg starter/cine.puml; echo $?
   ```

   Output:

   ```
   Error line 59 in file: starter/cine.puml
   Some diagram description contains errors
   200
   ```

   Abre el archivo en la línea 59: `Room "1" -> "1 Movie`. Falta cerrar las comillas de la multiplicidad. Ciérralas (`"1" Movie`) y vuelve a renderizar.

2. Segundo error:

   ```
   Error line 62 in file: starter/cine.puml
   Some diagram description contains errors
   200
   ```

   La línea 62 termina con una comilla suelta. Bórrala y renderiza otra vez:

   ```bash
   plantuml -tsvg starter/cine.puml; echo $?
   ```

   Output: `0`. Ya renderiza. Ahora empieza lo importante: abre `starter/cine.svg`.

3. Crea `revision.md` en la carpeta del lab con esta tabla, y añade una fila por cada error de modelado que encuentres:

   ```markdown
   | Línea | Error | Regla que rompe | Corrección |
   |---|---|---|---|
   ```

4. Revisa las líneas de relación una por una con estas preguntas:
   - **Generalización**: ¿el triángulo apunta a la clase más general? ¿"X es un Y" es verdad?
   - **Interfaz**: ¿se realiza con `<|..` y no con `<|--`? ¿Hay asociaciones hacia una interfaz que la clase ya realiza?
   - **Composición**: ¿pasa la prueba del borrado? Si borras un cliente, ¿deben desaparecer sus ventas?
   - **Multiplicidad**: ¿está en los dos extremos? Léela en voz alta en las dos direcciones: ¿una función vende una sola entrada?
   - **Redundancia**: ¿hay dos líneas que dicen lo mismo, o una línea que ya se deduce de otras (sala → película, cuando la película se proyecta en una función que está en una sala)?

5. Corrige `starter/cine.puml`. Al terminar deben quedar **8 relaciones**: 1 composición sala, 2 asociaciones de la función, 1 generalización, 1 realización, 1 composición venta–entradas, 1 asociación entrada–función y 1 asociación cliente–venta.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/cine.puml; echo $?
   plantuml -syntax < starter/cine.puml
   grep -cE '(--|[.][.])' starter/cine.puml
   ```

   Output:

   ```
   0
   CLASS
   (9 entities)
   8
   ```

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] Quedan 8 relaciones (`8` en el paso 6), todas las asociaciones con multiplicidad en los dos extremos
- [ ] `revision.md` tiene al menos 8 errores de modelado, cada uno con la regla que rompe
- [ ] Ninguna clase ni miembro cambió

## Reto extra

Busca un diagrama de clases publicado en un tutorial o en la documentación de un proyecto de código abierto y aplícale las preguntas del paso 4. Anota en `revision.md` lo que encuentres.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Diagrama de objetos](../lab-05-diagrama-de-objetos/README.md) | [Proyecto — Relaciones y objetos de tu dominio](../../3-proyecto/README.md) → |

[↑ Semana 03](../../README.md)
