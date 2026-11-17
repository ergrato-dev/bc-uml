# Rúbrica de evaluación — Semana 08

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

1. ¿Qué pregunta responde cada una de las tres vistas de esta semana (paquetes, componentes y despliegue)? ¿Quién lee cada una?
2. ¿Con qué criterio repartiste tus clases en paquetes? ¿Por qué agrupar por tipo de clase (`entities`, `enums`) no sirve?
3. ¿De dónde sale la dirección de una dependencia entre paquetes? ¿Por qué no se decide en el diagrama de paquetes?
4. ¿Qué problema concreto causa un ciclo entre dos paquetes? Explica dos formas de romperlo y cuándo elegirías cada una.
5. ¿Qué diferencia hay entre un paquete y un componente? Da un ejemplo de tu dominio en el que no coincidan uno a uno.
6. ¿Qué ganas al unir dos componentes por una interfaz en lugar de con una flecha directa? ¿Qué cambia si sustituyes el proveedor?
7. ¿Para qué sirven un puerto y la delegación en un componente compuesto? ¿Qué ve quien lo usa desde fuera?
8. ¿Qué diferencia hay entre un nodo `<<device>>`, un `<<executionEnvironment>>` y un artefacto? ¿Por qué el componente no se dibuja dentro del nodo?
9. ¿Qué une `<<manifest>>`? ¿Qué falta en el modelo cuando un componente no lo manifiesta ningún artefacto?
10. ¿Cuándo hace falta una ruta de comunicación entre dos nodos? ¿Cómo lo deduces del diagrama de componentes?

---

## 💪 Desempeño (40%)

| Lab | Criterio verificable | Pts |
|---|---|---|
| 01 | `paquetes.puml` con 3 paquetes y `(7 entities)`, 2 dependencias desde `loans` y `tsort` sin ciclo; `preguntas.md` | 6 |
| 02 | `componentes.puml` con `(8 entities)`, 4 provistas, 4 requeridas, ningún `-->` y el `comm` sin salida; `preguntas.md` | 7 |
| 03 | `taquilla.puml` con `(8 entities)`, `BoxOffice` compuesto, un puerto con `«delegate»` y `Kiosk` requiriendo solo `TicketSales`; `preguntas.md` | 7 |
| 04 | `despliegue.puml` con 3 dispositivos, 3 entornos, 3 artefactos dentro, 2 rutas con `<<protocol>>` y ningún `database`; `preguntas.md` | 7 |
| 05 | El `comm` y el `awk` sin salida, 4 `<<manifest>>` y la ruta hacia el proveedor de pagos; `preguntas.md` | 7 |
| 06 | Los dos archivos renderizan, `componentes.puml` con `(7 entities)` y los comandos de los pasos 4 a 8 sin salida; `preguntas.md` | 6 |
| | **Total** | **40** |

---

## 📦 Producto (30%)

Proyecto: [paquetes, componentes y despliegue](3-proyecto/README.md).

| Parte | Pts |
|---|---|
| Autograding: `./scripts/verificar-semana.sh 08` (18 comprobaciones, proporcional) | 60 |
| Las tres vistas cuentan el mismo sistema: paquetes desde `02-clases.puml`, componentes desde los casos de uso y la secuencia, despliegue de cada componente | 15 |
| Trazabilidad: cada clase en un paquete, cada componente con su artefacto y cada artefacto en un nodo | 10 |
| Notación UML correcta: dependencias sin ciclos, interfaces provistas y requeridas, sin `database` ni flechas directas entre componentes | 10 |
| Comentarios del porqué: dirección de las dependencias, separación de componentes y ubicación de los artefactos | 5 |
| **Total** | **100** (se escala a 30%) |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Proyecto — Paquetes, componentes y despliegue](3-proyecto/README.md) | [Recursos — ebooks](4-recursos/ebooks-free/README.md) → |

[↑ Semana 08](README.md)
