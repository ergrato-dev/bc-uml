# Lab 01 — Actores y límite del sistema

⏱ Duración estimada: ~60 min

## Objetivo

Separar los actores reales de los candidatos falsos y dibujar el límite del sistema de préstamos de una biblioteca.

## Contexto

- Un actor es un **rol externo**: ni una persona concreta ni una pieza del propio sistema. Ver [Actores y casos de uso](../../1-teoria/01-actores-y-casos-de-uso.md).
- Enunciado del cliente: *"Ana, como cualquier socio, renueva sus préstamos y paga sus multas desde la web; el pago lo procesa la pasarela del banco. En el mostrador, el bibliotecario registra los préstamos. Cada noche el sistema envía recordatorios a quien tiene un préstamo vencido. Todo se guarda en la base de datos del módulo de préstamos."*
- El starter tiene ya los casos de uso; tú decides quién está fuera.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-01-actores-y-limite-del-sistema
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/biblioteca.puml; echo $?
   plantuml -syntax < starter/biblioteca.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (8 entities)
   ```

   `DESCRIPTION` es como PlantUML llama a los diagramas de casos de uso. Abre `starter/biblioteca.svg`: cuatro muñecos y cuatro óvalos sueltos, sin límite.

2. Crea `actores.md` en la carpeta del lab. Subraya mentalmente cada sustantivo del enunciado que hace o recibe algo y clasifícalo en una tabla: `| Candidato | ¿Actor? | Por qué |`. Al menos 7 filas (Ana, socio, bibliotecario, pasarela, noche/reloj, base de datos, módulo de préstamos).

3. **TODO 1**: cambia `actor Ana` por `actor Member`. Ana es una persona; el rol es el de socio.

4. **TODO 2**: borra `actor Database` y `actor "Loan Module" as LoanModule`. Son piezas del sistema: van dentro del límite y no se dibujan en este diagrama.

5. **TODO 3**: la pasarela es otro sistema que el tuyo no controla:

   ```plantuml
   actor "Payment Gateway" as PaymentGateway <<system>>
   ```

   Las comillas permiten un nombre con espacios; el alias es el que usarás en las asociaciones.

6. **TODO 4**: añade `actor Clock`. Los recordatorios no los pide nadie: los dispara el tiempo.

7. **TODO 5**: el límite. Envuelve los cuatro `usecase` en:

   ```plantuml
   rectangle "Library System" {
     usecase "Borrow book" as CU01
     ...
   }
   ```

   Añade `left to right direction` si lo borraste. Renderiza: los óvalos quedan dentro de una caja con nombre y los actores fuera.

8. **TODO 6**: asociaciones, con `--` y sin flecha:

   ```plantuml
   Member -- CU02
   Member -- CU03
   CU03 -- PaymentGateway
   Clock -- CU04
   ```

   Escribir `CU03 -- PaymentGateway` (caso a la izquierda) coloca la pasarela a la derecha: es un actor secundario.

9. Comprueba los actores:

   ```bash
   grep -E '^[[:space:]]*actor' starter/biblioteca.puml
   ```

   Output:

   ```
   actor Member
   actor Librarian
   actor "Payment Gateway" as PaymentGateway <<system>>
   actor Clock
   ```

10. Borra los TODO y valida:

    ```bash
    grep -c TODO starter/biblioteca.puml; plantuml -checkonly starter/biblioteca.puml; echo $?
    ```

    Output: `0` y `0`.

## Criterios de éxito

- [ ] El SVG muestra 4 actores fuera del rectángulo `Library System` y 4 casos de uso dentro
- [ ] No quedan `Ana`, `Database` ni `LoanModule`; `PaymentGateway` lleva `<<system>>`
- [ ] Cada caso de uso tiene al menos un actor asociado
- [ ] `actores.md` justifica los 7 candidatos

## Reto extra

El bibliotecario también es socio de la biblioteca y se lleva libros. ¿Añades una asociación `Librarian -- CU02` o no cambias nada? Escribe la respuesta en `actores.md` usando la idea de rol.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Casos de uso con nivel de objetivo](../lab-02-casos-de-uso-con-objetivo/README.md) → |

[↑ Semana 04](../../README.md)
