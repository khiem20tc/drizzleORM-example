CREATE TABLE IF NOT EXISTS "info" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text
);

CREATE TABLE IF NOT EXISTS "transaction" (
	"id" serial PRIMARY KEY NOT NULL,
	"sender_user_id" integer,
	"recipient_user_id" integer
);

DO $$ BEGIN
 ALTER TABLE transaction ADD CONSTRAINT transaction_sender_user_id_info_id_fk FOREIGN KEY ("sender_user_id") REFERENCES info("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE transaction ADD CONSTRAINT transaction_recipient_user_id_info_id_fk FOREIGN KEY ("recipient_user_id") REFERENCES info("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
