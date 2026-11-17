# Lab 06 — Depurar patrones rotos

⏱ Duración estimada: ~60 min

## Objetivo

Encontrar y corregir los errores de sintaxis, los errores de modelado de un patrón Observer y las diferencias entre ese diagrama y su código.

## Contexto

- Repaso: [Patrones GoF en UML](../../1-teoria/03-patrones-gof-en-uml.md), apartados "Observer" y "Errores típicos", y [Del diagrama al código](../../1-teoria/01-del-diagrama-al-codigo.md).
- `starter/avisos.puml` **no renderiza**: tiene 3 errores de sintaxis y, detrás, 5 errores de modelado. El código de `starter/java/` y `starter/python/` (el mismo en dos lenguajes) compila, pero no cuenta lo mismo que el diagrama.
- Especificación: cuando se libera una butaca de una función, el cine avisa a la lista de espera y a la pantalla de la taquilla. Los avisos por SMS se retiraron el mes pasado. El diagrama manda: si el código tiene algo que el diagrama no tiene y la especificación no lo pide, sobra.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-06-depurar-patrones-rotos
   ```

### Errores de sintaxis

1. Renderiza:

   ```bash
   plantuml -tsvg starter/avisos.puml; echo $?
   ```

   Output:

   ```
   Error line 25 in file: starter/avisos.puml
   Some diagram description contains errors
   200
   ```

   **Error 1.** Línea 25: `class <<ConcreteObserver>> WaitingList {`. El estereotipo va detrás del nombre. Corrígelo y renderiza de nuevo:

   ```
   Error line 29 in file: starter/avisos.puml
   Some diagram description contains errors
   200
   ```

2. **Error 2.** Línea 29: `class BoxOfficeDisplay <<ConcreteObserver>> {`. La línea está bien, pero la llave que abre no se cierra nunca, y PlantUML señala la clase que dejó abierta. Añade `}` debajo de la operación y renderiza:

   ```
   Error line 33 in file: starter/avisos.puml
   Some diagram description contains errors
   200
   ```

3. **Error 3.** Línea 33: `Screening --> 0..* WaitingList : notifies >`. Las multiplicidades van entre comillas: `"0..*"`. Corrige y renderiza:

   ```bash
   plantuml -tsvg starter/avisos.puml; echo $?
   plantuml -syntax < starter/avisos.puml
   ```

   Output:

   ```
   0
   CLASS
   (5 entities)
   ```

   Renderiza, pero no es un Observer correcto. Abre `starter/avisos.svg`.

### Errores de modelado

4. Revisa roles, relaciones y notación:

   ```bash
   for r in Subject Observer ConcreteObserver; do grep -c "<<$r>>" starter/avisos.puml; done
   grep -c Observable starter/avisos.puml
   grep -cE '^interface [A-Za-z]+ <<interface>>' starter/avisos.puml
   grep -E '^Screening --> ' starter/avisos.puml
   grep -E '<[|][.]+' starter/avisos.puml
   ```

   Output:

   ```
   0
   1
   2
   1
   0
   Screening --> "0..*" WaitingList : notifies >
   ScreeningObserver <|.. WaitingList
   BoxOfficeDisplay <|.. ScreeningObserver
   ScreeningObserver <|... WaitingList
   ```

   Cinco problemas:
   - **Error 4.** No hay `<<Subject>>`: `Screening` dice `<<Observable>>`. El rol se escribe con el nombre del catálogo GoF.
   - **Error 5.** `interface ScreeningObserver <<Observer>>` no lleva `<<interface>>`. Con `hide circle`, nada distingue la interfaz de una clase.
   - **Error 6.** `Screening` se asocia con `WaitingList`, una clase concreta. El sujeto solo conoce la interfaz: `Screening --> "0..*" ScreeningObserver : notifies >`.
   - **Error 7.** `BoxOfficeDisplay <|.. ScreeningObserver` está al revés: dice que la interfaz realiza a la pantalla. El triángulo va junto a la interfaz: `ScreeningObserver <|.. BoxOfficeDisplay`.
   - **Error 8.** `ScreeningObserver <|... WaitingList` repite la realización de la línea anterior con otra longitud de flecha. Bórrala.

   Corrige los cinco y repite los comandos:

   ```
   1
   1
   2
   0
   1
   Screening --> "0..*" ScreeningObserver : notifies >
   ScreeningObserver <|.. WaitingList
   ScreeningObserver <|.. BoxOfficeDisplay
   ```

### Diagrama frente a código

5. Compara las clases del código con las del diagrama. La primera columna son las que solo están en el código; la segunda, tras un tabulador, las que solo están en el diagrama:

   ```bash
   C=starter/java      # o bien: C=starter/python
   comm -3 <(grep -rhoIE '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' $C | awk '{print $2}' | sort -u) <(grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/avisos.puml | awk '{print $NF}' | sort -u)
   ```

   Output:

   ```
   SmsAlert
   ```

   **Error 9.** `SmsAlert` está en el código y no en el diagrama. La especificación dice que los SMS se retiraron: borra la clase (`java/SmsAlert.java` o la clase `SmsAlert` de `python/avisos.py`). Repite el `comm`: `(sin salida)`.

6. Lista las clases del código que declaran que cumplen `ScreeningObserver`:

   ```bash
   grep -rhIE 'class[[:space:]]+[A-Za-z]+[^A-Za-z0-9_].*ScreeningObserver' $C | grep -oE 'class[[:space:]]+[A-Za-z]+' | awk '{print $2}' | sort
   ```

   Output:

   ```
   WaitingList
   ```

   **Error 10.** El diagrama dice `ScreeningObserver <|.. BoxOfficeDisplay`, pero en el código `BoxOfficeDisplay` tiene el método y no declara la interfaz. `Screening` no podría registrarla con `attach`. Añade `implements ScreeningObserver` (Java) o `(ScreeningObserver)` (Python) y repite el `grep`:

   ```
   BoxOfficeDisplay
   WaitingList
   ```

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué PlantUML no avisa de los errores 4 a 8?
   - En el error 10, el método `seatReleased` ya existía en `BoxOfficeDisplay`. ¿Por qué no basta?
   - En el error 9, ¿cuándo habría sido correcto añadir `SmsAlert` al diagrama en lugar de borrarla del código?

## Criterios de éxito

- [ ] `plantuml -checkonly starter/avisos.puml` sale con `0` y `-syntax` da `(5 entities)`
- [ ] `<<Subject>>`, `<<interface>> <<Observer>>` y dos `<<ConcreteObserver>>`, sin `<<Observable>>`
- [ ] `Screening` solo se asocia con `ScreeningObserver` y hay exactamente dos realizaciones, con el triángulo junto a la interfaz
- [ ] El `comm -3` no imprime nada y las dos clases concretas declaran `ScreeningObserver` en el código
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Escribe un `.puml` roto para un compañero con un Strategy: un error de sintaxis, dos de modelado (por ejemplo, el contexto apuntando a una estrategia concreta) y una diferencia con el código. Intercambiadlos y comparad cuánto tardáis.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Adapter y Factory Method](../lab-05-adapter-y-factory-method/README.md) | [Proyecto — De UML a código y patrones](../../3-proyecto/README.md) → |

[↑ Semana 09](../../README.md)
