BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "nit_chat_message" DROP CONSTRAINT "nit_chat_message_fk_0";
ALTER TABLE ONLY "nit_chat_message"
    ADD CONSTRAINT "nit_chat_message_fk_0"
    FOREIGN KEY("chatChannelId")
    REFERENCES "nit_chat_channel"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "nit_chat_participant" DROP CONSTRAINT "nit_chat_participant_fk_0";
ALTER TABLE ONLY "nit_chat_participant"
    ADD CONSTRAINT "nit_chat_participant_fk_0"
    FOREIGN KEY("chatChannelId")
    REFERENCES "nit_chat_channel"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR nit_tools
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('nit_tools', '20250716012433300', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250716012433300', "timestamp" = now();

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
