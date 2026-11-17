# Rúbrica de evaluación — Semana 07

Tres evidencias, **mínimo 70% en cada una** (no en el promedio).

| Evidencia | Peso | Qué se evalúa |
|---|---|---|
| 🧠 Conocimiento | 30% | 10 preguntas conceptuales |
| 💪 Desempeño | 40% | Los 6 labs |
| 📦 Producto | 30% | Proyecto semanal: autograding + calidad |

Bandas: Sobresaliente 90–100 · Notable 80–89 · Aprobado 70–79.

---

## 🧠 Conocimiento (30%)

Responde por escrito, con tus palabras, en 2 a 5 líneas cada una. 3 pts por respuesta: 3 = explica el porqué con un ejemplo propio; 2 = correcta sin porqué; 1 = parcial; 0 = incorrecta o copiada.

1. ¿Qué responde una máquina de estados que no responde la secuencia? ¿Por qué se dibuja para una clase y no para un caso de uso?
2. ¿Qué clases de tu dominio merecen una máquina de estados y cuáles no? ¿Qué criterio usas?
3. ¿Por qué un estado se nombra con un adjetivo o un participio y un evento con un verbo? Da un ejemplo de un nombre mal elegido.
4. ¿Qué pasa cuando llega un evento cuya guarda es falsa? ¿Y cuando llega un evento que el estado actual no acepta?
5. ¿Qué diferencia hay entre un evento de llamada, uno de señal, uno de cambio y uno de tiempo? ¿Cuáles exigen una operación en el diagrama de clases y por qué?
6. ¿Cuándo pones una acción en `entry` o `exit` en lugar de en las transiciones? ¿Qué riesgo corres si no lo haces?
7. ¿Qué diferencia hay entre una transición interna y una autotransición? Da un caso de tu dominio donde elegir mal cause un error.
8. ¿Qué ganas al agrupar estados en un compuesto? ¿Cuándo una transición debe salir del borde y cuándo de un subestado?
9. ¿Qué recuerda `[H]` y qué recuerda `[H*]`? ¿Cuándo dan resultados distintos?
10. ¿Qué cambió en tu `02-clases.puml` al dibujar la máquina de estados del proyecto? ¿Por qué deben coincidir los estados con los literales de la enumeración?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `ejemplar.puml` con `(7 entities)`, 9 transiciones con evento, inicial y final; `preguntas.md` | 6 |
| 02 | `pedido.puml` con `(9 entities)`, 4 guardas, 6 acciones, `after(48 h)`, un choice con `[else]` y ninguna etiqueta al revés; `preguntas.md` | 7 |
| 03 | `funcion.puml` con 3 actividades internas, sin autotransición, `closeBoxOffice()` una vez y eventos `when` y `after`; `preguntas.md` | 7 |
| 04 | `membresia.puml` con `(9 entities)`, compuesto `Active`, 3 flechas a `Suspended`/`Closed` y `Active[H]`; `preguntas.md` | 7 |
| 05 | Los `comm` de estados y literales sin salida, `refund()` en `Ticket` y 0 eventos sin operación; `preguntas.md` | 7 |
| 06 | `envio.puml` con `(9 entities)`, los comandos de los pasos 5 y 6 sin salida y guardas en `attemptDelivery()`; `preguntas.md` | 6 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [máquina de estados de una entidad](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 07` (18 comprobaciones, proporcional) | 60 |
| La máquina cuenta el ciclo de vida real de la clase según los casos de uso y la secuencia de la semana 06 | 15 |
| Estados y eventos trazados a `02-clases.puml`: literales de la enumeración y operaciones de la clase | 10 |
| Notación UML correcta: etiquetas en orden, `entry`/`exit`/`do` bien elegidos, compuesto y pseudoestado con sentido | 10 |
| Comentarios del porqué: compuesto, actividades internas y cambios en el diagrama de clases | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Máquina de estados de una entidad](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 07](README.md)
