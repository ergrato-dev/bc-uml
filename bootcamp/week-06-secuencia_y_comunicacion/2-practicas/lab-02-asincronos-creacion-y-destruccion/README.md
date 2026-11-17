# Lab 02 — Asíncronos, creación y destrucción

⏱ Duración estimada: ~60 min

## Objetivo

Completar la secuencia de "hacer un pedido" con un mensaje a sí mismo, la creación del pedido, un aviso asíncrono por correo y la destrucción del carrito.

## Contexto

- Sintaxis y reglas: [Lifelines y mensajes](../../1-teoria/01-lifelines-y-mensajes.md), tabla de mensajes.
- `starter/pedido.puml` renderiza con el inicio del escenario: el cliente confirma y el servicio pide al carrito sus productos.
- Escenario: el servicio calcula el envío, crea el pedido, manda la confirmación por correo sin esperar a que llegue y el carrito deja de existir.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-02-asincronos-creacion-y-destruccion
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/pedido.puml; echo $?
   plantuml -syntax < starter/pedido.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (4 participants)
   ```

   Abre `starter/pedido.svg`: cuatro mensajes síncronos, una respuesta del carrito y dos respuestas que vuelven al cliente.

2. **TODO 1 — Lifelines nuevas.** Debajo de `participant ":Cart" as cart`:

   ```plantuml
   participant ":Order" as order
   boundary ":MailGateway" as mail
   ```

   La pasarela de correo es boundary: es la frontera con un sistema externo, no una clase del dominio.

3. **TODO 2 — Mensaje a sí mismo.** El envío lo calcula el propio servicio con los productos que recibió:

   ```plantuml
   svc -> svc : shippingCost(items)
   ```

   En el SVG, la flecha sale de `:OrderService` y vuelve a él. Úsalo solo cuando el cálculo importa para entender el escenario: no dibujes cada método privado.

4. **TODO 3 — Creación.** El pedido no existe al empezar el escenario: nace aquí.

   ```plantuml
   create order
   svc -->> order : <<create>> Order(items, shippingCost)
   ```

   - `create order` hace que la caja de `:Order` baje hasta este mensaje.
   - `-->>` es línea discontinua con punta abierta: la flecha UML de creación.

   Renderiza y abre el SVG: `:Order` aparece a la altura del mensaje `«create»`, no arriba con los demás. Borra temporalmente la línea `create order`, renderiza otra vez y compara: la caja sube arriba como si el pedido hubiera existido siempre. Vuelve a escribirla.

5. **TODO 4 — Asíncrono.** El servicio no espera a que el correo se entregue:

   ```plantuml
   svc ->> mail : sendConfirmation(orderId, email)
   ```

   `->>` es línea continua con punta abierta. No lleva respuesta: si esperaras la respuesta, sería síncrono.

6. **TODO 5 — Destrucción.** Con el pedido creado, el carrito ya no hace falta:

   ```plantuml
   destroy cart
   ```

   En el SVG, una X roja cierra la lifeline de `:Cart`. Borra los comentarios de los TODO.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/pedido.puml; echo $?
   plantuml -syntax < starter/pedido.puml
   grep -cE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*->>[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:' starter/pedido.puml
   grep -cE -- '-->>[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:[[:space:]]*<<create>>' starter/pedido.puml
   grep -cE '^[[:space:]]*(create|destroy)[[:space:]]' starter/pedido.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (6 participants)
   1
   1
   2
   ```

   6 lifelines, 1 mensaje asíncrono, 1 mensaje de creación y las líneas `create` y `destroy`.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué el aviso por correo es asíncrono y `items()` no?
   - ¿Qué dice el diagrama si quitas `create order`? ¿Es verdad en este negocio?
   - Si el carrito se destruye, ¿qué relación entre `Cart` y `Order` esperas en el diagrama de clases: el pedido guarda los productos o apunta al carrito?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` cuenta `(6 participants)`
- [ ] `:Order` aparece a la altura de su mensaje `«create»`, con flecha discontinua y punta abierta
- [ ] Un mensaje asíncrono sin respuesta y un mensaje a sí mismo
- [ ] La lifeline de `:Cart` termina en una X
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

El almacén tiene que reservar el stock, y el servicio no espera: envía `reserveStock(orderId)` a un boundary `:WarehouseQueue`. Añádelo. ¿Cambia algo el orden respecto al correo? ¿Podría ir antes de crear el pedido?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Lifelines y mensajes](../lab-01-lifelines-y-mensajes/README.md) | [Lab 03 — Fragmentos alt y opt](../lab-03-fragmentos-alt-y-opt/README.md) → |

[↑ Semana 06](../../README.md)
