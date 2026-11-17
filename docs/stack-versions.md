# Versiones del stack

| Componente | Versión | Dónde se fija | Por qué |
|---|---|---|---|
| UML | 2.5.1 | especificación OMG | Última versión formal de la notación |
| PlantUML | 1.2026.9 | `lab/Dockerfile` (con hash SHA-256) | Misma versión para estudiantes, autograding y CI |
| Java (JRE) | 21 LTS | `lab/Dockerfile` (`eclipse-temurin:21-jre-noble`) | Lo necesita PlantUML |
| Graphviz | 2.43 | paquete de Ubuntu 24.04 | Motor de layout de clases, objetos, componentes y despliegue |
| Ubuntu | 24.04 LTS | base de la imagen | LTS con soporte hasta 2029 |
| Docker Compose | v2+ | equipo del estudiante | Sintaxis `compose.yaml` |

Features de PlantUML posteriores a 1.2026.9 no se usan. Si la documentación de plantuml.com muestra una sintaxis que no renderiza en el contenedor, manda el contenedor.
