# Lab 04 — Observer

⏱ Duración estimada: ~60 min

## Objetivo

Aplicar el patrón Observer a los avisos de disponibilidad de una biblioteca, de forma que un ejemplar avise a quien le interese sin conocer ninguna clase concreta.

## Contexto

- Roles y estructura: [Patrones GoF en UML](../../1-teoria/03-patrones-gof-en-uml.md), apartado "Observer".
- `starter/avisos.puml` renderiza, pero `LibraryItem` tiene una asociación con cada clase a la que avisa y las llama una a una (la nota lo muestra).
- Especificación: cuando un ejemplar vuelve a estar disponible, se avisa a la lista de espera, a la pantalla del catálogo y al boletín semanal. La biblioteca quiere añadir avisos nuevos (una app móvil) sin tocar `LibraryItem`, y que cada ejemplar tenga los suyos.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-04-observer
   ```

1. Renderiza el starter y ábrelo (`starter/avisos.svg`):

   ```bash
   plantuml -tsvg starter/avisos.puml; echo $?
   plantuml -syntax < starter/avisos.puml
   grep -cE '^LibraryItem --> ' starter/avisos.puml
   ```

   Output:

   ```
   0
   CLASS
   (6 entities)
   3
   ```

   Cinco clases y la nota. `LibraryItem` sale con tres flechas: una por clase a la que avisa.

2. **TODO 1 — Observer.** La interfaz que cumplen todos los que quieren enterarse. Una sola operación, que recibe el ejemplar que ha cambiado:

   ```plantuml
   interface ItemObserver <<interface>> <<Observer>> {
     + itemAvailable(item: LibraryItem): void
   }
   ```

3. **TODO 2 — Subject y ConcreteSubject.** `LibraryItem` es abstracta y `Book` hereda de ella: encajan con los dos roles del sujeto.
   - Añade `<<Subject>>` a `LibraryItem` y dos operaciones para gestionar la lista: `+ attach(observer: ItemObserver): void` y `+ detach(observer: ItemObserver): void`.
   - Añade `<<ConcreteSubject>>` a `Book`.
   - Sustituye las tres asociaciones de `LibraryItem` por una sola hacia la interfaz:

   ```plantuml
   LibraryItem --> "0..*" ItemObserver : notifies >
   ```

   Borra la nota: `markAvailable()` ya no llama a nadie por su nombre, recorre la lista y llama a `itemAvailable` en cada observador. Encima de `LibraryItem`, un comentario `'` que lo diga.

4. **TODO 3 — ConcreteObserver.** Las tres clases cumplen la interfaz. Cada una cambia su operación propia por `itemAvailable` y lleva el rol:

   ```plantuml
   class WaitingList <<ConcreteObserver>> {
     + itemAvailable(item: LibraryItem): void
   }

   ItemObserver <|.. WaitingList
   ```

   Haz lo mismo con `CatalogDisplay` y `Newsletter`. Borra los comentarios de los TODO y renderiza: `LibraryItem` arriba con `Book` debajo, una flecha `notifies` hacia `ItemObserver` y las tres clases colgando de ella con triángulo hueco y línea discontinua.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/avisos.puml; echo $?
   plantuml -syntax < starter/avisos.puml
   grep -cE '^LibraryItem --> ' starter/avisos.puml
   grep -cE '<[|][.][.]' starter/avisos.puml
   grep -c '<<ConcreteObserver>>' starter/avisos.puml
   grep -cE 'notifyFirst|refresh|addTitle' starter/avisos.puml
   ```

   Output:

   ```
   0
   CLASS
   (6 entities)
   1
   3
   3
   0
   ```

   El mismo número de entidades que al empezar (la interfaz entra, la nota sale), pero `LibraryItem` solo conoce una cosa: `ItemObserver`.

6. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - La biblioteca añade la app móvil. ¿Qué clases escribes y cuáles tocas?
   - ¿Por qué la asociación es `0..*` y no `1..*`?
   - `itemAvailable` recibe el ejemplar. ¿Qué pasaría si no lo recibiera y el observador estuviera atento a varios ejemplares?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(6 entities)`
- [ ] Los cuatro roles marcados: `<<Subject>>`, `<<ConcreteSubject>>`, `<<Observer>>` y tres `<<ConcreteObserver>>`
- [ ] `LibraryItem` tiene una sola asociación, hacia `ItemObserver`, con `0..*`
- [ ] Ninguna de las operaciones antiguas (`notifyFirst`, `refresh`, `addTitle`) queda en el diagrama
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Dibuja el diagrama de secuencia de `markAvailable()` con dos observadores registrados, con un fragmento `loop` sobre la lista. ¿Aparece en algún mensaje el nombre de una clase concreta de observador?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Strategy](../lab-03-strategy/README.md) | [Lab 05 — Adapter y Factory Method](../lab-05-adapter-y-factory-method/README.md) → |

[↑ Semana 09](../../README.md)
