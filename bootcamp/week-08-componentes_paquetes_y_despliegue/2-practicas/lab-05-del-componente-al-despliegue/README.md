# Lab 05 — Del componente al despliegue

⏱ Duración estimada: ~60 min

## Objetivo

Cruzar el diagrama de componentes de una tienda con su diagrama de despliegue y corregir los eslabones rotos: componentes sin artefacto, artefactos sin nodo e interfaces que cruzan máquinas sin ruta de comunicación.

## Contexto

- Sintaxis y reglas: [Nodos y artefactos](../../1-teoria/03-nodos-y-artefactos.md), apartado "Tres vistas, un sistema".
- `starter/componentes.puml` está bien y no lo tocas: es la referencia. `starter/despliegue.puml` renderiza, pero no cuenta lo mismo.
- Especificación: la tienda web corre en el navegador del cliente. Pedidos y catálogo son dos `.jar` en la JVM del servidor de la tienda. Los pagos los hace un proveedor externo en su propia plataforma.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-05-del-componente-al-despliegue
   ```

1. Renderiza los dos diagramas:

   ```bash
   plantuml -tsvg starter/componentes.puml; echo $?
   plantuml -syntax < starter/componentes.puml
   plantuml -tsvg starter/despliegue.puml; echo $?
   plantuml -syntax < starter/despliegue.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (7 entities)
   0
   DESCRIPTION
   (7 entities)
   ```

   Los dos renderizan. PlantUML no sabe que hablan del mismo sistema: eso lo compruebas tú.

2. **TODO 1 — Componentes y artefactos.** Cada componente tiene que tener un artefacto que lo manifieste, y no puede haber `<<manifest>>` hacia componentes que no existen. `comm -3` compara las dos listas: la primera columna son los componentes sin artefacto y la segunda, tras un tabulador, los `<<manifest>>` hacia nombres que no están en `componentes.puml`:

   ```bash
   cd starter
   comm -3 <(grep -oE '^component [A-Za-z]+' componentes.puml | awk '{print $2}' | sort) <(grep '<<manifest>>' despliegue.puml | awk '{print $3}' | sort -u)
   ```

   Output:

   ```
   Catalog
   	Payment
   Payments
   ```

   Dos problemas:
   - `Payment` y `Payments` son el mismo componente mal escrito. PlantUML ha creado un componente nuevo sin avisar. Corrige `component Payment` y el `<<manifest>>` de `paymentsJar` en `despliegue.puml`.
   - `Catalog` no lo manifiesta nadie, aunque `catalog.jar` existe. Añade `component Catalog` y `catalogJar ..> Catalog : <<manifest>>`.

   Repite el `comm`:

   ```
   (sin salida)
   ```

3. **TODO 2 — Artefactos sin nodo.** Lista los artefactos que no están dentro de ninguna llave:

   ```bash
   awk 'd == 0 && /^[[:space:]]*artifact / {print $2} {d += gsub(/[{]/, "{") - gsub(/[}]/, "}")}' despliegue.puml
   ```

   Output:

   ```
   "catalog.jar"
   ```

   Un artefacto suelto no dice dónde se ejecuta. Según la especificación, va en la JVM del servidor de la tienda. Muévelo dentro de `jvm`, debajo de `orders.jar`. Repite el `awk`:

   ```
   (sin salida)
   ```

4. **TODO 3 — Rutas para las interfaces.** Lista las interfaces requeridas:

   ```bash
   grep -E -- '--[(] ' componentes.puml
   ```

   Output:

   ```
   WebShop --( OrderApi
   WebShop --( ProductQuery
   Orders --( PaymentGateway
   Orders --( ProductQuery
   ```

   Para cada una, busca quién la provee y en qué máquina está cada componente (sigue el `<<manifest>>` hasta el artefacto y el artefacto hasta su nodo):

   | Requiere | Está en | Provee | Está en | ¿Ruta? |
   |---|---|---|---|---|
   | WebShop | customer | Orders | shopServer | `customer -- shopServer` ✓ |
   | WebShop | customer | Catalog | shopServer | la misma ✓ |
   | Orders | shopServer | Payments | paymentProvider | falta |
   | Orders | shopServer | Catalog | shopServer | no hace falta: misma máquina |

   Añade la que falta debajo de la ruta existente:

   ```plantuml
   shopServer -- paymentProvider : <<protocol>> HTTPS
   ```

   Borra los comentarios de los TODO y renderiza: tres máquinas unidas por dos rutas.

5. Comprueba (sigues dentro de `starter`):

   ```bash
   plantuml -checkonly despliegue.puml; echo $?
   plantuml -syntax < despliegue.puml
   grep -c '<<manifest>>' despliegue.puml
   grep -c '<<protocol>>' despliegue.puml
   grep -c TODO despliegue.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (8 entities)
   4
   2
   0
   ```

   4 artefactos y 4 componentes: uno por uno, y cada interfaz que cruza de máquina tiene su ruta.

6. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué PlantUML no protestó por `Payment`? ¿Qué habría pasado en un diagrama con 20 componentes?
   - `Orders --( ProductQuery` no necesita ruta. ¿Qué cambiaría si `catalog.jar` pasara a otra máquina?
   - ¿Puede un artefacto manifestar dos componentes? ¿Y un componente estar manifestado por dos artefactos? Pon un ejemplo de cada caso.

## Criterios de éxito

- [ ] `plantuml -checkonly despliegue.puml` sale con `0` y `-syntax` da `(8 entities)`
- [ ] `comm -3` no imprime nada: cada componente tiene su artefacto
- [ ] El `awk` no imprime nada: ningún artefacto fuera de un nodo
- [ ] Una ruta con `<<protocol>>` entre cada par de máquinas que se usan interfaces
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La tienda quiere escalar: dos servidores iguales con la JVM y los mismos `.jar`, detrás de un balanceador. ¿Duplicas los nodos en el diagrama o basta con una nota? ¿Qué ruta nueva aparece?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Nodos y artefactos](../lab-04-nodos-y-artefactos/README.md) | [Lab 06 — Depurar diagramas rotos](../lab-06-depurar-diagramas-rotos/README.md) → |

[↑ Semana 08](../../README.md)
