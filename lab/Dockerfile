# Laboratorio de bc-uml: PlantUML fijado para estudiantes, autograding y CI.
# Qué: Java 21 + Graphviz + PlantUML 1.2026.9 + las herramientas del autograding.
# Para qué: que todos rendericen los .puml con la misma versión y obtengan el mismo resultado.
FROM eclipse-temurin:21-jre-noble

ARG PLANTUML_VERSION=1.2026.9
ARG PLANTUML_SHA256=aa4a1d06f8911c4b842beff4828dd955be431692b631a312d04c0e9fab9581de

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    BC_UML_LAB=1

# graphviz: lo usan los diagramas de clases, objetos, componentes y despliegue.
# fonts-dejavu-core: sin fuentes, los PNG salen con cuadros vacíos en lugar de texto.
# bash, jq, grep, git: lo que necesita scripts/verificar-semana.sh.
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      graphviz fonts-dejavu-core bash jq git curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Se comprueba el hash: un jar distinto rompería la reproducibilidad del autograding.
RUN curl -fsSLo /opt/plantuml.jar \
      "https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar" \
 && echo "${PLANTUML_SHA256}  /opt/plantuml.jar" | sha256sum -c - \
 && printf '#!/bin/sh\nexec java -Djava.awt.headless=true -jar /opt/plantuml.jar "$@"\n' > /usr/local/bin/plantuml \
 && chmod +x /usr/local/bin/plantuml

WORKDIR /bc-uml
CMD ["bash"]
