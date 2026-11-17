# Lab 06 — Revisar un diagrama de clases

⏱ Duración estimada: ~60 min

## Objetivo

Revisar un diagrama de clases que renderiza sin errores pero está mal modelado, y corregirlo justificando cada cambio.

## Contexto

- `plantuml -checkonly` solo comprueba la sintaxis. Un diagrama puede renderizar perfecto y decir cosas falsas o inútiles.
- `starter/tienda.puml` tiene **8 errores de modelado**. Todos violan algo de la teoría de esta semana.
- Es la revisión que harás de los modelos de tus compañeros en la semana 10.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio, entra en la carpeta del lab y comprueba que renderiza:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-06-revisar-un-diagrama-de-clases
   plantuml -checkonly starter/tienda.puml; echo $?
   ```

   Output: `0`. Sin errores de sintaxis.

1. Crea `revision.md` en la carpeta del lab con esta tabla:

   ```markdown
   | # | Elemento | Problema | Regla que viola | Corrección |
   |---|---|---|---|---|
   ```

2. Revisa el diagrama con esta lista. Cada punto encuentra al menos un error:

   - Nombres de clase: ¿singular y en inglés?
   - Atributos: ¿visibilidad privada, tipo presente, tipo neutro (no de base de datos)?
   - Operaciones: ¿hay getters y setters triviales? ¿todas tienen tipo de retorno?
   - Responsabilidades: ¿alguna operación pertenece a otra clase del diagrama?
   - Enumeraciones: ¿tienen sentido como lista cerrada? ¿llevan su palabra clave?
   - Interfaces: ¿tienen estado? ¿llevan su palabra clave?

   Las comprobaciones automáticas te ayudan con parte de la lista:

   ```bash
   grep -nE '^[[:space:]]*[+][[:space:]]*[[:alpha:]]+[[:space:]]*:' starter/tienda.puml
   grep -nE '[(][^)]*[)][[:space:]]*$' starter/tienda.puml
   grep -nE '^(enum|interface)' starter/tienda.puml
   ```

   Output:

   ```
   12:  + sku: varchar(20)
   13:  + name: String
   12:  + sku: varchar(20)
   27:  + sendInvoiceEmail()
   30:enum Currency {
   34:interface Discountable {
   ```

   El primero lista atributos públicos; el segundo, líneas que terminan en `)` sin tipo de retorno (operaciones incompletas, y `sku` se cuela por su `varchar(20)`: otra pista); el tercero, enums e interfaces para revisar su palabra clave. `+ price` (línea 14) no aparece en ninguno: le falta el tipo, búscalo a ojo.

3. Llena una fila de `revision.md` por cada error. Hay 8; si encuentras más, mejor.

4. Corrige `starter/tienda.puml` según tu tabla. Para la operación mal ubicada, muévela a la clase responsable. Para el enum de un solo valor, decide si sobra o si le faltan valores, y explícalo.

5. Vuelve a lanzar los tres `grep` del paso 2: ninguno debe listar nada salvo las líneas `enum` e `interface`, que ahora llevan `<<enumeration>>` e `<<interface>>`:

   ```bash
   grep -nE '^(enum|interface)' starter/tienda.puml
   ```

   Output parecido a:

   ```
   30:enum Currency <<enumeration>> {
   36:interface Discountable <<interface>> {
   ```

   (Los números de línea dependen de tus cambios.)

6. Valida y renderiza:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   ```

   Output: `0`.

## Criterios de éxito

- [ ] `revision.md` con al menos 8 filas, cada una con la regla que viola
- [ ] Ningún atributo público, sin tipo o con tipo de base de datos
- [ ] Ningún getter/setter trivial ni operación sin retorno
- [ ] La operación mal ubicada está en su clase responsable
- [ ] Enum e interfaz con palabra clave; la interfaz sin atributos

## Reto extra

Pide a un compañero su `revision.md` y compara: ¿encontró algún error que tú no viste, o al revés? Anota en tu archivo qué regla te faltó aplicar.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — De código a diagrama](../lab-05-de-codigo-a-diagrama/README.md) | [Proyecto — Diagrama de clases de tu dominio](../../3-proyecto/README.md) → |

[↑ Semana 02](../../README.md)
