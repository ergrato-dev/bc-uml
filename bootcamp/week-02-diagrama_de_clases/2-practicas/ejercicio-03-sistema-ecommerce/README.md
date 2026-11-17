# Ejercicio 03 — Sistema E-Commerce Completo

> ⏱️ Duración: **55 minutos** | Nivel: **Intermedio**

## 🎯 Objetivo

Diseñar el diagrama de clases completo de un sistema e-commerce tomando
decisiones de diseño justificadas: qué relaciones usar, qué atributos modelar,
qué visibilidad aplicar.

---

## 📋 Enunciado

Eres el arquitecto de software de **ShopFast**, una plataforma de e-commerce.
Debes modelar el núcleo del sistema con las clases requeridas.

### Entidades del Sistema

#### 1. Usuario

- Propiedades: `id`, `email`, `passwordHash`, `nombre`, `apellido`, `fechaRegistro`, `activo`
- Métodos: verificar credenciales, actualizar perfil, dar de baja
- Tipos de usuario: `ClienteRegistrado`, `Administrador`, `Vendedor`

#### 2. Dirección

- Propiedades: `calle`, `numero`, `ciudad`, `pais`, `codigoPostal`
- Un usuario puede tener múltiples direcciones
- La dirección **no existe** sin el usuario (decide la relación)

#### 3. Producto

- Propiedades: `sku`, `nombre`, `descripcion`, `precio`, `stock`, `activo`
- Puede pertenecer a múltiples categorías
- Tiene 0 o más imágenes

#### 4. Categoría

- Propiedades: `id`, `nombre`, `descripcion`
- Puede tener subcategorías (jerarquía)

#### 5. Pedido

- Propiedades: `numeroPedido`, `fecha`, `estado`, `total` (derivado)
- Estados: `CREADO`, `CONFIRMADO`, `PAGADO`, `ENVIADO`, `ENTREGADO`, `CANCELADO`
- Un pedido pertenece a un cliente
- Un pedido tiene líneas de detalle (las líneas **no existen sin el pedido**)

#### 6. LineaPedido

- Propiedades: `cantidad`, `precioUnitario`, `subtotal` (derivado)
- Referencia a un Producto específico

#### 7. Pago

- Interfaz con método `procesar(monto: Double): boolean`
- Implementaciones: `PagoTarjeta`, `PagoPayPal`, `PagoTransferencia`

---

## 🎯 Decisiones de Diseño que Debes Tomar

Para cada punto, decide y justifica en comentarios del `.puml`:

1. **¿Dirección tiene composición o agregación con Usuario?**

   > Pista: Si el usuario se borra, ¿las direcciones deberían borrarse?

2. **¿Producto tiene composición o agregación con Imagen?**

   > Pista: ¿Una imagen de producto tiene sentido sin el producto?

3. **¿Categoría con sub-Categorías es herencia o asociación?**

   > Pista: Una subcategoría **sigue siendo** una categoría. ¿O es que una categoría tiene categorías hijas?

4. **¿Cuál es la multiplicidad de Pedido ↔ Cliente?**
   > Un cliente puede tener \_**\_ pedidos. Un pedido pertenece a \_\_** cliente.

---

## ✅ Criterios de Evaluación

| Criterio                                     | Puntaje     |
| -------------------------------------------- | ----------- |
| Todas las entidades modeladas                | 20 pts      |
| Relaciones con tipo correcto + justificación | 30 pts      |
| Multiplicidades en todas las relaciones      | 20 pts      |
| Enum `EstadoPedido` implementado             | 10 pts      |
| Interfaz `Pagable` con implementaciones      | 10 pts      |
| PlantUML funcional                           | 10 pts      |
| **Total**                                    | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio con estructura base
- [`solucion.puml`](solucion.puml) — Solución de referencia
