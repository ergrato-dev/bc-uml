# Rúbrica de evaluación — Semana 06

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

1. ¿Qué responde un diagrama de secuencia que no responde el de actividad? Usa un caso de uso de tu dominio.
2. ¿Por qué un objeto se escribe `:Copy` y no `Copy`? ¿Cuándo dibujarías dos lifelines de la misma clase?
3. ¿Por qué cada mensaje síncrono a un objeto del dominio tiene que ser una operación de su clase? ¿Qué haces si no lo es?
4. ¿Cuándo un mensaje es asíncrono y cuándo síncrono? Da un ejemplo de tu dominio que pueda ser cualquiera de los dos según una decisión de negocio.
5. ¿Qué dice un `create` sobre la vida de un objeto? ¿Qué afirma el diagrama si lo quitas?
6. ¿Qué diferencia hay entre `alt`, `opt` y `break`? ¿Cuándo un `alt` con un solo operando debería ser otro operador?
7. ¿Por qué en PlantUML las guardas se escriben sin corchetes? ¿Cómo detectas que una guarda está mal escrita si el diagrama renderiza?
8. ¿Qué relación hay entre un `ref` de una secuencia y un `<<include>>` del diagrama de casos de uso?
9. ¿Qué información da la numeración `1.1.2` que no da `3`? ¿Qué ves en un diagrama de comunicación que no ves en uno de secuencia?
10. ¿Qué cambió en tu `02-clases.puml` al dibujar la secuencia del proyecto? ¿Por qué el modelado de interacción corrige el estructural?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `reserva.puml` con `(4 participants)`, 4 mensajes síncronos, 4 respuestas y 2 activaciones; `preguntas.md` | 6 |
| 02 | `pedido.puml` con `(6 participants)`, 1 asíncrono, 1 creación con `create` y 1 `destroy`; `preguntas.md` | 6 |
| 03 | `entrada.puml` con 2 `alt` anidados, 2 `opt`, 4 `end` y ninguna guarda entre corchetes; `preguntas.md` | 7 |
| 04 | `devolucion.puml` con `ref`, `break`, `loop` con `opt` y `par` dentro, y una sola vuelta; `preguntas.md` | 7 |
| 05 | `comunicacion.puml` con `(6 entities)`, 6 enlaces y 7 mensajes numerados en el orden de la secuencia; `preguntas.md` | 7 |
| 06 | `devolucion.puml` con `(6 participants)` y los dos `grep` del paso 9 vacíos; `preguntas.md` | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [secuencia y comunicación de un caso de uso](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 06` (18 comprobaciones, proporcional) | 60 |
| La secuencia sigue el flujo principal de `CU-NN.md` y los fragmentos salen de sus flujos alternativos | 15 |
| Cada mensaje a un objeto del dominio es una operación de `02-clases.puml`, con los nombres del dominio | 10 |
| La comunicación cuenta la misma interacción, con un enlace por pareja y numeración correcta | 10 |
| Comentarios del porqué: asíncronos, fragmentos y operaciones añadidas al diagrama de clases | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Secuencia y comunicación de un caso de uso](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 06](README.md)
