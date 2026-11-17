# Glosario — Semana 08

| Término | Definición en una línea | Ejemplo |
|---|---|---|
| Paquete | Agrupación con nombre de elementos del modelo; cada elemento pertenece a uno solo | `package loans { class Loan }` |
| Dependencia entre paquetes | Algo de un paquete usa algo de otro; si cambia el usado, puede romperse el que usa | `loans ..> catalog` |
| `«import»` | Dependencia que permite nombrar los elementos del otro paquete sin cualificarlos | `loans ..> members : <<import>>` |
| Ciclo de dependencias | Dos o más paquetes que dependen unos de otros en círculo; ninguno se entiende por separado | `members ..> loans` y `loans ..> members` |
| Componente | Pieza del sistema sustituible que se describe por las interfaces que ofrece y necesita | `component Orders` |
| Interfaz provista | Contrato que un componente implementa y ofrece a otros; se dibuja como un círculo | `Orders -- OrderApi` |
| Interfaz requerida | Contrato que un componente necesita que otro le dé; se dibuja como un semicírculo | `Storefront --( OrderApi` |
| Ensamblaje | Unión de una interfaz requerida con la misma interfaz provista por otro componente | `Orders --( PaymentGateway` y `Payments -- PaymentGateway` |
| Puerto | Punto de interacción en el borde de un componente por el que entran o salen peticiones | `portin "sales" as salesPort` |
| Delegación | Paso de una petición desde un puerto a la parte interna que la atiende | `salesPort --> SeatMap : <<delegate>>` |
| Nodo `«device»` | Recurso físico o máquina virtual donde se ejecuta software | `node "Library server" <<device>> as server` |
| Entorno de ejecución | Nodo de software que aloja artefactos, dentro de un dispositivo | `node "JVM 21" <<executionEnvironment>> as jvm` |
| Artefacto | Archivo concreto que se instala en un nodo | `artifact "library-api.jar" as libraryApi` |
| `«manifest»` | Relación que dice qué componente materializa un artefacto | `libraryApi ..> Loans : <<manifest>>` |
| Ruta de comunicación | Conexión entre dos nodos, con el protocolo que usan | `kiosk -- server : <<protocol>> HTTPS` |

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Recursos — web](../4-recursos/webgrafia/README.md) | [Semana 09 — De UML a código y patrones](../../week-09-de_uml_a_codigo_y_patrones/README.md) → |

[↑ Semana 08](../README.md)
