# Ejercicio 02 — Transferencia Bancaria: Diagrama de Secuencia

> ⏱️ Duración: **40 minutos** | Nivel: **Intermedio**

## 🎯 Objetivo

Modelar el flujo completo de una transferencia bancaria usando un diagrama
de secuencia con múltiples participantes, mensajes síncronos/asíncronos,
y fragmentos combinados (alt, opt).

---

## 📋 Enunciado

**BancoDigital** procesa transferencias entre cuentas. Cuando un cliente
solicita una transferencia, el sistema valida fondos, consulta el servicio
antifraude, y ejecuta la operación.

### Participantes

| Lifeline                   | Tipo     | Rol                             |
| -------------------------- | -------- | ------------------------------- |
| `:Cliente`                 | Actor    | Inicia la transferencia vía app |
| `:AppBancaria`             | Boundary | Interfaz web/móvil              |
| `:TransferenciaController` | Control  | Orquesta el proceso             |
| `:CuentaRepository`        | Entity   | Accede a datos de cuentas       |
| `:AntiFraudeService`       | Entity   | Valida patrones sospechosos     |
| `:NotificacionService`     | Entity   | Envía notificaciones async      |

---

## 🔄 Flujo a Modelar

### Flujo Principal

1. Cliente ingresa monto y cuenta destino en `AppBancaria`
2. `AppBancaria` envía solicitud al `TransferenciaController`
3. `TransferenciaController` consulta saldo en `CuentaRepository`
4. `CuentaRepository` retorna saldo disponible
5. **[FRAGMENTO alt]** — Validación de fondos:
   - **[saldo >= monto]**: continúa el proceso
   - **[saldo < monto]**: retorna error "Fondos insuficientes" y termina
6. `TransferenciaController` consulta `AntiFraudeService`
7. `AntiFraudeService` analiza y retorna resultado (OK / Sospechoso)
8. **[FRAGMENTO alt]** — Resultado antifraude:
   - **[resultado = OK]**: ejecuta la transferencia
   - **[resultado = Sospechoso]**: retorna error "Transacción bloqueada"
9. `TransferenciaController` actualiza ambas cuentas en `CuentaRepository`
10. `CuentaRepository` confirma la actualización
11. **[FRAGMENTO opt]** — Si monto > 10000: `TransferenciaController` envía alerta adicional a `AntiFraudeService` (mensaje asíncrono)
12. `TransferenciaController` solicita (asíncrono) notificación al `NotificacionService`
13. `AppBancaria` retorna confirmación al `Cliente`

---

## 📌 Puntos Clave a Implementar

- Al menos 1 mensaje de **retorno** explícito (flecha punteada)
- Al menos 1 mensaje **asíncrono** (NotificacionService)
- **Fragmento alt** con 2 opciones mutuamente excluyentes
- **Fragmento opt** para comportamiento condicional
- Autoactivación de lifelines activas

---

## ✅ Criterios de Evaluación

| Criterio                                               | Puntaje     |
| ------------------------------------------------------ | ----------- |
| Todos los participantes declarados con tipos correctos | 20 pts      |
| Secuencia de mensajes en el orden correcto             | 20 pts      |
| Fragmento alt con 2 guards (saldo) implementado        | 20 pts      |
| Segundo fragmento alt (antifraude) o fragmento opt     | 15 pts      |
| Mensajes asíncronos identificados correctamente        | 15 pts      |
| Mensajes de retorno presentes                          | 10 pts      |
| **Total**                                              | **100 pts** |

---

## 🔗 Archivos

- [`starter.puml`](starter.puml) — Archivo de inicio
- [`solucion.puml`](solucion.puml) — Solución de referencia
