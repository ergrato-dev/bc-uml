# Lab 02 — Agregación y composición

⏱ Duración estimada: ~60 min

## Objetivo

Decidir con la prueba del borrado qué asociaciones de una tienda son composición, cuáles agregación y cuáles se quedan como asociación simple.

## Contexto

- Composición `*--`: el rombo relleno va en el todo; la parte se borra con él y pertenece a un único todo. Agregación `o--`: rombo vacío; la parte sobrevive y se puede compartir. Ver [Asociaciones y multiplicidad](../../1-teoria/01-asociaciones-y-multiplicidad.md).
- En PlantUML el rombo se dibuja en el lado donde escribes el símbolo: `Order *-- OrderLine` lo pone en `Order`.
- La mayoría de las asociaciones de un modelo **no** son ni una cosa ni la otra.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-02-agregacion-y-composicion
   ```

1. Renderiza el starter y cuenta rombos:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   grep -v "^'" starter/tienda.puml | grep -cF '*--'
   ```

   Output: `0` y `0`. El `grep -v "^'"` descarta los comentarios, que también mencionan `*--`.

2. Crea `decisiones.md` en la carpeta del lab con una tabla:

   ```markdown
   | Relación | ¿Si borro el todo, la parte sigue teniendo sentido? | ¿La parte se comparte? | Decisión |
   |---|---|---|---|
   | Customer – Address | | | |
   ```

   Una fila por cada una de las 5 relaciones del starter. Rellénala antes de tocar el diagrama.

3. **TODO 1**: composiciones. Según tu tabla deberían salir dos:
   - `Order` – `OrderLine`: una línea de pedido fuera de su pedido no significa nada.
   - `Customer` – `Address`: las direcciones de un cliente se borran con su cuenta.

   Cambia `--` por `*--` en esas dos líneas. El `*` queda al lado del todo:

   ```plantuml
   Customer "1" *-- "1..3" Address
   ```

   Renderiza: rombo relleno en `Customer`.

4. **TODO 2**: agregación. Un catálogo de temporada agrupa productos, pero los productos existen sin él y están en varios catálogos. Cambia esa línea a `o--` con el `o` junto a `Catalog`.

5. **TODO 3**: multiplicidad del todo. `Order "0..*" *-- "1..*" OrderLine` diría que una línea pertenece a muchos pedidos, y eso contradice la composición. Cambia `"0..*"` por `"1"` en el extremo `Order`.

6. `Customer` – `Order` y `OrderLine` – `Product` se quedan como asociación. Escribe en `decisiones.md` por qué: un pedido cerrado se conserva aunque el cliente se dé de baja (contabilidad), y un producto no es parte de una línea, solo es referenciado por ella.

7. Comprueba:

   ```bash
   grep -v "^'" starter/tienda.puml | grep -cF '*--'
   grep -v "^'" starter/tienda.puml | grep -cF 'o--'
   ```

   Output: `2` y `1`.

8. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/tienda.puml; plantuml -checkonly starter/tienda.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] El SVG muestra 2 rombos rellenos (en `Customer` y en `Order`) y 1 vacío (en `Catalog`)
- [ ] Las dos composiciones tienen `"1"` en el extremo del todo
- [ ] `decisiones.md` tiene la tabla completa con la prueba del borrado para las 5 relaciones

## Reto extra

La tienda empieza a vender "packs": un `Bundle` agrupa varios `Product` que también se venden sueltos. Añade `Bundle` y decide entre `*--`, `o--` y `--`. Justifícalo en `decisiones.md`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Asociaciones y multiplicidad](../lab-01-asociaciones-y-multiplicidad/README.md) | [Lab 03 — Generalización y realización](../lab-03-generalizacion-y-realizacion/README.md) → |

[↑ Semana 03](../../README.md)
