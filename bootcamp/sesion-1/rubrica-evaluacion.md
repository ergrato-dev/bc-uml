# 📊 Rúbrica de Evaluación — Sesión 1: Fundamentos y Diagramas Estructurales

## Criterio de Aprobación

> Mínimo **70%** en cada tipo de evidencia para aprobar la sesión.

---

## 🧠 Conocimiento (30%)

Evaluación teórica sobre los conceptos de la sesión.

| #   | Criterio                    | Indicadores                                                                                                       | Puntaje Máx |
| --- | --------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------- |
| 1   | **Fundamentos UML**         | Identifica correctamente los 14 diagramas, clasifica en estructurales/comportamiento, explica el propósito de UML | 20 pts      |
| 2   | **Diagrama de Clases**      | Define los 3 compartimentos, describe la visibilidad (`+`, `-`, `#`, `~`), distingue atributos de métodos         | 30 pts      |
| 3   | **Relaciones**              | Diferencia composición de agregación, explica herencia vs realización, identifica dependencia                     | 30 pts      |
| 4   | **Diagramas Estructurales** | Distingue objetos de clases, explica para qué sirven componentes y despliegue                                     | 20 pts      |

**Total Conocimiento: 100 pts → peso 30% de la nota final**

### Instrumento: Cuestionario de Selección Múltiple

Preguntas de ejemplo:

1. ¿Cuál notación representa una composición en UML?
   - a) `◇──` b) `◆──` c) `──▷` d) `····>`
2. ¿Qué multiplicidad significa "cero o muchos"?
   - a) `1` b) `0..1` c) `*` d) `1..*`
3. ¿Cuándo se usa herencia vs agregación?

---

## 💪 Desempeño (40%)

Evaluación de los ejercicios prácticos realizados durante la sesión.

| Ejercicio                             | Descripción                                                    | Puntaje Máx |
| ------------------------------------- | -------------------------------------------------------------- | ----------- |
| **Ejercicio 01** — Primera Clase      | Clase `Producto` con atributos, métodos y visibilidad correcta | 25 pts      |
| **Ejercicio 02** — Las 6 Relaciones   | Identificación y aplicación correcta de cada tipo de relación  | 40 pts      |
| **Ejercicio 03** — Sistema E-Commerce | Diagrama completo con decisiones de diseño justificadas        | 35 pts      |

**Total Desempeño: 100 pts → peso 40% de la nota final**

### Escala de Calificación por Ejercicio

| Nivel              | Descripción                             | %       |
| ------------------ | --------------------------------------- | ------- |
| ⭐⭐⭐ Excelente   | Completo, sin errores, buenas prácticas | 90–100% |
| ⭐⭐ Satisfactorio | Completo con errores menores            | 70–89%  |
| ⭐ Básico          | Incompleto pero demuestra comprensión   | 50–69%  |
| ✗ Insuficiente     | No entregado o no demuestra comprensión | 0–49%   |

---

## 📦 Producto (30%)

Evaluación del proyecto: **Sistema de Gestión de Biblioteca**.

| Criterio                | Descripción                                                | Puntaje Máx |
| ----------------------- | ---------------------------------------------------------- | ----------- |
| **Completitud**         | Contiene las 5+ clases requeridas con todos sus miembros   | 20 pts      |
| **Relaciones**          | Usa mínimo 3 tipos de relaciones correctamente             | 25 pts      |
| **Multiplicidades**     | Todas las asociaciones tienen multiplicidades definidas    | 15 pts      |
| **Visibilidad**         | Atributos y métodos con modificadores de acceso apropiados | 15 pts      |
| **Diagrama de Objetos** | Al menos 3 objetos instanciados con valores concretos      | 15 pts      |
| **PlantUML funcional**  | El archivo `.puml` renderiza sin errores                   | 10 pts      |

**Total Producto: 100 pts → peso 30% de la nota final**

### Detalles del Proyecto — Sistema de Biblioteca

**Clases requeridas**:

- `Usuario` (con tipos: Estudiante, Profesor, Público)
- `Libro` (con tipos: LibroFisico, LibroDigital)
- `Prestamo`
- `Reserva`
- `Multa`

**Relaciones esperadas**:

- Herencia: `LibroFisico`, `LibroDigital` extienden `Libro`
- Herencia: `Estudiante`, `Profesor`, `Publico` extienden `Usuario`
- Asociación/Composición: `Prestamo` relaciona `Usuario` y `Libro`
- Asociación: `Multa` se origina de `Prestamo`

**Diagrama de Objetos**:

- Instancia de `Estudiante` con datos concretos
- Instancia de `Libro` disponible
- Instancia de `Prestamo` activo

---

## 📐 Cálculo de Nota Final

```
Nota Final = (Conocimiento × 0.30) + (Desempeño × 0.40) + (Producto × 0.30)

Ejemplo:
  Conocimiento: 85 pts × 0.30 = 25.5
  Desempeño:    75 pts × 0.40 = 30.0
  Producto:     90 pts × 0.30 = 27.0
  ─────────────────────────────────────
  Nota Final:   82.5 / 100
  Estado:       ✅ APROBADO
```

---

## ⚠️ Condiciones de Reprobación

- Nota final < 70 en cualquier tipo de evidencia → **reprobado en ese tipo**
- No entregar el proyecto → máximo 70% en Producto → afecta la nota final
- Código PlantUML con errores de renderizado → descuento en criterio "PlantUML funcional"

---

## 🔗 Navegación

⬅️ [README Sesión 1](README.md) | 📖 [Ir a Teoría](1-teoria/) | 💻 [Ir a Prácticas](2-practicas/) | 🚀 [Ver Proyecto](3-proyecto/)
