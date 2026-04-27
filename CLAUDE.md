# efrei-projet-fil-rouge-cicd-backend

NestJS poker API. SQLite via TypeORM for users. Game state in-memory only (tables, players, deck).

## Stack

- NestJS 11, TypeScript 5.7
- TypeORM + SQLite (users only, persisted)
- JWT auth (global `AuthGuard`, `@Public()` to opt-out)
- Swagger at `/api`
- Jenkins CI/CD → Docker → Azure VM
- Registry: `registry.spokayhub.top`

## Commands

```bash
npm run start:dev     # watch mode
npm run build         # tsc compile
npm run test          # jest unit
npm run test:cov      # coverage
npm run lint          # eslint --fix
npm run format        # prettier --write
```

## Architecture

```
src/
  auth/          JWT auth, global guard, @Public decorator, SignInDto
  users/         TypeORM entity + CRUD (persisted), password @Exclude'd
  tables/        In-memory game tables array (resets on restart)
  players/       In-memory Player class, game actions (fold/check/call/raise/allIn)
  decks/         Singleton deck service (global state, all tables share it)
  game-logic/    Game flow, turn/round management, AI logic
  actions/       Action dispatch + possible-action resolver
```

## Environment variables

See `.env.example`. Required in production:

| Var | Description |
|-----|-------------|
| `JWT_SECRET` | JWT signing secret — **required** |
| `JWT_EXPIRY` | Token expiry, default `24h` |
| `DB_PATH` | SQLite file path, default `db.sqlite` |
| `PORT` | Listen port, default `3000` |
| `NODE_ENV` | Set to `production` to disable TypeORM synchronize |
| `CORS_ORIGIN` | Allowed origin, default `*` |

## Known remaining tech debt

| # | Location | Issue |
|---|----------|-------|
| A1 | `src/tables/tables.service.ts` | Game state in-memory — lost on restart, not scalable |
| A2 | `src/game-logic/game-logic.service.ts` | `determineWinner()` is random — no real poker hand evaluation |
| A3 | `src/decks/decks.service.ts` | Singleton deck — all tables share one global deck state |
| A4 | `src/app.module.ts` | Only `User` registered in TypeORM — all game state is ephemeral |
| Q1 | Everywhere | Pervasive `any` typing (game-logic, tables, decks, players) |
