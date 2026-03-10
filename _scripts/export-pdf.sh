#!/usr/bin/env zsh
# export-pdf.sh — Exportar módulos del bootcamp a PDF (requiere pandoc)
# Uso: ./export-pdf.sh [week-01|week-02|all]

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
  week-01) export_sesion week-01 ;;
  week-02) export_sesion week-02 ;;
  all)
    export_sesion week-01
    export_sesion week-02
    ;;
  *)
    echo "Uso: $0 [week-01|week-02|all]"
    exit 1
    ;;
esac

echo ""
echo "📁 PDFs generados en: $OUTPUT_DIR"
