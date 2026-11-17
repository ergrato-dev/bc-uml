# Rúbrica de evaluación — Semana 04

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

1. ¿Por qué un actor es un rol y no una persona? ¿Qué problema da modelar `Ana` como actor?
2. ¿Por qué la base de datos no es un actor y la pasarela de pago sí?
3. Explica la prueba del nivel con un caso demasiado grande y otro demasiado pequeño de un sistema que uses a diario.
4. ¿Por qué `Log in` casi nunca es un caso de uso?
5. ¿Qué diferencia hay entre `<<include>>` y `<<extend>>`? ¿Por qué sus flechas van en sentidos opuestos?
6. ¿Para qué sirve un punto de extensión? ¿Qué pierde un extend que no lo declara?
7. En el lab 04, ¿por qué `Pay with points` merece óvalo propio y pagar en dólares no?
8. ¿Por qué un diagrama de casos de uso no muestra orden? ¿Dónde se modela el orden?
9. ¿Qué diferencia hay entre una precondición y un flujo alternativo? Usa el lab 05.
10. ¿Qué gana tu modelo con la trazabilidad entre especificaciones y diagrama de clases? Da un ejemplo de hueco que te ayudó a encontrar.

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | 4 actores fuera de `Library System`, sin `Ana`/`Database`/`LoanModule`; `actores.md` con 7 candidatos | 6 |
| 02 | 6 casos `CU01`–`CU06` y `(8 entities)`; `nivel.md` clasifica los 8 óvalos originales | 6 |
| 03 | `2` include y `2` extend, punto de extensión y nota; `decisiones.md` | 7 |
| 04 | `3` generalizaciones, `(9 entities)`, `Clock`; `variantes.md` con el flujo alternativo de moneda | 7 |
| 05 | `CU-01.md` completo, sin `TODO`, flujos alternativos por regla y trazabilidad que imprime solo `fin` | 7 |
| 06 | `tienda.puml` con `(9 entities)` y `0` flechas `-->`; `revision.md` con al menos 9 errores | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [casos de uso de tu dominio](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 04` (16 comprobaciones, proporcional) | 60 |
| Actores y casos de uso fieles al dominio, en nivel de objetivo | 10 |
| Include y extend justificados y correctos | 10 |
| Especificaciones bien escritas, con la restricción del dominio como paso o flujo alternativo | 15 |
| Trazabilidad con `02-clases.puml` y con los actores del `README.md` | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Casos de uso de tu dominio](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 04](README.md)
