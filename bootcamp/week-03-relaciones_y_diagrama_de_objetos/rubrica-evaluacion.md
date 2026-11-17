# Rúbrica de evaluación — Semana 03

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

1. ¿Por qué el bootcamp exige multiplicidad en los dos extremos de toda asociación? ¿Qué pregunta responde cada extremo?
2. En el lab 01, ¿por qué `Loan "0..*" -- "1" Copy` y no `"0..1"` en el extremo `Loan`? ¿Qué te hizo cambiar de "un instante" a "toda la vida del ejemplar"?
3. Explica la prueba del borrado. Da un ejemplo propio de composición y otro de algo que parece composición pero no lo es.
4. ¿Por qué en una composición el extremo del todo es `1` (o `0..1`) y nunca `0..*`?
5. ¿Por qué una subclase no repite los atributos que hereda, pero sí puede repetir una operación?
6. ¿Qué diferencia hay entre `Ticket <|-- StudentTicket` y `Notifiable <|.. Reservation`? ¿Qué error de diseño causa usar la primera donde va la segunda?
7. ¿Cuándo un dato merece una clase asociación? ¿Cuándo esa clase asociación debe pasar a ser una clase normal?
8. ¿Qué diferencia hay entre una asociación navegable `-->` y una dependencia `..>`? Usa el ejemplo de `Invoice` del lab 04.
9. ¿Para qué sirve un diagrama de objetos si el diagrama de clases ya describe todo? Usa lo que encontraste en el paso 7 del lab 05.
10. En el lab 06, ¿qué línea era redundante y por qué una relación que se deduce de otras empeora el modelo?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | 5 asociaciones con multiplicidad en ambos extremos (`5`), roles en `Book`–`Author` y en la reflexiva; `multiplicidades.md` con 10 frases | 6 |
| 02 | `2` composiciones y `1` agregación, `"1"` en el todo; `decisiones.md` con la prueba del borrado de las 5 relaciones | 6 |
| 03 | `2` generalizaciones y `2` realizaciones; `seat`/`basePrice` solo en `Ticket`; `jerarquia.md` | 7 |
| 04 | `SupplyTerms` como clase asociación, `(7 entities)`, navegación hacia `Order`, dependencia `«use»`; `decisiones.md` | 7 |
| 05 | `(8 entities)` y `7` links coherentes con `clases.puml`; `coherencia.md` con la violación del paso 7 | 7 |
| 06 | `cine.puml` renderiza con 8 relaciones; `revision.md` con al menos 8 errores de modelado y su regla | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [relaciones y objetos de tu dominio](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 03` (16 comprobaciones, proporcional) | 60 |
| Multiplicidades fieles al dominio y a su restricción | 15 |
| Composición, generalización y realización correctas y justificadas con comentarios | 10 |
| Diagrama de objetos coherente con el de clases y con un caso que aporta algo | 10 |
| Coherencia con las semanas 01 y 02 (asociaciones del modelo conceptual, clases y glosario) | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Relaciones y objetos de tu dominio](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 03](README.md)
