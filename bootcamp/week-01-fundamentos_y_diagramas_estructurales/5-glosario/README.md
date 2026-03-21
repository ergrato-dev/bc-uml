# 📚 Glosario — Sesión 1: Fundamentos y Diagramas Estructurales

Referencia rápida de términos UML utilizados en esta sesión.

---

## A

**Abstracción**
Proceso de identificar características esenciales ignorando detalles no relevantes.
En UML se representa con clases abstractas (`abstract class`).

**Agregación**
Relación "tiene-un" donde las partes pueden existir independientemente del todo.
Notación: diamante blanco (`◇──`).

**Asociación**
Relación general y bidireccional entre dos clases. La más común y flexible.
Notación: línea sólida (`──`).

**Atributo**
Propiedad o dato que describe el estado de una clase.
Notación: `visibilidad nombre: tipo`

---

## C

**Cardinalidad** → Ver _Multiplicidad_

**Clase**
Plantilla que define atributos y métodos para crear objetos.
Representada como rectángulo con 3 compartimentos: nombre, atributos, métodos.

**Clase Abstracta**
Clase que no puede instanciarse directamente. Define comportamiento abstracto.
Notación: `abstract class NombreClase` o nombre en cursiva.

**Compartimento**
Cada una de las 3 secciones del rectángulo de una clase en UML.

1. Nombre | 2. Atributos | 3. Métodos

**Composición**
Relación "parte-de" donde las partes **no pueden existir** sin el todo.
Notación: diamante negro (`◆──`).

---

## D

**Dependencia**
Relación de uso temporal entre dos clases (la más débil).
Notación: flecha punteada (`····>`).

**Diagrama de Clases**
Diagrama UML que muestra clases, atributos, métodos y relaciones.
El más usado de todos los diagramas UML.

**Diagrama de Componentes**
Diagrama que muestra la organización modular del sistema (módulos, servicios, librerías).

**Diagrama de Despliegue**
Diagrama que muestra la distribución física del sistema en nodos e infraestructura.

**Diagrama de Objetos**
Diagrama que muestra instancias concretas de clases en un momento específico.

---

## E

**Encapsulamiento**
Principio de ocultar el estado interno (atributos privados) y exponer solo lo necesario (métodos públicos).

**Enumeración (Enum)**
Tipo de dato con un conjunto fijo de valores posibles.
Notación: `enum NombreEnum { VALOR1, VALOR2 }`

---

## H

**Herencia / Generalización**
Relación "es-un" donde una subclase hereda todos los miembros de la superclase.
Notación: flecha con triángulo vacío (`──▷`).

---

## I

**Interfaz**
Contrato que define métodos abstractos que una clase debe implementar.
Notación: `interface NombreInterfaz` o estereotipo `«interface»`.

**Instancia** → Ver _Objeto_

---

## M

**Método**
Comportamiento u operación de una clase.
Notación: `visibilidad nombre(parámetros): TipoRetorno`

**Multiplicidad**
Número de instancias que participan en una relación.
Valores comunes: `1`, `0..1`, `*`, `1..*`, `0..*`

---

## O

**Objeto**
Instancia concreta de una clase con valores específicos.
En un diagrama de objetos: `nombreObjeto: Clase`

**OMG (Object Management Group)**
Organismo que estandariza UML. Publicó UML 1.0 en 1997.

---

## P

**Polimorfismo**
Capacidad de objetos de diferentes clases de responder al mismo mensaje.
En UML: métodos abstractos que cada subclase implementa diferente.

**Protected** (`#`)
Modificador de acceso: accesible desde la clase y sus subclases.

**Private** (`-`)
Modificador de acceso: solo accesible dentro de la misma clase.

**Public** (`+`)
Modificador de acceso: accesible desde cualquier lugar.

---

## R

**Realización**
Relación donde una clase implementa todos los métodos de una interfaz.
Notación: flecha punteada con triángulo vacío (`····▷`).

**Relación**
Conexión semántica entre dos clases. Tipos: composición, agregación, herencia, realización, asociación, dependencia.

---

## S

**Subclase / Clase Derivada**
Clase que hereda de una superclase. Puede sobrescribir métodos y agregar nuevos.

**Superclase / Clase Base / Clase Padre**
Clase de la que otras heredan sus atributos y métodos.

---

## U

**UML (Unified Modeling Language)**
Lenguaje de modelado visual estándar para especificar, visualizar y documentar sistemas de software.
Versión actual: UML 2.5.1 (2017).

---

## V

**Visibilidad**
Modificador de acceso de atributos y métodos:

- `+` público | `-` privado | `#` protegido | `~` de paquete

---

## 🔗 Navegación

⬅️ [README Sesión 1](../README.md) | ➡️ [Sesión 2 — Glosario](../../week-02-diagramas_de_comportamiento/5-glosario/README.md)
