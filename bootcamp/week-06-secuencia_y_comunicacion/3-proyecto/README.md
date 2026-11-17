# Proyecto Semana 06 — Secuencia y comunicación de un caso de uso

⏱ Duración estimada: 3 h

## Objetivo

Modelar con un diagrama de secuencia y uno de comunicación la interacción de objetos que realiza un caso de uso de tu dominio, con sus flujos alternativos como fragmentos, trazada hacia tus casos de uso y tu diagrama de clases.

## Antes de empezar

- Partes de tu entrega de la semana 05. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Elige **un caso de uso que tenga especificación** en `casos-de-uso/CU-NN.md`, con al menos un flujo alternativo y en el que nazca un objeto del dominio (una reserva, un pedido, una cita). Suele ser el caso principal de tu proceso núcleo.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| 02-clases.puml, 04-casos-de-uso.puml y el diagrama de actividad siguen en el modelo y renderizan | 0 |
| Hay exactamente un diagrama 06-secuencia-<caso-de-uso>.puml con el caso de uso en kebab-case | 1 |
| El diagrama de secuencia renderiza sin errores | 1 |
| Es un diagrama de secuencia con title | 1 |
| Al menos 4 lifelines y una de ellas es el actor que inicia el caso de uso | 2 |
| Al menos 2 lifelines participant y cada una es una clase de 02-clases.puml | 2 |
| Al menos 5 mensajes síncronos (->) que llaman a una operación con paréntesis | 3 |
| Al menos 2 mensajes de respuesta (-->) | 3 |
| Al menos un mensaje asíncrono (->>) | 4 |
| Se crea un objeto durante la interacción (create y mensaje <<create>> con -->>) | 5 |
| Hay al menos un fragmento alt con su else | 6 |
| Todo alt, opt, loop y break lleva guarda y ninguna guarda va entre corchetes | 6 |
| Hay al menos otro fragmento: opt, loop, par o break | 7 |
| Hay exactamente un 06-comunicacion-<caso-de-uso>.puml, renderiza, tiene title y es de objetos | 8 |
| El diagrama de comunicación tiene al menos 5 mensajes numerados y alguno anidado (1.1) | 9 |
| El title de secuencia y comunicación cita el mismo caso de uso y ese CU existe en 04-casos-de-uso.puml | 10 |
| El README.md del modelo enlaza los dos diagramas de la semana | 11 |
| No quedan TODO en los diagramas de la semana | 11 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 05 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter/. bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter/
   ls bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter/diagramas
   ```

   Output (con el nombre de tu proceso en el archivo 05):

   ```
   01-modelo-conceptual.puml  03-objetos.puml        05-actividad-prestar-libro.puml  06-secuencia-CASO.puml
   02-clases.puml             04-casos-de-uso.puml   06-comunicacion-CASO.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 06
   ```

   Output (resumen): `4/18 comprobaciones superadas.` (con tu semana 05 copiada).

1. **TODO 1: nombre y título.** Ponle al caso de uso un nombre corto en kebab-case, en español como el resto de archivos (`prestar-libro`, `agendar-cita`). Renombra el archivo:

   ```bash
   mv bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter/diagramas/06-secuencia-CASO.puml bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter/diagramas/06-secuencia-prestar-libro.puml
   ```

   (con el nombre de tu caso de uso). Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter
   ```

   Cambia el `title` por `<Tu sistema> — CUxx <caso de uso en inglés> (secuencia)`, con el alias que tiene en `04-casos-de-uso.puml` (`CU02`). Renderiza:

   ```bash
   plantuml -tsvg diagramas/06-secuencia-*.puml; plantuml -syntax < diagramas/06-secuencia-*.puml
   ```

   Output:

   ```
   SEQUENCE
   (1 participants)
   ```

2. **TODO 2: lifelines.** Cambia `actor Actor` por el actor que inicia el caso de uso, con el mismo nombre que en `04-casos-de-uso.puml`. Después, en orden de izquierda a derecha: una `boundary` (pantalla, quiosco o pasarela por donde entra el actor), una `control` (el servicio que coordina) y los objetos del dominio con `participant ":Clase" as alias`. Cada `:Clase` tiene que estar en tu `02-clases.puml`. Comprueba:

   ```bash
   plantuml -syntax < diagramas/06-secuencia-*.puml
   for n in $(grep -hE '^[[:space:]]*participant[[:space:]]' diagramas/06-secuencia-*.puml | grep -oE ':[A-Z][A-Za-z0-9]*' | cut -c2- | sort -u); do grep -qE "class[[:space:]]+$n([^A-Za-z0-9]|$)" diagramas/02-clases.puml || echo "falta $n"; done; echo fin
   ```

   Output: `(4 participants)` o más, y `fin` sin ningún `falta X` antes. Si sale `falta X`, o el objeto no es del dominio (usa `boundary` o `control`) o tu diagrama de clases tiene un hueco: complétalo.

3. **TODO 3: mensajes síncronos y respuestas.** Recorre el flujo principal de `CU-NN.md` paso a paso. Cada paso del sistema se convierte en uno o varios mensajes síncronos `a -> b : operacion(args)`. Cuando el valor devuelto se usa después, dibuja la respuesta `b --> a : valor`.

   Cada mensaje que llega a un objeto del dominio es una operación de su clase. **Si la operación no está en `02-clases.puml`, añádela** con parámetros tipados y tipo de retorno, y deja un comentario `'` que diga que salió de esta secuencia. Cuenta:

   ```bash
   grep -cE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:[[:space:]]*[a-z][A-Za-z0-9]*[(]' diagramas/06-secuencia-*.puml
   grep -cE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*-->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:' diagramas/06-secuencia-*.puml
   ```

   Output: `5` o más y `2` o más. Añade `activate` y `deactivate` al boundary y al control.

4. **TODO 4: asíncrono.** ¿Qué envía el sistema sin esperar? Un aviso, un correo, una petición a un sistema externo. Dibújalo con `->>` hacia una `boundary` (`:NotificationGateway`, `:MailGateway`) y deja un comentario `'` que diga por qué no espera.

5. **TODO 5: creación.** El objeto que nace en este caso de uso (la postcondición de `CU-NN.md` suele nombrarlo) no existe al principio. Declara su lifeline arriba y créalo en su sitio:

   ```plantuml
   create loan
   svc -->> loan : <<create>> Loan(copy, memberId)
   ```

   Renderiza y comprueba en el SVG que su caja baja hasta el mensaje `«create»`.

6. **TODO 6: alt.** Elige un flujo alternativo de `CU-NN.md` (`2a.`, `3a.`) y dibuja las dos ramas con `alt` y `else else`. La guarda se escribe con palabras del dominio y sin corchetes. Si el flujo alternativo termina el caso de uso, puede ser un `break` en vez de un `alt`, pero el autograding pide al menos un `alt`. Comprueba las guardas (no debe listar nada):

   ```bash
   grep -nE '^[[:space:]]*((alt|opt|loop|break)[[:space:]]*$|(alt|else|opt|loop|break)[[:space:]]*[[])' diagramas/06-secuencia-*.puml; echo $?
   ```

   Output: `1`.

7. **TODO 7: otro fragmento.** Otro flujo alternativo, una repetición o un paso independiente: `opt`, `loop`, `par` o `break`. Si tu caso de uso incluye otro (`<<include>>`), añade también su `ref over ... : CUxx <nombre>`. Borra los comentarios de los TODO 1 a 7 y renderiza: revisa en el SVG que cada `end` cierra el fragmento que esperas.

8. **TODO 8: comunicación.** Renombra el segundo archivo con el mismo nombre de caso de uso:

   ```bash
   mv diagramas/06-comunicacion-CASO.puml diagramas/06-comunicacion-prestar-libro.puml
   ```

   Copia el `title` de la secuencia cambiando `(secuencia)` por `(comunicación)`. Cambia `actor Actor` por tu actor y declara los mismos objetos que en la secuencia con `object ":Clase" as alias` (`<<boundary>>` y `<<control>>` donde toque). Comprueba:

   ```bash
   plantuml -checkonly diagramas/06-comunicacion-*.puml; echo $?
   plantuml -syntax < diagramas/06-comunicacion-*.puml
   ```

   Output: `0`, `CLASS` y `(N entities)` con el mismo número de lifelines que la secuencia.

9. **TODO 9: enlaces numerados.** Recorre el flujo principal de tu secuencia (sin las ramas de los fragmentos) y escribe un enlace por pareja de objetos, empezando por quien envía:

   ```plantuml
   ui -- svc : "1.1: lend(barcode, memberId) >"
   svc -- copy : "1.1.1: isAvailable()\n1.1.3: markAsLent() >"
   ```

   Numeración decimal: `1` lo envía el actor, `1.1` se envía mientras se atiende `1`, `1.1.1` mientras se atiende `1.1`. Sin respuestas. Cuenta:

   ```bash
   grep -cE ':[[:space:]]*"[0-9]+([.][0-9]+)*:' diagramas/06-comunicacion-*.puml
   ```

   Output: `5` o más.

10. **Trazabilidad.** El `title` de los dos diagramas cita el mismo alias, y ese alias existe en `04-casos-de-uso.puml`:

    ```bash
    grep -hE '^title' diagramas/06-*.puml | grep -oE 'CU-?[0-9]{2}'
    grep -nE 'as[[:space:]]+CU02([[:space:]]|$)' diagramas/04-casos-de-uso.puml
    ```

    Output: el mismo alias dos veces y la línea del caso de uso en `04-casos-de-uso.puml` (con tu alias en vez de `CU02`).

11. **README e índice.** En la sección `## Diagramas` de `README.md`, añade los enlaces:

    ```markdown
    - [06 — Secuencia: prestar un libro (CU02)](diagramas/06-secuencia-prestar-libro.puml)
    - [06 — Comunicación: prestar un libro (CU02)](diagramas/06-comunicacion-prestar-libro.puml)
    ```

    Borra los comentarios de los TODO que queden. Comprueba que no queda ninguno (no debe listar nada):

    ```bash
    grep -n TODO diagramas/06-*.puml; echo $?
    ```

    Output: `1`.

12. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 06
    ```

    Output (resumen): `18/18 comprobaciones superadas.`

## Entrega

- [ ] `./scripts/verificar-semana.sh 06` pasa las 18 comprobaciones
- [ ] La secuencia sigue el flujo principal de `CU-NN.md` y sus fragmentos salen de flujos alternativos reales
- [ ] Cada mensaje a un objeto del dominio es una operación que existe en `02-clases.puml`
- [ ] La comunicación cuenta la misma interacción que la secuencia, con un enlace por pareja
- [ ] Los comentarios `'` explican por qué un mensaje es asíncrono y de qué flujo alternativo sale cada fragmento

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar secuencias rotas](../2-practicas/lab-06-depurar-secuencias-rotas/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 06](../README.md)
