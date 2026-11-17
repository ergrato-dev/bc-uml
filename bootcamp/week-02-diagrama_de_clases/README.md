# Semana 02 — Diagrama de clases

## Descripción

Pasas del modelo conceptual a un diagrama de clases en perspectiva de especificación: atributos con tipo y visibilidad, operaciones con firma completa, miembros estáticos y derivados, enumeraciones, clases abstractas e interfaces. Aprendes a leer código y dibujar su diagrama, y a revisar un diagrama que renderiza pero está mal modelado.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Escribir clases UML con atributos tipados y operaciones con firma completa
- Aplicar la visibilidad para encapsular el estado y expresar reglas del negocio como operaciones
- Usar multiplicidad de atributo, atributos derivados, valores iniciales y miembros estáticos
- Elegir entre enumeración, clase abstracta e interfaz y justificarlo
- Traducir clases de Java y Python a un diagrama de clases
- Revisar un diagrama de clases y corregir errores de modelado

## Prerrequisitos

- Semana 01 completada (tu modelo conceptual pasa `./scripts/verificar-semana.sh 01`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Anatomía de una clase](1-teoria/01-anatomia-de-una-clase.md) | 25 min |
| — | Teoría | [Enumeraciones, clases abstractas e interfaces](1-teoria/02-enums-abstractas-e-interfaces.md) | 20 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-anatomia-de-una-clase](2-practicas/lab-01-anatomia-de-una-clase/README.md) | 60 min |
| 2 | Lab | [lab-02-visibilidad-y-encapsulamiento](2-practicas/lab-02-visibilidad-y-encapsulamiento/README.md) | 60 min |
| 3 | Lab | [lab-03-operaciones-y-firmas](2-practicas/lab-03-operaciones-y-firmas/README.md) | 60 min |
| 4 | Lab | [lab-04-enums-abstractas-e-interfaces](2-practicas/lab-04-enums-abstractas-e-interfaces/README.md) | 60 min |
| 5 | Lab | [lab-05-de-codigo-a-diagrama](2-practicas/lab-05-de-codigo-a-diagrama/README.md) | 60 min |
| 6 | Lab | [lab-06-revisar-un-diagrama-de-clases](2-practicas/lab-06-revisar-un-diagrama-de-clases/README.md) | 60 min |
| — | Proyecto | [Diagrama de clases de tu dominio](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Anatomía de una clase
[60 min] lab-02 — Visibilidad y encapsulamiento
[60 min] lab-03 — Operaciones y firmas completas
[60 min] lab-04 — Enumeraciones, clases abstractas e interfaces
[60 min] lab-05 — De código a diagrama
[60 min] lab-06 — Revisar un diagrama de clases
[3 h]    Proyecto: diagrama de clases de tu dominio
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 02
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 01 — Fundamentos de UML y PlantUML](../week-01-fundamentos_uml_y_plantuml/README.md) | **Semana 02 — Diagrama de clases** | [Semana 03 — Relaciones y diagrama de objetos](../week-03-relaciones_y_diagrama_de_objetos/README.md) |

[← Volver al índice del bootcamp](../README.md)
