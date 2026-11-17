# Glosario — Semana 04

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Caso de uso | Objetivo que un actor consigue con el sistema | `usecase "Borrow book" as CU01` |
| Actor | Rol externo que interactúa con el sistema | `actor Librarian` |
| Actor principal | Actor que inicia el caso para conseguir su objetivo | `Librarian` en `Borrow book` |
| Actor secundario | Actor que el sistema necesita para cumplir el caso | `actor "Payment Gateway" as PaymentGateway <<system>>` |
| Límite del sistema | Rectángulo que separa lo que es responsabilidad del sistema | `rectangle "Library System" { }` |
| Nivel de objetivo | Tamaño correcto de un caso: el actor se va con lo que quería | `Borrow book` sí, `Enter barcode` no |
| Include | El caso base siempre ejecuta el caso incluido | `CU01 ..> CU03 : <<include>>` |
| Extend | La extensión añade comportamiento al base solo si se cumple una condición | `CU04 ..> CU01 : <<extend>>` |
| Punto de extensión | Lugar del caso base donde se puede enganchar una extensión | `extension points: seat selection` |
| Especificación textual | Descripción paso a paso del diálogo entre actor y sistema | `casos-de-uso/CU-01.md` |
| Precondición | Lo que es verdad antes del caso y el caso no comprueba | El socio está registrado |
| Flujo principal | Camino numerado en que todo sale bien | `1. El bibliotecario identifica al socio` |
| Flujo alternativo | Desvío que sale de un paso del flujo principal | `3a. El socio tiene un préstamo OVERDUE...` |
| Postcondición | Lo que es verdad cuando el caso termina con éxito | Existe un `Loan` `ACTIVE` |
| Trazabilidad | Correspondencia entre elementos de distintas vistas del modelo | `CU-01.md` ↔ `as CU01` ↔ `Loan` en `02-clases.puml` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 05 — Diagrama de actividades](../../week-05-diagrama_de_actividades/README.md) → |

[↑ Semana 04](../README.md)
