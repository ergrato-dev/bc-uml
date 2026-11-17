# Rúbrica de evaluación — Semana 10

Tres evidencias, **mínimo 70% en cada una** (no en el promedio).

| Evidencia | Peso | Qué se evalúa |
|---|---|---|
| 🧠 Conocimiento | 30% | 10 preguntas conceptuales |
| 💪 Desempeño | 40% | Los 6 labs |
| 📦 Producto | 30% | Modelo completo: autograding + calidad + defensa |

Bandas: Sobresaliente 90–100 · Notable 80–89 · Aprobado 70–79.

---

## 🧠 Conocimiento (30%)

Responde por escrito, con tus palabras, en 2 a 5 líneas cada una. 3 pts por respuesta: 3 = explica el porqué con un ejemplo propio; 2 = correcta sin porqué; 1 = parcial; 0 = incorrecta o copiada.

1. ¿Por qué el diagrama de clases es el centro de las reglas de coherencia? ¿Qué vista de tu modelo no depende de él?
2. Cuando la secuencia y el diagrama de clases se contradicen, ¿cómo decides cuál corregir? Cuenta un caso de tu modelo.
3. ¿Por qué un evento de tiempo (`when`, `after`) no tiene que ser una operación y uno de llamada sí?
4. ¿Qué diferencia hay entre coherencia y trazabilidad? ¿Puede un modelo tener una sin la otra?
5. ¿Qué te dice una clase que no aparece en ninguna fila de la matriz? ¿Qué dos salidas tiene?
6. ¿Qué clases van en una fila de la matriz y cuáles no? ¿Qué pasa si pones todas en todas?
7. ¿Por qué el revisor tiene que ser de otro dominio? ¿Qué hallazgo te hizo un compañero que tú no habrías visto?
8. ¿Qué distingue un "Se mantiene" válido de uno que no lo es? Da un ejemplo de cada uno.
9. ¿Por qué una decisión de modelado necesita una alternativa? ¿Cuál de las tuyas costó más defender?
10. ¿Qué parte de tu modelo cambiarías si empezaras hoy, sabiendo lo que sabes en la semana 10?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | Los `comm` de lifelines y de mensajes sin salida, `Catalog` añadida, `register` en `Member` con su comentario y `(5 participants)`; `preguntas.md` | 6 |
| 02 | Los cuatro `comm` sin salida, `ship` y `deliver` en `Order`, 6 literales en `OrderStatus` y `paquetes.puml` con `(6 entities)`; `preguntas.md` | 7 |
| 03 | Una fila por caso de uso con clases y enlaces, `LoyaltyCard` eliminada, `clases.puml` con `(7 entities)` y los cuatro huecos escritos; `preguntas.md` | 7 |
| 04 | `revision.md` con revisor y 6 hallazgos resueltos, los comandos de los pasos 3 a 5 sin salida tras las correcciones; `preguntas.md` | 7 |
| 05 | 5 decisiones completas, 5 comentarios `'` en `clases.puml`, guion de `10 min` y dos preguntas con respuesta; `preguntas.md` | 6 |
| 06 | `revisar.sh` sin avisos, los cinco diagramas renderizan con los conteos del paso 11 y los 9 errores justificados en `preguntas.md` | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [modelo completo y defensa](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 10` (17 comprobaciones, proporcional) | 60 |
| Trazabilidad honesta: cada fila con las clases que el caso de uso toca de verdad y los huecos escritos | 10 |
| Revisión: hallazgos de otra persona, resoluciones con motivo del dominio y correcciones aplicadas en los diagramas | 10 |
| Defensa oral: guion en 10 minutos, cada decisión con alternativa y motivo del dominio, respuestas a dos preguntas del instructor | 20 |
| **Total** | **100** (se escala a 30%) |

La defensa es individual y en directo. Si el modelo no es de tu dominio asignado, la entrega se anula.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Modelo completo y defensa](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 10](README.md)
