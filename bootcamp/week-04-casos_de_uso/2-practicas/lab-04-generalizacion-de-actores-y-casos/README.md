# Lab 04 — Generalización de actores y casos de uso

⏱ Duración estimada: ~60 min

## Objetivo

Simplificar un diagrama de pagos con generalización de actores y de casos de uso, y decidir cuándo una variante merece óvalo propio.

## Contexto

- Actor hijo: hace todo lo del padre y algo más. Caso hijo: variante del padre con el mismo objetivo. Ver [Include, extend y generalización](../../1-teoria/02-include-extend-y-generalizacion.md).
- Se dibuja igual que entre clases: `Customer <|-- Member`.
- Si dos variantes solo difieren en un detalle, sobra el óvalo: es un flujo alternativo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-04-generalizacion-de-actores-y-casos
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/pagos.puml; echo $?; plantuml -syntax < starter/pagos.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (10 entities)
   ```

   Observa en el SVG que `Member` repite las asociaciones de `Customer`.

2. **TODO 1**: generalización de actores. Añade:

   ```plantuml
   Customer <|-- Member
   ```

   Borra `Member -- CU01` y `Member -- CU02`: `Member` los hereda. Deja `Member -- CU04`, que es solo suyo.

3. **TODO 2**: generalización de casos:

   ```plantuml
   CU02 <|-- CU03
   CU02 <|-- CU04
   ```

   Renderiza: `Pay by card` y `Pay with points` cuelgan de `Pay order` con triángulo hueco.

4. **TODO 3**: borra `CU05` y `CU06`. Pagar en euros o en dólares tiene el mismo objetivo y los mismos pasos salvo la moneda. Escribe en `variantes.md` cómo lo pondrías como flujo alternativo de `Pay by card`, con el formato `3a. ...` de la teoría.

5. **TODO 4**: añade `actor Clock` y asócialo con `CU07`. Nadie pide cancelar los pedidos sin pagar: lo dispara el tiempo.

6. Comprueba:

   ```bash
   grep -cF '<|--' starter/pagos.puml
   plantuml -syntax < starter/pagos.puml
   ```

   Output:

   ```
   3
   DESCRIPTION
   (9 entities)
   ```

7. Responde en `variantes.md`: ¿por qué `Pay with points` sí merece óvalo propio y pagar en dólares no? Pista: ¿quién puede hacerlo y con qué actores habla?

8. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/pagos.puml; plantuml -checkonly starter/pagos.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] `Member` hereda de `Customer` y solo conserva su asociación con `Pay with points`
- [ ] `Pay by card` y `Pay with points` especializan `Pay order` (`3` generalizaciones en total)
- [ ] `CU05` y `CU06` eliminados y descritos como flujo alternativo en `variantes.md`
- [ ] `Clock` asociado a `Cancel unpaid orders`; `(9 entities)`

## Reto extra

Un empleado de la tienda (`Employee`) puede comprar con descuento. ¿Es hijo de `Customer`, de `Member` o un actor aparte? Modélalo y justifícalo en `variantes.md`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Include y extend](../lab-03-include-y-extend/README.md) | [Lab 05 — Especificación textual](../lab-05-especificacion-textual/README.md) → |

[↑ Semana 04](../../README.md)
