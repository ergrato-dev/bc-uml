# Lab 03 — Elegir el diagrama

⏱ Duración estimada: ~60 min

## Objetivo

Elegir el diagrama UML adecuado para ocho situaciones reales y justificar la elección con la pregunta que responde.

## Contexto

- Un diagrama se elige por la pregunta que hay que responder, no por costumbre.
- La tabla "Cómo elegir" de [Taxonomía de UML](../../1-teoria/02-taxonomia-uml.md) es tu herramienta; no la copies, aplícala.
- Este lab no usa el contenedor: es un ejercicio de criterio.

## Paso a paso

0. Abre `bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-03-elegir-el-diagrama/starter/respuestas.md` en tu editor.

1. Para cada escenario, antes de pensar en diagramas, escribe en la columna **Pregunta que responde** la pregunta de fondo en una frase. Ejemplo con un escenario que no está en la tabla:

   > "El equipo nuevo no sabe en qué orden se procesa una devolución ni quién la aprueba"
   > Pregunta: ¿Qué pasos tiene una devolución y quién hace cada uno?

2. Clasifica la pregunta: ¿habla de **cosas que existen a la vez** (estructura) o de **algo que ocurre en el tiempo** (comportamiento)? Esto descarta la mitad de los diagramas.

3. Dentro de la familia, elige el diagrama concreto y escríbelo en la columna **Diagrama**. Pistas para no confundirte:

   | Si dudas entre... | Pregúntate |
   |---|---|
   | Secuencia y actividades | ¿Importan los mensajes entre objetos concretos (secuencia) o los pasos y quién los hace (actividades)? |
   | Clases y objetos | ¿Hablas de tipos en general (clases) o de un caso concreto con valores (objetos)? |
   | Componentes y despliegue | ¿Hablas de piezas de software y sus interfaces (componentes) o de máquinas y contenedores (despliegue)? |
   | Casos de uso y actividades | ¿Qué objetivos tiene cada usuario (casos de uso) o cómo se ejecuta uno de ellos paso a paso (actividades)? |

4. En la última columna escribe qué otro diagrama consideraste y por qué lo descartaste. Si no dudaste, escribe el más parecido y por qué no sirve.

5. Revisa tu tabla con estas comprobaciones:
   - Ninguna fila tiene `TODO`: `grep -c TODO starter/respuestas.md` desde la carpeta del lab imprime `0`.
   - Al menos 4 diagramas distintos en la columna **Diagrama**: si repites mucho uno, revisa si respondiste la pregunta o el tema.
   - Ninguna pregunta empieza por "¿Cómo es el diagrama...?": la pregunta es del negocio o del sistema, no de UML.

## Criterios de éxito

- [ ] `grep -c TODO starter/respuestas.md` imprime `0`
- [ ] Las 8 filas tienen diagrama, pregunta y descarte
- [ ] Usaste al menos 4 tipos de diagrama distintos
- [ ] Cada pregunta se entiende sin saber UML

## Reto extra

Escribe un escenario noveno para cada uno de los diagramas que no apareció en tu tabla.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Depurar diagramas rotos](../lab-02-depurar-diagramas-rotos/README.md) | [Lab 04 — Leer diagramas](../lab-04-leer-diagramas/README.md) → |

[↑ Semana 01](../../README.md)
