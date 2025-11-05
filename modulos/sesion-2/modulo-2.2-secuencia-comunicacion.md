# Módulo 2.2: Diagramas de Secuencia y Comunicación

## ⏱️ Duración: 1.5 horas

## 🎯 Objetivos del Módulo

- Dominar el diagrama de secuencia (MUY IMPORTANTE en análisis)
- Comprender interacciones temporales entre objetos
- Modelar flujos de procesos complejos
- Conocer el diagrama de comunicación como alternativa

---

## 📖 ¿Qué es un Diagrama de Secuencia?

El **Diagrama de Secuencia** muestra cómo los objetos interactúan entre sí **en el tiempo**. Es uno de los diagramas más importantes para:

- Documentar flujos de casos de uso
- Diseñar APIs
- Entender sistemas existentes
- Comunicar lógica compleja

### ⭐ Importancia en Análisis de Sistemas

```
Ranking en Análisis de Sistemas:
1. Casos de Uso           ⭐⭐⭐⭐⭐ (Requisitos)
2. Diagrama de Clases     ⭐⭐⭐⭐⭐ (Diseño)
3. Diagrama de Secuencia  ⭐⭐⭐⭐⭐ (Flujos)
4. Componentes            ⭐⭐⭐⭐ (Arquitectura)
5. Actividades            ⭐⭐⭐ (Procesos)
```

---

## 🎨 Elementos del Diagrama de Secuencia

### 1. Actores y Objetos (Participantes)

```
┌─────────┐
│ :Actor  │  ← Actor (usuario)
└─────────┘

┌─────────┐
│ :Objeto │  ← Objeto del sistema
└─────────┘
```

### 2. Línea de Vida

```
┌─────────┐
│ :Objeto │
└────┬────┘
     │  ← Línea de vida (tiempo hacia abajo)
     │
     │
```

### 3. Mensajes

```
────────────────→  Mensaje síncrono (espera respuesta)
- - - - - - - →  Mensaje asíncrono (no espera)
←- - - - - - -   Mensaje de retorno
```

### 4. Activación

```
     │
     ▌  ← Rectángulo de activación
     ▌     (objeto está procesando)
     │
```

### 5. Fragmentos Combinados

```
┌─── alt [condición] ─────┐  Alternativa (if-else)
│                          │
├─── else ─────────────────┤
│                          │
└──────────────────────────┘

┌─── opt [condición] ─────┐  Opcional (if)
│                          │
└──────────────────────────┘

┌─── loop [condición] ────┐  Bucle (while, for)
│                          │
└──────────────────────────┘
```

---

## 🌍 Ejemplo Básico: Login de Usuario

![Secuencia Login](../../assets/secuencia-login.svg)

```plantuml
@startuml
actor Usuario
participant "UI" as UI
participant "AuthController" as Auth
participant "UserService" as Service
database "Database" as DB

Usuario -> UI: Ingresa credenciales
activate UI

UI -> Auth: login(email, password)
activate Auth

Auth -> Service: authenticate(email, password)
activate Service

Service -> DB: findUserByEmail(email)
activate DB
DB --> Service: userData
deactivate DB

Service -> Service: validatePassword(password)

alt Credenciales válidas
    Service --> Auth: token
    Auth --> UI: success(token)
    UI --> Usuario: Mostrar dashboard
else Credenciales inválidas
    Service --> Auth: error
    Auth --> UI: error("Credenciales inválidas")
    UI --> Usuario: Mostrar error
end

deactivate Service
deactivate Auth
deactivate UI

@enduml
```

### Análisis del Flujo:

1. **Usuario inicia**: Acción del actor
2. **UI procesa**: Interfaz recibe entrada
3. **Auth valida**: Controlador procesa lógica
4. **Service verifica**: Servicio consulta datos
5. **DB responde**: Base de datos retorna información
6. **Validación**: Lógica de negocio
7. **Alternativa**: Dos caminos posibles
8. **Respuesta**: Sistema responde al usuario

---

## 🔍 Fragmentos Combinados en Detalle

### 1. alt (Alternativa - if/else)

```plantuml
@startuml
participant Cliente
participant Sistema
participant Banco

Cliente -> Sistema: procesarPago(monto)
activate Sistema

Sistema -> Banco: validarFondos(cuenta, monto)
activate Banco

alt Fondos suficientes
    Banco --> Sistema: aprobado
    Sistema -> Sistema: generarRecibo()
    Sistema --> Cliente: pagoExitoso(recibo)
else Fondos insuficientes
    Banco --> Sistema: rechazado
    Sistema --> Cliente: errorSaldoInsuficiente()
else Error del banco
    Banco --> Sistema: error
    Sistema --> Cliente: errorServicioNoDisponible()
end

deactivate Banco
deactivate Sistema
@enduml
```

### 2. opt (Opcional - if)

```plantuml
@startuml
participant Usuario
participant Carrito
participant CuponService

Usuario -> Carrito: finalizarCompra()
activate Carrito

opt Usuario tiene cupón
    Carrito -> CuponService: validarCupon(codigo)
    activate CuponService
    CuponService --> Carrito: descuento
    deactivate CuponService
    Carrito -> Carrito: aplicarDescuento(descuento)
end

Carrito --> Usuario: totalFinal
deactivate Carrito
@enduml
```

### 3. loop (Bucle - for/while)

```plantuml
@startuml
participant Sistema
participant EmailService
database DB

Sistema -> DB: getUsuariosActivos()
activate DB
DB --> Sistema: listaUsuarios
deactivate DB

loop Para cada usuario
    Sistema -> EmailService: enviarNotificacion(usuario)
    activate EmailService
    EmailService --> Sistema: enviado
    deactivate EmailService
end

Sistema -> Sistema: registrarEnvios()
@enduml
```

### 4. par (Paralelo - concurrente)

```plantuml
@startuml
participant Cliente
participant Gateway
participant ServicioA
participant ServicioB

Cliente -> Gateway: solicitarDatos()
activate Gateway

par Llamadas paralelas
    Gateway -> ServicioA: getDatosA()
    activate ServicioA
    ServicioA --> Gateway: datosA
    deactivate ServicioA
else
    Gateway -> ServicioB: getDatosB()
    activate ServicioB
    ServicioB --> Gateway: datosB
    deactivate ServicioB
end

Gateway -> Gateway: combinarDatos()
Gateway --> Cliente: respuestaCompleta
deactivate Gateway
@enduml
```

---

## 🌟 Ejemplo Completo: Compra en E-Commerce

![Secuencia E-Commerce](../../assets/secuencia-ecommerce-completa.svg)

```plantuml
@startuml
actor Cliente
participant "UI" as UI
participant "CarritoController" as Carrito
participant "ProductoService" as Producto
participant "PagoService" as Pago
participant "InventarioService" as Inventario
participant "NotificacionService" as Notif
database "Database" as DB

Cliente -> UI: Agregar producto al carrito
activate UI
UI -> Carrito: agregarProducto(productoId, cantidad)
activate Carrito

Carrito -> Producto: verificarDisponibilidad(productoId, cantidad)
activate Producto
Producto -> DB: checkStock(productoId)
activate DB
DB --> Producto: stock
deactivate DB

alt Stock suficiente
    Producto --> Carrito: disponible
    Carrito -> Carrito: agregarAlCarrito()
    Carrito --> UI: productoAgregado
    UI --> Cliente: Confirmación
else Stock insuficiente
    Producto --> Carrito: stockInsuficiente
    Carrito --> UI: error
    UI --> Cliente: Producto no disponible
end
deactivate Producto
deactivate Carrito
deactivate UI

...Cliente continúa comprando...

Cliente -> UI: Finalizar compra
activate UI
UI -> Carrito: procesarCompra()
activate Carrito

' Reservar inventario
loop Para cada producto
    Carrito -> Inventario: reservarStock(productoId, cantidad)
    activate Inventario
    Inventario -> DB: updateStock(productoId, -cantidad)
    activate DB
    DB --> Inventario: ok
    deactivate DB
    Inventario --> Carrito: reservado
    deactivate Inventario
end

' Procesar pago
Carrito -> Pago: procesarPago(monto, metodoPago)
activate Pago

Pago -> Pago: validarDatos()

alt Pago aprobado
    Pago -> DB: registrarTransaccion()
    activate DB
    DB --> Pago: transaccionId
    deactivate DB

    Pago --> Carrito: pagoExitoso(transaccionId)

    ' Confirmar pedido
    Carrito -> DB: crearPedido()
    activate DB
    DB --> Carrito: pedidoId
    deactivate DB

    ' Enviar notificaciones en paralelo
    par Notificaciones
        Carrito -> Notif: enviarEmailConfirmacion(pedidoId)
        activate Notif
        Notif --> Carrito: enviado
        deactivate Notif
    else
        Carrito -> Notif: enviarSMS(pedidoId)
        activate Notif
        Notif --> Carrito: enviado
        deactivate Notif
    end

    Carrito --> UI: compraExitosa(pedidoId)
    UI --> Cliente: Mostrar confirmación

else Pago rechazado
    Pago --> Carrito: pagoRechazado

    ' Liberar inventario reservado
    loop Para cada producto
        Carrito -> Inventario: liberarStock(productoId, cantidad)
        activate Inventario
        Inventario -> DB: updateStock(productoId, +cantidad)
        activate DB
        DB --> Inventario: ok
        deactivate DB
        Inventario --> Carrito: liberado
        deactivate Inventario
    end

    Carrito --> UI: errorPago
    UI --> Cliente: Pago rechazado
end

deactivate Pago
deactivate Carrito
deactivate UI

@enduml
```

---

## 📊 Diagrama de Comunicación (Alternativa)

El **Diagrama de Comunicación** muestra las mismas interacciones pero enfatiza la **estructura** sobre el tiempo.

### Diferencias clave:

| Aspecto        | Secuencia         | Comunicación           |
| -------------- | ----------------- | ---------------------- |
| **Enfoque**    | Orden temporal    | Estructura de red      |
| **Layout**     | Vertical (tiempo) | Libre (espacial)       |
| **Numeración** | Implícita         | Explícita (1, 2, 3...) |
| **Uso**        | Flujos detallados | Vista general          |

### Ejemplo: Mismo flujo de Login

![Comunicación Login](../../assets/comunicacion-login.svg)

```plantuml
@startuml
object Usuario
object UI
object AuthController
object UserService
object Database

Usuario -> UI : 1: login(email, password)
UI -> AuthController : 2: authenticate()
AuthController -> UserService : 3: validateUser()
UserService -> Database : 4: findUser()
Database --> UserService : 5: userData
UserService --> AuthController : 6: token
AuthController --> UI : 7: success
UI --> Usuario : 8: showDashboard
@enduml
```

### ¿Cuándo usar cada uno?

```
Usar SECUENCIA cuando:
✓ Necesitas mostrar orden temporal exacto
✓ Flujos complejos con decisiones
✓ Documentación detallada de APIs
✓ Debugging de interacciones

Usar COMUNICACIÓN cuando:
✓ Vista general de relaciones
✓ Documentación de alto nivel
✓ Espacios reducidos
✓ Énfasis en colaboración
```

---

## 🎯 Buenas Prácticas

### ✅ BIEN

```
✓ Nombrar participantes claramente
  ":CarritoController" no "c"

✓ Usar fragmentos para lógica compleja
  alt, opt, loop según corresponda

✓ Mantener nivel de abstracción consistente
  No mezclar bajo nivel con alto nivel

✓ Incluir mensajes de retorno importantes
  No todos, solo los relevantes

✓ Agrupar operaciones relacionadas
  Usar notas o comentarios

✓ Limitar número de participantes
  5-7 objetos máximo por diagrama
```

### ❌ MAL

```
✗ Incluir todos los getters/setters
  Demasiado detalle innecesario

✗ Mezclar lógica de UI con negocio
  Separar responsabilidades

✗ Olvidar casos de error
  Siempre modelar flujos alternativos

✗ Diagramas demasiado largos
  Dividir en múltiples diagramas

✗ No usar fragmentos combinados
  alt/opt/loop hacen más claro el flujo
```

---

## 💡 Patrones Comunes en Secuencia

### 1. Patrón Request-Response

```plantuml
@startuml
Cliente -> Servidor: request()
activate Servidor
Servidor --> Cliente: response()
deactivate Servidor
@enduml
```

### 2. Patrón Callback

```plantuml
@startuml
Cliente -> Servidor: processAsync(callback)
activate Servidor
Servidor -> Servidor: procesamiento largo
Servidor -> Cliente: callback(resultado)
deactivate Servidor
@enduml
```

### 3. Patrón Chain of Responsibility

```plantuml
@startuml
Cliente -> HandlerA: handle()
activate HandlerA
HandlerA -> HandlerB: handle()
activate HandlerB
HandlerB -> HandlerC: handle()
activate HandlerC
HandlerC --> HandlerB: processed
deactivate HandlerC
HandlerB --> HandlerA: processed
deactivate HandlerB
HandlerA --> Cliente: result
deactivate HandlerA
@enduml
```

---

## 📝 Ejercicio 5: Sistema Bancario - Transferencia (30 min)

### Escenario

Diseña el diagrama de secuencia para una **transferencia bancaria**:

**Actores**: Cliente

**Participantes**:

- UI
- TransferenciaController
- CuentaService
- ValidacionService
- TransaccionService
- NotificacionService
- Database

**Flujo**:

1. Cliente inicia transferencia (cuenta origen, cuenta destino, monto)
2. Sistema valida que ambas cuentas existan
3. Sistema verifica saldo suficiente en cuenta origen
4. Sistema verifica límites diarios de transferencia
5. Si todo OK:
   - Debitar cuenta origen
   - Acreditar cuenta destino
   - Registrar transacción
   - Enviar notificaciones a ambos clientes
6. Si hay errores:
   - Notificar error específico
   - No realizar operación

**Incluye**:

- Fragmentos alt para validaciones
- Fragmento par para notificaciones paralelas
- Manejo de al menos 3 casos de error

**Solución**: Ver [solucion-ejercicio-5.md](./ejercicios/solucion-ejercicio-5.md)

---

## ✅ Checklist del Módulo

Antes de continuar, asegúrate de:

- [ ] Crear diagramas de secuencia con sintaxis correcta
- [ ] Usar fragmentos combinados apropiadamente
- [ ] Modelar flujos con múltiples alternativas
- [ ] Distinguir entre secuencia y comunicación
- [ ] Haber completado el ejercicio 5

---

## ⏭️ Siguiente Módulo

[Módulo 2.3: Diagramas de Estados y Actividades](./modulo-2.3-estados-actividades.md)
