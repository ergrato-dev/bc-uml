# Lab 06 — Estilo común, include y exportación

⏱ Duración estimada: ~60 min

## Objetivo

Compartir un estilo entre diagramas con `!include`, añadir una leyenda, exportar a SVG y PNG y revisar cambios con `git diff`.

## Contexto

- En un equipo, cada diagrama repite las mismas líneas de estilo. Un archivo `.iuml` incluido con `!include` las centraliza.
- `-o carpeta` escribe la imagen en otra carpeta, **relativa a la carpeta del `.puml`**, no a donde ejecutas el comando.
- Como el diagrama es texto, `git diff` muestra exactamente qué cambió entre dos versiones.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-06-estilo-include-y-exportacion
   ```

1. Mira cómo depende el diagrama del estilo. Renombra temporalmente el estilo y renderiza:

   ```bash
   mv starter/estilo.iuml starter/estilo.bak
   plantuml -tsvg starter/biblioteca-v1.puml; echo $?
   ```

   Output:

   ```
   Error line 2 in file: starter/biblioteca-v1.puml
   Some diagram description contains errors
   200
   ```

   La línea 2 es `!include estilo.iuml`: el archivo no existe. La ruta del `!include` es relativa a la carpeta del `.puml`. Devuélvelo a su sitio:

   ```bash
   mv starter/estilo.bak starter/estilo.iuml
   plantuml -tsvg starter/biblioteca-v1.puml; echo $?
   ```

   Output: `0`.

2. **TODO 1** de `starter/estilo.iuml`: añade al final

   ```plantuml
   skinparam defaultFontName Monospaced
   ```

   Renderiza **los dos** diagramas sin tocarlos:

   ```bash
   plantuml -tsvg starter/biblioteca-v1.puml starter/biblioteca-v2.puml; echo $?
   ```

   Output: `0`. Abre ambos SVG: los nombres de las clases salen en fuente monoespaciada en los dos. Un cambio, dos diagramas actualizados.

3. **TODO 2** de `starter/biblioteca-v1.puml`: sustituye la línea del TODO por una leyenda que diga para qué sirve el diagrama:

   ```plantuml
   legend right
     Préstamos de la biblioteca: quién pide qué libro.
   endlegend
   ```

   ```bash
   plantuml -checkonly starter/biblioteca-v1.puml; echo $?
   ```

   Output: `0`. Renderiza y comprueba que la leyenda aparece en un recuadro a la derecha.

4. Exporta los dos diagramas a PNG en una carpeta `salida/` dentro del lab:

   ```bash
   plantuml -tpng -o ../salida starter/biblioteca-v1.puml starter/biblioteca-v2.puml; echo $?
   ls salida
   ```

   Output:

   ```
   0
   biblioteca-v1.png  biblioteca-v2.png
   ```

   `../salida` porque `-o` es relativo a `starter/`, donde están los `.puml`.

5. Compara las dos versiones como lo haría un revisor en un pull request:

   ```bash
   git diff --no-index starter/biblioteca-v1.puml starter/biblioteca-v2.puml
   ```

   Output (fragmento; las cabeceras `index` cambian):

   ```diff
   -title Biblioteca — préstamos
   +title Biblioteca — préstamos y autores
    
    class Member
    class Loan
    class Book
   +class Author
   +
   +Author -- Book : writes
   ```

   En una línea se ve qué cambió del modelo: se añadió `Author` y su asociación. Con dos PNG tendrías que comparar imágenes a ojo. (Además verás la leyenda que añadiste en el paso 3 como líneas `-` en la v1.)

6. Limpia las imágenes generadas (no se versionan) y sal:

   ```bash
   rm -r salida starter/*.svg
   exit
   ```

## Criterios de éxito

- [ ] Sin `starter/estilo.iuml`, el render falla en la línea del `!include`; con él, sale `0`
- [ ] Los dos diagramas usan la fuente del estilo sin haberlos editado
- [ ] `biblioteca-v1.puml` tiene leyenda y renderiza
- [ ] `salida/` contiene los dos PNG
- [ ] Sabes leer en `git diff` qué cambió en el modelo

## Reto extra

Prueba un tema integrado: añade `!theme plain` en `estilo.iuml`, renderiza y compara. ¿Qué pierdes y qué ganas frente al tema por defecto cuando el diagrama se imprime en blanco y negro?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Modelo conceptual](../lab-05-modelo-conceptual/README.md) | [Proyecto — Portada y modelo conceptual de tu dominio](../../3-proyecto/README.md) → |

[↑ Semana 01](../../README.md)
