# drp-space-db

Space catalog schema. **Migrations only.** Engine: [`drp-infra-postgres`](https://github.com/code-corhuila/drp-infra-postgres). No database container here. `drp-space-api` must not own DDL.

Model: `drp-docs` `06-data/models.md` (schema `space`, user `space_app`).

## Layout (Anexo J)

| Folder | Content |
|--------|---------|
| `01_ddl/` | `spaces`, `blocked_periods` (schema-qualified) |
| `02_dml/` | Corte 2 catalog fixture — **do not cherry-pick to qa/main** |
| `03_dcl/` | grants for `space_app` (no DELETE; soft-delete via `deleted_at`) |
| `04_tcl/` | reserved |
| `05_rollbacks/` | local undo |
| `deploy/compose.yml` | Flyway job only |

Control table: `space.flyway_space_history`.

## Run

```bash
# infra first
docker compose --env-file env/dev.env -f deploy/compose.yml up -d

# this repo
docker compose --env-file .env.example -f deploy/compose.yml run --rm space-migrate
```

## Branching

Child of `develop` named `feat/…`. Never commit on `develop` / `qa` / `main`. Promote with `cherry-pick -x`.
