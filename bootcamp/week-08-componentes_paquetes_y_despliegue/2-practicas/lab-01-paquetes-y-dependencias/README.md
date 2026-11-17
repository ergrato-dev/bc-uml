# Lab 01 — Paquetes y dependencias

⏱ Duración estimada: ~60 min

## Objetivo

Agrupar las clases de una biblioteca en paquetes, derivar sus dependencias de las asociaciones del diagrama de clases y romper el ciclo que aparece.

## Contexto

- Sintaxis y reglas: [Paquetes y dependencias](../../1-teoria/01-paquetes-y-dependencias.md).
- `starter/paquetes.puml` renderiza, pero tiene las siete clases sueltas. En un comentario arriba tienes las asociaciones navegables del diagrama de clases: de ahí salen las dependencias.
- Especificación: el catálogo agrupa libros, ejemplares y autores. Los socios y su tipo de membresía van juntos. Préstamos y reservas forman el tercer grupo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-01-paquetes-y-dependencias
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/paquetes.puml; echo $?
   plantuml -syntax < starter/paquetes.puml
   ```

   Output:

   ```
   0
   CLASS
   (7 entities)
   ```

   Un diagrama de paquetes con clases dentro es, para PlantUML, un diagrama de clases. Abre `starter/paquetes.svg`: siete cajas sin orden.

2. **TODO 1 — Paquetes.** Envuelve las clases en tres paquetes, sin atributos ni operaciones (ya están en el diagrama de clases):

   ```plantuml
   package catalog {
     class Book
     class Copy
     class Author
   }
   ```

   Haz lo mismo con `members` (`Member`, `MembershipType`) y `loans` (`Loan`, `Reservation`). Renderiza:

   ```bash
   plantuml -tsvg starter/paquetes.puml; plantuml -syntax < starter/paquetes.puml
   ```

   Output:

   ```
   CLASS
   (7 entities)
   ```

   Siguen siendo 7: PlantUML cuenta las clases, no los paquetes. En el SVG cada grupo está dentro de una carpeta con pestaña.

3. **TODO 2 — Dependencias.** Recorre el comentario de asociaciones. Cada una que une clases de paquetes distintos es una dependencia del paquete de origen al de destino. `Loan --> Copy` da:

   ```plantuml
   loans ..> catalog
   ```

   Escribe una línea por cada par de paquetes, no una por cada asociación: `Reservation --> Book` es la misma dependencia `loans ..> catalog`. `Copy --> Book` no cruza de paquete y no da ninguna. Cuenta:

   ```bash
   grep -cE '^[a-z]+ [.]+> [a-z]+' starter/paquetes.puml
   ```

   Output:

   ```
   3
   ```

   Si te salen 4 o más, has repetido un par. Si te salen 2, te falta la que sale de `Member --> Loan`.

4. **TODO 3 — El ciclo.** `tsort` ordena pares "origen destino" de arriba abajo y avisa si no puede porque hay un ciclo:

   ```bash
   grep -E '^[a-z]+ [.]+> [a-z]+' starter/paquetes.puml | awk '{print $1, $3}' | tsort; echo $?
   ```

   Output:

   ```
   tsort: -: input contains a loop:
   tsort: members
   tsort: loans
   members
   loans
   catalog
   1
   ```

   `members` depende de `loans` y `loans` de `members`: no puedes cambiar ni probar uno sin el otro. La causa es `Member --> Loan`: el socio guarda sus préstamos activos. Para saber qué tiene prestado un socio basta con buscar los préstamos de ese socio, así que quita esa navegabilidad. Borra la línea `'   Member --> Loan ...` del comentario y la dependencia `members ..> loans`. Repite:

   ```bash
   grep -E '^[a-z]+ [.]+> [a-z]+' starter/paquetes.puml | awk '{print $1, $3}' | tsort; echo $?
   ```

   Output:

   ```
   loans
   members
   catalog
   0
   ```

   Ese es el orden de capas: `loans` arriba, usa a los otros dos; `members` y `catalog` no dependen de nadie. Borra los comentarios de los TODO y renderiza: las dos flechas salen de `loans`.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/paquetes.puml; echo $?
   plantuml -syntax < starter/paquetes.puml
   grep -cE '^package ' starter/paquetes.puml
   grep -cE '^[a-z]+ [.]+> [a-z]+' starter/paquetes.puml
   grep -c TODO starter/paquetes.puml
   ```

   Output:

   ```
   0
   CLASS
   (7 entities)
   3
   2
   0
   ```

6. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué la flecha va de `loans` a `catalog` y no al revés?
   - Al quitar `Member --> Loan`, ¿qué tiene que cambiar en `02-clases.puml` para que los dos diagramas digan lo mismo?
   - Si mañana el catálogo tuviera que mostrar si un ejemplar está prestado, ¿qué dependencia aparecería? ¿Cómo lo resolverías sin crear un ciclo?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `CLASS` y `(7 entities)`
- [ ] 3 paquetes con todas las clases dentro, sin atributos ni operaciones
- [ ] 2 dependencias, las dos saliendo de `loans`
- [ ] `tsort` ordena los paquetes y sale con `0`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La biblioteca quiere avisar a los socios cuando una reserva está lista y cuando un préstamo vence. Añade un paquete `notifications` con una interfaz `Notifiable <<interface>>` que implementen `Loan` y `Reservation`. ¿Hacia dónde van las nuevas dependencias? Comprueba con `tsort` que sigue sin haber ciclo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Componentes e interfaces](../lab-02-componentes-e-interfaces/README.md) → |

[↑ Semana 08](../../README.md)
