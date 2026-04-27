-- PostgreSQL dump generated from SQLite db.sqlite
-- Import: psql -U <user> -d <database> -f dump_postgres.sql

BEGIN;

CREATE TABLE IF NOT EXISTS "user" (
    "id"           SERIAL PRIMARY KEY,
    "pseudo"       VARCHAR NOT NULL,
    "password"     VARCHAR NOT NULL,
    "email"        VARCHAR NOT NULL,
    "bank"         INTEGER NOT NULL DEFAULT 1000,
    "victoryStats" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "UQ_ed766a9782779b8390a2a81f444" UNIQUE ("email")
);

INSERT INTO "user" ("id", "pseudo", "password", "email", "bank", "victoryStats") VALUES
(1, 'lolilol',    '$2b$10$8oryRwpBTFKAchAiSiO7g.8v5wMw42kUnTXHLDKw713jN0fT3TYwi', 'lolilol@lol.com',    1000, 0),
(2, 'lolilol',    '$2b$10$HMo5YReg79m7PbAGuaV0nuddFcYbNbLNtTm/P9c.7sWzb/KBLLS4i', 'lollol@lol.com',     1000, 0),
(3, 'lolilol',    '$2b$10$TTmB7Uxd2kYCdxou5atsZuJyG4jgcN1DJQLb1eyH4eg4JOyAZNjuG', 'testtt@dol.fr',      1000, 0),
(4, 'lolol',      '$2b$10$3fsaig5.iS9MDje8YL0dcuShnHGonwEuDNxb..ji6ow5.KKXaFyC6', 'testt@dol.fr',       1000, 0),
(5, 'lolaaaaal',  '$2b$10$gaz/asF1fc7F03iDvPrSrefwR0643EjjpWnU41N4rCkV9e83p5I8q', 'tesssst@dol.fr',     1000, 0),
(6, 'lallieTEST', '$2b$10$9cipLdm4xHlyS5bn2hpJKeTJfujYC5YpKYOFX/Ur.D/vDYZi46e/q', 'exemple@exemple.com', 1000, 0),
(7, 'test',       '$2b$10$RE4uHbqSEShCL.Cm3WzFQ.GhcmblG7Qa1QRgk/7dq7dvG1JSsDSSS', 'test@test.test',     1000, 0);

-- Sync sequence to max id so future inserts don't conflict
SELECT setval(pg_get_serial_sequence('"user"', 'id'), MAX("id")) FROM "user";

COMMIT;
