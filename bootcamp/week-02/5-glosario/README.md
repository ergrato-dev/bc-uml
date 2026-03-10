# Glosario — Sesión 2: Diagramas de Comportamiento UML

> Términos clave para los diagramas de comportamiento: casos de uso,
> secuencia, comunicación, estados y actividades.

---

## A

**Actor**
: Entidad externa al sistema (persona, organización u otro sistema) que
interactúa con él. Se representa como un muñeco palito o un rectángulo con
el estereotipo `«actor»`. Los actores pueden ser **primarios** (inician CU)
o **secundarios** (responden a CU).

**Activación** _(Activation bar)_
: Rectángulo delgado sobre una línea de vida en un diagrama de secuencia
que indica el período en que ese objeto está ejecutando una operación.
En PlantUML se genera con `activate` / `deactivate`.

**Actividad** _(Activity)_
: Comportamiento compuesto expuesto como un flujo de acciones en un diagrama
de actividades. Equivale a un método o proceso de negocio.

---

## C

**Caso de Uso** _(Use Case)_
: Especificación de una secuencia de acciones, incluyendo variantes, que el
sistema ejecuta para producir un resultado observable de valor para un actor.
Los nombres siempre se escriben en **infinitivo** (ej. _Registrar Pedido_).

**Condición de Guarda** _(Guard Condition)_
: Expresión booleana asociada a una transición en un diagrama de estados o
actividades. La transición solo se dispara si la guarda es verdadera.
Notación: `evento[condición] / acción`.

---

## D

**Decisión** _(Decision Node)_
: Nodo rombo en un diagrama de actividades que representa un punto de
bifurcación con condiciones de guarda en cada flujo de salida.

---

## E

**Estado** _(State)_
: Situación durante la vida de un objeto en la que satisface alguna condición,
realiza alguna actividad o espera algún evento. Se representa con un rectángulo
de esquinas redondeadas.

**Estado Compuesto** _(Composite State)_
: Estado que contiene una máquina de estados interna (subestados). Permite
modelar comportamiento complejo sin entrelazar transiciones externas.

**Estado Final** _(Final State)_
: Estado especial que representa la terminación de la máquina de estados
o de una región. Se representa con un círculo lleno rodeado de otro círculo
(notación `[*]` en PlantUML al destino).

**Estado Inicial** _(Initial State)_
: Pseudoestado que indica el punto de entrada de la máquina de estados.
Se representa con un círculo negro sólido (notación `[*] -->` en PlantUML).

**Extend** _(«extend»)_
: Relación entre casos de uso donde el CU **extensión** añade comportamiento
opcional al CU **base** bajo ciertas condiciones. La flecha apunta del CU
extensión al CU base: `CUextension ..> CUbase : «extend»`.

---

## F

**Fork**
: Nodo en diagrama de actividades que divide un flujo en múltiples flujos
concurrentes (paralelos). Se representa con una barra horizontal gruesa.

**Fragmento Combinado** _(Combined Fragment)_
: Elemento en diagramas de secuencia que agrupa mensajes bajo un operador
de interacción: `alt`, `opt`, `loop`, `par`, `break`, `ref`, etc.

---

## G

**Guarda** → ver _Condición de Guarda_

---

## I

**Include** _(«include»)_
: Relación entre casos de uso donde el CU base **siempre** incluye el
comportamiento del CU incluido. La flecha apunta del CU base al incluido:
`CUbase ..> CUincluido : «include»`. Evita duplicación de pasos comunes.

---

## J

**Join**
: Nodo en diagrama de actividades que sincroniza múltiples flujos concurrentes
en uno solo. Se representa con una barra horizontal gruesa (igual que fork,
pero con múltiples entradas y una salida).

---

## L

**Línea de Vida** _(Lifeline)_
: Elemento en un diagrama de secuencia que representa un participante
individual durante una interacción. Se muestra como un rectángulo (cabeza)
con una línea de puntos vertical (cuerpo).

---

## M

**Máquina de Estados** _(State Machine)_
: Modelo de comportamiento que describe la secuencia de estados por los que
pasa un objeto a lo largo de su vida en respuesta a eventos.

**Mensaje** _(Message)_
: Comunicación entre lifelines en un diagrama de secuencia.
Tipos principales:

- **Síncrono** (`->`) — espera respuesta antes de continuar.
- **Asíncrono** (`->>`) — no espera respuesta.
- **Retorno** (`-->`) — respuesta a un mensaje síncrono.
- **Auto-mensaje** — un objeto se envía un mensaje a sí mismo.

---

## N

**Nodo de Acción** _(Action Node)_
: Nodo en un diagrama de actividades que representa una tarea atómica
(no descomponible en el nivel de abstracción actual). Se representa con
un rectángulo de esquinas redondeadas.

---

## O

**Operador de Interacción** _(Interaction Operator)_
: Palabra clave que define la semántica de un fragmento combinado:
`alt` (alternativa), `opt` (opcional), `loop` (bucle), `par` (paralelo),
`break` (ruptura), `ref` (referencia a otra interacción).

---

## P

**Partición** _(Partition / Swimlane)_
: División vertical u horizontal de un diagrama de actividades que agrupa
acciones por responsabilidad (actor, departamento, sistema). En PlantUML:
`|NombreCarril|`.

**Pseudoestado** _(Pseudostate)_
: Estado especial en una máquina de estados (inicial `[*]`, final, historia,
junction, choice) que no tiene semántica de estado completa por sí solo.

---

## S

**Secuencia** _(Sequence Diagram)_
: Diagrama que muestra cómo los objetos interactúan entre sí con énfasis
en el **orden temporal** de los mensajes.

**Swimlane** → ver _Partición_

---

## T

**Transición** _(Transition)_
: Arco dirigido entre dos estados en una máquina de estados, disparado por
un evento, condicionado por una guarda, y con una acción opcional.
Notación completa: `evento[guarda] / acción`.

---

## U

**Uso de Caso** → ver _Caso de Uso_

---

_Glosario de la Sesión 1 (términos estructurales): consultar
[`../../week-01/5-glosario/README.md`](../../week-01/5-glosario/README.md)_
