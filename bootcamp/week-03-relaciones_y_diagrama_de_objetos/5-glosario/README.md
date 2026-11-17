# Glosario — Semana 03

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Asociación | Vínculo estructural entre objetos de dos clases | `Member "1" -- "0..*" Loan` |
| Multiplicidad | Cuántos objetos de un extremo se vinculan con uno del otro | `"0..*"`, `"1..*"`, `"0..1"` |
| Rol | Nombre que un extremo de la asociación da a la clase de ese lado | `Book "books 0..*" -- "authors 1..*" Author` |
| Asociación reflexiva | Asociación de una clase consigo misma; necesita roles | `Member -- Member` (recommenders, recipients) |
| Navegabilidad | Desde qué extremo se puede llegar al otro; se dibuja con punta abierta | `Invoice "0..1" --> "1" Order` |
| Agregación | Asociación todo–parte en la que la parte sobrevive y se puede compartir | `Catalog "0..*" o-- "0..*" Product` |
| Composición | Asociación todo–parte en la que la parte muere con su único todo | `Order "1" *-- "1..*" OrderLine` |
| Prueba del borrado | Preguntar si la parte tiene sentido cuando se borra el todo | Sin pedido, la línea no significa nada |
| Generalización | Relación "es un" entre una subclase y su superclase | `Ticket <\|-- StudentTicket` |
| Realización | Relación entre una clase y la interfaz cuyo contrato cumple | `Notifiable <\|.. Reservation` |
| Dependencia | Una clase usa a otra de forma pasajera, sin guardar un vínculo | `Invoice ..> InvoiceTemplate : <<use>>` |
| Clase asociación | Asociación con atributos propios: los datos del vínculo | `(Product, Supplier) .. SupplyTerms` |
| Objeto | Instancia concreta de una clase en una situación | `object "ana : Member" as ana` |
| Slot | Valor de un atributo en un objeto | `name = "Ana Ruiz"` |
| Link | Instancia de una asociación entre dos objetos; sin multiplicidad | `ana -- l1` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 04 — Casos de uso](../../week-04-casos_de_uso/README.md) → |

[↑ Semana 03](../README.md)
