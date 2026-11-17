# Rúbrica de evaluación — Semana 05

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

1. ¿Qué responde un diagrama de actividad que no responde el diagrama de casos de uso? Usa un caso de tu dominio.
2. ¿Por qué una acción se nombra con verbo y objeto? ¿Qué problema trae una acción llamada `Loan form`?
3. ¿Qué significa que unas guardas sean excluyentes y exhaustivas? Da un ejemplo que falle cada propiedad.
4. ¿Qué diferencia hay entre `stop` y `end`? ¿Cuándo un `stop` en una rama paralela es un error?
5. ¿Cómo decides si dos acciones van en ramas paralelas o en secuencia? Usa el lab 03.
6. ¿Por qué una decisión se cierra con una fusión y un fork con un join? ¿Qué pasa si los cambias?
7. ¿Por qué una acción va en la partición de quien la hace y no de quien la pide? ¿Por qué `Database` no es una partición?
8. ¿Qué aporta un nodo de objeto con estado (`Reservation [READY]`)? ¿Qué te dice si el estado no existe en el diagrama de clases?
9. ¿Qué diferencia hay entre enviar una señal y aceptar un evento? ¿Por qué después de un `sendSignal` a veces hace falta un `acceptEvent`?
10. ¿Qué relación hay entre los flujos alternativos de tus `CU-NN.md` y las decisiones de tu actividad? Da un ejemplo de tu proyecto.

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `devolucion.puml` con 7 acciones con verbo, 2 decisiones, 4 guardas y 1 `stop`; `preguntas.md` | 6 |
| 02 | `caja.puml` con 1 `repeat`, 3 `case`, 7 guardas y 2 `stop`; `guardas.md` analiza los 4 conjuntos | 6 |
| 03 | `estreno.puml` con 4 ramas, 1 `end fork` y 1 `end`; `dependencias.md` y `decision-o-fork.md` | 7 |
| 04 | `pedido.puml` con 5 particiones en orden, `0` `Database` y un fork entre calles; `responsables.md` | 7 |
| 05 | `reservas.puml` con 4 nodos de objeto y 3 señales o eventos; trazabilidad que imprime solo `fin` | 7 |
| 06 | `venta.puml` con los conteos del paso 5; `revision.md` con al menos 9 errores | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [actividad del proceso núcleo](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 05` (16 comprobaciones, proporcional) | 60 |
| El proceso es el núcleo del dominio y la restricción del dominio se ve como decisión | 10 |
| Particiones por responsable y cada acción en la de quien la hace | 10 |
| Decisiones, paralelo y finales correctos, con comentarios del porqué | 15 |
| Trazabilidad con `04-casos-de-uso.puml`, `CU-NN.md` y `02-clases.puml` | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Actividad del proceso núcleo](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 05](README.md)
