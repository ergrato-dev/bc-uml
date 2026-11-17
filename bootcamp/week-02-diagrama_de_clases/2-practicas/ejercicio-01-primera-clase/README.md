# Ejercicio 01 — Mi Primera Clase UML

> ⏱️ Duración: **25 minutos** | Nivel: **Básico**

## 🎯 Objetivo

Crear tu primera clase UML completa con atributos, métodos y visibilidad correcta,
partiendo del archivo `starter.puml`.

---

## 📋 Enunciado

Tienes que modelar la clase `Producto` para un sistema de e-commerce.

### Requisitos funcionales

Un **Producto** en nuestra tienda tiene las siguientes características:

**Datos**:

- Un identificador único (String)
- Nombre del producto (String)
- Descripción (String)
- Precio en dólares (decimal)
- Cantidad en stock (entero)
- Categoría (String)
- Disponible o no (booleano)

**Comportamientos**:

- Verificar si está disponible (retorna booleano)
- Actualizar el stock dado un cambio de cantidad (no retorna nada)
- Obtener el precio con descuento aplicado, dado un porcentaje (retorna decimal)
- Calcular un hash interno para caché — solo uso interno de la clase (retorna String)

**Reglas de visibilidad**:

- Los datos son privados (encapsulamiento)
- Los comportamientos públicos son la API de la clase
- El cálculo de hash es privado (detalle de implementación)

---

## 💡 Pistas

- `id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`, `disponible` son atributos privados
- `estaDisponible()`, `actualizarStock()`, `getPrecioConDescuento()` son métodos públicos
- `calcularHash()` es un método privado
- Usa los tipos de dato correspondientes: `String`, `Double`, `int`, `boolean`

---

## 🚀 Pasos Sugeridos

1. Abre el archivo `starter.puml` en tu editor
2. Añade los atributos con sus tipos y visibilidad
3. Añade los métodos con sus parámetros, tipos de retorno y visibilidad
4. Verifica que renderiza correctamente en PlantUML
5. Compara con la solución cuando termines

---

## ✅ Criterios de Evaluación

| Criterio                                            | Puntaje     |
| --------------------------------------------------- | ----------- |
| Todos los atributos presentes con tipo correcto     | 30 pts      |
| Visibilidad correcta en todos los miembros          | 30 pts      |
| Todos los métodos con parámetros y tipos de retorno | 25 pts      |
| PlantUML renderiza sin errores                      | 15 pts      |
| **Total**                                           | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio (complétalo)
- [`solucion.puml`](solucion.puml) — Solución de referencia (no ver antes de intentarlo)
