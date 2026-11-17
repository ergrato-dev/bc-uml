# Lab 04 — Nodos y artefactos

⏱ Duración estimada: ~60 min

## Objetivo

Convertir el borrador de despliegue de una biblioteca en un diagrama UML con dispositivos, entornos de ejecución, artefactos desplegados y rutas de comunicación con su protocolo.

## Contexto

- Sintaxis y reglas: [Nodos y artefactos](../../1-teoria/03-nodos-y-artefactos.md).
- `starter/despliegue.puml` renderiza, pero sus nodos no dicen si son máquinas o software, los archivos están sueltos y la base de datos es un cilindro que UML no define.
- Especificación: el quiosco de autopréstamo es un PC con Windows 11 que ejecuta `kiosk-app.exe`. El servidor de la biblioteca ejecuta `library-api.jar` en una JVM 21. La base de datos es PostgreSQL 17, en su propia máquina, con el esquema `library-schema.sql`. El quiosco habla con el servidor por HTTPS y el servidor con la base de datos por JDBC.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-04-nodos-y-artefactos
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/despliegue.puml; echo $?
   plantuml -syntax < starter/despliegue.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (7 entities)
   ```

   Abre `starter/despliegue.svg`: tres cajas en 3D, un cilindro y tres archivos sin sitio.

2. **TODO 1 — Dispositivos y alias.** Las tres son máquinas. Añade `<<device>>` y un alias sin espacios a cada una:

   ```plantuml
   node "Self-service kiosk" <<device>> as kiosk
   node "Library server" <<device>> as server
   node "Database server" <<device>> as dbServer
   ```

   Cambia las dos líneas del final para que usen los alias: `kiosk -- server` y `server --> "Library DB"`. Si te dejas las comillas en un nombre con espacios, por ejemplo `Self-service kiosk -- server`:

   ```bash
   plantuml -tsvg starter/despliegue.puml; echo $?
   ```

   Output:

   ```
   Error line 18 in file: starter/despliegue.puml
   Some diagram description contains errors
   200
   ```

   Con los alias bien escritos, `-syntax` sigue dando `(7 entities)` y cada caja muestra `«device»` encima del nombre.

3. **TODO 2 — Entornos de ejecución.** Cada máquina ejecuta un software base. Va dentro del dispositivo, así que el `node` del dispositivo abre llaves:

   ```plantuml
   node "Library server" <<device>> as server {
     node "JVM 21" <<executionEnvironment>> as jvm
   }
   ```

   Haz lo mismo con `"Windows 11"` (alias `windows`) en el quiosco y `"PostgreSQL 17"` (alias `postgres`) en el servidor de base de datos. El gestor de base de datos ya está representado, así que borra `database "Library DB"` y la flecha `server --> "Library DB"`. Renderiza:

   ```bash
   plantuml -tsvg starter/despliegue.puml; plantuml -syntax < starter/despliegue.puml
   ```

   Output:

   ```
   DESCRIPTION
   (6 entities)
   ```

   Ya no hay cilindro: el cilindro de PlantUML no es UML, y PostgreSQL es un entorno de ejecución como la JVM.

4. **TODO 3 — Artefactos desplegados.** Mueve cada artefacto dentro del entorno que lo ejecuta, con su alias:

   ```plantuml
   node "JVM 21" <<executionEnvironment>> as jvm {
     artifact "library-api.jar" as libraryApi
   }
   ```

   `kiosk-app.exe` (alias `kioskApp`) va en `windows` y `library-schema.sql` (alias `schema`) en `postgres`. Renderiza:

   ```bash
   plantuml -tsvg starter/despliegue.puml; plantuml -syntax < starter/despliegue.puml
   ```

   Output:

   ```
   DESCRIPTION
   (3 entities)
   ```

   PlantUML solo cuenta lo que no contiene nada: los tres artefactos. En el SVG, cada archivo está dentro de su entorno y cada entorno dentro de su máquina.

5. **TODO 4 — Rutas de comunicación.** Una línea continua entre dispositivos con el protocolo:

   ```plantuml
   kiosk -- server : <<protocol>> HTTPS
   server -- dbServer : <<protocol>> JDBC
   ```

   Sin flecha: la ruta une dos máquinas, no dice quién llama. Borra los comentarios de los TODO y renderiza.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/despliegue.puml; echo $?
   grep -c '<<device>>' starter/despliegue.puml
   grep -c '<<executionEnvironment>>' starter/despliegue.puml
   awk 'd > 0 && /^[[:space:]]*artifact / {n++} {d += gsub(/[{]/, "{") - gsub(/[}]/, "}")} END {print n}' starter/despliegue.puml
   grep -c '<<protocol>>' starter/despliegue.puml
   grep -cE '^(database|cloud) ' starter/despliegue.puml
   ```

   Output:

   ```
   0
   3
   3
   3
   2
   0
   ```

   El `awk` cuenta los artefactos que están dentro de unas llaves: los 3. El último `grep` confirma que no queda ninguna forma que no sea UML.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `JVM 21` es un nodo y `library-api.jar` no?
   - El quiosco no habla con la base de datos. ¿Dónde lo dice el diagrama?
   - Si la biblioteca pasa la API a un contenedor Docker en el mismo servidor, ¿qué nodo añades y dónde?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 3 dispositivos con alias, cada uno con su entorno de ejecución dentro
- [ ] 3 artefactos, cada uno dentro de su entorno
- [ ] 2 rutas de comunicación con `<<protocol>>` y ningún `database`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La biblioteca añade una copia de seguridad diaria: un script `backup.sh` que corre en otra máquina y copia la base de datos por SSH a un almacenamiento externo. Añádelo. ¿Cuántos nodos nuevos necesitas? ¿Qué rutas?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Puertos y delegación](../lab-03-puertos-y-delegacion/README.md) | [Lab 05 — Del componente al despliegue](../lab-05-del-componente-al-despliegue/README.md) → |

[↑ Semana 08](../../README.md)
