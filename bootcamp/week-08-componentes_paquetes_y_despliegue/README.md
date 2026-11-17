# Semana 08 — Componentes, paquetes y despliegue

## Descripción

Pasas del comportamiento a la arquitectura. Agrupas tus clases en paquetes sin ciclos, partes el sistema en componentes que se comunican solo por interfaces y decides en qué máquinas se instala cada pieza. Las tres vistas se trazan entre sí y hasta `02-clases.puml`.

## Objetivos de aprendizaje

Al terminar esta semana, podrás:

- Agrupar clases en paquetes por lo que cambia junto y derivar sus dependencias de las asociaciones
- Detectar y romper ciclos de dependencias entre paquetes
- Modelar componentes con interfaces provistas y requeridas en lugar de flechas directas
- Encapsular un componente compuesto detrás de un puerto con delegación
- Modelar dispositivos, entornos de ejecución, artefactos desplegados y rutas de comunicación con su protocolo
- Trazar cada componente a un artefacto con `«manifest»` y cada artefacto a su nodo
- Depurar diagramas de componentes y de despliegue rotos, en sintaxis y en modelado

## Prerrequisitos

- Semana 07 completada (tu modelo pasa `./scripts/verificar-semana.sh 07`)
- El laboratorio Docker (`docker compose build`, ver [setup del entorno](../../docs/setup-entorno.md))

## Contenido

| # | Tipo | Tema | Tiempo |
|---|------|------|--------|
| — | Teoría | [Paquetes y dependencias](1-teoria/01-paquetes-y-dependencias.md) | 15 min |
| — | Teoría | [Componentes e interfaces](1-teoria/02-componentes-e-interfaces.md) | 15 min |
| — | Teoría | [Nodos y artefactos](1-teoria/03-nodos-y-artefactos.md) | 15 min |
| — | Conocimiento | [10 preguntas](rubrica-evaluacion.md#-conocimiento-30) | 15 min |
| 1 | Lab | [lab-01-paquetes-y-dependencias](2-practicas/lab-01-paquetes-y-dependencias/README.md) | 60 min |
| 2 | Lab | [lab-02-componentes-e-interfaces](2-practicas/lab-02-componentes-e-interfaces/README.md) | 60 min |
| 3 | Lab | [lab-03-puertos-y-delegacion](2-practicas/lab-03-puertos-y-delegacion/README.md) | 60 min |
| 4 | Lab | [lab-04-nodos-y-artefactos](2-practicas/lab-04-nodos-y-artefactos/README.md) | 60 min |
| 5 | Lab | [lab-05-del-componente-al-despliegue](2-practicas/lab-05-del-componente-al-despliegue/README.md) | 60 min |
| 6 | Lab | [lab-06-depurar-diagramas-rotos](2-practicas/lab-06-depurar-diagramas-rotos/README.md) | 60 min |
| — | Proyecto | [Paquetes, componentes y despliegue](3-proyecto/README.md) | 3 h |

**Total: 10 horas**

## Distribución del tiempo

```
[45 min] Leer 1-teoria/
[15 min] Responder las 10 preguntas de Conocimiento
[60 min] lab-01 — Paquetes y dependencias
[60 min] lab-02 — Componentes e interfaces
[60 min] lab-03 — Puertos y delegación
[60 min] lab-04 — Nodos y artefactos
[60 min] lab-05 — Del componente al despliegue
[60 min] lab-06 — Depurar diagramas rotos
[3 h]    Proyecto: paquetes, componentes y despliegue
```

## Verificación de completitud

Desde la raíz del repositorio:

```bash
./scripts/verificar-semana.sh 08
```

## 🔗 Navegación

| Anterior | Actual | Siguiente |
|---|---|---|
| [Semana 07 — Máquinas de estados](../week-07-maquinas_de_estados/README.md) | **Semana 08 — Componentes, paquetes y despliegue** | [Semana 09](../week-09-de_uml_a_codigo_y_patrones/README.md) |

[← Volver al índice del bootcamp](../README.md)
