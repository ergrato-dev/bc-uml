# Lab 04 — Enumeraciones, clases abstractas e interfaces

⏱ Duración estimada: ~60 min

## Objetivo

Decidir cuándo un elemento es enumeración, clase abstracta o interfaz y escribirlo con la notación UML correcta.

## Contexto

- Enum: lista cerrada de valores. Clase abstracta: no se instancia, sus subclases la completan. Interfaz: contrato de operaciones sin estado. Ver [Enumeraciones, clases abstractas e interfaces](../../1-teoria/02-enums-abstractas-e-interfaces.md).
- Con `hide circle`, las palabras clave `<<enumeration>>` e `<<interface>>` se escriben siempre.
- La generalización (`StudentTicket` es un `Ticket`) se dibuja en la semana 03; hoy solo la anotas.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-04-enums-abstractas-e-interfaces
   ```

1. Renderiza el starter y observa los problemas:

   ```bash
   plantuml -tsvg starter/entradas.puml; plantuml -syntax < starter/entradas.puml
   ```

   Output:

   ```
   CLASS
   (4 entities)
   ```

   `Ticket` parece una clase que se puede vender sola y `rating: String` admite cualquier texto (`"para mayores"`, `"R "`, `""`).

2. **TODO 1**: haz abstracta `Ticket`:

   ```plantuml
   abstract class Ticket {
     - seat: String
     - basePrice: Decimal
     {abstract} + finalPrice(): Decimal
   }
   ```

   Renderiza: el nombre y `finalPrice()` salen en cursiva.

3. **TODO 2**: la clasificación por edad:

   ```plantuml
   enum AgeRating <<enumeration>> {
     G
     PG
     PG13
     R
   }
   ```

   Y en `Movie`, cambia `- rating: String` por `- rating: AgeRating`.

4. **TODO 3**: el contrato de aviso:

   ```plantuml
   interface Notifiable <<interface>> {
     + notificationText(): String
   }
   ```

5. **TODO 4**: añade `Reservation` con `- code: String` y `+ notificationText(): String`. `Reservation` y las entradas no se parecen en nada salvo en que avisan al cliente: por eso es una interfaz y no una superclase.

6. Comprueba:

   ```bash
   plantuml -syntax < starter/entradas.puml
   grep -cE '<<(enumeration|interface)>>' starter/entradas.puml
   ```

   Output:

   ```
   CLASS
   (7 entities)
   2
   ```

7. Crea `decisiones.md` en la carpeta del lab con una línea por decisión: por qué `Ticket` es abstracta y no interfaz, por qué `AgeRating` es enum y no clase, por qué `Notifiable` es interfaz y no clase abstracta. Usa la tabla "Clase abstracta vs interfaz" de la teoría.

8. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/entradas.puml; plantuml -checkonly starter/entradas.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] `Ticket` y `finalPrice()` en cursiva en el SVG
- [ ] `Movie.rating` es de tipo `AgeRating`
- [ ] `plantuml -syntax` imprime `(7 entities)` y hay 2 palabras clave explícitas
- [ ] `decisiones.md` justifica las tres decisiones

## Reto extra

Las categorías de películas (comedia, drama, terror...) las mantiene el programador del cine y cambian cada temporada. ¿Enum o clase? Añade tu decisión a `decisiones.md` y modélala.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Operaciones y firmas completas](../lab-03-operaciones-y-firmas/README.md) | [Lab 05 — De código a diagrama](../lab-05-de-codigo-a-diagrama/README.md) → |

[↑ Semana 02](../../README.md)
