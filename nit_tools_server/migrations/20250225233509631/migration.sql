BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "nit_chat_participant" ADD COLUMN "lastMessage" text;
ALTER TABLE "nit_chat_participant" ADD COLUMN "lastMessageSentAt" timestamp without time zone;
ALTER TABLE "nit_chat_participant" ADD COLUMN "unreadCount" bigint NOT NULL DEFAULT 0;

--
-- MIGRATION VERSION FOR nit_tools
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('nit_tools', '20250225233509631', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250225233509631', "timestamp" = now();

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
