# 🏗️ Sesión 1: Fundamentos y Diagramas Estructurales

## 🎯 Objetivos de Aprendizaje

Al finalizar esta sesión, serás capaz de:

- ✅ Explicar qué es UML y cuándo aplicarlo en proyectos reales
- ✅ Identificar y clasificar los 14 tipos de diagramas UML 2.5
- ✅ Crear diagramas de clases con atributos, métodos y visibilidad
- ✅ Aplicar los 6 tipos de relaciones entre clases
- ✅ Usar multiplicidades correctamente en asociaciones
- ✅ Diseñar diagramas de objetos como instancias de clases
- ✅ Modelar arquitectura con diagramas de componentes
- ✅ Representar infraestructura con diagramas de despliegue

---

## 📚 Requisitos Previos

> Ninguno obligatorio. Esta es tu sesión inicial de UML.

- Conocimiento básico de programación orientada a objetos (conceptos: clase, objeto, herencia)
- Editor de texto o VS Code instalado
- Opcional: PlantUML instalado localmente o acceso a [plantuml.com/plantuml](http://www.plantuml.com/plantuml)

---

## 🗂️ Estructura de la Sesión

```
week-01/
├── README.md                                 # Este archivo
├── rubrica-evaluacion.md                     # Criterios de evaluación
├── 0-assets/                                 # Diagramas SVG de apoyo
├── 1-teoria/
│   ├── 01-introduccion-uml.md               # ¿Qué es UML? Historia y taxonomía
│   ├── 02-cuando-usar-uml.md                # Cuándo aplicar UML (y cuándo no)
│   ├── 03-diagrama-clases-sintaxis.md       # Clases, atributos, métodos, visibilidad
│   ├── 04-relaciones-entre-clases.md        # Las 6 relaciones + multiplicidades
│   └── 05-diagramas-estructurales.md        # Objetos, Componentes y Despliegue
├── 2-practicas/
│   ├── ejercicio-01-primera-clase/           # Modelar una clase básica
│   ├── ejercicio-02-relaciones/              # Las 6 relaciones en práctica
│   └── ejercicio-03-sistema-ecommerce/      # Caso integrador e-commerce
├── 3-proyecto/
│   └── starter/
│       └── sistema-biblioteca.puml           # Starter del proyecto
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

| Tema                    | Archivo                          | Duración | Descripción                                                             |
| ----------------------- | -------------------------------- | -------- | ----------------------------------------------------------------------- |
| Introducción a UML      | `01-introduccion-uml.md`         | 25 min   | Historia, estándar OMG, 14 diagramas, taxonomía                         |
| Cuándo usar UML         | `02-cuando-usar-uml.md`          | 15 min   | Casos ideales, cuándo NO usar, buenas prácticas                         |
| Diagrama de Clases      | `03-diagrama-clases-sintaxis.md` | 35 min   | Sintaxis, visibilidad, tipos estáticos y abstractos                     |
| Relaciones entre Clases | `04-relaciones-entre-clases.md`  | 30 min   | Asociación, agregación, composición, herencia, realización, dependencia |
| Diagramas Estructurales | `05-diagramas-estructurales.md`  | 15 min   | Objetos, componentes, despliegue                                        |

### 2️⃣ Prácticas (2 horas)

| Ejercicio          | Carpeta                           | Duración | Nivel        | Descripción                                         |
| ------------------ | --------------------------------- | -------- | ------------ | --------------------------------------------------- |
| Primera Clase UML  | `ejercicio-01-primera-clase/`     | 25 min   | Básico       | Modelar clase `Producto` desde cero                 |
| Las 6 Relaciones   | `ejercicio-02-relaciones/`        | 40 min   | Básico/Medio | Identificar y aplicar cada tipo de relación         |
| Sistema E-Commerce | `ejercicio-03-sistema-ecommerce/` | 55 min   | Intermedio   | Diagrama completo con 6+ clases y relaciones mixtas |

### 3️⃣ Proyecto (1 hora)

**Sistema de Gestión de Biblioteca** — Modelado completo con:

- Diagrama de clases con herencia y composición
- Diagrama de objetos con datos de ejemplo
- Diagrama de componentes de la arquitectura

---

## ⏱️ Distribución del Tiempo (5 horas)

```
📖 Teoría:        2h   (40%)
💻 Prácticas:     2h   (40%)
🚀 Proyecto:      0.5h (10%)
📚 Recursos:      0.5h (10%)
```

### Cronograma Sugerido

| Bloque   | Actividad                                             | Tiempo |
| -------- | ----------------------------------------------------- | ------ |
| Bloque 1 | Teoría temas 1-2 (introducción + cuándo usar)         | 40 min |
| Bloque 2 | Teoría temas 3-4 (clases + relaciones) + ejercicio-01 | 90 min |
| Bloque 3 | Teoría tema 5 + ejercicio-02                          | 70 min |
| Bloque 4 | Ejercicio-03 + inicio proyecto                        | 80 min |
| Bloque 5 | Recursos y glosario                                   | 30 min |

---

## 📌 Entregables

### 📦 Proyecto: Sistema de Biblioteca (100% del producto)

Archivo `sistema-biblioteca.puml` funcional que incluya:

- [ ] Diagrama de clases con mínimo 5 clases
- [ ] Al menos 3 tipos de relaciones diferentes
- [ ] Multiplicidades correctas en todas las asociaciones
- [ ] Atributos y métodos con visibilidad correcta
- [ ] Diagrama de objetos con al menos 3 instancias

> **Nota**: Los ejercicios de prácticas son materiales de aprendizaje preparatorios.
> El único entregable formal es el proyecto.

---

## 🎓 Conceptos Clave

- **UML**: Unified Modeling Language — estándar OMG para modelado de software
- **Diagrama de Clases**: Representación estática de clases, atributos, métodos y relaciones
- **Visibilidad**: `+` público, `-` privado, `#` protegido, `~` de paquete
- **Asociación**: Relación general entre dos clases (`──`)
- **Agregación**: "tiene-un" con ciclo de vida independiente (`◇──`)
- **Composición**: "contiene-un" con ciclo de vida dependiente (`◆──`)
- **Herencia**: "es-un" — subclase hereda de superclase (`──▷`)
- **Realización**: Clase implementa una interfaz (`····▷`)
- **Dependencia**: Uso temporal entre clases (`····>`)
- **Multiplicidad**: Cardinalidad de la relación (`1`, `0..1`, `*`, `1..*`)
- **Diagrama de Objetos**: Instancias concretas de clases en un momento dado
- **Diagrama de Componentes**: Organización modular del sistema
- **Diagrama de Despliegue**: Distribución física de la infraestructura

---

## 📚 Recursos Adicionales

### 📖 Lecturas Recomendadas

- Ver carpeta [4-recursos/webgrafia/](4-recursos/webgrafia/)

### 🎥 Videos

- Ver carpeta [4-recursos/videografia/](4-recursos/videografia/)

### 📚 Ebooks Gratuitos

- Ver carpeta [4-recursos/ebooks-free/](4-recursos/ebooks-free/)

---

## ✅ Checklist de Verificación

Antes de pasar a la Sesión 2, asegúrate de:

- [ ] Identifico los 14 diagramas UML y sus dos categorías
- [ ] Sé cuándo aplicar y cuándo NO aplicar UML
- [ ] Puedo crear una clase con atributos, métodos y visibilidad correcta
- [ ] Entiendo la diferencia entre composición y agregación
- [ ] Puedo aplicar los 6 tipos de relaciones
- [ ] Utilizo multiplicidades correctamente
- [ ] Puedo diferenciar una clase de un objeto en UML
- [ ] Entrego el proyecto funcional en PlantUML ✨
- [ ] Alcancezo mínimo 70% en la evaluación

---

## 🔗 Navegación

⬅️ Anterior: [Inicio del Bootcamp](../../README.md) &nbsp;➡️ Siguiente: [Sesión 2: Diagramas de Comportamiento](../week-02/README.md)

---

## 💡 Consejos para Esta Sesión

> 💡 **El diagrama de clases es el rey**: Dedica el tiempo necesario a dominarlo — es la base de todo UML estructural.

> ✏️ **Dibuja antes de codificar**: Esboza el diagrama en papel antes de escribir código PlantUML. Pensar primero, tipear después.

> 🔗 **Relaciones: calidad > cantidad**: Es mejor 3 relaciones bien definidas que 8 imprecisas. Pregúntate: ¿composición o agregación? ¿herencia o asociación?

> 🎯 **Usa el proyecto como hilo conductor**: El Sistema de Biblioteca te acompaña durante toda la sesión — cada ejercicio es un bloque hacia el entregable final.
