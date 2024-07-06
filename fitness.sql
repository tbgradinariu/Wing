create database fitness;

\c fitness

create table users(
	id smallserial not null primary key, 
	name varchar(50) not null, 
	email varchar(50) not null, 
	date_of_birth date);

create table workout_plans(
	id serial not null primary key, 
	user_id smallint not null references users(id));

create table workouts(
	id serial not null primary key, 
	workout_plan_id int references workout_plans(id), 
	user_id smallint not null references users(id), 
	name varchar(40), 
	date timestamp not null);

create table muscle_groups(
	id smallserial not null primary key, 
	name varchar(40) not null);

create table exercise_types(
	id smallserial not null primary key, 
	name varchar(20) not null);

create table exercise_templates(
	id smallserial not null primary key, 
	exercise_type_id smallint not null references exercise_types(id), 
	muscle_group_id smallint not null references muscle_groups(id), 
	secondary_muscle_group_id smallint references muscle_groups(id), 
	third_muscle_group_id smallint references muscle_groups(id), 
	fourth_muscle_group_id smallint references muscle_groups(id), 
	name varchar(40) not null);

create table exercises(
	id bigserial not null primary key, 
	exercise_template_id smallint not null references exercise_templates(id), 
	workout_id int not null references workouts(id));

create table exercise_sets(
	id bigserial not null primary key, 
	exercise_id bigint not null references exercises(id), 
	reps smallint not null, 
	additionalWeight smallint not null, 
	isPerformedToFailure boolean not null);

create table duration_exercise_sets(
	id bigserial not null primary key, 
	exercise_id bigint not null references exercises(id), 
	duration smallint not null, 
	additionalWeight smallint not null);

insert into users (name, date_of_birth, email) values ('Roxana', '1988-08-21', 'boicu.roxana@gmail.com');
insert into users (name, date_of_birth, email) values ('Tibi', '1989-03-27', 'gradinariu.tiberiu@gmail.com');