# Glosario — Semana 07

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Máquina de estados | Diagrama del ciclo de vida de un objeto de una clase: sus estados y cómo pasa de uno a otro | `title Biblioteca — ciclo de vida de Loan` |
| Estado | Situación en la que el objeto espera algo y responde a ciertos eventos | `Overdue` |
| Estado inicial y final | El inicial (pseudoestado) marca dónde empieza la vida del objeto; el final, dónde termina | `[*] --> Active`, `Returned --> [*]` |
| Transición | Paso de un estado a otro, etiquetado `evento [guarda] / acción` | `Active --> Returned : return()` |
| Evento de llamada | Invocación de una operación de la clase que dispara una transición | `renew()` |
| Evento de señal | Mensaje asíncrono que llega de fuera; se escribe sin paréntesis | `addressFixed` |
| Evento de cambio | Se dispara cuando una condición pasa de falsa a verdadera | `when(today > dueDate)` |
| Evento de tiempo | Se dispara al pasar un tiempo desde que se entró al estado | `after(48 h)` |
| Guarda | Condición que se evalúa al llegar el evento; si es falsa, el evento se descarta | `[renewals < 2]` |
| Acción | Comportamiento breve que se ejecuta al cruzar una transición | `/ chargeFine()` |
| entry / exit / do | Actividades internas: al entrar, al salir y mientras se está en el estado | `Held : entry / startHoldTimer()` |
| Transición interna | Responde a un evento sin salir del estado, sin ejecutar `entry` ni `exit` | `OnSale : seatSold / updateFreeSeats()` |
| Estado compuesto | Estado que contiene subestados; sus transiciones de borde valen para todos | `state Fulfilling { ... }` |
| Historia | Pseudoestado que devuelve al compuesto al subestado en que estaba (`[H]`) o a todos los niveles (`[H*]`) | `OnHold --> Fulfilling[H]` |
| Choice | Pseudoestado que elige el destino según guardas evaluadas después del evento | `state shipping <<choice>>` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 08 — Componentes, paquetes y despliegue](../../week-08-componentes_paquetes_y_despliegue/README.md) → |

[↑ Semana 07](../README.md)
