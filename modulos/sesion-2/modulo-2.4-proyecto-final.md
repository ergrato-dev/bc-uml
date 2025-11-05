# Módulo 2.4: Proyecto Final Integrador

## ⏱️ Duración: 30 minutos

## 🎯 Objetivos

- Integrar TODOS los conceptos del curso
- Aplicar múltiples diagramas UML a un proyecto real
- Demostrar dominio completo de UML
- Crear documentación profesional de un sistema

---

## 🏥 PROYECTO: Sistema de Gestión Hospitalaria Integral

### 📋 Descripción General

Diseñarás la documentación UML completa para un **Hospital Digital**, un sistema que integra todas las operaciones de un hospital moderno.

### 🎯 Alcance del Sistema

El Hospital Digital debe gestionar:

1. **Gestión de Pacientes**

   - Registro de pacientes
   - Historia clínica electrónica
   - Expediente médico digital
   - Seguimiento de tratamientos

2. **Gestión de Citas**

   - Agendamiento online y presencial
   - Recordatorios automáticos
   - Cancelaciones y reprogramaciones
   - Lista de espera

3. **Gestión de Consultas**

   - Atención presencial
   - Telemedicina
   - Prescripción de medicamentos
   - Órdenes de exámenes

4. **Gestión de Hospitalización**

   - Admisión de pacientes
   - Asignación de habitaciones
   - Seguimiento de signos vitales
   - Alta médica

5. **Gestión de Farmacia**

   - Inventario de medicamentos
   - Dispensación
   - Control de recetas
   - Alertas de vencimiento

6. **Gestión de Laboratorio**

   - Órdenes de exámenes
   - Toma de muestras
   - Procesamiento de resultados
   - Entrega de resultados

7. **Facturación y Pagos**
   - Generación de facturas
   - Integración con seguros
   - Procesamiento de pagos
   - Reportes financieros

---

## 📝 Entregables Requeridos

Debes crear los siguientes diagramas UML:

### 1️⃣ Diagrama de Casos de Uso (OBLIGATORIO)

**Requisitos**:

- Identificar TODOS los actores:

  - Paciente
  - Médico
  - Enfermera
  - Recepcionista
  - Farmacéutico
  - Laboratorista
  - Administrador
  - Sistema de Seguros (externo)
  - Sistema de Pagos (externo)

- Mínimo 20 casos de uso organizados por módulos
- Relaciones include/extend apropiadas
- Generalización de actores si aplica

**Casos de uso mínimos por módulo**:

```
Gestión de Pacientes:
- Registrar Paciente
- Actualizar Datos Personales
- Consultar Historia Clínica

Gestión de Citas:
- Agendar Cita
- Cancelar Cita
- Reprogramar Cita
- Confirmar Asistencia

Gestión de Consultas:
- Realizar Consulta Presencial
- Realizar Teleconsulta
- Prescribir Medicamento
- Ordenar Examen

Hospitalización:
- Admitir Paciente
- Asignar Habitación
- Registrar Signos Vitales
- Dar Alta

Farmacia:
- Dispensar Medicamento
- Validar Receta
- Actualizar Inventario

Laboratorio:
- Procesar Orden de Examen
- Registrar Resultado
- Entregar Resultado

Facturación:
- Generar Factura
- Procesar Pago
- Gestionar Seguro
```

### 2️⃣ Diagrama de Clases (OBLIGATORIO)

**Requisitos**:

- Clases principales con atributos y métodos
- Mínimo 15 clases
- Todos los tipos de relaciones:
  - Herencia (Persona → Paciente, Médico, etc.)
  - Composición (Consulta contiene Prescripción)
  - Agregación (Hospital tiene Departamentos)
  - Asociación (Paciente-Cita)

**Clases mínimas**:

```
Personas:
- Persona (abstracta)
  - Paciente
  - Médico
  - Enfermera
  - Personal

Médico:
- Consulta
- Prescripcion
- OrdenExamen
- Diagnostico

Hospitalización:
- Hospitalizacion
- Habitacion
- SignosVitales
- CamaHospital

Medicamentos:
- Medicamento
- Receta
- Dispensacion

Administrativo:
- Cita
- HistoriaClinica
- Factura
- Pago
- Seguro
```

### 3️⃣ Diagrama de Secuencia (OBLIGATORIO - 2 flujos)

**Flujo 1**: "Agendar Cita y Realizar Consulta"

- Desde que el paciente agenda hasta recibir prescripción
- Incluir validaciones y casos de error
- Mínimo 5 participantes
- Usar fragmentos alt, opt

**Flujo 2**: "Hospitalización de Emergencia"

- Admisión urgente hasta estabilización
- Incluir comunicación entre múltiples departamentos
- Usar fragmentos par para acciones paralelas

### 4️⃣ Diagrama de Estados (OBLIGATORIO - 2 objetos)

**Objeto 1**: Ciclo de vida de una **Cita**

```
Estados sugeridos:
Agendada → Confirmada → EnCurso → Completada → Facturada
             ↓              ↓
         Cancelada    NoAsistio
```

**Objeto 2**: Ciclo de vida de una **Hospitalización**

```
Estados sugeridos:
Admitido → EnTratamiento → Estable → EnAlta → DadoDeAlta
              ↓                ↓
         Critico         Transferido
```

### 5️⃣ Diagrama de Actividades (OBLIGATORIO)

**Proceso**: "Proceso Completo de Atención al Paciente"

Desde llegada hasta salida:

```
1. Llegada y registro
2. Triage (clasificación de urgencia)
3. Espera según prioridad
4. Consulta médica
5. Si requiere exámenes:
   - Fork: Laboratorio + Imagenología
   - Join: Esperar resultados
6. Si requiere medicamentos:
   - Generar receta
   - Dispensar en farmacia
7. Si requiere hospitalización:
   - Proceso de admisión
8. Facturación
9. Pago o gestión de seguro
10. Alta y seguimiento
```

- Usar swimlanes (Paciente, Recepción, Médico, Enfermería, Farmacia, Caja)
- Incluir decisiones múltiples
- Mínimo 2 forks/joins

### 6️⃣ Diagrama de Componentes (OPCIONAL pero recomendado)

**Arquitectura de microservicios**:

```
Frontend:
- Portal Pacientes
- Portal Médicos
- Panel Administrativo

Backend Services:
- API Gateway
- Servicio de Autenticación
- Servicio de Citas
- Servicio de Historia Clínica
- Servicio de Facturación
- Servicio de Farmacia
- Servicio de Laboratorio

Data Layer:
- Base de Datos Pacientes
- Base de Datos Clínica
- Base de Datos Financiera
- Repositorio de Imágenes

Externos:
- API de Seguros
- Pasarela de Pagos
- Servicio de Notificaciones (Email/SMS)
```

---

## 📋 Documentación Adicional

Para 3 casos de uso principales, documenta:

### Plantilla de Caso de Uso Detallado

```markdown
## CU-XX: [Nombre del Caso de Uso]

**ID**: CU-XX
**Actor Principal**: [Actor]
**Actores Secundarios**: [Otros actores]
**Nivel**: [Usuario/Subfunción/Resumen]
**Prioridad**: [Alta/Media/Baja]

### Descripción

[Descripción breve del caso de uso]

### Precondiciones

- [Lista de condiciones que deben cumplirse]

### Garantías de Éxito (Postcondiciones)

- [Estado del sistema después de ejecución exitosa]

### Flujo Principal (Escenario de Éxito)

1. [Paso 1]
2. [Paso 2]
3. [Paso 3]
   ...

### Flujos Alternativos

**Xa. [Título del flujo alternativo]**

- [Descripción]

### Flujos de Excepción

**Xe. [Título de excepción]**

- [Cómo se maneja]

### Requisitos Especiales

- [Requisitos no funcionales]

### Frecuencia de Uso

[Estimación de uso]

### Reglas de Negocio

- [Reglas que gobiernan este caso]

### Información Adicional

[Notas, comentarios]
```

---

## 🎨 Criterios de Evaluación

### Diagrama de Casos de Uso (20 puntos)

- [ ] Todos los actores identificados (5 pts)
- [ ] Mínimo 20 casos de uso relevantes (5 pts)
- [ ] Uso correcto de include/extend (5 pts)
- [ ] Organización clara del diagrama (5 pts)

### Diagrama de Clases (25 puntos)

- [ ] Mínimo 15 clases con atributos y métodos (8 pts)
- [ ] Todos los tipos de relaciones usados correctamente (8 pts)
- [ ] Multiplicidades correctas (4 pts)
- [ ] Uso de herencia y polimorfismo (5 pts)

### Diagramas de Secuencia (20 puntos)

- [ ] Flujo 1 completo y correcto (10 pts)
- [ ] Flujo 2 completo y correcto (10 pts)

### Diagramas de Estados (15 puntos)

- [ ] Ciclo de vida Cita completo (7.5 pts)
- [ ] Ciclo de vida Hospitalización completo (7.5 pts)

### Diagrama de Actividades (15 puntos)

- [ ] Proceso completo modelado (5 pts)
- [ ] Uso correcto de swimlanes (5 pts)
- [ ] Decisiones y paralelismo bien aplicados (5 pts)

### Documentación (5 puntos)

- [ ] Casos de uso documentados profesionalmente (5 pts)

### Bonus (hasta 10 puntos extra)

- [ ] Diagrama de Componentes (+5 pts)
- [ ] Diagramas adicionales innovadores (+5 pts)

---

## 💡 Consejos para el Éxito

### 1. Planificación (5 min)

```
✓ Lee todos los requisitos
✓ Identifica las entidades principales
✓ Prioriza los diagramas obligatorios
✓ Planifica el orden de trabajo
```

### 2. Ejecución (20 min)

```
✓ Empieza por Casos de Uso (visión general)
✓ Continúa con Clases (estructura)
✓ Luego Secuencia (comportamiento)
✓ Finalmente Estados y Actividades
```

### 3. Revisión (5 min)

```
✓ Verifica consistencia entre diagramas
✓ Valida que todos los requisitos estén cubiertos
✓ Revisa notación UML
✓ Asegura claridad y legibilidad
```

---

## 🌟 Ejemplo de Integración

### Cómo los diagramas se relacionan:

**Caso de Uso**: "Agendar Cita"
↓
**Diagrama de Clases**: Clases Paciente, Cita, Médico, Agenda
↓
**Diagrama de Secuencia**: Flujo detallado de agendamiento
↓
**Diagrama de Estados**: Estados de la Cita
↓
**Diagrama de Actividades**: Proceso completo que incluye agendar

### Trazabilidad:

```
Requisito → Caso de Uso → Clases → Secuencia → Estados
```

---

## 📚 Recursos de Apoyo

### Herramientas Sugeridas:

1. **PlantUML** - Para generar diagramas desde código
2. **Draw.io** - Para diagramas visuales
3. **Visual Paradigm** - Suite completa
4. **Lucidchart** - Colaboración online

### Plantillas Disponibles:

- `plantillas/caso-uso-detallado.md`
- `plantillas/diagrama-clases.puml`
- `plantillas/diagrama-secuencia.puml`

---

## ✅ Lista de Verificación Final

Antes de entregar, verifica:

- [ ] Todos los diagramas obligatorios están completos
- [ ] La notación UML es correcta
- [ ] Los diagramas son legibles y bien organizados
- [ ] Hay consistencia entre diagramas
- [ ] Se incluyen casos de error y excepciones
- [ ] La documentación está completa
- [ ] Los archivos están bien nombrados
- [ ] El proyecto está organizado en carpetas

---

## 🎓 Reflexión Final del Curso

### Lo que has aprendido:

#### Sesión 1: Estructura

✅ Fundamentos de UML  
✅ Diagrama de Clases (el más importante)  
✅ Diagramas Estructurales  
✅ Práctica integrada

#### Sesión 2: Comportamiento

✅ Casos de Uso (requisitos)  
✅ Diagramas de Secuencia (flujos)  
✅ Estados y Actividades  
✅ Proyecto completo

### Habilidades Adquiridas:

```
✓ Capturar requisitos con Casos de Uso
✓ Diseñar estructuras con Clases
✓ Modelar interacciones con Secuencia
✓ Documentar ciclos de vida con Estados
✓ Mapear procesos con Actividades
✓ Diseñar arquitecturas con Componentes
✓ Comunicar diseños efectivamente
```

---

## 🚀 Próximos Pasos

### Después del curso:

1. **Practica Constantemente**

   - Modela sistemas que uses diariamente
   - Contribuye a documentación de proyectos open source
   - Crea tu portafolio de diagramas

2. **Profundiza en Patrones**

   - Gang of Four Design Patterns
   - Arquitectura de software
   - Domain-Driven Design (DDD)

3. **Aprende Herramientas**

   - Domina PlantUML
   - Explora Enterprise Architect
   - Prueba herramientas de ingeniería inversa

4. **Aplica en Proyectos Reales**
   - Documenta tu proyecto actual
   - Propón mejoras arquitectónicas
   - Facilita comunicación del equipo

---

## 📜 Certificación

Al completar exitosamente el proyecto final con:

- **Mínimo 70/100 puntos**: Certificado de Participación
- **80-89 puntos**: Certificado de Aprobación
- **90-100 puntos**: Certificado de Excelencia

---

## 🤝 Agradecimientos

**¡Felicitaciones por completar el Curso de UML!**

Has dado un paso importante en tu desarrollo como analista/desarrollador de software. UML es una habilidad fundamental que te acompañará en toda tu carrera.

### Recuerda:

> "El valor de UML no está en crear diagramas perfectos, sino en pensar claramente sobre el sistema y comunicar efectivamente el diseño."

---

**¿Preguntas o comentarios?**  
**¿Necesitas ayuda con el proyecto?**

Contacto: [Información del instructor]

---

## 📎 Material Complementario

- [Soluciones de Ejercicios](./ejercicios/soluciones/)
- [Proyectos de Ejemplo](../../ejemplos/)
- [Cheat Sheets](../../recursos/cheatsheets/)
- [Referencias Bibliográficas](../../recursos/referencias.md)
- [Comunidad y Foros](../../recursos/comunidad.md)

---

**¡Mucho éxito en tu proyecto final!** 🎉

**Tiempo estimado de entrega**: Según lo defina el instructor  
**Formato de entrega**: [Especificar según la institución]
