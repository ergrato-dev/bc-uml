# Lab 06 — Depurar casos de uso rotos

⏱ Duración estimada: ~60 min

## Objetivo

Reparar un diagrama de casos de uso que no renderiza y, cuando renderice, corregir sus errores de modelado.

## Contexto

- `starter/tienda.puml` tiene **2 errores de sintaxis** y al menos **9 errores de modelado**.
- `plantuml -syntax` cuenta las líneas desde 0; `plantuml -tsvg`, desde 1.
- Repasa las secciones "Errores frecuentes" de los tres archivos de [teoría](../../1-teoria/01-actores-y-casos-de-uso.md).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-06-depurar-casos-de-uso-rotos
   ```

1. Renderiza:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   ```

   Output:

   ```
   Error line 17 in file: starter/tienda.puml
   Some diagram description contains errors
   200
   ```

   Línea 17: `usecase "Ship order as CU04`. Faltan las comillas de cierre del nombre. Corrígelo: `usecase "Ship order" as CU04`.

2. Vuelve a renderizar:

   ```
   Error line 22 in file: starter/tienda.puml
   Some diagram description contains errors
   200
   ```

   La línea 22 cierra el `rectangle` con `)` en lugar de `}`. Corrígelo y renderiza otra vez:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   ```

   Output: `0`. Abre `starter/tienda.svg`.

3. Crea `revision.md` con una tabla `| Línea | Error | Regla que rompe | Corrección |` y añade una fila por error. Revisa con estas preguntas:
   - **Actores:** ¿hay alguno dentro del rectángulo? ¿Alguno es una pieza del sistema? ¿Dos actores asociados entre sí?
   - **Casos de uso:** ¿alguno es un paso de interfaz o agrupa demasiado?
   - **Asociaciones:** ¿alguna lleva flecha? ¿Hay líneas entre casos que expresan orden ("primero pido, luego pago, luego envío")?
   - **Include y extend:** ¿la flecha sale del lado correcto? ¿Son discontinuas y con el estereotipo bien escrito? ¿Tiene sentido lo que incluyen?

4. Corrige `starter/tienda.puml`. Al terminar deben quedar 3 actores fuera del sistema (`Customer`, un empleado de almacén con nombre de rol y `Shipping`), 6 casos de uso y estas relaciones: el cliente con pedir, pagar y devolver; `Place order` incluye `Check stock`; `Apply coupon` extiende `Place order`; el empleado con `Ship order`; `Ship order` con `Shipping`.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/tienda.puml; echo $?
   plantuml -syntax < starter/tienda.puml
   grep -cE -- '-->' starter/tienda.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (9 entities)
   0
   ```

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `plantuml -syntax` imprime `(9 entities)`
- [ ] Ningún actor dentro del rectángulo, ninguna asociación con flecha (`0`) y ninguna línea entre casos salvo include y extend
- [ ] Include desde `Place order` y extend hacia `Place order`, los dos con `..>`
- [ ] `revision.md` tiene al menos 9 errores de modelado, cada uno con la regla que rompe

## Reto extra

Escribe en `revision.md` qué parte del orden "pedir, pagar, enviar" que expresaban las flechas borradas se pierde, y dónde la vas a modelar (pista: semana 05).

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Especificación textual](../lab-05-especificacion-textual/README.md) | [Proyecto — Casos de uso de tu dominio](../../3-proyecto/README.md) → |

[↑ Semana 04](../../README.md)
