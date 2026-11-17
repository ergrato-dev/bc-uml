# Setup del entorno

Todo el bootcamp corre en un contenedor con PlantUML fijado. En tu equipo solo necesitas Docker, git y jq.

## 1. Requisitos

| Herramienta | Comprobación | Resultado esperado |
|---|---|---|
| Docker con Compose v2 | `docker compose version` | `Docker Compose version v2.x` o superior |
| git | `git --version` | `git version 2.x` |
| jq | `jq --version` | `jq-1.7` o superior |

- **Linux:** instala Docker Engine según la guía oficial de tu distribución y añade tu usuario al grupo `docker`.
- **Windows:** Docker Desktop con el backend WSL2; trabaja dentro de tu distribución WSL2, no en `C:\`.
- **macOS:** Docker Desktop u OrbStack.
- **jq:** `sudo apt install jq` (Ubuntu/WSL2) o `brew install jq` (macOS).

## 2. Clonar y construir el laboratorio

```bash
git clone https://github.com/ergrato-dev/bc-uml.git
cd bc-uml
docker compose build
```

La primera vez descarga Java y PlantUML (unos 400 MB). Comprueba:

```bash
docker compose run --rm uml plantuml -version
```

Output (las dos primeras líneas):

```
PlantUML version 1.2026.9 / 18d0aae [2026-10-17 08:25:10 UTC]
Build Version: 1.2026.9
```

## 3. Renderizar un diagrama

```bash
docker compose run --rm uml plantuml -tsvg ruta/al/diagrama.puml
```

Genera `ruta/al/diagrama.svg` junto al `.puml`; ábrelo en el navegador. La ruta es relativa a la raíz del repo, que es donde arranca el contenedor.

El contenedor corre con uid/gid 1000 para que los SVG generados sean tuyos. Si `id -u` no imprime `1000`, exporta tus ids antes: `export UID GID=$(id -g)` (bash/zsh).

## 4. Doctor y autograding

```bash
./scripts/verificar-semana.sh --doctor   # comprueba Docker, jq y git
./scripts/verificar-semana.sh 01         # autograding de la Semana 01
```

## 5. Editor (opcional)

Cualquier editor sirve. Si usas VS Code, la extensión `jebbs.plantuml` muestra una vista previa; configúrala para renderizar en local, nunca con el servidor público de plantuml.com: enviaría tus diagramas a un tercero.
