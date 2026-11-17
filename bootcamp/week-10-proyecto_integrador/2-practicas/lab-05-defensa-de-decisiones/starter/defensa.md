# Defensa del modelo — tienda online

## Guion (10 minutos)

<!-- TODO 5: cinco paradas, cada una con un enlace y sus minutos entre paréntesis. -->

## Decisiones

### 1. Las líneas son composición del pedido

- **Diagrama:** [clases](clases.puml)
- **Decisión:** `Order *-- OrderLine`: las líneas se crean dentro del pedido y desaparecen con él.
- **Alternativa:** una agregación `Order o-- OrderLine`, o una asociación simple.
- **Por qué:** una línea sin pedido no significa nada en la tienda: no se puede comprar, facturar ni devolver suelta.

<!-- TODO 1 a 4: cuatro decisiones más, con las mismas cuatro líneas. -->

## Preguntas que espero

<!-- TODO 6: dos preguntas difíciles y tu respuesta corta. -->
