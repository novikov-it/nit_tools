BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "fcm_token" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "nit_fcm_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "fcmToken" text NOT NULL
);


--
-- MIGRATION VERSION FOR nit_tools
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('nit_tools', '20250228045223300', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250228045223300', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
