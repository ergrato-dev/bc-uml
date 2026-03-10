# 📊 Rúbrica de Evaluación — Sesión 2: Diagramas de Comportamiento

## Criterio de Aprobación

> Mínimo **70%** en cada tipo de evidencia para aprobar la sesión.

---

## 🧠 Conocimiento (30%)

| #   | Criterio                    | Indicadores                                                          | Puntaje Máx |
| --- | --------------------------- | -------------------------------------------------------------------- | ----------- |
| 1   | **Casos de Uso**            | Define actor, caso de uso, sistema; diferencia include de extend     | 25 pts      |
| 2   | **Diagrama de Secuencia**   | Identifica líneas de vida, tipos de mensajes y fragmentos combinados | 30 pts      |
| 3   | **Diagrama de Estados**     | Define estado, transición, guarda, estado inicial/final              | 25 pts      |
| 4   | **Diagrama de Actividades** | Explica diferencia con estados, define swimlane, fork/join           | 20 pts      |

**Total Conocimiento: 100 pts → peso 30% de la nota final**

### Preguntas de Ejemplo

1. ¿Cuál es la diferencia entre `«include»` y `«extend»`?
2. ¿Qué tipo de mensaje UML no espera respuesta?
3. ¿Qué fragmento combinado modela una condición alternativa (`if/else`)?
4. ¿Cuándo usas un diagrama de estado vs uno de actividades?

---

## 💪 Desempeño (40%)

| Ejercicio                       | Descripción                                                           | Puntaje Máx |
| ------------------------------- | --------------------------------------------------------------------- | ----------- |
| **Ejercicio 01** — Casos de Uso | Red social con actores, CU, include/extend y límite del sistema       | 30 pts      |
| **Ejercicio 02** — Secuencia    | Flujo de compra online con mensajes, retornos y fragmento alt         | 40 pts      |
| **Ejercicio 03** — Estados      | Ciclo de vida de solicitud con guardas, acciones y estados compuestos | 30 pts      |

**Total Desempeño: 100 pts → peso 40% de la nota final**

### Escala de Calificación

| Nivel              | Descripción                           | %       |
| ------------------ | ------------------------------------- | ------- |
| ⭐⭐⭐ Excelente   | Completo, correcto, buenas prácticas  | 90–100% |
| ⭐⭐ Satisfactorio | Completo con errores menores          | 70–89%  |
| ⭐ Básico          | Incompleto pero demuestra comprensión | 50–69%  |
| ✗ Insuficiente     | No entregado o sin comprensión        | 0–49%   |

---

## 📦 Producto (30%)

Evaluación del proyecto: **Hospital Digital**.

| Criterio                    | Descripción                                                  | Puntaje Máx |
| --------------------------- | ------------------------------------------------------------ | ----------- |
| **Casos de Uso**            | 3+ actores, 8+ casos de uso, include y extend correctos      | 25 pts      |
| **Diagrama de Secuencia**   | Flujo "agendar consulta" con 4+ participantes y alternativas | 25 pts      |
| **Diagrama de Estados**     | Ciclo de vida del paciente con 5+ estados y guardas          | 25 pts      |
| **Diagrama de Actividades** | Proceso consulta con 3+ swimlanes y decisiones               | 15 pts      |
| **PlantUML funcional**      | Archivo `.puml` renderiza sin errores                        | 10 pts      |

**Total Producto: 100 pts → peso 30% de la nota final**

### Detalles del Proyecto — Hospital Digital

**Actores esperados** (mínimo 3):

- Paciente
- Médico
- Administrador
- [Opcional: Farmacéutico, Laboratorista, Seguro Médico]

**Casos de uso esperados**:

- `Registrar Paciente`, `Agendar Consulta`, `Realizar Consulta`
- `Prescribir Medicamento`, `Emitir Orden de Examen`
- Include: `Verificar Seguro` incluido en `Agendar Consulta`
- Extend: `Enviar Recordatorio` extiende `Agendar Consulta` (opcional)

**Flujo de secuencia esperado**: "Agendar Consulta"

- Participantes: `:Paciente`, `:SistemaWeb`, `:ServicioAgendamiento`, `:BaseDatos`
- Mensajes: solicitud, validar disponibilidad, confirmar, notificar
- Fragmento alt: disponible vs no disponible

**Estados del ciclo de vida del paciente**:

- No Registrado → Registrado → Con Cita → En Consulta → Alta / Hospitalizado → [Final]

---

## 📐 Cálculo de Nota Final

```
Nota Final = (Conocimiento × 0.30) + (Desempeño × 0.40) + (Producto × 0.30)
```

---

## 🔗 Navegación

⬅️ [README Sesión 2](README.md) | 📖 [Ir a Teoría](1-teoria/) | 💻 [Ir a Prácticas](2-practicas/) | 🚀 [Ver Proyecto](3-proyecto/)
