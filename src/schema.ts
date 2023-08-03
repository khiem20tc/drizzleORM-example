import { integer, pgTable, serial, text } from 'drizzle-orm/pg-core';

export const info = pgTable('info', {
	id: serial('id').primaryKey(),
	name: text('name'),
	description: text('description'),
});

export const transaction = pgTable('transaction', {
	id: serial('id').primaryKey(),
	sender: integer('sender_user_id').references(() => info.id),
	recipient: integer('recipient_user_id').references(() => info.id),
});
