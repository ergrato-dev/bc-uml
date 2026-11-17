#!/usr/bin/env bash
#
# verificar-semana.sh — autograding declarativo del bootcamp.
#
# Uso:
#   ./scripts/verificar-semana.sh 03        comprueba la Semana 03
#   ./scripts/verificar-semana.sh --doctor  comprueba tu entorno
#   PROYECTO=ruta/a/3-proyecto ./scripts/verificar-semana.sh 03
#                                           comprueba otra carpeta (la del instructor)
#
# Por defecto los checks corren dentro del contenedor uml (compose.yaml,
# PlantUML 1.2026.9), asi todos obtienen el mismo resultado.
#
# Este script no sabe nada de ninguna semana en concreto: lee las
# comprobaciones de bootcamp/week-NN-*/checks.json y las ejecuta. Si necesitas
# logica especifica de una semana, el sitio es el checks.json, nunca este
# archivo. El contrato completo esta en docs/autograding.md.

set -euo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$RAIZ"

rojo()  { printf '\033[0;31m%s\033[0m\n' "$*"; }
verde() { printf '\033[0;32m%s\033[0m\n' "$*"; }
gris()  { printf '\033[0;90m%s\033[0m\n' "$*"; }

doctor() {
  local fallos=0

  comprobar() {
    if [[ "$2" == ok ]]; then
      printf '  \033[0;32m✅\033[0m %-10s %s\n' "$1" "${3:-}"
    else
      printf '  \033[0;31m❌\033[0m %-10s %s\n' "$1" "${3:-}"
      fallos=$(( fallos + 1 ))
    fi
  }

  if [[ -z "${BC_UML_LAB:-}" ]]; then
    if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
      comprobar docker ok "$(docker compose version 2>/dev/null | head -1)"
    else
      comprobar docker no "no disponible — el laboratorio corre en Docker (docs/setup-entorno.md)"
    fi
  else
    if command -v plantuml >/dev/null 2>&1; then
      comprobar plantuml ok "$(plantuml -version 2>/dev/null | head -1)"
    else
      comprobar plantuml no "no instalado — reconstruye la imagen: docker compose build"
    fi
    if command -v dot >/dev/null 2>&1; then
      comprobar graphviz ok "$(dot -V 2>&1)"
    else
      comprobar graphviz no "no instalado — los diagramas de clases lo necesitan"
    fi
  fi

  if command -v jq >/dev/null 2>&1; then
    comprobar jq ok "$(jq --version)"
  else
    comprobar jq no "no instalado — es obligatorio para leer checks.json"
  fi

  if command -v git >/dev/null 2>&1; then
    comprobar git ok "$(git --version)"
  else
    comprobar git no "no instalado — tu modelo se versiona con git"
  fi

  echo
  if (( fallos == 0 )); then
    verde "Todo listo."
    return 0
  fi
  rojo "$fallos comprobacion(es) del entorno fallaron."
  return 1
}

# Aserciones:
#   exit0        el comando sale con 0
#   exit!=0      el comando sale distinto de 0
#   exit=N       el comando sale exactamente con N
#   stdout~RE    la salida casa con la expresion regular extendida RE
#   stdout!~RE   la salida NO casa con RE
evaluar() {
  local asercion="$1" codigo="$2" salida="$3"

  case "$asercion" in
    exit0)       [[ "$codigo" -eq 0 ]] ;;
    "exit!=0")   [[ "$codigo" -ne 0 ]] ;;
    exit=*)      [[ "$codigo" -eq "${asercion#exit=}" ]] ;;
    "stdout!~"*) ! grep -qE "${asercion#stdout!~}" <<<"$salida" ;;
    stdout~*)    grep -qE "${asercion#stdout~}" <<<"$salida" ;;
    *)
      rojo "ASERCION DESCONOCIDA: '$asercion'"
      gris "Validas: exit0, exit!=0, exit=N, stdout~RE, stdout!~RE"
      return 2
      ;;
  esac
}

verificar_semana() {
  local semana="$1"

  if ! command -v jq >/dev/null 2>&1; then
    rojo "Falta jq. Es obligatorio para leer checks.json."
    exit 1
  fi

  local dir
  dir=$(find "$RAIZ/bootcamp" -maxdepth 1 -type d -name "week-${semana}-*" | head -1)
  if [[ -z "$dir" ]]; then
    rojo "No existe la carpeta de la Semana $semana."
    exit 1
  fi

  local archivo="$dir/checks.json"
  if [[ ! -f "$archivo" ]]; then
    rojo "La Semana $semana todavia no tiene checks.json."
    exit 1
  fi
  if ! jq -e . "$archivo" >/dev/null 2>&1; then
    rojo "checks.json invalido: $archivo"
    exit 1
  fi

  local proyecto="${PROYECTO:-$dir/3-proyecto/starter}"
  if [[ ! -d "$proyecto" ]]; then
    rojo "No existe la carpeta del proyecto: $proyecto"
    exit 1
  fi
  proyecto="$(cd "$proyecto" && pwd)"

  echo "Semana $semana — $(jq -r '.titulo' "$archivo")"
  echo

  local total=0 pasados=0
  local _id descripcion cmd asercion pista codigo salida

  while IFS=$'\t' read -r _id descripcion cmd asercion pista; do
    total=$(( total + 1 ))

    # Los marcadores dejan el checks.json independiente de rutas.
    cmd=${cmd//\{semana\}/$dir}
    cmd=${cmd//\{raiz\}/$RAIZ}
    cmd=${cmd//\{proyecto\}/$proyecto}

    # `if` alrededor: con `set -e`, capturar el codigo de un comando que falla
    # a proposito requiere un contexto condicional.
    if salida=$(bash -c "$cmd" 2>&1 </dev/null); then codigo=0; else codigo=$?; fi

    if evaluar "$asercion" "$codigo" "$salida"; then
      printf '  \033[0;32m✅\033[0m %s\n' "$descripcion"
      pasados=$(( pasados + 1 ))
    else
      printf '  \033[0;31m❌\033[0m %s\n' "$descripcion"
      printf '     \033[0;90mpista: %s\033[0m\n' "$pista"
    fi
  done < <(jq -r '.checks[] | [.id, .descripcion, .cmd, .assert, .pista] | @tsv' "$archivo")

  echo
  if (( pasados == total )); then
    verde "$pasados/$total comprobaciones superadas."
    return 0
  fi
  rojo "$pasados/$total comprobaciones superadas."
  gris "Cada pista dice en que archivo y en que paso se arregla."
  return 1
}

# Fuera del laboratorio, la semana se verifica dentro del contenedor.
if [[ -z "${BC_UML_LAB:-}" && "${1:-}" =~ ^[0-9]{2}$ ]]; then
  if [[ -n "${PROYECTO:-}" ]]; then
    abs="$(cd "$PROYECTO" && pwd)"
    exec docker compose run --rm -T -v "$abs:/entrega:ro" -e PROYECTO=/entrega uml \
      ./scripts/verificar-semana.sh "$1"
  fi
  exec docker compose run --rm -T uml ./scripts/verificar-semana.sh "$1"
fi

case "${1:-}" in
  --doctor)      doctor ;;
  -h|--help|"")  sed -n '3,18p' "${BASH_SOURCE[0]}" | sed 's|^# \?||' ;;
  [0-9][0-9])    verificar_semana "$1" ;;
  *)             rojo "La semana se indica con dos digitos: 01, 02 ... 10"; exit 1 ;;
esac
