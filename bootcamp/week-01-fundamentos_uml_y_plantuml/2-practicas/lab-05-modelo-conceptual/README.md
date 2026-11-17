# Lab 05 — Modelo conceptual

⏱ Duración estimada: ~60 min

## Objetivo

Construir el modelo conceptual de un cine a partir de una narrativa, con conceptos y asociaciones con nombre.

## Contexto

- Un modelo conceptual muestra el **vocabulario del negocio**: qué conceptos existen y cómo se relacionan. Sin atributos, sin operaciones, sin tipos.
- Técnica clásica: los **sustantivos** de la narrativa son candidatos a concepto; los **verbos** que unen dos sustantivos son candidatos a asociación.
- Es exactamente lo que harás en el proyecto con tu dominio.

## Paso a paso

0. Abre `starter/narrativa.md` en tu editor y, en otra terminal, el contenedor:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-05-modelo-conceptual
   ```

1. Crea `candidatos.md` en la carpeta del lab con una lista de **todos** los sustantivos de la narrativa (cine, sala, fila, butaca, semana, programador, película, función, hora, cliente...). Sin filtrar todavía.

2. Filtra la lista con estas reglas y anota al lado de cada descartado la regla que aplicaste:

   | Regla | Ejemplo | Por qué se descarta |
   |---|---|---|
   | Es un valor de otro concepto | hora, fecha de vencimiento, puntos, edad | Será un **atributo** en la semana 02 |
   | Es el sistema entero | cine | No aporta: todo está dentro |
   | Es un sinónimo | taquilla y web como "canal" | Un concepto, no dos |
   | Es un actor que no guarda datos | programador | Aparecerá en casos de uso (semana 04) |

   Deberían quedarte entre 7 y 10 conceptos.

3. **TODO 1** de `starter/conceptual.puml`: declara los conceptos, uno por línea, en inglés y en singular:

   ```plantuml
   class Movie
   class Screening
   ```

   Comprueba:

   ```bash
   plantuml -syntax < starter/conceptual.puml
   ```

   Output: `CLASS` y `(N entities)` con N igual al número de conceptos que declaraste (7 o más).

4. Busca en la narrativa los verbos que unen dos de tus conceptos ("una entrada da derecho a una butaca", "el socio canjea..."). Cada uno es una asociación.

5. **TODO 2**: escribe las asociaciones, con el nombre en inglés después de ` : `:

   ```plantuml
   Movie -- Screening : is shown in
   ```

   Comprueba que todas llevan nombre. Este comando lista las asociaciones **sin** nombre; no debe imprimir nada:

   ```bash
   grep -F -- ' -- ' starter/conceptual.puml | grep -vF ' : '; echo $?
   ```

   Output:

   ```
   1
   ```

   (`1` es el código de `grep` cuando no encuentra nada: ninguna asociación sin nombre.)

6. Renderiza y lee el resultado en voz alta, de izquierda a derecha: "un cliente *makes* una compra; una compra *includes* entradas...". Si una frase no tiene sentido, la asociación está mal nombrada o une los conceptos equivocados.

   ```bash
   plantuml -tsvg starter/conceptual.puml; echo $?
   ```

   Output: `0`.

7. Borra las líneas de comentario de los TODO y comprueba que no queda ninguno:

   ```bash
   grep -c TODO starter/conceptual.puml
   ```

   Output: `0`.

## Criterios de éxito

- [ ] `plantuml -syntax < starter/conceptual.puml` imprime `CLASS` y al menos `(7 entities)`
- [ ] Al menos 6 asociaciones, todas con nombre (el `grep` del paso 5 imprime `1`)
- [ ] Ningún concepto es un valor (hora, precio, puntos): esos quedaron anotados en `candidatos.md`
- [ ] Cada asociación se lee como una frase con sentido del negocio

## Reto extra

La narrativa dice que un socio canjea 100 puntos por una entrada gratis. ¿Es "canje" un concepto o una asociación entre `MemberCard` y `Ticket`? Escribe en `candidatos.md` tu decisión y qué información te haría cambiarla.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Leer diagramas](../lab-04-leer-diagramas/README.md) | [Lab 06 — Estilo común, include y exportación](../lab-06-estilo-include-y-exportacion/README.md) → |

[↑ Semana 01](../../README.md)
