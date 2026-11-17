# Autograding

`scripts/verificar-semana.sh` te dice qué te falta antes de entregar. No sabe nada de ninguna semana en concreto: lee `bootcamp/week-NN-*/checks.json` y ejecuta lo que ahí ponga.

## Uso

```bash
./scripts/verificar-semana.sh --doctor   # comprueba tu entorno
./scripts/verificar-semana.sh 02         # comprueba la Semana 02 dentro del contenedor uml
```

Desde tu equipo, el script se relanza dentro del contenedor (`docker compose run --rm -T uml`), con PlantUML 1.2026.9. Así todos obtienen el mismo resultado.

Salida:

```
Semana 02 — Diagrama de clases

  ✅ 02-clases.puml renderiza sin errores
  ❌ 02-clases.puml tiene al menos 6 clases
     pista: 3-proyecto/README.md, Paso a paso, paso 2

  1/2 comprobaciones superadas.
```

Sale con 0 si pasan todas y con 1 si falla alguna. Cada pista dice en qué archivo y en qué paso se arregla.

## Formato de `checks.json`

```json
{
  "semana": "02",
  "titulo": "Diagrama de clases",
  "checks": [
    {
      "id": "clases-renderiza",
      "descripcion": "02-clases.puml renderiza sin errores",
      "cmd": "plantuml -checkonly {proyecto}/diagramas/02-clases.puml",
      "assert": "exit0",
      "pista": "3-proyecto/README.md, Paso a paso, paso 1"
    }
  ]
}
```

| Campo | Qué es |
|---|---|
| `id` | Identificador estable en kebab-case. Nunca se renombra |
| `descripcion` | Qué se comprueba, en una línea. Se copia literal a `3-proyecto/README.md` |
| `cmd` | Comando bash, ejecutado desde la raíz del repositorio dentro del contenedor |
| `assert` | `exit0`, `exit!=0`, `exit=N`, `stdout~RE`, `stdout!~RE` (la salida incluye stderr) |
| `pista` | Archivo y paso donde se arregla |

| Marcador | Se sustituye por |
|---|---|
| `{raiz}` | Ruta absoluta del repositorio |
| `{semana}` | Carpeta de la semana |
| `{proyecto}` | `{semana}/3-proyecto/starter`; con `PROYECTO=ruta`, esa ruta (montada en el contenedor) |

> [!IMPORTANT]
> Ni `cmd` ni `assert` pueden llevar `\`: `jq @tsv` la escapa. Usa clases POSIX (`[[:space:]]`), `[.]`, `[(]` o `grep -F`.

## Herramientas de PlantUML para comprobar

| Comando | Qué imprime | Para qué |
|---|---|---|
| `plantuml -checkonly f.puml` | nada; sale con 0 o con 200 si hay error | El diagrama renderiza |
| `plantuml -syntax < f.puml` | tipo (`CLASS`, `SEQUENCE`, `ACTIVITY`...) y `(N entities)` o `(N participants)` | Tipo de diagrama y tamaño sin depender de nombres |
| `grep -cE 'RE' f.puml` | número de líneas que casan | Notación concreta: visibilidad, tipos, relaciones, fragmentos |

Contar entidades:

```bash
[ "$(plantuml -syntax < f.puml | awk -F'[( ]' '/entities/{print $2}')" -ge 6 ]
```

## Reglas de diseño

1. El `checks.json` se escribe antes que el contenido: define qué tienen que enseñar los labs.
2. Entre 6 y 18 comprobaciones por semana. Una comprobación, un hecho.
3. **Agnóstico del dominio:** cada aprendiz modela un sistema distinto. Se comprueba tipo, tamaño y notación, nunca nombres de clases o actores.
4. Comprueba que renderiza antes que cualquier otra cosa: un `.puml` roto invalida todo lo demás.
5. Los checks nunca hablan con Internet (nada de plantuml.com).
6. Cero lógica de semana en `verificar-semana.sh`.

## Escribir una comprobación nueva

1. Ejecuta el comando a mano dentro del contenedor (`docker compose run --rm uml bash`) con un caso que pasa y otro que falla.
2. Añádelo al `checks.json` con su `pista` y copia la `descripcion` al `3-proyecto/README.md`.
3. `./scripts/verificar-semana.sh NN` tiene que fallar contra `starter/` y pasar contra la solución del instructor: `PROYECTO=../bc-instructor/bc-uml/week-NN-slug/3-proyecto ./scripts/verificar-semana.sh NN`.
