# Proyecto Semana 01 — Portada y modelo conceptual de tu dominio

⏱ Duración estimada: 3 h

## Objetivo

Arrancar el `modelo` de tu dominio: la portada con dominio, actores y glosario, y el primer diagrama, el modelo conceptual.

## Antes de empezar

- El instructor te asigna **tu dominio** al inicio de la semana: un sistema, sus actores, un proceso núcleo, una entidad con ciclo de vida y una restricción. Si aún no lo tienes, pídelo antes de seguir. Detalle en [proyecto hilo conductor](../../../docs/proyecto-hilo-conductor.md).
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Todos los nombres del modelo (conceptos, actores, asociaciones) van **en inglés**; la prosa del README, en español.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| README.md del modelo no tiene TODO pendientes | 1 a 4 |
| README.md describe el dominio en al menos 2 líneas de texto | 1 |
| README.md lista al menos 3 actores | 2 |
| El glosario del dominio tiene al menos 8 términos | 3 |
| README.md enlaza diagramas/01-modelo-conceptual.puml | 4 |
| 01-modelo-conceptual.puml renderiza sin errores | 5 |
| 01-modelo-conceptual.puml es un diagrama de clases | 5 |
| 01-modelo-conceptual.puml tiene title | 5 |
| El modelo conceptual tiene al menos 6 conceptos | 6 |
| El modelo conceptual no tiene atributos ni operaciones todavía | 6 |
| El modelo conceptual tiene al menos 5 asociaciones (--) | 7 |
| Toda asociación lleva nombre (: verbo) | 7 |
| 01-modelo-conceptual.puml no tiene TODO pendientes | 8 |

## Paso a paso

0. Desde la raíz del repositorio, mira el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 01
   ```

   Output (resumen): 5 comprobaciones en verde y `5/13 comprobaciones superadas.` El resto es tu trabajo.

1. **Dominio.** En `starter/README.md`, cambia `TODO: nombre del sistema` del título por el nombre de tu sistema y sustituye el TODO de `## Dominio` por 2 a 4 líneas: qué hace el sistema, para quién y qué problema resuelve. Incluye la restricción de tu dominio: condiciona todo el modelo.

2. **Actores.** En `## Actores`, una línea por actor con guion, nombre en inglés y qué hace:

   ```markdown
   - Receptionist: agenda citas y registra clientes.
   ```

   Al menos 3. Cuenta los sistemas externos (una pasarela de pago, un laboratorio) como actores.

3. **Glosario.** En `## Glosario del dominio`, sustituye la fila `TODO` por al menos 8 términos: el nombre en inglés que usarás en los diagramas y qué significa **en tu negocio** (no la definición del diccionario). Aplica el filtro del lab 05: los valores (fechas, precios) no son términos del glosario todavía.

   Comprueba cuántas filas tienes (desde la raíz del repo):

   ```bash
   awk '/^## /{s=($0 ~ /^## Glosario/); next} s && /^[|]/' bootcamp/week-01-fundamentos_uml_y_plantuml/3-proyecto/starter/README.md | tail -n +3 | wc -l
   ```

   Output: `8` o más.

4. **Índice de diagramas.** En `## Diagramas`, sustituye el TODO por el enlace al diagrama:

   ```markdown
   - [01 — Modelo conceptual](diagramas/01-modelo-conceptual.puml)
   ```

5. **Título.** Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/3-proyecto/starter
   ```

   En `diagramas/01-modelo-conceptual.puml`, cambia el `title` por `<Tu sistema> — modelo conceptual`. Comprueba:

   ```bash
   plantuml -syntax < diagramas/01-modelo-conceptual.puml
   ```

   Output: `CLASS` y `(0 entities)`.

6. **TODO 1: conceptos.** Declara al menos 6 conceptos de tu glosario con `class Nombre`, sin llaves `{}`: el modelo conceptual no lleva atributos ni operaciones. Comprueba:

   ```bash
   plantuml -syntax < diagramas/01-modelo-conceptual.puml
   ```

   Output: `CLASS` y `(N entities)` con N ≥ 6.

7. **TODO 2: asociaciones.** Al menos 5 asociaciones `A -- B : verbo`, en inglés. Léelas en voz alta como en el lab 05. Comprueba que ninguna queda sin nombre (no debe listar nada):

   ```bash
   grep -F -- ' -- ' diagramas/01-modelo-conceptual.puml | grep -vF ' : '; echo $?
   ```

   Output: `1`.

   Si la restricción de tu dominio relaciona dos conceptos de forma especial (varios dueños con permisos distintos, una lista de espera...), piensa si necesita un concepto propio en lugar de una asociación directa, y explícalo con un comentario `'` en el `.puml`.

8. Borra los comentarios de los TODO, renderiza y revisa el SVG:

   ```bash
   plantuml -tsvg diagramas/01-modelo-conceptual.puml; echo $?
   grep -c TODO diagramas/01-modelo-conceptual.puml
   exit
   ```

   Output: `0` y `0`.

9. Desde la raíz del repositorio, verifica la entrega:

   ```bash
   ./scripts/verificar-semana.sh 01
   ```

   Output (última línea):

   ```
   13/13 comprobaciones superadas.
   ```

## Calidad (40 pts, la revisa el instructor)

- Los conceptos y asociaciones salen de **tu** dominio y de su restricción, no de un ejemplo genérico.
- El glosario define cada término en el contexto del negocio.
- Nombres en inglés, en singular, sin abreviaturas.
- Comentarios `'` donde hay una decisión de modelado que no es obvia.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Estilo común, include y exportación](../2-practicas/lab-06-estilo-include-y-exportacion/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 01](../README.md)
