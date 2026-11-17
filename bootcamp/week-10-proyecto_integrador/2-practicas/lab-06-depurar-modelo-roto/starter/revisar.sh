#!/usr/bin/env bash
# Revisa la coherencia del modelo con las reglas de los labs 01 a 03.
# Uso, desde la carpeta del lab: bash starter/revisar.sh
cd "$(dirname "$0")/modelo" || exit 1
d=diagramas
clases() { grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' "$@" | awk '{print $NF}' | sort -u; }
ops() { grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' "$@" | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u; }
aviso() { [ -n "$2" ] && echo "$1: $(echo $2)"; }

echo "== 1. Renderizan"
for f in $d/*.puml; do plantuml -checkonly "$f" >/dev/null 2>&1 || echo "no renderiza: $f"; done

echo "== 2. Coherencia con clases.puml"
aviso "objetos de clases que no existen" "$(grep -hE '^object' $d/objetos.puml | grep -oE ':[[:space:]]*[A-Z][A-Za-z0-9_]*' | grep -oE '[A-Z][A-Za-z0-9_]*' | sort -u | comm -23 - <(clases $d/clases.puml))"
aviso "mensajes que no son operaciones" "$(grep -E -- '->[[:space:]]*[a-z]+[[:space:]]*:' $d/secuencia-*.puml | sed -E 's/^[^:]*:[[:space:]]*//' | grep -oE '^[a-z][A-Za-z0-9_]*[(]' | tr -d '(' | sort -u | comm -23 - <(ops $d/clases.puml))"
aviso "eventos que no son operaciones de Ticket" "$(grep -oE -- '-->[^:]*:[[:space:]]*[a-z][A-Za-z0-9_]*[(]' $d/estados-ticket.puml | grep -oE '[a-z][A-Za-z0-9_]*[(]$' | tr -d '(' | grep -vxE 'when|after' | sort -u | comm -23 - <(awk '/^class Ticket /,/^}/' $d/clases.puml | ops))"
aviso "estados sin literal en TicketStatus" "$(grep -oE '[A-Z][a-z][A-Za-z]*' $d/estados-ticket.puml | grep -vE '^(Cine|Ticket)$' | tr '[:lower:]' '[:upper:]' | sort -u | comm -23 - <(awk '/^enum TicketStatus/,/^}/' $d/clases.puml | grep -oE '^[[:space:]]+[A-Z_]+$' | tr -d ' ' | sort -u))"

echo "== 3. Trazabilidad"
aviso "filas sin caso de uso" "$(grep -oE '^[|][[:space:]]*CU-[0-9]{2}' trazabilidad.md | grep -oE '[0-9]{2}' | sort -u | comm -23 - <(grep -oE 'as[[:space:]]+CU[0-9]{2}' $d/casos-de-uso.puml | grep -oE '[0-9]{2}' | sort -u))"
aviso "clases de la matriz que no existen" "$(awk -F'|' '$2 ~ /CU-[0-9]/ {print $4}' trazabilidad.md | grep -oE '`[A-Z][A-Za-z0-9_]*`' | tr -d '`' | sort -u | comm -23 - <(clases $d/clases.puml))"

echo "== 4. Índice del README"
for f in $d/*.puml; do grep -qF "]($f)" README.md || echo "el README no enlaza $f"; done
