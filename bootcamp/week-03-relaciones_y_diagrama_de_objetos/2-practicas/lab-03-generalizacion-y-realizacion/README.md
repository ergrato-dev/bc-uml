# Lab 03 — Generalización y realización

⏱ Duración estimada: ~60 min

## Objetivo

Dibujar la jerarquía de entradas de un cine y las interfaces que cumple, sin repetir en las subclases lo que heredan.

## Contexto

- Es el modelo del lab 04 de la semana 02, ahora con relaciones.
- Generalización `<|--`: línea continua, triángulo en la superclase. Realización `<|..`: línea discontinua, triángulo en la interfaz. Ver [Generalización, realización y dependencia](../../1-teoria/02-generalizacion-realizacion-y-dependencia.md).
- Una subclase solo muestra lo que añade o redefine.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-03-generalizacion-y-realizacion
   ```

1. Renderiza el starter y cuenta los atributos heredados repetidos:

   ```bash
   plantuml -tsvg starter/cine.puml; echo $?
   grep -cE '^[[:space:]]*- (seat|basePrice):' starter/cine.puml
   ```

   Output: `0` y `6`. `seat` y `basePrice` aparecen en tres clases.

2. **TODO 1**: generalización. Al final del archivo:

   ```plantuml
   Ticket <|-- StudentTicket
   Ticket <|-- MemberTicket
   ```

   La superclase va del lado del triángulo `<|`. Renderiza: `Ticket` arriba, en cursiva, con dos flechas de triángulo hueco que le llegan desde las subclases.

3. **TODO 2**: borra `- seat: String` y `- basePrice: Decimal` de `StudentTicket` y de `MemberTicket`. Las subclases los heredan. **No** borres `+ finalPrice(): Decimal`: cada subclase lo redefine, y por eso `Ticket` lo declara `{abstract}`.

   ```bash
   grep -cE '^[[:space:]]*- (seat|basePrice):' starter/cine.puml
   ```

   Output: `2`.

4. **TODO 3**: realización. `Ticket` y `Reservation` cumplen `Notifiable`:

   ```plantuml
   Notifiable <|.. Ticket
   Notifiable <|.. Reservation
   ```

   Renderiza: líneas discontinuas con triángulo hueco en `Notifiable`. Como `Ticket` realiza la interfaz, sus subclases también la cumplen: no hace falta dibujarlo dos veces.

5. **TODO 4**: asociaciones con las funciones y las películas:

   ```plantuml
   Ticket "0..*" -- "1" Screening : for >
   Screening "0..*" -- "1" Movie : shows >
   ```

6. Comprueba:

   ```bash
   grep -v "^'" starter/cine.puml | grep -cF '<|--'
   grep -v "^'" starter/cine.puml | grep -cF '<|..'
   plantuml -syntax < starter/cine.puml
   ```

   Output:

   ```
   2
   2
   CLASS
   (7 entities)
   ```

7. Escribe en `jerarquia.md` (en la carpeta del lab) la respuesta a: ¿por qué `Reservation` realiza `Notifiable` en lugar de heredar de `Ticket`? Usa la pregunta "¿X es un Y, siempre?" de la teoría.

8. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/cine.puml; plantuml -checkonly starter/cine.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] Dos generalizaciones hacia `Ticket` y dos realizaciones hacia `Notifiable` (`2` y `2` en el paso 6)
- [ ] `seat` y `basePrice` solo en `Ticket` (`2` en el paso 3)
- [ ] Las subclases conservan `finalPrice()` y el SVG muestra `Ticket` en cursiva
- [ ] `jerarquia.md` justifica la realización de `Reservation`

## Reto extra

El cine quiere ofrecer entradas `VipTicket` que también son de socio (`MemberTicket`) pero con sillón reclinable. ¿Subclase de `MemberTicket`, de `Ticket` o un atributo? Modela tu decisión y explícala en `jerarquia.md`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Agregación y composición](../lab-02-agregacion-y-composicion/README.md) | [Lab 04 — Clase asociación, navegabilidad y dependencia](../lab-04-clase-asociacion-y-dependencia/README.md) → |

[↑ Semana 03](../../README.md)
