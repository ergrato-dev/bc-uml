# 🎯 Sesión 2: Diagramas de Comportamiento

## 🎯 Objetivos de Aprendizaje

Al finalizar esta sesión, serás capaz de:

- ✅ Capturar requisitos funcionales con diagramas de casos de uso
- ✅ Identificar actores, casos de uso y sus relaciones (include/extend)
- ✅ Modelar interacciones entre objetos con diagramas de secuencia
- ✅ Aplicar fragmentos combinados (alt, loop, opt) en secuencias
- ✅ Usar diagramas de comunicación como alternativa estructural
- ✅ Documentar ciclos de vida con diagramas de estados
- ✅ Diseñar flujos de proceso con diagramas de actividades y swimlanes
- ✅ Integrar múltiples diagramas UML para documentar un sistema completo

---

## 📚 Requisitos Previos

> Completar la **Sesión 1** es un prerrequisito obligatorio.

- ✅ Dominio del diagrama de clases y relaciones (Sesión 1)
- ✅ Comprensión de la taxonomía UML (Sesión 1)
- ✅ PlantUML instalado o acceso al servidor online

---

## 🗂️ Estructura de la Sesión

```
week-02/
├── README.md                                    # Este archivo
├── rubrica-evaluacion.md                        # Criterios de evaluación
├── 0-assets/                                    # Diagramas SVG de apoyo
├── 1-teoria/
│   ├── 01-casos-uso.md                         # Actores, CU y relaciones
│   ├── 02-secuencia.md                         # Diagrama de secuencia completo
│   ├── 03-comunicacion.md                      # Diagrama de comunicación
│   ├── 04-estados.md                           # Máquinas de estado
│   └── 05-actividades.md                       # Flujos de actividades y swimlanes
├── 2-practicas/
│   ├── ejercicio-01-casos-uso/                 # Red social: actores y CU
│   ├── ejercicio-02-secuencia/                 # Flujo de compra online
│   └── ejercicio-03-estados/                   # Ciclo de vida de una solicitud
├── 3-proyecto/
│   └── starter/
│       └── hospital-digital.puml               # Starter del proyecto
├── 4-recursos/
│   ├── ebooks-free/
│   ├── videografia/
│   └── webgrafia/
└── 5-glosario/
    └── README.md
```

---

## 📝 Contenidos

### 1️⃣ Teoría (2 horas)

| Tema                     | Archivo              | Duración | Descripción                                     |
| ------------------------ | -------------------- | -------- | ----------------------------------------------- |
| Casos de Uso             | `01-casos-uso.md`    | 30 min   | Actores, CU, include/extend, documentación      |
| Diagrama de Secuencia    | `02-secuencia.md`    | 35 min   | Líneas de vida, mensajes, fragmentos combinados |
| Diagrama de Comunicación | `03-comunicacion.md` | 15 min   | Alternativa al diagrama de secuencia            |
| Diagrama de Estados      | `04-estados.md`      | 20 min   | Estados, transiciones, guardas, acciones        |
| Diagrama de Actividades  | `05-actividades.md`  | 20 min   | Nodos de actividad, decisiones, swimlanes       |

### 2️⃣ Prácticas (2 horas)

| Ejercicio                | Carpeta                   | Duración | Nivel      | Descripción                             |
| ------------------------ | ------------------------- | -------- | ---------- | --------------------------------------- |
| Red Social: Casos de Uso | `ejercicio-01-casos-uso/` | 35 min   | Básico     | Actores, CU y relaciones include/extend |
| Compra Online: Secuencia | `ejercicio-02-secuencia/` | 45 min   | Intermedio | Flujo completo con fragmentos alt/loop  |
| Solicitud: Estados       | `ejercicio-03-estados/`   | 40 min   | Intermedio | Ciclo de vida con guardas y acciones    |

### 3️⃣ Proyecto (1 hora)

**Hospital Digital** — Documentación UML integrada con:

- Diagrama de casos de uso del sistema hospitalario
- Diagrama de secuencia del flujo de consulta médica
- Diagrama de estados del ciclo de vida de un paciente
- Diagrama de actividades del proceso de hospitalización

---

## ⏱️ Distribución del Tiempo (5 horas)

```
📖 Teoría:        2h   (40%)
💻 Prácticas:     2h   (40%)
🚀 Proyecto:      0.5h (10%)
📚 Recursos:      0.5h (10%)
```

### Cronograma Sugerido

| Bloque   | Actividad                                       | Tiempo |
| -------- | ----------------------------------------------- | ------ |
| Bloque 1 | Teoría: Casos de Uso + ejercicio-01             | 65 min |
| Bloque 2 | Teoría: Secuencia + Comunicación + ejercicio-02 | 95 min |
| Bloque 3 | Teoría: Estados + Actividades + ejercicio-03    | 75 min |
| Bloque 4 | Proyecto Hospital Digital                       | 45 min |
| Bloque 5 | Recursos y glosario                             | 20 min |

---

## 📌 Entregables

### 📦 Proyecto: Hospital Digital (100% del producto)

Archivo `hospital-digital.puml` funcional que incluya:

- [ ] Diagrama de casos de uso con mínimo 3 actores y 8 casos de uso
- [ ] Al menos una relación `«include»` y una `«extend»`
- [ ] Diagrama de secuencia del flujo de "agendar consulta"
- [ ] Diagrama de estados del "ciclo de vida de un paciente"
- [ ] Diagrama de actividades del proceso de "consulta médica"

---

## 🎓 Conceptos Clave

- **Caso de Uso**: Funcionalidad del sistema desde la perspectiva del usuario
- **Actor**: Entidad externa que interactúa con el sistema
- **include**: Caso de uso que SIEMPRE invoca a otro (`«include»`)
- **extend**: Caso de uso que OPCIONALMENTE extiende a otro (`«extend»`)
- **Línea de Vida (Lifeline)**: Participante en un diagrama de secuencia
- **Mensaje**: Comunicación entre participantes en una secuencia
- **Fragmento Combinado**: `alt`, `opt`, `loop`, `par` en diagramas de secuencia
- **Estado**: Condición estable en la que puede estar un objeto
- **Transición**: Cambio de estado disparado por un evento
- **Guarda**: Condición booleana que habilita una transición `[condición]`
- **Actividad**: Paso en un proceso o flujo de trabajo
- **Swimlane**: Carril de responsabilidad en un diagrama de actividades
- **Nodo de decisión**: Bifurcación basada en una condición (`<>`)
- **Fork/Join**: Paralelismo en diagramas de actividades

---

## 📚 Recursos Adicionales

- Ver carpeta [4-recursos/webgrafia/](4-recursos/webgrafia/)
- Ver carpeta [4-recursos/videografia/](4-recursos/videografia/)

---

## ✅ Checklist de Verificación

Antes de dar por completo el bootcamp, asegúrate de:

- [ ] Puedo diseñar un diagrama de casos de uso completo con actores e include/extend
- [ ] Sé modelar un flujo completo con diagrama de secuencia (mensajes, retornos, fragmentos)
- [ ] Entiendo cuándo usar secuencia vs comunicación
- [ ] Puedo modelar el ciclo de vida de un objeto con estados y transiciones
- [ ] Sé añadir guardas y acciones a las transiciones
- [ ] Puedo diseñar un proceso con actividades y swimlanes
- [ ] Integro múltiples diagramas para documentar un sistema completo
- [ ] Entrego el proyecto funcional en PlantUML ✨
- [ ] Alcanzo mínimo 70% en la evaluación

---

## 🔗 Navegación

⬅️ Anterior: [Sesión 1: Fundamentos y Diagramas Estructurales](../week-01/README.md) &nbsp;➡️ [Inicio del Bootcamp](../../README.md)

---

## 💡 Consejos para Esta Sesión

> 🎭 **Casos de Uso: piensa como usuario, no como desarrollador**: El diagrama debe responder "¿qué puede hacer el sistema?" no "¿cómo lo hace?".

> ⏱️ **Secuencia: el tiempo fluye hacia abajo**: Cada mensaje desciende en la línea de tiempo. Si tienes dudas sobre el orden, córrelo mentalmente.

> 🔄 **Estados: modela los casos de error**: Un buen diagrama de estados no solo muestra el "happy path" — incluye cancelaciones, rechazos y timeouts.

> 🏊 **Swimlanes = responsabilidades claras**: Cada carril le asigna acciones a una entidad. Si una acción no sabes en qué carril va, es señal de que la responsabilidad es ambigua.
