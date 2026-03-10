# 03 — Diagrama de Clases: Sintaxis y Estructura

> ⏱️ Duración estimada: **35 minutos**

## 🎯 Objetivos

- Dominar la sintaxis completa del diagrama de clases
- Aplicar correctamente los modificadores de visibilidad
- Modelar atributos, métodos y sus tipos
- Representar elementos especiales: abstractos, estáticos, derivados

---

## 🎥 Video de Refuerzo

📺 **El Plano del Código: UML**

👉 [Ver video en Dropbox](https://www.dropbox.com/scl/fi/7vr6zegwi3yjyeszafuy4/1.2.El_Plano_del_C-digo__UML.mp4?rlkey=nwtut0r1mhiue750jcav9cnnb&st=iweiu2fs&dl=0)

---

## 📖 ¿Qué es un Diagrama de Clases?

El **Diagrama de Clases** es el diagrama UML más utilizado. Representa la
**estructura estática** del sistema mostrando:

- **Clases**: Plantillas que definen objetos
- **Atributos**: Las propiedades/datos de cada clase
- **Métodos**: Los comportamientos/operaciones de cada clase
- **Relaciones**: Cómo se conectan las clases entre sí

---

## 🎨 Anatomía de una Clase

Una clase se representa con un rectángulo dividido en **3 compartimentos**:

![Sintaxis de Clase](../0-assets/02-clase-sintaxis.svg)

```
┌─────────────────────────────┐
│         NombreClase         │  ← Compartimento 1: Nombre (OBLIGATORIO)
├─────────────────────────────┤
│  visibilidad nombre: tipo   │  ← Compartimento 2: Atributos (opcional)
│  visibilidad nombre: tipo   │
├─────────────────────────────┤
│  visibilidad nombre(): tipo │  ← Compartimento 3: Métodos (opcional)
│  visibilidad nombre(): tipo │
└─────────────────────────────┘
```

### Ejemplo Completo

```plantuml
@startuml
class Producto {
  - id: String
  - nombre: String
  - precio: Double
  - stock: int
  --
  + getNombre(): String
  + setPrecio(precio: Double): void
  + isDisponible(): boolean
  - calcularImpuesto(): Double
}
@enduml
```

---

## 🔒 Modificadores de Visibilidad

Los modificadores de acceso se indican con **símbolos antes del nombre**:

| Símbolo | Visibilidad   | Significado                              | Equivalente                       |
| ------- | ------------- | ---------------------------------------- | --------------------------------- |
| `+`     | **public**    | Accesible desde cualquier lugar          | `public` en Java/Python           |
| `-`     | **private**   | Solo accesible desde la misma clase      | `private` en Java, `__` en Python |
| `#`     | **protected** | Accesible desde la clase y sus subclases | `protected` en Java               |
| `~`     | **package**   | Accesible dentro del mismo paquete       | `default` en Java                 |

### ✅ Buena Práctica: Encapsulamiento

```plantuml
@startuml
' ❌ MAL: atributos públicos exponen el estado interno
class UsuarioMal {
  + password: String
  + saldo: Double
}

' ✅ BIEN: atributos privados con getters/setters controlados
class UsuarioBien {
  - password: String
  - saldo: Double
  + getSaldo(): Double
  + setSaldo(monto: Double): void
  - validarPassword(pass: String): boolean
}
@enduml
```

---

## 📝 Tipos de Atributos y Métodos

### Atributos con Tipo Explícito

```plantuml
@startuml
class Empleado {
  - id: String           ' String
  - nombre: String       ' String
  - salario: Double      ' Decimal
  - activo: boolean      ' Booleano
  - fechaIngreso: Date   ' Fecha
  - roles: List<String>  ' Colección
}
@enduml
```

### Atributos Estáticos (subrayados)

Los atributos **estáticos** pertenecen a la clase, no a las instancias.
En PlantUML se subrayan automáticamente con `{static}`:

```plantuml
@startuml
class Configuracion {
  - {static} instancia: Configuracion
  - {static} MAX_USUARIOS: int = 1000
  - tema: String
  + {static} getInstancia(): Configuracion
}
@enduml
```

### Métodos Abstractos

Los métodos **abstractos** no tienen implementación — las subclases deben implementarlos:

```plantuml
@startuml
abstract class Figura {
  - color: String
  + {abstract} calcularArea(): Double
  + {abstract} calcularPerimetro(): Double
  + getColor(): String
}
@enduml
```

### Atributos Derivados (/)

Los atributos **derivados** se calculan a partir de otros:

```plantuml
@startuml
class Carrito {
  - items: List<Item>
  - descuento: Double
  / total: Double    ' calculado: suma(items) - descuento
}
@enduml
```

---

## 🏷️ Estereotipos y Restricciones

### Estereotipos Comunes

```plantuml
@startuml
' Interfaz
interface Pagable {
  + procesar(): boolean
}

' Clase abstracta
abstract class Vehiculo {
  + {abstract} acelerar(): void
}

' Enumeración
enum EstadoPedido {
  CREADO
  CONFIRMADO
  ENVIADO
  ENTREGADO
  CANCELADO
}
@enduml
```

### Restricciones

```plantuml
@startuml
class CuentaBancaria {
  - saldo: Double {saldo >= 0}  ' restricción
  - limite: Double
  + depositar(monto: Double): void {monto > 0}
}
@enduml
```

---

## 🌍 Ejemplo de la Vida Real: Sistema E-Commerce

![Diagrama de Clases E-Commerce](../0-assets/03-ecommerce-diagrama-clases.svg)

```plantuml
@startuml
skinparam classBackgroundColor #2d2d2d
skinparam classBorderColor #666666
skinparam classAttributeIconSize 0

class Usuario {
  - id: String
  - email: String
  - passwordHash: String
  - nombre: String
  --
  + registrar(): void
  + iniciarSesion(pass: String): boolean
  + actualizarPerfil(): void
}

class Producto {
  - sku: String
  - nombre: String
  - precio: Double
  - stock: int
  - categoria: String
  --
  + estaDisponible(): boolean
  + actualizarStock(cantidad: int): void
}

class Pedido {
  - id: String
  - fecha: Date
  - estado: EstadoPedido
  / total: Double
  --
  + confirmar(): void
  + cancelar(): void
  + calcularTotal(): Double
}

enum EstadoPedido {
  CREADO
  CONFIRMADO
  ENVIADO
  ENTREGADO
}
@enduml
```

---

## ✅ Resumen

| Elemento           | Notación              | Cuándo usarlo                       |
| ------------------ | --------------------- | ----------------------------------- |
| Atributo público   | `+ nombre: Tipo`      | Raro — solo si es intencional       |
| Atributo privado   | `- nombre: Tipo`      | Por defecto para datos internos     |
| Atributo protegido | `# nombre: Tipo`      | Cuando subclases necesitan acceso   |
| Método público     | `+ nombre(): Tipo`    | API pública de la clase             |
| Atributo estático  | `{static} nombre`     | Compartido por todas las instancias |
| Método abstracto   | `{abstract} nombre()` | Clases abstractas/interfaces        |
| Atributo derivado  | `/ nombre: Tipo`      | Calculado a partir de otros         |

---

## 🔗 Navegación

⬅️ Anterior: [02 — Cuándo Usar UML](02-cuando-usar-uml.md) &nbsp;➡️ Siguiente: [04 — Relaciones entre Clases](04-relaciones-entre-clases.md)
