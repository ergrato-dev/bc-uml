# Especificación textual

El óvalo solo es un nombre. Lo que vale de un caso de uso es su **especificación**: el diálogo paso a paso entre el actor y el sistema. UML no fija su formato; el bootcamp usa este, basado en el de Alistair Cockburn.

## Plantilla

```markdown
# CU-01 — Borrow book

## Actor principal

Librarian.

## Actores secundarios

Ninguno.

## Precondiciones

- El socio está registrado y no tiene multas pendientes.

## Disparador

El socio llega al mostrador con un libro.

## Flujo principal

1. El bibliotecario identifica al socio (include CU-03).
2. El bibliotecario escanea el ejemplar.
3. El sistema comprueba que el socio tiene menos de 3 préstamos activos.
4. El sistema crea el `Loan` con `dueDate` a 21 días.
5. El sistema imprime el comprobante.

## Flujos alternativos

2a. El ejemplar está reservado por otro socio: el sistema lo indica y el caso termina.
3a. El socio ya tiene 3 préstamos activos: el sistema rechaza el préstamo y el caso termina.

## Postcondiciones

- Existe un `Loan` `ACTIVE` del socio sobre el ejemplar.
```

## Las secciones

| Sección | Qué responde |
|---|---|
| Actor principal | Quién quiere el objetivo |
| Actores secundarios | A quién necesita el sistema |
| Precondiciones | Qué tiene que ser verdad **antes**; el caso no lo comprueba |
| Disparador | Qué hace que empiece |
| Flujo principal | El camino en que todo sale bien, numerado |
| Flujos alternativos | Desvíos y errores, cada uno colgado de un paso |
| Postcondiciones | Qué es verdad **después**, si el flujo principal termina |

## Reglas de escritura

- **Un paso, una acción, un sujeto:** "El sistema crea el `Loan`", no "se crea el préstamo y se avisa".
- **Alterna actor y sistema:** el actor pide o da algo, el sistema responde. Si cinco pasos seguidos son del sistema, probablemente describes su implementación.
- **Sin interfaz:** "El socio elige el libro", no "pulsa el botón azul de la tercera fila".
- **Entre 3 y 9 pasos.** Más de 9: el caso es demasiado grande o describe detalle de pantalla. Menos de 3: quizá es un paso de otro caso.
- **Flujos alternativos con número del paso y letra:** `3a.` sale del paso 3; un segundo desvío del mismo paso es `3b.`. Cada uno dice cómo termina: "el caso termina" o "vuelve al paso N".
- **Nombres del modelo:** clases, atributos y estados en inglés, como en tu diagrama de clases (`Loan`, `ACTIVE`). La prosa, en español.

## Trazabilidad

La especificación conecta las vistas del modelo:

- El nombre del archivo `CU-01.md` coincide con el alias `CU01` del diagrama.
- Cada clase, atributo o estado que nombra la especificación existe en `02-clases.puml`. Si nombras algo que no existe, falta en el modelo o sobra en el texto.
- Las reglas del negocio (máximo 3 préstamos) aparecen como paso del sistema o como flujo alternativo. Es donde se ve la restricción de tu dominio.
- Un `include` aparece como paso que remite al otro caso; un `extend`, como flujo alternativo en el paso del punto de extensión.

En la semana 06 convertirás un flujo principal en un diagrama de secuencia: cada paso del sistema será un mensaje.

## Errores frecuentes

- Precondiciones que el caso comprueba (es un paso o un flujo alternativo, no una precondición).
- Flujos alternativos sueltos ("si hay error, se avisa") sin paso de origen ni final.
- Postcondiciones que repiten el último paso en vez de decir qué estado queda.
- Pasos que dicen cómo lo hace el sistema ("consulta la tabla `loans` con un `JOIN`").

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Teoría — Include, extend y generalización](02-include-extend-y-generalizacion.md) | [Índice de labs](../2-practicas/README.md) → |

[↑ Semana 04](../README.md)
