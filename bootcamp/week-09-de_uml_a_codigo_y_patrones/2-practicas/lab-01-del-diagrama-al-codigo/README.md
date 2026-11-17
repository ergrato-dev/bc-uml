# Lab 01 — Del diagrama al código

⏱ Duración estimada: ~60 min

## Objetivo

Escribir el esqueleto de código de un diagrama de clases de una biblioteca y comprobar con la terminal que no falta ninguna clase, atributo, operación ni herencia.

## Contexto

- Reglas de traducción: [Del diagrama al código](../../1-teoria/01-del-diagrama-al-codigo.md).
- `starter/biblioteca.puml` es la referencia y no se toca. El código empieza a medias en dos versiones: `starter/java/` y `starter/python/`. Trabaja solo en la de tu lenguaje. Si programas en otro (C#, Kotlin, TypeScript), crea `starter/otro/` y sigue los mismos pasos: las comprobaciones no dependen del lenguaje.
- Esqueleto significa firmas sin lógica: el cuerpo de cada operación lanza una excepción (`UnsupportedOperationException`, `NotImplementedError`) o devuelve un valor fijo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-01-del-diagrama-al-codigo
   ```

1. Renderiza el diagrama de referencia y ábrelo (`starter/biblioteca.svg`):

   ```bash
   plantuml -tsvg starter/biblioteca.puml; echo $?
   plantuml -syntax < starter/biblioteca.puml
   ```

   Output:

   ```
   0
   CLASS
   (6 entities)
   ```

2. Elige tu carpeta de código. Todos los comandos siguientes usan `$C`:

   ```bash
   C=starter/java      # o bien: C=starter/python
   ```

   Lista las clases del diagrama que todavía no están en el código. El primer `grep` saca los nombres del `.puml` y el segundo, los que siguen a `class`, `interface`, `enum` o `record` en el código. `comm -23` imprime los que están en el primero y no en el segundo:

   ```bash
   comm -23 <(grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/biblioteca.puml | awk '{print $NF}' | sort -u) <(grep -rhoIE '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' $C | awk '{print $2}' | sort -u)
   ```

   Output:

   ```
   Dvd
   Loan
   ```

3. **TODO 1 — Herencia.** `LibraryItem <|-- Dvd` es una generalización: `Dvd` hereda de `LibraryItem`. Escríbela como `Book`, con su atributo y la operación que redefine:

   ```java
   // java/Dvd.java
   public class Dvd extends LibraryItem {
       private int minutes;
       ...
   ```

   ```python
   # python/biblioteca.py
   class Dvd(LibraryItem):
       def __init__(self, title: str, minutes: int):
           super().__init__(title)
           self._minutes = minutes
       ...
   ```

   Comprueba qué clases declaran que heredan de `LibraryItem`:

   ```bash
   grep -rhIE 'class[[:space:]]+[A-Za-z]+[^A-Za-z0-9_].*LibraryItem' $C | grep -oE 'class[[:space:]]+[A-Za-z]+' | awk '{print $2}' | sort
   ```

   Output:

   ```
   Book
   Dvd
   ```

   Las dos generalizaciones del diagrama están en el código. Repite el `comm` del paso 2: ya solo sale `Loan`.

4. **TODO 2 — Atributos y asociaciones.** Crea `Loan` con `dueDate` y `status`, y añade a `Member` los atributos `name` y `email`. Después, las dos asociaciones. La flecha dice quién tiene el campo:
   - `Member "1" --> "0..*" Loan`: `Member` tiene una colección de préstamos (`List<Loan>`, `list[Loan]`). `Loan` no tiene campo `member`.
   - `Loan "0..*" --> "1" LibraryItem`: `Loan` tiene un campo `item` de tipo `LibraryItem`.

   Tipos: `Date` pasa a `LocalDate` en Java y a `date` en Python; `LoanStatus` es el enum que ya está escrito.

   Lista los atributos y operaciones del diagrama que no aparecen en el código. Los nombres se comparan en minúsculas y sin `_`, así que `dueDate` y `due_date` cuentan como el mismo:

   ```bash
   grep -oE '^[[:space:]]*([{][a-z]+[}][[:space:]]*)?[-+#~][[:space:]]*([{][a-z]+[}][[:space:]]*)?[A-Za-z_][A-Za-z0-9_]*' starter/biblioteca.puml | awk '{print $NF}' | tr -d _ | tr '[:upper:]' '[:lower:]' | sort -u > /tmp/miembros
   comm -23 /tmp/miembros <(grep -rhoIE '[A-Za-z_][A-Za-z0-9_]*' $C | tr -d _ | tr '[:upper:]' '[:lower:]' | sort -u)
   ```

   Output:

   ```
   activeloans
   borrow
   close
   isoverdue
   ```

   Solo faltan operaciones: los atributos ya están. Repite el `comm` del paso 2: `(sin salida)`.

5. **TODO 3 — Operaciones.** Escribe las cuatro con los parámetros y el tipo de retorno del diagrama, sin lógica:

   ```java
   public boolean isOverdue(LocalDate today) {
       throw new UnsupportedOperationException("sin implementar");
   }
   ```

   ```python
   def is_overdue(self, today: date) -> bool:
       raise NotImplementedError
   ```

   `borrow(item: LibraryItem, today: Date): Loan` va en `Member`; `activeLoans(): Integer`, también. Borra los comentarios de los TODO y repite el `comm` del paso 4:

   ```
   (sin salida)
   ```

6. Comprueba (sigues con `$C` definido):

   ```bash
   grep -rn TODO $C; echo $?
   grep -rhoIE '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' $C | wc -l
   ```

   Output:

   ```
   1
   6
   ```

   Seis clasificadores en el diagrama y seis en el código. Si tienes Java o Python en tu equipo, fuera del contenedor, compila: `javac -d /tmp/lab01 starter/java/*.java` o `python3 -c "import sys; sys.path.insert(0, 'starter/python'); import biblioteca"`. No es obligatorio: el contenedor solo trae PlantUML.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `Loan` no tiene un campo `member`? ¿Qué tendrías que cambiar en el diagrama para que lo tuviera?
   - El diagrama no dice si `Loan` recibe `item` en el constructor o en un setter. ¿Cuál eliges y por qué?
   - ¿Qué parte del diagrama no pudiste traducir sin decidir algo por tu cuenta?

## Criterios de éxito

- [ ] El `comm` de clases (paso 2) no imprime nada
- [ ] `Book` y `Dvd` declaran que heredan de `LibraryItem`
- [ ] El `comm` de atributos y operaciones (paso 4) no imprime nada
- [ ] Ningún TODO en tu carpeta de código y 6 clasificadores declarados
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La biblioteca añade reservas: un socio reserva un ejemplar prestado y, cuando se devuelve, se le avisa. Añade `Reservation` al diagrama con sus asociaciones y escríbela en el código. ¿Qué clase tiene la colección de reservas: `Member`, `LibraryItem` o las dos?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Del código al diagrama](../lab-02-del-codigo-al-diagrama/README.md) → |

[↑ Semana 09](../../README.md)
