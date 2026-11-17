# Lab 01 — Anatomía de una clase

⏱ Duración estimada: ~60 min

## Objetivo

Escribir clases completas en PlantUML con atributos tipados, valores iniciales y operaciones con firma.

## Contexto

- Sintaxis de atributo: `visibilidad nombre: Tipo = valorInicial`. De operación: `visibilidad nombre(param: Tipo): Retorno`. Ver [Anatomía de una clase](../../1-teoria/01-anatomia-de-una-clase.md).
- Los comentarios `'` dentro de las llaves de una clase no se dibujan: puedes dejarlos mientras trabajas, pero bórralos al terminar.
- Las tres líneas `hide circle`, `hide empty members` y `skinparam classAttributeIconSize 0` van en todo diagrama de clases del bootcamp.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-01-anatomia-de-una-clase
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/libro.puml; echo $?
   ```

   Output: `0`. Abre `starter/libro.svg`: una caja `Book` sin compartimentos (están vacíos y `hide empty members` los oculta).

2. **TODO 1**: dentro de las llaves de `Book`, añade los atributos:

   ```plantuml
     - isbn: String
     - title: String
     - publishedYear: Integer
     - copies: Integer = 1
   ```

   Renderiza de nuevo: aparece el compartimento de atributos con `-` delante de cada uno. Sin `skinparam classAttributeIconSize 0` verías cuadrados de colores en lugar de `-`: compruébalo comentando esa línea con `'`, renderizando y volviéndola a activar.

3. **TODO 2**: debajo de los atributos, las operaciones:

   ```plantuml
     + isAvailable(): Boolean
     + lend(to: Member): Loan
   ```

   PlantUML separa atributos y operaciones por los paréntesis: todo miembro con `(` va al tercer compartimento, aunque lo escribas antes.

4. **TODO 3**: declara `Member` y `Loan` con sus atributos, igual que `Book`:

   ```plantuml
   class Member {
     - memberNumber: String
     - fullName: String
   }
   ```

   Haz lo mismo con `Loan` (`startDate: Date`, `dueDate: Date`). Comprueba:

   ```bash
   plantuml -syntax < starter/libro.puml
   ```

   Output:

   ```
   CLASS
   (3 entities)
   ```

5. Cuenta los atributos con tipo y las operaciones con retorno:

   ```bash
   grep -cE '^[[:space:]]*-[[:space:]]*[[:alpha:]]+[[:space:]]*:' starter/libro.puml
   grep -cE '^[[:space:]]*[+][[:space:]]*[[:alpha:]]+[(].*[)][[:space:]]*:' starter/libro.puml
   ```

   Output: `8` y `2`. Son las mismas expresiones que usa el autograding del proyecto.

6. Borra los comentarios de los TODO y valida:

   ```bash
   grep -c TODO starter/libro.puml; plantuml -checkonly starter/libro.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] `plantuml -syntax < starter/libro.puml` imprime `CLASS` y `(3 entities)`
- [ ] 8 atributos privados con tipo y 2 operaciones públicas con tipo de retorno
- [ ] `copies` muestra su valor inicial `= 1` en el SVG
- [ ] Sin TODO y `plantuml -checkonly` sale con `0`

## Reto extra

Añade a `Book` un atributo `authors: String [1..*]`. ¿Qué dice esa multiplicidad? ¿Por qué en la semana 03 lo cambiarás por una asociación con una clase `Author`?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Visibilidad y encapsulamiento](../lab-02-visibilidad-y-encapsulamiento/README.md) → |

[↑ Semana 02](../../README.md)
