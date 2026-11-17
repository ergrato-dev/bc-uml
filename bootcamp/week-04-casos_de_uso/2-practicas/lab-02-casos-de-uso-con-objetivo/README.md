# Lab 02 — Casos de uso con nivel de objetivo

⏱ Duración estimada: ~60 min

## Objetivo

Reescribir los casos de uso de una tienda para que cada uno sea un objetivo completo del actor, ni demasiado grande ni un simple paso.

## Contexto

- Prueba del nivel: "cuando termina, ¿el actor se va con algo que quería?". Ver [Actores y casos de uso](../../1-teoria/01-actores-y-casos-de-uso.md).
- Nombre: verbo en infinitivo + objeto, en inglés.
- Alias `CU01`, `CU02`...: el bootcamp los usa para enlazar cada óvalo con su especificación.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-02-casos-de-uso-con-objetivo
   ```

1. Renderiza el starter y cuenta los casos con alias `CUNN`:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   grep -cE '^[[:space:]]*usecase[[:space:]]+"[^"]+"[[:space:]]+as[[:space:]]+CU[0-9][0-9]' starter/tienda.puml
   ```

   Output: `0` y `0`. Los óvalos usan alias `A`...`H`.

2. **TODO 1**: crea `nivel.md` con una fila por óvalo del starter:

   ```markdown
   | Óvalo | Nivel | Por qué |
   |---|---|---|
   | Manage store | Demasiado grande | Agrupa actualizar el catálogo, revisar ventas, gestionar devoluciones... |
   ```

   Pistas: `Log in` y `Click buy button` son pasos; `Enter card number` es un detalle de interfaz; `Save order in database` es lo que hace el sistema por dentro, no un objetivo de nadie; `Product CRUD` describe operaciones de datos, no de negocio. Solo dos óvalos están ya en el nivel correcto.

3. **TODO 2**: sustituye los ocho `usecase` por los seis de nivel de objetivo:

   ```plantuml
   usecase "Search product" as CU01
   usecase "Place order" as CU02
   usecase "Track order" as CU03
   usecase "Return product" as CU04
   usecase "Update catalog" as CU05
   usecase "Review sales" as CU06
   ```

   `Place order` absorbe `Click buy button` y `Enter card number`: serán pasos de su especificación. `Update catalog` sustituye a `Product CRUD`.

4. **TODO 3**: borra todas las asociaciones y escribe las nuevas: `Customer` con `CU01`–`CU04` y `StoreManager` con `CU05` y `CU06`. Renderiza y comprueba que ningún óvalo queda sin actor.

5. Comprueba:

   ```bash
   grep -cE '^[[:space:]]*usecase[[:space:]]+"[^"]+"[[:space:]]+as[[:space:]]+CU[0-9][0-9]' starter/tienda.puml
   plantuml -syntax < starter/tienda.puml
   ```

   Output:

   ```
   6
   DESCRIPTION
   (8 entities)
   ```

6. Añade a `nivel.md` dónde fue a parar cada óvalo eliminado (`Log in` → paso de `Place order`, etc.).

7. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/tienda.puml; plantuml -checkonly starter/tienda.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] 6 casos de uso con alias `CU01`–`CU06` (`6` en el paso 5) y `(8 entities)`
- [ ] Todos con verbo + objeto y con al menos un actor
- [ ] `nivel.md` clasifica los 8 óvalos originales y dice dónde quedó cada uno

## Reto extra

El encargado pide un caso `Generate monthly report`. ¿Es un objetivo distinto de `Review sales` o el mismo? Decide, modela y justifícalo en `nivel.md`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Actores y límite del sistema](../lab-01-actores-y-limite-del-sistema/README.md) | [Lab 03 — Include y extend](../lab-03-include-y-extend/README.md) → |

[↑ Semana 04](../../README.md)
