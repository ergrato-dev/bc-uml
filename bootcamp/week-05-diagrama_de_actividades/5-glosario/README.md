# Glosario — Semana 05

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Diagrama de actividad | Flujo de trabajo de un proceso: orden, decisiones, paralelo y responsables | `05-actividad-prestar-libro.puml` |
| Acción | Paso atómico que alguien hace, con verbo y objeto | `:Scan copy barcode;` |
| Nodo inicial | Punto donde empieza la actividad | `start` |
| Final de actividad | Nodo que termina la actividad entera | `stop` |
| Final de flujo | Nodo que termina solo el flujo que llega | `end` |
| Decisión | Rombo con una entrada y varias salidas con guarda; pasa una sola | `if (Returned late?) then ([yes])` |
| Fusión | Rombo que junta ramas alternativas sin esperar | `endif` |
| Guarda | Condición entre corchetes en una salida de decisión | `[total > 100]` |
| Fork | Barra que abre ramas que se ejecutan todas, en cualquier orden | `fork` / `fork again` |
| Join | Barra que espera a que lleguen todas las ramas paralelas | `end fork` |
| Partición | Calle que agrupa las acciones de un mismo responsable | `\|Warehouse\|` |
| Nodo de objeto | Objeto del modelo que el flujo produce o consume, con su estado | `:Reservation [READY]; <<object>>` |
| Enviar señal | Envía un mensaje y sigue sin esperar respuesta | `:Pickup notice; <<sendSignal>>` |
| Aceptar evento | Detiene el flujo hasta que llega algo de fuera | `:Copy returned; <<acceptEvent>>` |
| Evento de tiempo | Detiene el flujo hasta que pasa un plazo | `:3 days; <<timeEvent>>` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 06 — Secuencia y comunicación](../../week-06-secuencia_y_comunicacion/README.md) → |

[↑ Semana 05](../README.md)
