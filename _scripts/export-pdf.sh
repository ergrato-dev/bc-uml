#!/usr/bin/env zsh
# export-pdf.sh — Exportar módulos del bootcamp a PDF (requiere pandoc)
# Uso: ./export-pdf.sh [sesion-1|sesion-2|all]

set -e

SESION=${1:-all}
OUTPUT_DIR="./exported-pdfs"
mkdir -p "$OUTPUT_DIR"

export_sesion() {
  local sesion=$1
  echo "📄 Exportando $sesion..."
  for file in bootcamp/"$sesion"/1-teoria/*.md; do
    [ -f "$file" ] || continue
    base=$(basename "$file" .md)
    pandoc "$file" -o "$OUTPUT_DIR/${sesion}-${base}.pdf" \
      --pdf-engine=xelatex \
      -V geometry:margin=2cm \
      -V fontsize=11pt \
      2>/dev/null && echo "  ✅ $base.pdf" || echo "  ⚠️  $base (pandoc/xelatex no disponible)"
  done
}

case "$SESION" in
  sesion-1) export_sesion sesion-1 ;;
  sesion-2) export_sesion sesion-2 ;;
  all)
    export_sesion sesion-1
    export_sesion sesion-2
    ;;
  *)
    echo "Uso: $0 [sesion-1|sesion-2|all]"
    exit 1
    ;;
esac

echo ""
echo "📁 PDFs generados en: $OUTPUT_DIR"
