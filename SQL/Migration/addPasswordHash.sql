\c fitness

ALTER TABLE users
ADD COLUMN password_hash varchar(100) NOT NULL DEFAULT '';