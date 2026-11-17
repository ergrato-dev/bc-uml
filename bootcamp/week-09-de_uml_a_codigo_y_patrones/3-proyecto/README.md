# Proyecto Semana 09 — De UML a código y patrones

⏱ Duración estimada: 3 h

## Objetivo

Llevar tu diagrama de clases a un esqueleto de código en tu lenguaje y aplicar a tu dominio uno de los cuatro patrones de la semana, con su diagrama y su código.

## Antes de empezar

- Partes de tu entrega de la semana 08. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Elige el lenguaje orientado a objetos que mejor conoces. Las comprobaciones buscan nombres de clases, atributos y operaciones en el texto del código, así que valen para Java, Python, C#, Kotlin o TypeScript. Los nombres en `snake_case` cuentan igual que en `camelCase`.
- El código es un esqueleto: clases, campos y firmas. Las operaciones no llevan lógica, salvo la del patrón si quieres mostrar cómo delega.
- El patrón resuelve un problema que ya está en tu modelo: un enum que decide comportamiento, una clase que avisa a otras por su nombre, un sistema externo de tu `04-casos-de-uso.puml`, una creación que depende de un tipo.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| Los diagramas de las semanas 02 a 08 siguen en el modelo y renderizan | 0 |
| codigo/ tiene al menos un archivo de código fuente | 2 |
| Cada clase, interfaz y enumeración de 02-clases.puml está declarada en codigo/ | 2 |
| Cada atributo de 02-clases.puml aparece en codigo/ (sin distinguir camelCase de snake_case) | 3 |
| Cada operación de 02-clases.puml aparece en codigo/ (sin distinguir camelCase de snake_case) | 4 |
| Cada generalización y realización de 02-clases.puml y del patrón está en la declaración de la clase hija en codigo/ | 5 |
| Hay un solo 09-patron-<nombre>.puml y su nombre es strategy, observer, factory-method o adapter | 7 |
| 09-patron-<nombre>.puml renderiza, es un diagrama de clases y tiene title | 7 |
| Cada rol del patrón está marcado como estereotipo en un clasificador (<<Context>>, <<Strategy>>, <<ConcreteStrategy>>...) | 8 |
| El patrón tiene al menos una interfaz <<interface>> o una clase abstracta | 8 |
| Hay al menos una generalización o realización y una asociación o dependencia (--> o ..>) hacia la abstracción | 8 |
| Al menos un clasificador del patrón es una clase de 02-clases.puml | 8 |
| Cada clasificador del patrón está declarado en codigo/ | 9 |
| Cada clase de codigo/ está en 02-clases.puml o en el patrón | 9 |
| El README del modelo enlaza el diagrama del patrón y codigo/ | 10 |
| No queda ningún TODO en el patrón ni en codigo/ | 10 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 08 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-08-componentes_paquetes_y_despliegue/3-proyecto/starter/. bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/
   ls bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/diagramas bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/codigo
   ```

   Output (con los nombres de tu proceso, tu caso de uso y tu entidad):

   ```
   bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/codigo:
   README.md

   bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/diagramas:
   01-modelo-conceptual.puml  05-actividad-prestar-libro.puml     07-estados-prestamo.puml  09-patron-nombre.puml
   02-clases.puml             06-comunicacion-prestar-libro.puml  08-componentes.puml
   03-objetos.puml            06-secuencia-prestar-libro.puml     08-despliegue.puml
   04-casos-de-uso.puml       08-paquetes.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 09
   ```

   Output (resumen): `3/16 comprobaciones superadas.` (con tu semana 08 copiada).

   Abre el contenedor y entra en el starter. Los pasos siguientes se ejecutan ahí:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter
   ```

1. **TODO 1: lenguaje.** En `codigo/README.md`, rellena el lenguaje con su versión, qué hay en la carpeta y el comando con el que se compila o se importa. El contenedor no trae compiladores: compila en tu equipo.

2. **TODO 2: clasificadores.** Crea en `codigo/` una clase, interfaz o enumeración por cada clasificador de `02-clases.puml`, con el mismo nombre. Organízalas como pida tu lenguaje: un archivo por clase en Java o C#, uno o varios módulos en Python. Comprueba que no falta ninguna (no debe listar nada):

   ```bash
   RE='^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+'
   comm -23 <(grep -oE "$RE" diagramas/02-clases.puml | awk '{print $NF}' | sort -u) <(grep -rhoIE --exclude='*.md' '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' codigo | awk '{print $2}' | sort -u)
   ```

   Output: `(sin salida)`.

3. **TODO 3: atributos y asociaciones.** Cada atributo de `02-clases.puml` pasa a un campo con el tipo más cercano de tu lenguaje. Cada asociación navegable, a un campo en la clase de la que sale la flecha: una referencia con multiplicidad `1` o `0..1`, una colección con `0..*` o `1..*`. Cada composición, a una parte que el todo crea dentro. Lista los atributos y operaciones del diagrama que no aparecen en el código:

   ```bash
   grep -oE '^[[:space:]]*([{][a-z]+[}][[:space:]]*)?[-+#~][[:space:]]*([{][a-z]+[}][[:space:]]*)?[A-Za-z_][A-Za-z0-9_]*' diagramas/02-clases.puml | awk '{print $NF}' | tr -d _ | tr '[:upper:]' '[:lower:]' | sort -u > /tmp/miembros
   comm -23 /tmp/miembros <(grep -rhoIE --exclude='*.md' '[A-Za-z_][A-Za-z0-9_]*' codigo | tr -d _ | tr '[:upper:]' '[:lower:]' | sort -u)
   ```

   Output: solo nombres de operaciones. Si sale un atributo, falta el campo o está escrito distinto.

4. **TODO 4: operaciones.** Escribe cada operación con sus parámetros y su tipo de retorno. El cuerpo lanza una excepción (`UnsupportedOperationException`, `NotImplementedError`) o devuelve un valor fijo. No escribas la palabra TODO en el código: el último paso la busca. Repite el `comm` del paso 3:

   Output: `(sin salida)`.

5. **TODO 5: herencia y realización.** Cada `A <|-- B` es `B` heredando de `A` en la línea donde se declara `B`; cada `I <|.. C`, `C` implementando `I`. Comprueba (no debe listar nada):

   ```bash
   awk '$2 ~ /^<[|](--|[.][.])$/ {print $1, $3} $2 ~ /^(--|[.][.])[|]>$/ {print $3, $1}' diagramas/02-clases.puml diagramas/09-patron-*.puml | while read p c; do grep -rqIE --exclude='*.md' "(class|interface|enum|record)[[:space:]]+$c([^A-Za-z0-9_].*)?[^A-Za-z0-9_]$p([^A-Za-z0-9_]|$)" codigo || echo "falta: $c hereda de $p"; done
   ```

   Output: `(sin salida)`. Si escribes la herencia en otra línea que la del nombre de la clase, este comando no la ve: ponla en la misma.

6. **TODO 6: decisiones de traducción.** Al final de `codigo/README.md`, una tabla con las decisiones que tomaste: a qué tipo pasa `Date` o `Decimal`, qué colección usas para `0..*`, cómo se ve una composición, qué hiciste con las asociaciones sin flecha. Borra el comentario del TODO 6.

7. **TODO 7: elegir patrón.** Busca en tu modelo un problema que resuelva uno de los cuatro (ver la teoría, "Cuándo no usar un patrón"). Renombra el diagrama con el nombre del patrón y pon en el `title` el problema que resuelve:

   ```bash
   mv diagramas/09-patron-nombre.puml diagramas/09-patron-strategy.puml
   ```

   Los nombres válidos son `strategy`, `observer`, `factory-method` y `adapter`.

8. **TODO 8: roles y relaciones.** Sustituye `FirstClass` por un clasificador por rol, con el rol del catálogo como estereotipo:

   | Patrón | Roles |
   |---|---|
   | Strategy | `Context`, `Strategy`, `ConcreteStrategy` |
   | Observer | `Subject`, `ConcreteSubject`, `Observer`, `ConcreteObserver` |
   | Factory Method | `Creator`, `ConcreteCreator`, `Product`, `ConcreteProduct` |
   | Adapter | `Client`, `Target`, `Adapter`, `Adaptee` |

   Al menos uno es una clase de `02-clases.puml` (declárala sin miembros: ya los tiene allí). La abstracción es `interface X <<interface>> <<Rol>>` o `abstract class X <<Rol>>`. Añade la generalización o realización y la asociación o dependencia hacia la abstracción. Comprueba roles y clases compartidas:

   ```bash
   grep -oE '<<[A-Za-z]+>>' diagramas/09-patron-*.puml | sort | uniq -c
   comm -12 <(grep -oE "$RE" diagramas/09-patron-*.puml | awk '{print $NF}' | sort -u) <(grep -oE "$RE" diagramas/02-clases.puml | awk '{print $NF}' | sort -u)
   ```

   Output (con Strategy, tres estrategias concretas y dos clases del modelo): 

   ```
         3 <<ConcreteStrategy>>
         1 <<Context>>
         1 <<Strategy>>
         1 <<interface>>
   Loan
   Member
   ```

   Si has cerrado el contenedor, vuelve a definir `RE` como en el paso 2. Repite el comando del paso 5: las realizaciones del patrón también tienen que estar en el código.

9. **TODO 9: el patrón en el código.** Escribe en `codigo/` las clases nuevas del patrón. Comprueba que el código y los dos diagramas tienen exactamente las mismas clases (no debe listar nada):

   ```bash
   comm -3 <(grep -rhoIE --exclude='*.md' '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' codigo | awk '{print $2}' | sort -u) <(grep -hoE "$RE" diagramas/02-clases.puml diagramas/09-patron-*.puml | awk '{print $NF}' | sort -u)
   ```

   Output: `(sin salida)`. La primera columna serían clases del código que no están en ningún diagrama; la segunda, tras un tabulador, clases de los diagramas sin código.

10. **README e índice.** En la sección `## Diagramas` de `README.md`, añade los enlaces (con el nombre de tu patrón):

    ```markdown
    - [09 — Patrón Strategy: <problema>](diagramas/09-patron-strategy.puml)
    - Código: [esqueleto en <lenguaje>](codigo/README.md)
    ```

    Borra los comentarios de los TODO, renderiza el patrón y comprueba que no queda ningún TODO:

    ```bash
    plantuml -checkonly diagramas/09-patron-*.puml; echo $?
    grep -rn TODO diagramas/09-patron-*.puml codigo; echo $?
    ```

    Output:

    ```
    0
    1
    ```

11. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 09
    ```

    Output (resumen): `16/16 comprobaciones superadas.`

## Entrega

- [ ] `./scripts/verificar-semana.sh 09` pasa las 16 comprobaciones
- [ ] El código compila o se importa en tu equipo con el comando de `codigo/README.md`
- [ ] Cada asociación navegable es un campo solo en la clase de la que sale la flecha, y cada `0..*` es una colección
- [ ] El contexto, sujeto, creador o cliente del patrón se relaciona con la abstracción, nunca con una clase concreta
- [ ] Los comentarios `'` del patrón explican qué problema de tu dominio resuelve y por qué ese patrón y no otro

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar patrones rotos](../2-practicas/lab-06-depurar-patrones-rotos/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 09](../README.md)
