# Lab 02 — Visibilidad y encapsulamiento

⏱ Duración estimada: ~60 min

## Objetivo

Proteger el estado de una clase con la visibilidad adecuada y sustituir getters y setters por operaciones que expresan reglas del negocio.

## Contexto

- Narrativa del cine (lab 05 de la semana 01): la tarjeta de socio acumula puntos con cada compra, con 100 puntos se canjea una entrada gratis y caduca al año.
- `starter/tarjeta.puml` modela la tarjeta con todo público y getters/setters: nada impide dejarla con puntos negativos.
- Visibilidades: `+` pública, `-` privada, `#` protegida, `~` de paquete.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-02-visibilidad-y-encapsulamiento
   ```

1. Cuenta lo que hay ahora:

   ```bash
   grep -cE '^[[:space:]]*[+]' starter/tarjeta.puml
   ```

   Output: `9`. Nueve miembros públicos: cualquier clase del sistema puede cambiar cualquier cosa.

2. Antes de editar, escribe en un archivo `analisis.md` (en la carpeta del lab) una regla del negocio que hoy se puede romper por cada atributo. Ejemplo: "`points` público: alguien puede asignar -500".

3. **TODO 1**: cambia `+` por `-` en los 4 atributos.

4. **TODO 2**: borra `getPoints`, `setPoints`, `getExpiresOn` y `setExpiresOn`. Leer un atributo privado se sobrentiende; un setter público devuelve el problema del paso 2.

5. **TODO 3**: añade las operaciones que expresan las reglas:

   ```plantuml
     + earnPoints(purchaseTotal: Decimal): void
     + redeemFreeTicket(): Ticket
     + renew(today: Date): void
     + isValidOn(day: Date): Boolean
   ```

   Cada una protege una regla: `redeemFreeTicket()` puede comprobar que hay 100 puntos antes de restar; `setPoints(value)` no podía.

6. **TODO 4**: `validateNumber()` solo la usa la propia tarjeta: cámbiala a `- validateNumber(): Boolean`.

7. **TODO 5**: añade el punto de extensión para subclases:

   ```plantuml
     # pointsPerCurrencyUnit(): Integer
   ```

8. Comprueba el resultado por visibilidad:

   ```bash
   for v in '[+]' '-' '#'; do printf '%s ' "$v"; grep -cE "^[[:space:]]*$v" starter/tarjeta.puml; done
   ```

   Output:

   ```
   [+] 4
   - 5
   # 1
   ```

   4 operaciones públicas (el contrato), 5 miembros privados (4 atributos y `validateNumber`), 1 protegido.

9. Borra los comentarios de los TODO y valida:

   ```bash
   grep -c TODO starter/tarjeta.puml; plantuml -checkonly starter/tarjeta.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] Ningún atributo público; ningún getter ni setter
- [ ] Las 4 operaciones públicas expresan reglas del negocio
- [ ] El conteo del paso 8 da `4`, `5` y `1`
- [ ] `analisis.md` explica qué regla protege cada cambio

## Reto extra

¿Qué pasa con `active: Boolean` ahora que existe `isValidOn(day: Date)`? Decide si sobra y justifícalo en `analisis.md` (pista: ¿puede `active` contradecir a `expiresOn`?).

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Anatomía de una clase](../lab-01-anatomia-de-una-clase/README.md) | [Lab 03 — Operaciones y firmas completas](../lab-03-operaciones-y-firmas/README.md) → |

[↑ Semana 02](../../README.md)
