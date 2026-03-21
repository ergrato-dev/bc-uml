# Ejercicio 01 — Red Social: Diagrama de Casos de Uso

> ⏱️ Duración: **35 minutos** | Nivel: **Básico**

## 🎯 Objetivo

Modelar el diagrama de casos de uso completo de una red social,
identificando actores, casos de uso, y aplicando relaciones include/extend.

---

## 📋 Enunciado

**SocialConnect** es una red social que permite a usuarios publicar contenido,
seguir a otros, y chatear en tiempo real. Los moderadores pueden gestionar
reportes de contenido inapropiado.

### Actores del sistema

1. **Usuario No Registrado**: Solo puede ver perfiles públicos y registrarse
2. **Usuario Registrado**: Acceso completo a funcionalidades sociales
3. **Moderador**: Puede gestionar reportes y banear usuarios
4. **Sistema de Notificaciones** (actor secundario): Envía notificaciones push/email

### Funcionalidades del sistema

Para **Usuario No Registrado**:

- Registrarse
- Ver perfiles públicos

Para **Usuario Registrado**:

- Iniciar sesión (requiere autenticación)
- Publicar contenido (texto, imagen o video)
- Dar "Me Gusta" a publicaciones
- Comentar publicaciones
- Seguir a otros usuarios
- Enviar mensajes directos
- Reportar contenido inapropiado
- Editar perfil

Para **Moderador** (que también es Usuario Registrado):

- Ver reportes pendientes
- Banear usuario
- Eliminar contenido

### Relaciones include/extend a identificar

Pistas para encontrar los **includes** (siempre ocurren):

- Iniciar sesión siempre requiere... ¿qué?
- Publicar imagen siempre requiere... ¿qué?
- Enviar mensaje siempre requiere estar autenticado

Pistas para encontrar los **extends** (opcionales):

- Al publicar, se puede OPCIONALMENTE etiquetar amigos
- Al comentar, se puede OPCIONALMENTE adjuntar imagen
- Al reportar, se puede OPCIONALMENTE recibir notificación de seguimiento

---

## 🚀 Pasos Sugeridos

1. Identifica todos los actores y dibújalos fuera del sistema
2. Lista todos los casos de uso dentro del rectángulo del sistema
3. Conecta cada actor con sus casos de uso (asociación)
4. Identifica las relaciones include y extend
5. Añade la relación de generalización entre Moderador y Usuario Registrado
6. Verifica que el diagrama renderiza en PlantUML

---

## ✅ Criterios de Evaluación

| Criterio                                          | Puntaje     |
| ------------------------------------------------- | ----------- |
| Todos los actores identificados correctamente     | 20 pts      |
| Casos de uso con nombres en infinitivo apropiados | 20 pts      |
| Asociaciones actor ↔ CU correctas                 | 20 pts      |
| Mínimo 2 relaciones include correctas             | 20 pts      |
| Mínimo 1 relación extend correcta                 | 10 pts      |
| Generalización Moderador → Usuario Registrado     | 10 pts      |
| **Total**                                         | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio
- [`solucion.puml`](solucion.puml) — Solución de referencia
