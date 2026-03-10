# Ejercicio 02 — Las 6 Relaciones en Práctica

> ⏱️ Duración: **40 minutos** | Nivel: **Básico / Medio**

## 🎯 Objetivo

Identificar el tipo de relación correcto para cada escenario y modelarlo
en PlantUML, aplicando también multiplicidades apropiadas.

---

## 📋 Parte A — Identificación (15 min)

Para cada par de clases, indica qué tipo de relación es la más apropiada:

| #   | Clase A      | Clase B      | Pista                                       | Relación correcta |
| --- | ------------ | ------------ | ------------------------------------------- | ----------------- |
| 1   | `Auto`       | `Vehículo`   | Un Auto **es un** tipo de Vehículo          | ???               |
| 2   | `Casa`       | `Habitación` | Las habitaciones **no existen** sin la casa | ???               |
| 3   | `Equipo`     | `Jugador`    | Un jugador puede **cambiar de equipo**      | ???               |
| 4   | `Animal`     | `Sonido`     | Un Animal **produce** un sonido (temporal)  | ???               |
| 5   | `Pagable`    | `Tarjeta`    | Tarjeta **implementa** la interfaz Pagable  | ???               |
| 6   | `Estudiante` | `Curso`      | Un estudiante **inscribe** cursos           | ???               |

**Respuestas esperadas** (al final del archivo):

1. Herencia | 2. Composición | 3. Agregación | 4. Dependencia | 5. Realización | 6. Asociación

---

## 📋 Parte B — Modelado PlantUML (25 min)

Completa el archivo `starter.puml` añadiendo las 6 relaciones del siguiente sistema:

### Sistema: Plataforma Educativa

**Clases del sistema**:

- `Persona` (abstracta): nombre, email
- `Estudiante` extiende `Persona`: matricula, promedio
- `Profesor` extiende `Persona`: legajo, especialidad
- `Curso`: codigo, nombre, creditos
- `Material`: titulo, tipo, url
- `Evaluable` (interfaz): `evaluar(): Double`
- `Curso` implementa `Evaluable`
- `Estudiante` implementa `Evaluable`

**Relaciones a modelar**:

1. `Estudiante` hereda de `Persona`
2. `Profesor` hereda de `Persona`
3. `Curso` contiene `Material` (composición — materiales no existen sin el curso)
4. `Profesor` tiene `Cursos` que dicta (agregación — el profesor existe independientemente)
5. `Estudiante` se inscribe en `Cursos` (asociación n:m)
6. `Curso` implementa `Evaluable` (realización)
7. `Estudiante` implementa `Evaluable` (realización)

**Multiplicidades requeridas**:

- Un Profesor puede dictar de 1 a 5 cursos
- Un Curso puede ser dictado por 1 a 2 profesores
- Un Estudiante puede estar inscripto en 1 a muchos cursos
- Un Curso puede tener 0 o más estudiantes
- Un Curso contiene 1 o más materiales

---

## ✅ Criterios de Evaluación

| Criterio                              | Puntaje     |
| ------------------------------------- | ----------- |
| Parte A: 5+ respuestas correctas de 6 | 20 pts      |
| Relaciones tipo correcto en PlantUML  | 40 pts      |
| Multiplicidades correctas             | 25 pts      |
| PlantUML renderiza sin errores        | 15 pts      |
| **Total**                             | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio
- [`solucion.puml`](solucion.puml) — Solución de referencia
