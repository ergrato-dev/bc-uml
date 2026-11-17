# Glosario — Semana 10

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Vista | Cada diagrama del modelo, que muestra el mismo sistema desde un ángulo | Clases (estructura), secuencia (tiempo), estados (ciclo de vida) |
| Coherencia entre vistas | Ninguna vista contradice a otra: lo que una nombra, existe en la que lo define | El mensaje `markLoaned()` es una operación de `Book` |
| Incoherencia | Dos vistas que dicen cosas incompatibles del mismo elemento | La secuencia llama a `reserve()` y `Book` no la tiene |
| Evento de llamada | Evento de una máquina de estados que corresponde a una operación de la clase | `Placed --> Paid : pay(payment)` |
| Evento de tiempo | Evento que dispara el reloj, no una llamada; no es una operación | `after(48 h)`, `when(today > dueDate)` |
| Trazabilidad | Poder seguir cada requisito hasta las piezas del modelo que lo cumplen, y al revés | CU-02 lleva a `Ticket`, `Payment` y la secuencia de compra |
| Matriz de trazabilidad | Tabla con una fila por caso de uso, sus clases y sus diagramas | Fila CU-02: Buy ticket; `Ticket`, `Payment`; enlace a la secuencia |
| Trazabilidad hacia delante | Del caso de uso a las clases y diagramas que lo cumplen | ¿Qué clases necesita "Place order"? |
| Trazabilidad hacia atrás | De la clase al caso de uso que la justifica | ¿Qué caso de uso usa `Wishlist`? |
| Clase huérfana | Clase del modelo que no aparece en ninguna fila de la matriz | `LoyaltyCard` sin programa de puntos |
| Hueco de trazabilidad | Caso de uso que solo aparece en uno o dos diagramas, declarado bajo la matriz | "Refund ticket no tiene secuencia" |
| Revisión por pares | Revisión del modelo por otra persona, que registra hallazgos | Un compañero de otro dominio revisa tu `02-clases.puml` |
| Hallazgo | Lo que ve el revisor, escrito como problema y no como solución | "`LibrarySystem` tiene 11 operaciones" |
| Resolución | Respuesta del autor a un hallazgo: Corregido, Se mantiene o Pendiente justificado | "Se mantiene: el precio de la entrada no cambia tras venderla" |
| Decisión de modelado | Elección entre dos formas razonables de modelar algo, con su motivo del dominio | `Ticket` como clase asociación en lugar de un atributo de `Screening` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | — |

[↑ Semana 10](../README.md)
