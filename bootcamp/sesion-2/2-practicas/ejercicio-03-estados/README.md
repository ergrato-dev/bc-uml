# Ejercicio 03 — Solicitud de Crédito: Diagrama de Estados

> ⏱️ Duración: **35 minutos** | Nivel: **Intermedio**

## 🎯 Objetivo

Modelar el ciclo de vida completo de una solicitud de crédito bancario
usando un diagrama de estados, incluyendo estados compuestos, guardas
y acciones en transiciones.

---

## 📋 Enunciado

**CreditoRápido** es un sistema de solicitudes de crédito en línea.
Cada solicitud pasa por distintos estados desde que se inicia hasta
que el dinero es desembolsado o la solicitud es rechazada/cancelada.

### Estados del sistema

| Estado                | Descripción                                 |
| --------------------- | ------------------------------------------- |
| `Borrador`            | El cliente está completando el formulario   |
| `Enviada`             | El cliente envió la solicitud para revisión |
| `EnRevision`          | Un analista está evaluando la solicitud     |
| `Aprobada`            | La solicitud fue aprobada por el analista   |
| `Rechazada`           | La solicitud fue rechazada                  |
| `PendienteDocumentos` | Se solicitaron documentos adicionales       |
| `Desembolsada`        | El dinero fue transferido al cliente        |
| `Cancelada`           | El cliente canceló la solicitud             |

### Transiciones

| Desde               | Evento[Guarda]                      | Acción                 | Hacia               |
| ------------------- | ----------------------------------- | ---------------------- | ------------------- |
| [inicio]            | —                                   | —                      | Borrador            |
| Borrador            | enviarSolicitud[formularioCompleto] | validarDatos()         | Enviada             |
| Borrador            | cancelar                            | notificarCancelacion() | Cancelada           |
| Enviada             | asignarAnalista[disponible]         | —                      | EnRevision          |
| EnRevision          | aprobar[scoreCredito >= 600]        | notificarAprobacion()  | Aprobada            |
| EnRevision          | rechazar[scoreCredito < 600]        | notificarRechazo()     | Rechazada           |
| EnRevision          | solicitarDocs                       | enviarEmailDocs()      | PendienteDocumentos |
| PendienteDocumentos | recibirDocumentos                   | —                      | EnRevision          |
| PendienteDocumentos | expirar[30días sin respuesta]       | notificarExpiracion()  | Cancelada           |
| Aprobada            | desembolsar[cuentaVerificada]       | transferirFondos()     | Desembolsada        |
| Aprobada            | cancelarDesembolso                  | —                      | Cancelada           |
| Desembolsada        | —                                   | —                      | [fin]               |
| Rechazada           | —                                   | —                      | [fin]               |
| Cancelada           | —                                   | —                      | [fin]               |

### Estado Compuesto a Implementar

El estado **EnRevision** tiene un subestado compuesto que modela
cómo el analista trabaja internamente:

```
EnRevision {
  [inicio] → AnalizandoPerfil → VerificandoHistorial → EvaluandoRiesgo → [decisión]
}
```

---

## 🚀 Pasos Sugeridos

1. Dibuja el estado inicial `[*]` y conecta a `Borrador`
2. Declara todos los estados simples
3. Conecta las transiciones con su evento, guarda y acción
4. Implementa el estado compuesto `EnRevision`
5. Conecta los tres estados finales a `[*]`
6. Verifica que el diagrama renderiza correctamente

---

## ✅ Criterios de Evaluación

| Criterio                                            | Puntaje     |
| --------------------------------------------------- | ----------- |
| Estado inicial y final correctamente dibujados      | 10 pts      |
| Todos los estados declarados con nombres apropiados | 20 pts      |
| Todas las transiciones con evento[guarda] correctas | 30 pts      |
| Acciones en transiciones (al menos 3)               | 20 pts      |
| Estado compuesto `EnRevision` implementado          | 20 pts      |
| **Total**                                           | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio
- [`solucion.puml`](solucion.puml) — Solución de referencia
