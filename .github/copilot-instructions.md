# 🤖 GitHub Copilot Instructions — Bootcamp UML

## Contexto del Proyecto

Este es un bootcamp intensivo de **UML (Unified Modeling Language)** estructurado en 2 sesiones
de 5 horas cada una (~10 horas totales). Está diseñado para desarrolladores de software con
una dedicación de **5 horas semanales**.

## Estructura del Proyecto

```
bc-uml/
├── bootcamp/
│   ├── week-01-fundamentos_y_diagramas_estructurales/     # Fundamentos + Diagramas Estructurales (5h)
│   └── week-02-diagramas_de_comportamiento/               # Diagramas de Comportamiento (5h)
├── assets/          # Diagramas SVG (dark theme)
└── docs/            # Plan de estudios y guías
```

## Convenciones del Proyecto

### Idioma

- **Documentación**: Español
- **Código PlantUML**: Inglés para clases/métodos, español para comentarios
- **Nombres de archivo**: minúsculas, guiones, numeración con cero: `01-introduccion-uml.md`

### Diagramas PlantUML

- Siempre incluir `@startuml` / `@enduml`
- Usar skinparam consistente con el tema dark del proyecto
- Los diagramas deben ser didácticos (no overly complex)

### Estructura de Módulos

Cada sesión sigue la estructura estándar:

```
sesion-X/
├── README.md                  # Objetivos, contenidos, distribución tiempo (5h)
├── rubrica-evaluacion.md      # Criterios: Conocimiento 30%, Desempeño 40%, Producto 30%
├── 0-assets/                  # SVGs del módulo
├── 1-teoria/                  # Archivos teóricos 01-xx.md, 02-xx.md...
├── 2-practicas/               # Ejercicios con enunciado + starter.puml
├── 3-proyecto/                # Proyecto con starter/
├── 4-recursos/                # webgrafia/, videografia/, ebooks-free/
└── 5-glosario/                # README.md con términos UML
```

### Evaluación

- **Conocimiento** 🧠 (30%): Cuestionarios teóricos
- **Desempeño** 💪 (40%): Ejercicios prácticos (2-practicas/)
- **Producto** 📦 (30%): Proyecto final (3-proyecto/)
- Criterio de aprobación: mínimo **70%** en cada tipo

### Distribución de tiempo por sesión (5h)

```
📖 Teoría:        2h   (40%)
💻 Prácticas:     2h   (40%)
🚀 Proyecto:      0.5h (10%)
📚 Recursos:      0.5h (10%)
```

## Restricciones

- No generar contenido fuera del scope UML 2.5
- Los SVGs deben usar tema oscuro: fondo `#1a1a1a`, sin editar en este asistente
- No referenciar herramientas comerciales de pago como alternativa exclusiva
- Las prácticas deben incluir archivos `.puml` starter funcionales
