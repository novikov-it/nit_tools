BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "nit_chat_message" ADD COLUMN "attachmentIds" json;
ALTER TABLE "nit_chat_message" ADD COLUMN "customMessageType" json;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "nit_chat_participant" ADD COLUMN "lastReadMessageId" bigint;
ALTER TABLE ONLY "nit_chat_participant"
    ADD CONSTRAINT "nit_chat_participant_fk_1"
    FOREIGN KEY("lastReadMessageId")
    REFERENCES "nit_chat_message"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR nit_tools
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('nit_tools', '20250529204539273', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250529204539273', "timestamp" = now();

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
