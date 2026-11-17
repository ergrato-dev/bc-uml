# Proyecto Semana 08 — Paquetes, componentes y despliegue

⏱ Duración estimada: 3 h

## Objetivo

Añadir a tu modelo las tres vistas de arquitectura: los paquetes que agrupan tus clases sin ciclos, los componentes que se comunican por interfaces y el despliegue de sus artefactos en nodos.

## Antes de empezar

- Partes de tu entrega de la semana 07. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Las tres vistas tienen que contar el mismo sistema. Los paquetes salen de `02-clases.puml`; los componentes, de lo que tu sistema hace en los casos de uso y la secuencia; el despliegue, de dónde se ejecuta cada componente. No hace falta que tu dominio sea grande: con 3 paquetes, 3 componentes y 2 máquinas basta si cada decisión tiene su porqué.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| Los diagramas de clases, casos de uso, actividad, secuencia, comunicación y estados siguen en el modelo y renderizan | 0 |
| 08-paquetes.puml renderiza, es un diagrama de clases y tiene title | 1 |
| 08-paquetes.puml tiene al menos 3 paquetes | 1 |
| Los paquetes contienen al menos 6 clasificadores y todos existen en 02-clases.puml | 2 |
| Hay al menos 2 dependencias ..> entre paquetes | 3 |
| Las dependencias entre paquetes no forman ningún ciclo | 3 |
| 08-componentes.puml renderiza, es un diagrama de componentes y tiene title | 4 |
| 08-componentes.puml tiene al menos 3 componentes | 4 |
| Hay al menos 2 interfaces y cada una la provee un componente (Componente -- Interfaz) | 5 |
| Al menos una interfaz la provee un componente y la requiere otro (Componente --( Interfaz) | 5 |
| 08-despliegue.puml renderiza, es un diagrama de despliegue y tiene title | 6 |
| Hay al menos 2 nodos <<device>> | 6 |
| Hay al menos un nodo <<executionEnvironment>> dentro de otro nodo | 6 |
| Hay al menos 2 artefactos desplegados dentro de un nodo | 7 |
| Un artefacto manifiesta (<<manifest>>) un componente de 08-componentes.puml | 7 |
| Dos nodos se unen con una ruta de comunicación con etiqueta (a -- b : protocolo) | 8 |
| El README del modelo enlaza los tres diagramas de la semana 08 | 9 |
| No queda ningún TODO en los diagramas 08-*.puml | 9 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 07 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-07-maquinas_de_estados/3-proyecto/starter/. bootcamp/week-08-componentes_paquetes_y_despliegue/3-proyecto/starter/
   ls bootcamp/week-08-componentes_paquetes_y_despliegue/3-proyecto/starter/diagramas
   ```

   Output (con los nombres de tu proceso, tu caso de uso y tu entidad):

   ```
   01-modelo-conceptual.puml  05-actividad-prestar-libro.puml     07-estados-prestamo.puml
   02-clases.puml             06-comunicacion-prestar-libro.puml  08-componentes.puml
   03-objetos.puml            06-secuencia-prestar-libro.puml     08-despliegue.puml
   04-casos-de-uso.puml       08-paquetes.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 08
   ```

   Output (resumen): `5/18 comprobaciones superadas.` (con tu semana 07 copiada).

   Abre el contenedor y entra en el starter. Los pasos siguientes se ejecutan ahí:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/3-proyecto/starter
   ```

1. **TODO 1: paquetes.** En `diagramas/08-paquetes.puml`, pon el nombre de tu sistema en el `title` y sustituye `firstPackage` por entre 3 y 6 paquetes. Agrupa por lo que cambia junto en tu dominio (`catalog`, `loans`), no por tipo de clase (`entities`, `enums`).

2. **TODO 2: clases dentro.** Mete en cada paquete el nombre de las clases, enumeraciones e interfaces de `02-clases.puml` que le pertenecen, con la misma palabra clave (`class`, `abstract class`, `enum ... <<enumeration>>`, `interface ... <<interface>>`) y sin atributos ni operaciones. Comprueba que no te has inventado ni mal escrito ninguna (no debe listar nada):

   ```bash
   RE='^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+'
   comm -23 <(grep -oE "$RE" diagramas/08-paquetes.puml | awk '{print $NF}' | sort -u) <(grep -oE "$RE" diagramas/02-clases.puml | awk '{print $NF}' | sort -u)
   ```

   Output: `(sin salida)`.

3. **TODO 3: dependencias sin ciclos.** Recorre las relaciones de `02-clases.puml` que unen clases de paquetes distintos y escribe una dependencia por cada par de paquetes, del que usa al usado: `loans ..> catalog`. Encima de cada una, un comentario `'` con la relación que la provoca. Ordénalas con `tsort`:

   ```bash
   grep -E '^[a-z]+ [.]+> [a-z]+' diagramas/08-paquetes.puml | awk '{print $1, $3}' | tsort; echo $?
   ```

   Output: tus paquetes de arriba abajo y `0`. Si sale `tsort: -: input contains a loop:`, rompe el ciclo como en el lab 01 y anota en `02-clases.puml` la navegabilidad que hayas quitado.

4. **TODO 4: componentes.** En `diagramas/08-componentes.puml`, pon el `title` y sustituye `FirstComponent` por al menos 3 componentes: la aplicación que usan tus actores, las piezas de negocio y cualquier integración con un sistema externo de tu `04-casos-de-uso.puml`. Un componente puede trabajar con varios paquetes, pero no hagas uno por clase.

5. **TODO 5: interfaces.** Declara al menos 2 interfaces antes de usarlas. Cada una la provee un componente (`Loans -- LoanApi`) y al menos una la requiere otro (`WebApp --( LoanApi`). Comprueba que ninguna requerida se queda sin proveedor (no debe listar nada):

   ```bash
   f=diagramas/08-componentes.puml
   comm -23 <(grep -oE -- '--[(] [A-Za-z]+' $f | awk '{print $2}' | sort -u) <(grep -oE '^[A-Za-z]+ -- [A-Za-z]+$' $f | awk '{print $3}' | sort -u)
   ```

   Output: `(sin salida)`.

6. **TODO 6: nodos.** En `diagramas/08-despliegue.puml`, pon el `title` y declara al menos 2 dispositivos con alias (`node "Application server" <<device>> as appServer`). Dentro de cada uno, con llaves, el entorno de ejecución que corre ahí (`node "JVM 21" <<executionEnvironment>> as jvm`). Nada de `database` ni `cloud`.

7. **TODO 7: artefactos y manifest.** Dentro de los entornos, los archivos que se instalan (`artifact "loans-api.jar" as loansApi`). Declara los componentes con `component` y une cada artefacto a su componente con `loansApi ..> Loans : <<manifest>>`. Comprueba que cada componente de `08-componentes.puml` tiene artefacto y que no hay `<<manifest>>` hacia nombres que no existen (no debe listar nada):

   ```bash
   comm -3 <(grep -oE '^component [A-Za-z]+' diagramas/08-componentes.puml | awk '{print $2}' | sort) <(grep '<<manifest>>' diagramas/08-despliegue.puml | awk '{print $3}' | sort -u)
   ```

   Output: `(sin salida)`.

8. **TODO 8: rutas de comunicación.** Une con `--` los dispositivos que se comunican, con su protocolo: `webClient -- appServer : <<protocol>> HTTPS`. Hace falta una ruta por cada interfaz de `08-componentes.puml` cuyo proveedor y cuyo cliente están en máquinas distintas (la tabla del lab 05). Borra los comentarios de los TODO 1 a 8 y renderiza los tres:

   ```bash
   plantuml -checkonly diagramas/08-*.puml; echo $?
   ```

   Output: `0`.

9. **README e índice.** En la sección `## Diagramas` de `README.md`, añade los enlaces:

   ```markdown
   - [08 — Paquetes](diagramas/08-paquetes.puml)
   - [08 — Componentes](diagramas/08-componentes.puml)
   - [08 — Despliegue](diagramas/08-despliegue.puml)
   ```

   Comprueba que no queda ningún TODO (no debe listar nada):

   ```bash
   grep -n TODO diagramas/08-*.puml; echo $?
   ```

   Output: `1`.

10. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 08
    ```

    Output (resumen): `18/18 comprobaciones superadas.`

## Entrega

- [ ] `./scripts/verificar-semana.sh 08` pasa las 18 comprobaciones
- [ ] Cada clase de `02-clases.puml` está en un paquete, y cada dependencia tiene un comentario con la relación que la provoca
- [ ] Ningún componente se une a otro con `-->`: todo pasa por interfaces
- [ ] Cada componente tiene su artefacto, y cada artefacto está dentro de un nodo
- [ ] Los comentarios `'` explican por qué una clase va en su paquete, por qué un componente está separado de otro y por qué un artefacto va en su máquina

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar diagramas rotos](../2-practicas/lab-06-depurar-diagramas-rotos/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 08](../README.md)
