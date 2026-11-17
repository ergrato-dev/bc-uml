# Lab 02 — Coherencia entre estados, objetos, paquetes y clases

⏱ Duración estimada: ~60 min

## Objetivo

Comprobar contra el diagrama de clases de una tienda su máquina de estados, su diagrama de objetos y su diagrama de paquetes, y corregir las cuatro incoherencias que aparecen.

## Contexto

- Reglas: [Coherencia entre vistas](../../1-teoria/01-coherencia-entre-vistas.md), tabla "El diagrama de clases es el centro".
- `starter/` tiene cuatro diagramas del pedido de una tienda: `clases.puml`, `estados-order.puml`, `objetos.puml` y `paquetes.puml`. Todos renderizan.
- Las reglas del lab: cada evento con paréntesis es una operación de `Order` (sin contar `when` y `after`); cada estado tiene su literal en `OrderStatus`; cada objeto es de una clase que existe; cada clase está en un paquete.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-02-coherencia-estados-objetos-y-paquetes
   ```

1. Renderiza los cuatro diagramas y ábrelos (`starter/*.svg`):

   ```bash
   plantuml -tsvg starter/*.puml; echo $?
   for f in starter/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
   ```

   Output (en orden alfabético: clases, estados, objetos, paquetes):

   ```
   0
   CLASS (6 entities)
   STATE (8 entities)
   CLASS (4 entities)
   CLASS (5 entities)
   ```

   Guarda las clases para compararlas en los pasos siguientes:

   ```bash
   grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/clases.puml | awk '{print $NF}' | sort -u > /tmp/clases
   ```

2. Los eventos contra las operaciones **de `Order`**, no de cualquier clase. El `awk` se queda con las líneas entre `class Order` y su `}`:

   ```bash
   awk '/^class Order /,/^}/' starter/clases.puml | grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u > /tmp/ops
   grep -oE -- '-->[^:]*:[[:space:]]*[a-z][A-Za-z0-9_]*[(]' starter/estados-order.puml | grep -oE '[a-z][A-Za-z0-9_]*[(]$' | tr -d '(' | grep -vxE 'when|after' | sort -u > /tmp/eventos
   comm -13 /tmp/ops /tmp/eventos
   ```

   Output:

   ```
   deliver
   ship
   ```

   `after(48 h)` no sale: es un evento de tiempo, lo dispara el reloj.

3. **TODO 1 — Operaciones que piden los estados.** Enviar y entregar un pedido son cosas que el sistema hace con `Order`. Añade a `Order`, debajo de `cancel`:

   ```plantuml
     + ship(carrier: String): void
     + deliver(): void
   ```

   Repite las tres líneas del paso 2: `(sin salida)`.

4. Los estados contra los literales de `OrderStatus`. El atributo `status: OrderStatus` guarda el estado, así que cada estado necesita su literal (`Placed` es `PLACED`):

   ```bash
   awk '/^enum OrderStatus/,/^}/' starter/clases.puml | grep -oE '^[[:space:]]+[A-Z_]+$' | tr -d ' ' | sort -u > /tmp/literales
   grep -oE '[A-Z][a-z][A-Za-z]*' starter/estados-order.puml | grep -vE '^(Tienda|Order)$' | tr '[:lower:]' '[:upper:]' | sort -u > /tmp/estados
   comm -3 /tmp/literales /tmp/estados
   ```

   Output (con un tabulador delante: solo están en los estados):

   ```
   	CANCELLED
   	DELIVERED
   ```

   El segundo `grep` quita las dos palabras del `title` que empiezan por mayúscula.

5. **TODO 2 — Literales que faltan.** Añade `DELIVERED` y `CANCELLED` a `OrderStatus`, debajo de `SHIPPED`. Repite el paso 4: `(sin salida)`.

6. Los objetos contra las clases:

   ```bash
   grep -hE '^object' starter/objetos.puml | grep -oE ':[[:space:]]*[A-Z][A-Za-z0-9_]*' | grep -oE '[A-Z][A-Za-z0-9_]*' | sort -u | comm -23 - /tmp/clases
   ```

   Output:

   ```
   Client
   ```

7. **TODO 3 — Un nombre que no existe.** En la tienda, quien compra es `Customer`; `Client` es un despiste del diagrama de objetos. Cambia `ana : Client` por `ana : Customer` y repite el paso 6: `(sin salida)`.

8. Las clases contra los paquetes. Ahora el orden es el contrario: lo que está en `clases.puml` y en ningún paquete:

   ```bash
   grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/paquetes.puml | awk '{print $NF}' | sort -u | comm -23 /tmp/clases -
   ```

   Output:

   ```
   Payment
   ```

9. **TODO 4 — Una clase sin paquete.** Los pagos son un tema propio de la tienda. Crea su paquete antes de las dependencias y haz que `orders` dependa de él:

   ```plantuml
   package payments {
     class Payment
   }

   orders ..> payments
   ```

   Repite el paso 8: `(sin salida)`.

10. Comprueba que todo renderiza:

    ```bash
    plantuml -checkonly starter/*.puml; echo $?
    for f in starter/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
    ```

    Output:

    ```
    0
    CLASS (6 entities)
    STATE (8 entities)
    CLASS (4 entities)
    CLASS (6 entities)
    ```

    Las clases siguen en 6: los literales del enum no son entidades. Los paquetes pasan de 5 a 6 por `Payment`. Abre `starter/paquetes.svg`: tres flechas discontinuas salen de `orders`.

11. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
    - En los TODO 1 y 2 cambiaste el diagrama de clases; en el TODO 3, el de objetos. ¿Por qué no al revés?
    - ¿Por qué `after(48 h)` no tiene que ser una operación de `Order`?
    - `Order` tiene `pay(payment)` y la máquina de estados también. ¿Qué comando del lab detectaría que alguien la renombra a `charge` solo en una de las dos vistas?

## Criterios de éxito

- [ ] `plantuml -checkonly starter/*.puml` sale con `0`
- [ ] Los `comm` de los pasos 2, 4, 6 y 8 no imprimen nada
- [ ] `Order` tiene `ship` y `deliver`, y `OrderStatus` tiene 6 literales
- [ ] `paquetes.puml` tiene `(6 entities)` y `orders` depende de `payments`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

El diagrama de objetos pone `status = PAID`. Escribe un comando que compruebe que cada valor que toma `status` en `objetos.puml` es un literal de `OrderStatus`, y pruébalo cambiando el valor a `PAYED`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Coherencia entre clases y secuencia](../lab-01-coherencia-clases-y-secuencia/README.md) | [Lab 03 — Matriz de trazabilidad](../lab-03-matriz-de-trazabilidad/README.md) → |

[↑ Semana 10](../../README.md)
