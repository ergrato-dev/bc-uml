# Lab 01 — Asociaciones y multiplicidad

⏱ Duración estimada: ~60 min

## Objetivo

Unir las clases de una biblioteca con asociaciones que lleven nombre, roles y multiplicidad en los dos extremos.

## Contexto

- Una asociación es una línea continua `--`. La multiplicidad va entre comillas junto a cada clase: `Member "1" -- "0..*" Loan`. Ver [Asociaciones y multiplicidad](../../1-teoria/01-asociaciones-y-multiplicidad.md).
- La multiplicidad de un extremo responde a: "para **un** objeto del otro lado, ¿cuántos de este?".
- Hoy no hay rombos ni flechas: solo asociaciones.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-01-asociaciones-y-multiplicidad
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/biblioteca.puml; echo $?
   ```

   Output: `0`. Abre `starter/biblioteca.svg` en el navegador: cinco clases sueltas, sin líneas.

2. **TODO 1**: socio y préstamo. Debajo del TODO escribe:

   ```plantuml
   Member "1" -- "0..*" Loan : has >
   ```

   El `"1"` está junto a `Member`: un préstamo es de **un** socio. El `"0..*"` está junto a `Loan`: un socio tiene de cero a muchos préstamos. `: has >` es el nombre de la asociación y la punta indica que se lee "Member has Loan".

   Renderiza y abre el SVG: aparece la línea con `1` cerca de `Member` y `0..*` cerca de `Loan`.

3. **TODO 2**: préstamo y ejemplar. Escribe la línea tú. Pista: piensa en un ejemplar durante un año entero, no en un instante.

   ```plantuml
   Loan "?" -- "?" Copy : lends >
   ```

   Respuesta esperada: `"0..*"` junto a `Loan` y `"1"` junto a `Copy`.

4. **TODO 3**: libro y ejemplar, con nombre `has`. Un libro sin ningún ejemplar no está en el catálogo: el extremo `Copy` es `1..*`.

5. **TODO 4**: libro y autor con **roles**. El rol va dentro de las comillas, antes o después de la multiplicidad:

   ```plantuml
   Book "books 0..*" -- "authors 1..*" Author
   ```

   Se lee: un autor tiene `books` (0 o más); un libro tiene `authors` (al menos 1). En el SVG, cada rol aparece junto a su multiplicidad.

6. **TODO 5**: asociación reflexiva. Un socio recomienda libros a otros socios. Une `Member` consigo misma con los roles `recommenders` y `recipients`, ambos `0..*`, y el nombre `recommends to >`. Sin roles, una asociación reflexiva es imposible de leer.

   Renderiza: sale un bucle sobre `Member`.

7. Cuenta las asociaciones con multiplicidad en ambos extremos:

   ```bash
   grep -cE '"[^"]+"[[:space:]]*-+[[:space:]]*"[^"]+"' starter/biblioteca.puml
   ```

   Output: `5`. Si sale menos, a alguna línea le falta una de las dos multiplicidades.

8. Crea `multiplicidades.md` en la carpeta del lab con una frase por extremo (10 frases), con este formato:

   ```markdown
   - Un Member tiene 0 o más Loan.
   - Un Loan es de exactamente 1 Member.
   ```

   Si alguna frase suena falsa en una biblioteca real, la multiplicidad está mal: corrígela.

9. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/biblioteca.puml; plantuml -checkonly starter/biblioteca.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] El SVG muestra 5 asociaciones, cada una con multiplicidad en los dos extremos
- [ ] `grep -cE` del paso 7 imprime `5`
- [ ] `Book`–`Author` y la reflexiva de `Member` llevan roles
- [ ] `multiplicidades.md` tiene 10 frases y todas son verdad en una biblioteca

## Reto extra

La biblioteca limita a 3 los préstamos **activos** por socio. ¿Puedes cambiar `0..*` por `0..3`? Piensa en los préstamos ya devueltos y escribe en `multiplicidades.md` por qué la multiplicidad no basta y dónde pondrías la regla (pista: una operación de la semana 02).

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Agregación y composición](../lab-02-agregacion-y-composicion/README.md) → |

[↑ Semana 03](../../README.md)
