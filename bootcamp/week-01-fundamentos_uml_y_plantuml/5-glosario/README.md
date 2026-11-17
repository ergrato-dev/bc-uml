# Glosario — Semana 01

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| UML | Notación estándar del OMG para modelar sistemas de software | Un diagrama de clases UML 2.5.1 |
| Modelo | Simplificación de un sistema que muestra solo lo necesario para un propósito | El modelo conceptual de un cine |
| Diagrama | Vista gráfica de una parte de un modelo | El diagrama de estados de un pedido |
| Boceto | Uso de UML para pensar y discutir, con el detalle justo | Seis clases en una pizarra antes de programar |
| Plano | Uso de UML para documentar un diseño que otro construirá o mantendrá | Diagrama de despliegue del sistema en producción |
| Diagrama de estructura | Diagrama que muestra lo que existe a la vez, sin tiempo | Clases, componentes, despliegue |
| Diagrama de comportamiento | Diagrama que muestra algo que ocurre en el tiempo | Actividades, secuencia, estados |
| Diagrama de interacción | Diagrama de comportamiento centrado en mensajes entre participantes | Secuencia, comunicación |
| Modelo conceptual | Diagrama de clases con los conceptos del negocio y sus asociaciones, sin atributos | `Member -- Loan : requests` |
| Asociación | Relación estructural entre dos clases | `Order -- Product : contains` |
| PlantUML | Herramienta que dibuja diagramas a partir de texto | `plantuml -tsvg modelo.puml` |
| `@startuml` / `@enduml` | Marcas que delimitan un diagrama en un `.puml` | Sin `@enduml`: `No diagram found` |
| `!include` | Directiva de PlantUML que inserta otro archivo | `!include estilo.iuml` |
| Diagramas como código | Práctica de escribir diagramas como texto versionado | Revisar un `.puml` con `git diff` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | — |

[↑ Semana 01](../README.md)
