# bc-uml — UML Bootcamp, Zero to Advanced

A **10-week**, **10 h/week** (100 h) self-paced bootcamp on **UML 2.5.1** for developers who already program with object orientation. You go from your first class diagram to a complete model of a system (structure, behavior, architecture) that you can defend and turn into code.

All content is in **Spanish**. Every diagram is written as code with **PlantUML 1.2026.9**, versioned with git and rendered in a **Docker lab** (`compose.yaml`) so everyone gets the same result.

```bash
git clone https://github.com/ergrato-dev/bc-uml.git
cd bc-uml
docker compose build
docker compose run --rm uml plantuml -version
```

- Week index and status: [bootcamp/README.md](bootcamp/README.md)
- Lab setup: [docs/setup-entorno.md](docs/setup-entorno.md)
- Autograding: `./scripts/verificar-semana.sh NN` ([docs/autograding.md](docs/autograding.md))
- Running project, the model of a domain assigned by the instructor: [docs/proyecto-hilo-conductor.md](docs/proyecto-hilo-conductor.md)

## ⚠️ Disclaimer

This material is **educational and non-commercial** in nature. Examples, diagrams, and projects are fictitious and intended for learning purposes only.

- Content is provided **"as is"**, without warranties of any kind, express or implied.
- The authors assume no responsibility for the use of this material in production environments.
- **UML** is a registered trademark of the Object Management Group (OMG). This project has no official affiliation with OMG or any certification body.
- Third-party tools and resources mentioned are subject to their own license terms.

License: [CC BY-NC-SA 4.0](LICENSE).
