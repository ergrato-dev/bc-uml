# Proyecto hilo conductor: `modelo`

**Qué:** el modelo UML completo del sistema de tu dominio. **Para qué:** que cada semana añadas una vista real del mismo sistema y al final tengas un modelo coherente que puedas defender y llevar a código. **Impacto:** el proyecto de cada semana parte de lo que entregaste la anterior; si un diagrama queda flojo, el siguiente lo nota.

## Tu dominio

El instructor te asigna **un dominio** en la semana 01: un sistema de negocio con sus actores, un proceso núcleo, una entidad con ciclo de vida y una restricción propia. Dos aprendices de la misma cohorte no repiten dominio. Copiar el modelo de otro dominio anula la entrega.

Todos los nombres del modelo (clases, atributos, estados, mensajes, actores) salen de tu dominio y van en inglés.

## Estructura final (semana 10)

```
modelo/
├── README.md            # dominio, actores, glosario del dominio, índice de diagramas
├── diagramas/
│   ├── 01-modelo-conceptual.puml
│   ├── 02-clases.puml
│   ├── 03-objetos.puml
│   ├── 04-casos-de-uso.puml
│   ├── 05-actividad-<proceso>.puml
│   ├── 06-secuencia-<caso-de-uso>.puml
│   ├── 07-estados-<entidad>.puml
│   ├── 08-{paquetes,componentes,despliegue}.puml
│   └── 09-patron-<nombre>.puml
├── casos-de-uso/        # CU-01.md, CU-02.md ...
├── codigo/              # esqueleto de clases en tu lenguaje POO
├── trazabilidad.md      # casos de uso → clases → diagramas (semana 10)
├── revision.md          # hallazgos de la revisión por pares y resoluciones (semana 10)
└── defensa.md           # guion y decisiones de modelado (semana 10)
```

Cada `3-proyecto/starter/` es esta carpeta tal como debería quedar al final de la semana anterior, con TODOs para la semana actual. Si prefieres seguir con tu propia entrega, cópiala encima del starter: el autograding corrige `3-proyecto/starter/`.

## Incremento por semana

| Semana | Qué añades al modelo |
|---|---|
| 01 | `README.md` del dominio y `01-modelo-conceptual.puml` |
| 02 | `02-clases.puml`: atributos tipados, operaciones, enum, clase abstracta |
| 03 | Relaciones en `02-clases.puml` y `03-objetos.puml` |
| 04 | `04-casos-de-uso.puml` y especificaciones `casos-de-uso/CU-NN.md` |
| 05 | Actividad del proceso núcleo con particiones |
| 06 | Secuencia de un caso de uso con fragmentos y su comunicación |
| 07 | Máquina de estados de la entidad con ciclo de vida |
| 08 | Paquetes, componentes y despliegue |
| 09 | `codigo/` desde el diagrama de clases y un patrón GoF aplicado |
| 10 | Coherencia entre vistas, trazabilidad y defensa |
