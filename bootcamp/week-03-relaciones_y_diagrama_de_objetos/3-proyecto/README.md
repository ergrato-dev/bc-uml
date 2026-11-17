# Proyecto Semana 03 — Relaciones y objetos de tu dominio

⏱ Duración estimada: 3 h

## Objetivo

Unir las clases de tu dominio con las relaciones UML correctas y comprobar sus multiplicidades con un diagrama de objetos de una situación concreta.

## Antes de empezar

- Partes de tu entrega de la semana 02 (`README.md`, `01-modelo-conceptual.puml` y `02-clases.puml`). El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Esta semana **editas** `02-clases.puml` (le añades relaciones) y **creas** el contenido de `03-objetos.puml`, que ya trae los TODO.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| 01-modelo-conceptual.puml de la semana 01 sigue en el modelo y renderiza | 0 |
| 02-clases.puml renderiza sin errores | 1 |
| 02-clases.puml es un diagrama de clases con title | 1 |
| 02-clases.puml tiene al menos 5 asociaciones con multiplicidad en los dos extremos | 2 y 4 |
| Hay al menos una composición (*--) | 4 |
| Hay al menos una generalización (<\|--) | 5 |
| Hay al menos una realización de interfaz (<\|..) | 6 |
| Ninguna asociación, agregación o composición sin multiplicidad en ambos extremos | 7 |
| 03-objetos.puml renderiza sin errores | 8 |
| 03-objetos.puml tiene title y solo objetos, sin clases | 8 |
| Al menos 6 objetos con nombre y clase ("name : Class") | 9 |
| Al menos 10 slots con valor (name = value) | 10 |
| Al menos 5 links entre objetos | 11 |
| Los links no llevan multiplicidad (es de las asociaciones, no de los objetos) | 11 |
| README.md enlaza diagramas/03-objetos.puml | 12 |
| 02-clases.puml y 03-objetos.puml no tienen TODO pendientes | 13 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 02 al starter de esta semana (`-n` no sobrescribe nada que ya exista, así que `03-objetos.puml` se conserva):

   ```bash
   cp -rn bootcamp/week-02-diagrama_de_clases/3-proyecto/starter/. bootcamp/week-03-relaciones_y_diagrama_de_objetos/3-proyecto/starter/
   ls bootcamp/week-03-relaciones_y_diagrama_de_objetos/3-proyecto/starter/diagramas
   ```

   Output:

   ```
   01-modelo-conceptual.puml  02-clases.puml  03-objetos.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 03
   ```

   Output (resumen): `7/16 comprobaciones superadas.` (con tu semana 02 copiada).

1. Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/3-proyecto/starter
   ```

   En `diagramas/02-clases.puml`, cambia el comentario de cabecera: quita la línea que decía que las relaciones llegaban en la semana 03.

2. **Asociaciones.** Abre `01-modelo-conceptual.puml`: sus asociaciones son el punto de partida. Pásalas al final de `02-clases.puml`, antes de `@enduml`, con multiplicidad en los dos extremos y nombre:

   ```plantuml
   Member "1" -- "0..*" Loan : has >
   ```

   Lee cada una en voz alta en las dos direcciones ("un X tiene ... Y; un Y es de ... X"). Si suena falsa en tu dominio, corrige la multiplicidad. Añade roles donde dos asociaciones unan las mismas clases o en las reflexivas.

3. Renderiza y revisa el SVG:

   ```bash
   plantuml -tsvg diagramas/02-clases.puml; echo $?
   ```

   Output: `0`. Abre `diagramas/02-clases.svg`.

4. **Composición y agregación.** Aplica la prueba del borrado a cada asociación: al menos una debe ser composición (`*--`, con `"1"` en el todo). Usa agregación solo si la parte se comparte y sobrevive; si dudas, déjala como asociación. Explica cada composición con un comentario `'` encima. Cuenta:

   ```bash
   grep -v "^'" diagramas/02-clases.puml | grep -cE '"[^"]+"[[:space:]]*[*o<]?-+[*o>]?[[:space:]]*"[^"]+"'
   ```

   Output: `5` o más.

5. **Generalización.** Tu clase abstracta de la semana 02 necesita al menos una subclase. Añádela con sus atributos **propios** (no repitas los heredados) y la operación `{abstract}` redefinida:

   ```plantuml
   Ticket <|-- StudentTicket
   ```

6. **Realización.** Las clases que tienen la operación de tu interfaz la realizan:

   ```plantuml
   Notifiable <|.. Loan
   ```

   Si una clase realiza la interfaz pero no tenía su operación, añádesela.

   Opcional: si un dato pertenece a un vínculo y no a una clase, conviértelo en clase asociación `(A, B) .. C` (lab 04). Si una clase solo usa otra en una operación, dibuja la dependencia `..>`.

7. Comprueba que ninguna asociación quedó sin multiplicidad (no debe listar nada):

   ```bash
   grep -v "^'" diagramas/02-clases.puml | grep -E '^[[:space:]]*[[:alnum:]_]+[[:space:]]*("[^"]*")?[[:space:]]*[*o<]?-+[*o>]?[[:space:]]*("[^"]*")?[[:space:]]*[[:alnum:]_]+' | grep -vE '"[^"]+"[[:space:]]*[*o<]?-+[*o>]?[[:space:]]*"[^"]+"'; echo $?
   ```

   Output: `1`. Si lista alguna línea, añádele la multiplicidad que falta.

8. **Diagrama de objetos: título.** Abre `diagramas/03-objetos.puml`. Elige la situación (TODO 1): la que más pone a prueba tus multiplicidades, por ejemplo alguien con varios de algo o un objeto compartido por dos. Cambia el `title` por `<Tu sistema> — <la situación>` y renderiza:

   ```bash
   plantuml -tsvg diagramas/03-objetos.puml; echo $?
   ```

   Output: `0`. No escribas `class` en este archivo: solo objetos.

9. **TODO 2: objetos.** Al menos 6, con nombre y clase de tu `02-clases.puml`. Ninguno de una clase abstracta ni de una interfaz:

   ```plantuml
   object "ana : Member" as ana {
   }
   ```

   ```bash
   grep -cE '^[[:space:]]*object[[:space:]]+"[^"]*:[[:space:]]*[[:alpha:]]' diagramas/03-objetos.puml
   ```

   Output: `6` o más.

10. **TODO 3: slots.** Al menos 10 en total, `nombre = valor`. Cada slot corresponde a un atributo de la clase del objeto (o de su superclase) y su valor es de ese tipo: los enums sin comillas, los textos con comillas.

11. **TODO 4: links.** Al menos 5, sin multiplicidad (`ana -- l1`). Para cada uno, busca la asociación de `02-clases.puml` que lo permite y cuenta: ningún objeto puede tener más links de los que permite la multiplicidad. Si encuentras un link que el diagrama de clases no permite, falta una asociación o el caso es imposible: corrige el que esté mal.

    ```bash
    plantuml -syntax < diagramas/03-objetos.puml
    ```

    Output: `CLASS` y `(N entities)` con N ≥ 6.

12. **Índice.** En el `README.md` del modelo, añade a `## Diagramas`:

    ```markdown
    - [03 — Objetos](diagramas/03-objetos.puml)
    ```

    Si añadiste subclases o clases asociación, añádelas también al glosario del dominio.

13. Borra los comentarios de los TODO y sal del contenedor:

    ```bash
    grep -c TODO diagramas/02-clases.puml diagramas/03-objetos.puml
    exit
    ```

    Output:

    ```
    diagramas/02-clases.puml:0
    diagramas/03-objetos.puml:0
    ```

14. Desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 03
    ```

    Output (última línea):

    ```
    16/16 comprobaciones superadas.
    ```

## Calidad (40 pts, la revisa el instructor)

- Multiplicidades fieles al dominio y a su restricción: cada frase "un X tiene ... Y" es verdad en tu sistema.
- Composición, agregación y generalización justificadas con comentarios `'`; ninguna puesta solo para pasar el autograding.
- Subclases sin atributos heredados repetidos; realizaciones con las operaciones de la interfaz.
- El diagrama de objetos es coherente con el de clases (clases, slots, links y multiplicidades) y muestra un caso que aporta algo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar relaciones rotas](../2-practicas/lab-06-depurar-relaciones-rotas/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 03](../README.md)
