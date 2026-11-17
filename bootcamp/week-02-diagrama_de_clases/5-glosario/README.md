# Glosario — Semana 02

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Clase | Descripción de un conjunto de objetos con los mismos atributos, operaciones y significado | `class Book` |
| Atributo | Propiedad que guarda cada objeto de la clase | `- title: String` |
| Operación | Servicio que la clase ofrece; se describe por su firma | `+ lend(to: Member): Loan` |
| Firma | Nombre, parámetros con tipo y tipo de retorno de una operación | `renew(extraDays: Integer): Boolean` |
| Visibilidad | Quién puede acceder a un miembro: `+`, `-`, `#`, `~` | `- points: Integer` |
| Encapsulamiento | Ocultar el estado y exponer solo operaciones que respetan las reglas | `redeemFreeTicket()` en lugar de `setPoints()` |
| Multiplicidad de atributo | Cuántos valores puede tener un atributo | `- seats: String [1..10]` |
| Atributo derivado | Atributo que se calcula a partir de otros; se marca con `/` | `- /total: Decimal` |
| Miembro estático | Atributo u operación de la clase, no de cada objeto; se dibuja subrayado | `{static} - maxLoanDays: Integer` |
| Clase abstracta | Clase que no se instancia directamente; nombre en cursiva | `abstract class Ticket` |
| Operación abstracta | Operación sin implementación en la clase que la declara | `{abstract} + finalPrice(): Decimal` |
| Enumeración | Tipo con una lista cerrada de valores | `enum AgeRating <<enumeration>>` |
| Interfaz | Contrato de operaciones públicas sin estado | `interface Notifiable <<interface>>` |
| Estereotipo | Marca `«nombre»` que añade significado a un elemento | `<<entity>>` |
| Perspectiva de especificación | Nivel de detalle con responsabilidades y tipos neutros, sin lenguaje concreto | Esta semana |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 03 — Relaciones y diagrama de objetos](../../week-03-relaciones_y_diagrama_de_objetos/README.md) → |

[↑ Semana 02](../README.md)
