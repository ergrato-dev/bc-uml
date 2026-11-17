# Glosario — Semana 06

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Diagrama de secuencia | Interacción entre objetos ordenada en el tiempo, de arriba abajo | `06-secuencia-prestar-libro.puml` |
| Lifeline | Participante de la interacción: una caja y una línea discontinua que es su tiempo | `participant ":Copy" as copy` |
| Boundary | Lifeline que separa al actor del sistema: pantalla, API, pasarela | `boundary ":LoanScreen" as ui` |
| Control | Lifeline que coordina el escenario de un caso de uso | `control ":LoanService" as svc` |
| Mensaje síncrono | Llamada a una operación; el emisor espera la respuesta | `svc -> copy : isAvailable()` |
| Mensaje de respuesta | Valor que devuelve una llamada síncrona | `copy --> svc : true` |
| Mensaje asíncrono | Envío sin esperar respuesta; el emisor sigue | `svc ->> mail : sendConfirmation(orderId)` |
| Mensaje de creación | Mensaje que hace nacer un objeto durante la interacción | `svc -->> loan : <<create>> Loan(copy)` |
| Destrucción | Fin de la vida de un objeto, marcado con una X | `destroy cart` |
| Activación | Barra sobre la lifeline mientras el objeto está ocupado | `activate svc` |
| Fragmento combinado | Marco que agrupa mensajes bajo un operador | `alt`, `opt`, `loop`, `par`, `break` |
| Guarda | Condición de un operando, entre corchetes en UML y sin ellos en PlantUML | `alt card approved` |
| Uso de interacción | Referencia a otra interacción dibujada aparte | `ref over svc, member : CU-07 Identify member` |
| Diagrama de comunicación | La misma interacción dibujada como objetos enlazados con mensajes numerados | `06-comunicacion-prestar-libro.puml` |
| Número de secuencia | Prefijo decimal que ordena los mensajes y muestra el anidamiento | `1.1.2: markAsLent()` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 07 — Máquinas de estados](../../week-07-maquinas_de_estados/README.md) → |

[↑ Semana 06](../README.md)
