create database fitness;

\c fitness

create table users(id smallserial not null primary key, name varchar(50) not null, date_of_birth date);
create table workout_plans(id serial not null primary key, user_id smallint references users(id));
