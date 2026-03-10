# 02 — Cuándo Usar UML (y Cuándo No)

> ⏱️ Duración estimada: **15 minutos**

## 🎯 Objetivos

- Identificar situaciones donde UML aporta valor real
- Reconocer cuándo UML genera overhead innecesario
- Aplicar buenas prácticas generales de modelado

---

## ✅ Situaciones Ideales para UML

### 1. Proyectos Complejos

```
✅ Múltiples desarrolladores trabajando en paralelo
✅ Arquitecturas sofisticadas con muchos componentes
✅ Necesidad de documentación técnica formal
✅ Requisitos contractuales de documentación
```

### 2. Comunicación del Equipo

```
✅ Alinear la visión del sistema antes de implementar
✅ Onboarding de nuevos miembros del equipo
✅ Revisiones de diseño (design reviews)
✅ Comunicación con stakeholders no técnicos
```

### 3. Planificación Arquitectónica

```
✅ Diseñar antes de implementar (architecture first)
✅ Evaluar alternativas de diseño sin escribir código
✅ Detectar problemas de diseño tempranamente
✅ Planificar la escalabilidad del sistema
```

### 4. Documentación de Sistemas Existentes

```
✅ Ingeniería inversa (reverse engineering)
✅ Mantenimiento de sistemas legados
✅ Transferencia de conocimiento entre equipos
✅ Auditorías técnicas
```

---

## ❌ Cuándo NO usar UML (o usarlo con moderación)

### 1. Proyectos Pequeños y Simples

```
❌ Scripts de una sola función
❌ Prototipos rápidos de exploración
❌ Proyectos personales sin colaboradores
→ El overhead supera el beneficio
```

### 2. Equipos con Metodologías Ágiles Extremas

```
❌ Equipos que priorizan código funcional sobre documentación
❌ Cambios de requisitos muy frecuentes (cada sprint)
→ Preferir diagramas livianos (C4 Model, sketches)
```

### 3. Tecnologías Muy Bien Documentadas

```
❌ Frameworks con convenciones estrictas (Rails, Django)
→ La arquitectura ya está implícita en la estructura del framework
```

---

## 🎯 5 Buenas Prácticas Generales

### 1. Simplicidad sobre Completitud

```
❌ MAL: Incluir todos los atributos, métodos y relaciones posibles
✅ BIEN: Modelar solo lo necesario para comunicar la idea clave
```

### 2. Adaptar al Público

```
❌ MAL: El mismo nivel de detalle técnico para todos
✅ BIEN: Técnico para devs, funcional para stakeholders
```

### 3. Mantener Actualizado

```
❌ MAL: Crear diagramas una vez y abandonarlos
✅ BIEN: Actualizar los diagramas críticos cuando cambia el código
```

### 4. Usar Herramientas Accesibles

```
❌ MAL: Herramientas propietarias que no puede abrir el equipo
✅ BIEN: PlantUML (texto), Draw.io (gratis), SVG (estándar)
```

### 5. Consistencia de Estilo

```
❌ MAL: Cada diagrama con convenciones distintas
✅ BIEN: Guía de estilo compartida en el equipo
```

---

## 💡 Regla de Oro

> **¿Este diagrama ayuda a que alguien entienda mejor el sistema?**
>
> - Si la respuesta es **sí** → créalo
> - Si la respuesta es **no** → no lo hagas

UML es un **medio**, no un fin. El objetivo es comunicar diseño, no generar artefactos.

---

## ✅ Resumen

| Situación                              | ¿Usar UML?                 |
| -------------------------------------- | -------------------------- |
| Sistema con 5+ desarrolladores         | ✅ Sí                      |
| Proyecto con requisitos bien definidos | ✅ Sí                      |
| Arquitectura con múltiples componentes | ✅ Sí                      |
| Script de 50 líneas                    | ❌ No                      |
| Prototipo de fin de semana             | ❌ No                      |
| Sistema legado sin documentar          | ✅ Sí (ingeniería inversa) |

---

## 🔗 Navegación

⬅️ Anterior: [01 — Introducción a UML](01-introduccion-uml.md) &nbsp;➡️ Siguiente: [03 — Diagrama de Clases: Sintaxis](03-diagrama-clases-sintaxis.md)
