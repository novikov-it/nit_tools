BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "nit_chat_message" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "nit_chat_message" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "chatChannelId" bigint NOT NULL,
    "sentAt" timestamp without time zone NOT NULL,
    "text" text
);

--
-- ACTION DROP TABLE
--
DROP TABLE "nit_chat_participant" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "nit_chat_participant" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "chatChannelId" bigint NOT NULL,
    "lastMessage" text,
    "lastMessageSentAt" timestamp without time zone,
    "unreadCount" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE UNIQUE INDEX "chat_participants_idx" ON "nit_chat_participant" USING btree ("userId", "chatChannelId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "nit_chat_message"
    ADD CONSTRAINT "nit_chat_message_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "nit_chat_message"
    ADD CONSTRAINT "nit_chat_message_fk_1"
    FOREIGN KEY("chatChannelId")
    REFERENCES "nit_chat_channel"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "nit_chat_participant"
    ADD CONSTRAINT "nit_chat_participant_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "nit_chat_participant"
    ADD CONSTRAINT "nit_chat_participant_fk_1"
    FOREIGN KEY("chatChannelId")
    REFERENCES "nit_chat_channel"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR nit_tools
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('nit_tools', '20250323042819122', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250323042819122', "timestamp" = now();

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
