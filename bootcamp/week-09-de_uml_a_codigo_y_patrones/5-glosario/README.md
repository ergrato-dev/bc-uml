# Glosario — Semana 09

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Esqueleto de código | Clases, campos y firmas de operaciones sin lógica, traducidos de un diagrama | `public boolean isOverdue(LocalDate today) { throw ...; }` |
| Ingeniería directa | Generar código a partir del modelo | `Member --> "0..*" Loan` pasa a `List<Loan> loans` |
| Ingeniería inversa | Reconstruir el modelo a partir del código existente | `private Customer customer;` pasa a `Cart --> "1" Customer` |
| Navegabilidad en código | La clase de la que sale la flecha tiene el campo; la otra no | `Loan --> LibraryItem`: `Loan` tiene `item` |
| Colección | Campo que traduce una multiplicidad `0..*` o `1..*` | `List<CartLine> lines`, `list[CartLine]` |
| Patrón de diseño | Solución con nombre a un problema de diseño que se repite | Strategy, Observer |
| GoF | Los cuatro autores de *Design Patterns* (1994) y su catálogo de 23 patrones | Gamma, Helm, Johnson, Vlissides |
| Rol de un patrón | Pieza que el patrón exige; la cumple una clase de tu dominio | `<<Context>>`, `<<Observer>>` |
| Strategy | Cada variante de un algoritmo en una clase que cumple una interfaz común | `PricingPolicy` con `RegularPricing` y `MatineePricing` |
| Observer | Un sujeto avisa a una lista de observadores que solo conoce por su interfaz | `LibraryItem --> "0..*" ItemObserver` |
| Factory Method | Una operación abstracta crea el producto; cada subclase decide cuál | `{abstract} # createLabel(order: Order): ShippingLabel` |
| Adapter | Una clase que cumple la interfaz esperada y traduce las llamadas a una clase ajena | `AcmePayAdapter` entre `PaymentGateway` y `AcmePayClient` |
| Client (Adapter) | La clase que usa la interfaz `Target` sin saber qué hay detrás | `Checkout --> PaymentGateway` |
| Adaptee | Clase existente, con otra interfaz, que no puedes cambiar | `AcmePayClient` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 10 — Proyecto integrador](../../week-10-proyecto_integrador/README.md) → |

[↑ Semana 09](../README.md)
