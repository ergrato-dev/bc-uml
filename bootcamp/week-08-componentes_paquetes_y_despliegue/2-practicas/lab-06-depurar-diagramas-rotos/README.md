# Lab 06 — Depurar diagramas rotos

⏱ Duración estimada: ~60 min

## Objetivo

Reparar los diagramas de componentes y de despliegue de un cine con 3 errores de sintaxis de PlantUML y 5 errores de modelado que PlantUML dibuja sin protestar.

## Contexto

- Repasa los "Errores típicos" de [Componentes e interfaces](../../1-teoria/02-componentes-e-interfaces.md) y de [Nodos y artefactos](../../1-teoria/03-nodos-y-artefactos.md).
- `starter/componentes.puml` y `starter/despliegue.puml` **no renderizan**: son los únicos starters de la semana rotos a propósito.
- Especificación: la web del cine usa la API de reservas. Reservas cobra a través de la pasarela de pagos y avisa al cliente con el servicio de notificaciones. La web corre en el navegador del cliente. Reservas y notificaciones son dos `.jar` en la JVM 21 del servidor del cine. La base de datos es PostgreSQL 17 en su propia máquina. Los pagos los hace un proveedor externo. Todas las comunicaciones van por HTTPS, salvo la de la base de datos, que va por JDBC.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-06-depurar-diagramas-rotos/starter
   ```

### Parte 1 — Sintaxis

PlantUML se detiene en el primer error de cada archivo. Corrige uno, renderiza otra vez y pasa al siguiente.

1. Renderiza los componentes:

   ```bash
   plantuml -tsvg componentes.puml; echo $?
   plantuml -syntax < componentes.puml
   ```

   Output:

   ```
   Error line 17 in file: componentes.puml
   Some diagram description contains errors
   200
   ERROR
   16
   Syntax Error? (Assumed diagram type: component)
   ```

   `-tsvg` cuenta las líneas desde 1 y `-syntax` desde 0: las dos señalan `Bookings -(( PaymentGateway`. Una interfaz requerida lleva un solo `(`. Corrígela con dos guiones, como las demás.

2. Renderiza otra vez:

   ```bash
   plantuml -tsvg componentes.puml; echo $?
   plantuml -syntax < componentes.puml
   ```

   Output:

   ```
   Error line 20 in file: componentes.puml
   Some diagram description contains errors
   200
   ERROR
   19
   This element (NotificationSender) is already defined (Assumed diagram type: component)
   ```

   La línea 20 declara `NotificationSender`, pero la línea 14 ya la había usado y PlantUML la creó entonces. Mueve la declaración arriba, con las otras dos interfaces. Renderiza: sale con `0`.

3. Renderiza el despliegue:

   ```bash
   plantuml -tsvg despliegue.puml; echo $?
   ```

   Output:

   ```
   Error line 23 in file: despliegue.puml
   Some diagram description contains errors
   200
   ```

   `Cinema server -- cinemaDb`: un nombre con espacios sin comillas. Usa el alias `cinemaServer`. Renderiza los dos:

   ```bash
   plantuml -syntax < componentes.puml; plantuml -syntax < despliegue.puml
   ```

   Output:

   ```
   DESCRIPTION
   (9 entities)
   DESCRIPTION
   (5 entities)
   ```

   Los dos renderizan. 9 entidades en componentes, cuando solo se declaran 4 componentes y 3 interfaces: sobran 2. Ahí empieza la parte 2.

### Parte 2 — Modelado

4. **Nombres que nadie declaró.** Lista los nombres que aparecen a la izquierda de una línea de interfaz y no están declarados como componente:

   ```bash
   f=componentes.puml
   comm -13 <(grep -oE '^component [A-Za-z]+' $f | awk '{print $2}' | sort) <(grep -E -- ' --[(]? ' $f | awk '{print $1}' | sort -u)
   ```

   Output:

   ```
   Bokings
   ```

   Una errata: PlantUML ha creado un componente `Bokings` que provee `BookingApi`, y `Bookings` no provee nada. Corrígela.

5. **Interfaces requeridas sin proveedor.** El mismo `comm` del lab 02:

   ```bash
   comm -23 <(grep -oE -- '--[(] [A-Za-z]+' $f | awk '{print $2}' | sort -u) <(grep -oE '^[A-Za-z]+ -- [A-Za-z]+$' $f | awk '{print $3}' | sort -u)
   ```

   Output:

   ```
   Mailer
   ```

   `Bookings` requiere `Mailer`, que nadie provee ni se declara. Según la especificación, reservas avisa con el servicio de notificaciones: cámbiala por `NotificationSender`. Repite los dos `comm`: ninguno imprime nada. `-syntax` da `(7 entities)`.

6. **Formas que no son UML.** En el despliegue:

   ```bash
   grep -nE '^(database|cloud) ' despliegue.puml
   ```

   Output:

   ```
   16:database "Cinema DB" as cinemaDb
   ```

   Sustitúyelo por un dispositivo con su entorno de ejecución y cambia la ruta `cinemaServer -- cinemaDb` para que vaya a `dbServer`:

   ```plantuml
   node "Database server" <<device>> as dbServer {
     node "PostgreSQL 17" <<executionEnvironment>> as postgres
   }
   ```

7. **Artefactos sin nodo.**

   ```bash
   awk 'd == 0 && /^[[:space:]]*artifact / {print $2} {d += gsub(/[{]/, "{") - gsub(/[}]/, "}")}' despliegue.puml
   ```

   Output:

   ```
   "notifications.jar"
   ```

   Según la especificación, va en la JVM del servidor del cine. Muévelo dentro de `jvm`, debajo de `bookings.jar`.

8. **Rutas sin protocolo.**

   ```bash
   grep -E '^[A-Za-z]+ -- [A-Za-z]+$' despliegue.puml
   ```

   Output:

   ```
   cinemaServer -- paymentProvider
   ```

   Añade `: <<protocol>> HTTPS`. Repite los comandos de los pasos 6, 7 y 8: ninguno imprime nada.

9. Comprueba:

   ```bash
   plantuml -checkonly componentes.puml despliegue.puml; echo $?
   plantuml -syntax < componentes.puml
   plantuml -syntax < despliegue.puml
   grep -c '<<protocol>>' despliegue.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (7 entities)
   DESCRIPTION
   (5 entities)
   3
   ```

10. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
    - De los 8 errores, ¿cuáles habría detectado PlantUML si los demás no existieran? ¿Qué tienen en común los otros 5?
    - ¿Por qué un `database` en el despliegue es un error de modelado y no solo de estilo?
    - Escribe una comprobación de una línea (como las de los pasos 4 a 8) que detecte un componente que no requiere ni provee ninguna interfaz.

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` para los dos archivos
- [ ] `componentes.puml` da `(7 entities)` y los dos `comm` no imprimen nada
- [ ] Ningún `database`, ningún artefacto fuera de un nodo y ninguna ruta sin protocolo
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Añade al despliegue el `<<manifest>>` de cada artefacto hacia su componente, como en el lab 05. ¿Qué componente de `componentes.puml` se queda sin artefacto? ¿Dónde lo desplegarías?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Del componente al despliegue](../lab-05-del-componente-al-despliegue/README.md) | [Proyecto — Paquetes, componentes y despliegue](../../3-proyecto/README.md) → |

[↑ Semana 08](../../README.md)
