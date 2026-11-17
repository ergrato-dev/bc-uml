# Rúbrica de evaluación — Semana 02

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

1. ¿Por qué casi todos los atributos de un modelo deberían ser privados? Da un ejemplo de regla del negocio que un atributo público permite romper.
2. ¿Por qué no se dibujan getters y setters triviales? ¿Qué se pierde de vista si se dibujan?
3. ¿Qué diferencia hay entre `- copies: Integer = 1` y `{static} - maxLoanDays: Integer`? ¿Cuándo usarías cada uno?
4. ¿Qué es un atributo derivado y por qué conviene marcarlo con `/` en lugar de tratarlo como uno normal?
5. ¿Por qué el bootcamp usa tipos neutros (`Integer`, `Date`) y no `int`, `LocalDate` o `varchar(20)`?
6. Una lista de categorías que mantiene el administrador: ¿enum o clase? ¿Y los días de la semana? Justifica ambas.
7. ¿Qué diferencia hay entre una clase abstracta y una interfaz? Da un caso en que elegir mal complique el diseño.
8. ¿Qué significa que una clase tenga una operación `{abstract}`? ¿Qué consecuencia tiene para la clase?
9. En el lab 05 omitiste el constructor y el getter de `Loan`. ¿Con qué criterio decides qué miembros del código aparecen en el diagrama?
10. ¿Cómo detectas que una operación está en la clase equivocada? Usa un ejemplo del lab 06.

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `libro.puml` con 3 clases, 8 atributos privados con tipo y 2 operaciones con retorno | 6 |
| 02 | Sin atributos públicos ni getters/setters; conteo `4`/`5`/`1` por visibilidad; `analisis.md` con las reglas protegidas | 7 |
| 03 | Firmas completas (`0`/`0` en las mediciones), multiplicidad, derivado, estático y enum `PaymentMethod` | 6 |
| 04 | `Ticket` abstracta, `AgeRating` como tipo, `Notifiable` interfaz, `(7 entities)` y `decisiones.md` | 7 |
| 05 | `prestamo.puml` con 4 elementos, sin tipos de Java/Python, `traduccion.md` justifica lo omitido | 7 |
| 06 | `revision.md` con al menos 8 errores y su regla; `tienda.puml` corregido | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [diagrama de clases de tu dominio](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 02` (16 comprobaciones, proporcional) | 60 |
| Atributos y operaciones fieles al dominio y a su restricción | 15 |
| Responsabilidades bien ubicadas, sin getters/setters ni operaciones genéricas | 10 |
| Enum, abstracta e interfaz justificadas con comentarios | 10 |
| Coherencia con el modelo conceptual de la semana 01 | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Diagrama de clases de tu dominio](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 02](README.md)
