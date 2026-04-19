# Plan de Estudios — Bootcamp UML

> Versión 2.0 · Actualizado: 2026

## Descripción General

Bootcamp intensivo de **UML 2.5** estructurado en **2 sesiones de 5 horas** cada una (10 horas totales).
Diseñado para desarrolladores con una disponibilidad de **5 horas semanales**.

## Objetivos Generales del Bootcamp

Al completar el bootcamp, el estudiante será capaz de:

1. Comprender la taxonomía UML 2.5 y seleccionar el diagrama apropiado para cada necesidad
2. Modelar la estructura estáticade un sistema con diagramas de clases, objetos y componentes
3. Modelar el comportamiento dinámico con diagramas de casos de uso, secuencia, estados y actividades
4. Comunicar diseños de software a diferentes audiencias usando UML como lenguaje común
5. Usar PlantUML para generar diagramas desde código (diagrams-as-code)

---

## Sesión 1: Fundamentos y Diagramas Estructurales

**Duración**: 5 horas | **Semana**: 1

### Objetivos

- Conocer el origen, propósito y taxonomía de UML 2.5
- Dominar la sintaxis completa del diagrama de clases
- Identificar y aplicar los 6 tipos de relaciones entre clases
- Crear diagramas de objetos, componentes y despliegue

### Contenidos

| Módulo                                                                                           | Tema                                        | Duración |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------- | -------- |
| [`01-introduccion-uml.md`](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/1-teoria/01-introduccion-uml.md)                 | Historia, propósito, taxonomía 14 diagramas | 20 min   |
| [`02-cuando-usar-uml.md`](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/1-teoria/02-cuando-usar-uml.md)                   | Cuándo sí, cuándo no, buenas prácticas      | 15 min   |
| [`03-diagrama-clases-sintaxis.md`](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/1-teoria/03-diagrama-clases-sintaxis.md) | Anatomía de clase, visibilidad, estáticos   | 30 min   |
| [`04-relaciones-entre-clases.md`](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/1-teoria/04-relaciones-entre-clases.md)   | 6 tipos de relaciones, guía de decisión     | 35 min   |
| [`05-diagramas-estructurales.md`](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/1-teoria/05-diagramas-estructurales.md)   | Objetos, componentes, despliegue            | 20 min   |

### Ejercicios Prácticos

| Ejercicio                                                                                 | Tema                        | Dificultad | Duración |
| ----------------------------------------------------------------------------------------- | --------------------------- | ---------- | -------- |
| [Ejercicio 01](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/2-practicas/ejercicio-01-primera-clase/README.md)     | Primera clase PlantUML      | Básico     | 20 min   |
| [Ejercicio 02](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/2-practicas/ejercicio-02-relaciones/README.md)        | Relaciones entre clases     | Intermedio | 30 min   |
| [Ejercicio 03](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/2-practicas/ejercicio-03-sistema-ecommerce/README.md) | Sistema E-Commerce completo | Avanzado   | 35 min   |

### Proyecto

[Sistema Biblioteca](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/3-proyecto/starter/sistema-biblioteca.puml) — Diagrama de clases completo de un sistema de préstamos.

### Evaluación

Ver [Rúbrica Sesión 1](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/rubrica-evaluacion.md).

---

## Sesión 2: Diagramas de Comportamiento

**Duración**: 5 horas | **Semana**: 2

### Objetivos

- Modelar requisitos funcionales con diagramas de casos de uso
- Representar flujos temporales de mensajes con diagramas de secuencia
- Modelar ciclos de vida con máquinas de estados
- Documentar procesos de negocio con diagramas de actividades

### Contenidos

| Módulo                                                                   | Tema                                       | Duración |
| ------------------------------------------------------------------------ | ------------------------------------------ | -------- |
| [`01-casos-uso.md`](../bootcamp/week-02-diagramas_de_comportamiento/1-teoria/01-casos-uso.md)       | Actores, CU, include, extend               | 25 min   |
| [`02-secuencia.md`](../bootcamp/week-02-diagramas_de_comportamiento/1-teoria/02-secuencia.md)       | Lifelines, mensajes, fragmentos combinados | 30 min   |
| [`03-comunicacion.md`](../bootcamp/week-02-diagramas_de_comportamiento/1-teoria/03-comunicacion.md) | Diferencias con secuencia, numeración      | 15 min   |
| [`04-estados.md`](../bootcamp/week-02-diagramas_de_comportamiento/1-teoria/04-estados.md)           | Estados, transiciones, guardas, compuestos | 25 min   |
| [`05-actividades.md`](../bootcamp/week-02-diagramas_de_comportamiento/1-teoria/05-actividades.md)   | Nodos, swimlanes, fork/join                | 25 min   |

### Ejercicios Prácticos

| Ejercicio                                                                         | Tema                               | Dificultad | Duración |
| --------------------------------------------------------------------------------- | ---------------------------------- | ---------- | -------- |
| [Ejercicio 01](../bootcamp/week-02-diagramas_de_comportamiento/2-practicas/ejercicio-01-casos-uso/README.md) | Casos de Uso — Red Social          | Básico     | 35 min   |
| [Ejercicio 02](../bootcamp/week-02-diagramas_de_comportamiento/2-practicas/ejercicio-02-secuencia/README.md) | Secuencia — Transferencia Bancaria | Intermedio | 40 min   |
| [Ejercicio 03](../bootcamp/week-02-diagramas_de_comportamiento/2-practicas/ejercicio-03-estados/README.md)   | Estados — Solicitud de Crédito     | Intermedio | 35 min   |

### Proyecto

[Hospital Digital](../bootcamp/week-02-diagramas_de_comportamiento/3-proyecto/starter/hospital-digital.puml) — Sistema hospitalario con los 4 diagramas de comportamiento.

### Evaluación

Ver [Rúbrica Sesión 2](../bootcamp/week-02-diagramas_de_comportamiento/rubrica-evaluacion.md).

---

## Prerrequisitos del Bootcamp

| Conocimiento                     | Nivel Requerido                             |
| -------------------------------- | ------------------------------------------- |
| Programación Orientada a Objetos | Básico (clases, herencia, interfaces)       |
| Desarrollo de software           | Básico (haber escrito al menos un proyecto) |
| UML                              | No requerido (se enseña desde cero)         |
| PlantUML                         | No requerido (se introduce en la práctica)  |

---

## Recursos Complementarios

| Recurso                                                                     | Descripción                            |
| --------------------------------------------------------------------------- | -------------------------------------- |
| [Cheat Sheet](CHEAT-SHEET.md)                                               | Referencia rápida de notación PlantUML |
| [Sesión 1 — Webgrafía](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/4-recursos/webgrafia/README.md) | Links esenciales para estructurales    |
| [Sesión 2 — Webgrafía](../bootcamp/week-02-diagramas_de_comportamiento/4-recursos/webgrafia/README.md) | Links esenciales para comportamiento   |
| [Glosario Estructural](../bootcamp/week-01-fundamentos_y_diagramas_estructurales/5-glosario/README.md)           | Términos de la Sesión 1                |
| [Glosario Comportamiento](../bootcamp/week-02-diagramas_de_comportamiento/5-glosario/README.md)        | Términos de la Sesión 2                |
