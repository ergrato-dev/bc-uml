# Rúbrica de evaluación — Semana 01

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

1. UML es una notación y no un método. ¿Qué consecuencia práctica tiene eso para un equipo que empieza a usarlo?
2. ¿En qué se diferencia usar UML como boceto de usarlo como plano? Da un caso en que cada uno sea el adecuado.
3. Describe una situación en la que hacer un diagrama UML sería una pérdida de tiempo. ¿Por qué?
4. ¿Qué diferencia hay entre un diagrama de estructura y uno de comportamiento? ¿Por qué no puede un diagrama de clases mostrar el orden en que ocurren las cosas?
5. Tienes que explicar por qué un pedido enviado ya no se puede cancelar. ¿Qué diagrama eliges y por qué no uno de secuencia?
6. ¿Por qué el modelo conceptual no lleva atributos ni tipos? ¿Qué perderías si los pusieras ya?
7. En el lab 05 descartaste "hora" y "puntos" como conceptos. ¿Qué criterio aplicaste y dónde aparecerán más adelante?
8. ¿Qué ventajas concretas tiene escribir diagramas como código frente a dibujarlos con una herramienta gráfica? Nombra también un inconveniente.
9. ¿Por qué el bootcamp prohíbe el servidor online de plantuml.com para el trabajo del estudiante?
10. PlantUML señaló un error en la línea 5 y el problema estaba en la línea 8. ¿Cómo es posible? ¿Qué estrategia sigues para encontrar el error real?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `plantuml -syntax < starter/hola.puml` imprime `CLASS` y `(4 entities)`; `hola.svg` muestra 4 clases y 3 asociaciones | 6 |
| 02 | `plantuml -checkonly starter/*.puml` sale con `0`; `roto-4.puml` separado en un diagrama de clases y uno de secuencia | 7 |
| 03 | `respuestas.md` sin TODO, 8 filas con diagrama, pregunta y descarte, al menos 4 diagramas distintos | 7 |
| 04 | `respuestas.md` con las 10 preguntas respondidas con hechos del diagrama y los símbolos `*--`, `-->`, `/ acción` identificados | 6 |
| 05 | `conceptual.puml` con al menos 7 conceptos y 6 asociaciones con nombre; `candidatos.md` con los descartes justificados | 8 |
| 06 | Estilo común aplicado a los dos diagramas, leyenda, PNG en `salida/` y lectura del `git diff` | 6 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [portada y modelo conceptual de tu dominio](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 01` (13 comprobaciones, proporcional) | 60 |
| Fidelidad al dominio asignado y a su restricción | 15 |
| Glosario con significados del negocio, no del diccionario | 10 |
| Nombres en inglés, en singular, sin abreviaturas; asociaciones que se leen como frases | 10 |
| Comentarios `'` en las decisiones de modelado no obvias | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Portada y modelo conceptual de tu dominio](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 01](README.md)
