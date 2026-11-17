# Lab 03 — Include y extend

⏱ Duración estimada: ~60 min

## Objetivo

Usar `<<include>>` para un paso obligatorio compartido y `<<extend>>` para un comportamiento opcional con punto de extensión y condición.

## Contexto

- Include: el base **siempre** lo ejecuta; la flecha sale del base. Extend: **a veces**, según una condición; la flecha sale de la extensión. Ver [Include, extend y generalización](../../1-teoria/02-include-extend-y-generalizacion.md).
- Los dos se dibujan con `..>` y su estereotipo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-03-include-y-extend
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/cine.puml; echo $?
   ```

   Output: `0`. `Select screening`, `Choose premium seat` y `Redeem gift card` están sueltos dentro del sistema.

2. **TODO 1**: comprar y reservar empiezan siempre eligiendo la función. Al final del archivo:

   ```plantuml
   CU01 ..> CU03 : <<include>>
   CU02 ..> CU03 : <<include>>
   ```

   Renderiza: dos flechas discontinuas que llegan a `Select screening` con `«include»`.

3. **TODO 2**: el punto de extensión. Cambia la declaración de `CU01`:

   ```plantuml
   usecase "Buy ticket\n--\nextension points:\nseat selection" as CU01
   ```

   `\n` es un salto de línea y `--` dibuja la línea que separa el nombre del compartimento. Renderiza: el óvalo de `Buy ticket` tiene dos partes.

4. **TODO 3**: la extensión, con su nota:

   ```plantuml
   CU04 ..> CU01 : <<extend>>

   note right of CU04
     condition: customer is a member
     extension point: seat selection
   end note
   ```

   La flecha va **de** `Choose premium seat` **a** `Buy ticket`: comprar funciona sin butaca premium y no sabe que la extensión existe.

5. **TODO 4**: `Redeem gift card`. No todos los clientes tienen tarjeta regalo, y comprar funciona sin ella. Dibuja la relación que corresponda y escribe en `decisiones.md` por qué es esa y no la otra. Incluye en `decisiones.md` también por qué `Select screening` es include.

6. Comprueba:

   ```bash
   grep -c '<<include>>' starter/cine.puml; grep -c '<<extend>>' starter/cine.puml
   plantuml -syntax < starter/cine.puml
   ```

   Output:

   ```
   2
   2
   DESCRIPTION
   (8 entities)
   ```

   Son 8 entidades: 2 actores, 5 casos de uso y la nota.

7. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/cine.puml; plantuml -checkonly starter/cine.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] Dos `<<include>>` hacia `Select screening` y dos `<<extend>>` hacia `Buy ticket`
- [ ] `Buy ticket` muestra el compartimento `extension points` y la nota dice condición y punto
- [ ] Todas las flechas de include y extend son discontinuas
- [ ] `decisiones.md` justifica `Select screening` y `Redeem gift card`

## Reto extra

El cine quiere que todo pago pase por un control antifraude de la pasarela. ¿Include, extend o un paso dentro de la especificación de `Buy ticket`? Aplica la regla "incluye solo lo que se repite en dos casos o más".

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Casos de uso con nivel de objetivo](../lab-02-casos-de-uso-con-objetivo/README.md) | [Lab 04 — Generalización de actores y casos de uso](../lab-04-generalizacion-de-actores-y-casos/README.md) → |

[↑ Semana 04](../../README.md)
