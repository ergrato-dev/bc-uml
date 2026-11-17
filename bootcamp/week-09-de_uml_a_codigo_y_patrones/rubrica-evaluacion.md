# Rúbrica de evaluación — Semana 09

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

1. ¿Por qué escribir el esqueleto de código es una prueba del diagrama de clases? Cuenta una duda que te surgió al escribirlo y qué le faltaba al diagrama.
2. ¿Cómo decides en qué clase va el campo de una asociación? ¿Qué haces con una asociación sin flechas?
3. ¿Qué diferencia hay en el código entre una asociación, una composición y una dependencia? Pon un ejemplo de tu dominio de cada una.
4. Al leer código, ¿cuándo un campo es un atributo y cuándo una asociación? ¿Por qué no dibujarlo de las dos formas?
5. ¿Qué información del modelo no se puede recuperar del código? Da dos ejemplos y cómo los decidiste en el lab 02.
6. ¿Por qué getters, setters y constructores no se dibujan en el diagrama de clases?
7. ¿Qué problema de tu dominio resuelve el patrón que elegiste? ¿Qué pasaría en el modelo si no lo aplicaras?
8. ¿Por qué el contexto, el sujeto o el cliente tienen que relacionarse con la abstracción y no con una clase concreta?
9. ¿Qué ganas al marcar los roles como estereotipos? ¿Qué pierde quien lee un diagrama sin ellos?
10. ¿Cuándo un patrón es un exceso? Da un ejemplo de tu modelo donde no aplicarías ninguno de los cuatro.

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | Los `comm` de clases y de miembros sin salida, `Book` y `Dvd` heredando de `LibraryItem`, 6 clasificadores y ningún TODO; `preguntas.md` | 7 |
| 02 | `tienda.puml` con `(7 entities)`, el `comm -3` sin salida, ningún atributo con tipo de clase ni getter, y 3 asociaciones, 1 composición, 3 dependencias y 1 realización; `preguntas.md` | 7 |
| 03 | `precios.puml` con `(6 entities)`, los tres roles de Strategy, sin `ScreeningKind` y `Screening` asociado a la interfaz; `preguntas.md` | 6 |
| 04 | `avisos.puml` con `(6 entities)`, los cuatro roles de Observer y una sola asociación de `LibraryItem` hacia `ItemObserver`; `preguntas.md` | 6 |
| 05 | `pagos.puml` con `(5 entities)` y los roles de Adapter; `envios.puml` con `(7 entities)` y los de Factory Method; sin `ShippingService`; `preguntas.md` | 7 |
| 06 | `avisos.puml` renderiza con `(5 entities)`, los 8 errores del diagrama corregidos, el `comm -3` sin salida y las dos clases concretas declarando la interfaz en el código; `preguntas.md` | 7 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [de UML a código y patrones](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 09` (16 comprobaciones, proporcional) | 60 |
| Fidelidad del código al diagrama: navegabilidad en el lado correcto, colecciones para `0..*`, composiciones creadas dentro, dependencias sin campo | 15 |
| El patrón resuelve un problema real del dominio y al menos una de sus piezas ya existía en el modelo | 10 |
| Notación UML correcta: roles del catálogo GoF, `<<interface>>` explícito, realización con el triángulo junto a la interfaz | 10 |
| Comentarios del porqué: problema que resuelve el patrón y decisiones de traducción en `codigo/README.md` | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — De UML a código y patrones](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 09](README.md)
