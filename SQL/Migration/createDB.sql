create database fitness;

\c fitness

create table users(
	id smallserial not null primary key, 
	name varchar(50) not null, 
	email varchar(50) not null, 
	date_of_birth date);

create table workout_plans(
	id serial not null primary key,
	user_id smallint not null references users(id),
	target_weekly_workout_days smallint,
	start_date date,
	end_date date);

create table workouts(
	id serial not null primary key, 
	workout_plan_id int references workout_plans(id), 
	user_id smallint not null references users(id), 
	name varchar(40), 
	date timestamp not null);

create table muscle_groups(
	id smallserial not null primary key, 
	name varchar(40) not null unique);

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
	fifth_muscle_group_id smallint references muscle_groups(id), 
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


insert into users (name, date_of_birth, email) values ('Tibi', '1989-03-27', 'gradinariu.tiberiu@gmail.com');
insert into users (name, date_of_birth, email) values ('Roxana', '1988-08-21', 'boicu.roxana@gmail.com');

insert into exercise_types (name) values ('Vertical push/pull');
insert into exercise_types (name) values ('Horizontal push/pull');
insert into exercise_types (name) values ('Push');
insert into exercise_types (name) values ('Pull');
insert into exercise_types (name) values ('Legs');
insert into exercise_types (name) values ('Cardio');
insert into exercise_types (name) values ('Abs');

insert into muscle_groups (name) values ('Chest');
insert into muscle_groups (name) values ('Lats');
insert into muscle_groups (name) values ('Traps');
insert into muscle_groups (name) values ('Quads');
insert into muscle_groups (name) values ('Hamstrings');
insert into muscle_groups (name) values ('Glutes');
insert into muscle_groups (name) values ('Calves');
insert into muscle_groups (name) values ('Abs');
insert into muscle_groups (name) values ('Biceps');
insert into muscle_groups (name) values ('Triceps');
insert into muscle_groups (name) values ('Front deltoid');
insert into muscle_groups (name) values ('Side deltoid');
insert into muscle_groups (name) values ('Rear deltoid');
insert into muscle_groups (name) values ('Lower back');

insert into workout_plans (user_id, target_weekly_workout_days, start_date) values (1, 4, '2024-07-08');
insert into workout_plans (user_id, target_weekly_workout_days, start_date) values (2, 3, '2024-07-08');

insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Horizontal push/pull', '2024-05-19 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Vertical push/pull', '2024-05-21 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Horizontal push/pull', '2024-05-24 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Legs', '2024-05-25 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Vertical push/pull', '2024-05-27 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Horizontal push/pull', '2024-05-28 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Chest+back', '2024-05-29 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Deadlifts', '2024-05-30 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Vertical push/pull', '2024-06-01 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Legs', '2024-06-02 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Chest+back', '2024-06-03 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Deadlifts', '2024-06-07 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Horizontal push/pull', '2024-06-09 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Legs', '2024-06-11 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Vertical push', '2024-06-12 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Deadlifts', '2024-06-15 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Incline bench press', '2024-06-16 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Legs+traps', '2024-06-18 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'OHP+rows', '2024-06-19 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Pullups+Bench press', '2024-06-20 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Squat+RDL', '2024-06-25 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Pullups+Bench press+rows', '2024-06-26 05:30:00');
insert into workouts (workout_plan_id, user_id, name, date) values (1, 1, 'Pullups+OHP', '2024-06-28 05:30:00');

insert into workouts (workout_plan_id, user_id, name, date) values (2, 2, 'Cardio workout', '2024-07-08 9:00:00');
insert into workouts (workout_plan_id, user_id, name, date) values (2, 2, 'Pilates workout', '2024-07-09 9:00:00');
insert into workouts (workout_plan_id, user_id, name, date) values (2, 2, 'Cardio workout', '2024-07-10 9:00:00');
insert into workouts (workout_plan_id, user_id, name, date) values (2, 2, 'Pilates workout', '2024-07-12 9:00:00');

insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (4, 2, 3, 13, 9, 'Pull ups');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (3, 1, 10, 11, 8, 'Push ups');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (5, 4, 5, 6, 7, 'Squats');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (5, 5, 6, 14, 3, 'Deadlifts');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (5, 5, 6, 14, 3, 'Romanian deadlifts(RDL)');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, name) values (3, 1, 10, 11, 'Bench press');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, name) values (3, 1, 10, 11, 'Inclined bench press');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, fifth_muscle_group_id, name) values (3, 11, 12, 13, 10, 3, 'Overhead press');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, fifth_muscle_group_id, name) values (3, 11, 12, 13, 10, 3, 'Dumbbell shoulder press');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (4, 2, 3, 13, 9, 'Barbell row');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, third_muscle_group_id, fourth_muscle_group_id, name) values (4, 2, 3, 13, 9, 'Dumbbell row');
insert into exercise_templates (exercise_type_id, muscle_group_id, secondary_muscle_group_id, name) values (3, 12, 13, 'Lateral raises');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (5, 7, 'Calf raises');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (4, 3, 'Shrugs');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (4, 9, 'Barbell curls');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (4, 9, 'Dumbbell curls');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (3, 10, 'Dips');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (3, 10, 'Skullcrushers');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (7, 8, 'Sit ups');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (7, 8, 'Crunches');
insert into exercise_templates (exercise_type_id, muscle_group_id, name) values (3, 13, 'Rear delt fly');

-- Bench press, Barbell row 19.05
insert into exercises(exercise_template_id, workout_id) values (6, 1);
insert into exercises(exercise_template_id, workout_id) values (10, 1);
-- Pullups, overhead press 21.05
insert into exercises(exercise_template_id, workout_id) values (1, 2);
insert into exercises(exercise_template_id, workout_id) values (8, 2);
-- Pullups, Incline bench press, Dumbbell row, Lateral raises 24.05
insert into exercises(exercise_template_id, workout_id) values (1, 3);
insert into exercises(exercise_template_id, workout_id) values (7, 3);
insert into exercises(exercise_template_id, workout_id) values (11, 3);
insert into exercises(exercise_template_id, workout_id) values (12, 3);
-- Squat, RDL 25.05
insert into exercises(exercise_template_id, workout_id) values (3, 4);
insert into exercises(exercise_template_id, workout_id) values (5, 4);
-- Pullups, ohp, dumbbell row 27.05
insert into exercises(exercise_template_id, workout_id) values (1, 5);
insert into exercises(exercise_template_id, workout_id) values (8, 5);
insert into exercises(exercise_template_id, workout_id) values (11, 5);
-- Barbell row, skullcrushers 28.05
insert into exercises(exercise_template_id, workout_id) values (10, 6);
insert into exercises(exercise_template_id, workout_id) values (18, 6);
-- Pullups, Bench press, Barbell curls 29.05
insert into exercises(exercise_template_id, workout_id) values (1, 7);
insert into exercises(exercise_template_id, workout_id) values (6, 7);
insert into exercises(exercise_template_id, workout_id) values (15, 7);
-- Deadlifts, Rear shoulder flys, calf raises 30.05
insert into exercises(exercise_template_id, workout_id) values (4, 8);
insert into exercises(exercise_template_id, workout_id) values (21, 8);
insert into exercises(exercise_template_id, workout_id) values (13, 8);
-- Pullups, overhead press 01.06
insert into exercises(exercise_template_id, workout_id) values (1, 9);
insert into exercises(exercise_template_id, workout_id) values (8, 9);
-- Squats, Calf raises 02.06
insert into exercises(exercise_template_id, workout_id) values (3, 10);
insert into exercises(exercise_template_id, workout_id) values (13, 10);
-- Pullups, incline bench press, dumbbell hammer curls 03.06
insert into exercises(exercise_template_id, workout_id) values (1, 11);
insert into exercises(exercise_template_id, workout_id) values (7, 11);
insert into exercises(exercise_template_id, workout_id) values (16, 11);
-- Pullups, Deadlifts, Lateral raises 07.06
insert into exercises(exercise_template_id, workout_id) values (1, 12);
insert into exercises(exercise_template_id, workout_id) values (4, 12);
insert into exercises(exercise_template_id, workout_id) values (12, 12);
-- Pullups, Bench press, Barbell rows 09.06
insert into exercises(exercise_template_id, workout_id) values (1, 13);
insert into exercises(exercise_template_id, workout_id) values (6, 13);
insert into exercises(exercise_template_id, workout_id) values (10, 13);
-- Pullups, Squats, Calf raises 11.06
insert into exercises(exercise_template_id, workout_id) values (1, 14);
insert into exercises(exercise_template_id, workout_id) values (3, 14);
insert into exercises(exercise_template_id, workout_id) values (13, 14);
-- Overheadpress, lateral raises 12.06
insert into exercises(exercise_template_id, workout_id) values (8, 15);
insert into exercises(exercise_template_id, workout_id) values (12, 15);
-- Deadlifts, hammer curls 15.06
insert into exercises(exercise_template_id, workout_id) values (4, 16);
insert into exercises(exercise_template_id, workout_id) values (16, 16);
-- Pullups, incline bench press 16.06
insert into exercises(exercise_template_id, workout_id) values (1, 17);
insert into exercises(exercise_template_id, workout_id) values (7, 17);
-- Squats, shrugs 18.06
insert into exercises(exercise_template_id, workout_id) values (3, 18);
insert into exercises(exercise_template_id, workout_id) values (14, 18);
-- OHP, Barbell row 19.06
insert into exercises(exercise_template_id, workout_id) values (8, 19);
insert into exercises(exercise_template_id, workout_id) values (10, 19);
-- Pullups, bench press, lateral raises 20.06
insert into exercises(exercise_template_id, workout_id) values (1, 20);
insert into exercises(exercise_template_id, workout_id) values (6, 20);
insert into exercises(exercise_template_id, workout_id) values (12, 20);
-- Squat, RDL, Calf raises 25.06
insert into exercises(exercise_template_id, workout_id) values (3, 21);
insert into exercises(exercise_template_id, workout_id) values (5, 21);
insert into exercises(exercise_template_id, workout_id) values (13, 21);
-- Pullups, Bench press, Dumbbell rows, Lateral raises 26.06
insert into exercises(exercise_template_id, workout_id) values (1, 22);
insert into exercises(exercise_template_id, workout_id) values (6, 22);
insert into exercises(exercise_template_id, workout_id) values (11, 22);
insert into exercises(exercise_template_id, workout_id) values (12, 22);
-- Pullups, overhead press 28.06
insert into exercises(exercise_template_id, workout_id) values (1, 23);
insert into exercises(exercise_template_id, workout_id) values (8, 23);

-- Bench press 19.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 11, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 10, 34, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 10, 44, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 9, 46, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (1, 7, 46, true);

-- Barbell row 19.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (2, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (2, 8, 30, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (2, 8, 30, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (2, 8, 30, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (2, 8, 30, true);

-- Pullups 21.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (3, 5, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (3, 5, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (3, 6, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (3, 5, -35, true);

-- Overhead press 21.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (4, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (4, 8, 24, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (4, 8, 24, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (4, 8, 24, true);

-- Pullups 24.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (5, 6, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (5, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (5, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (5, 7, -35, true);

-- Incline bench press 24.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 12, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 10, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 10, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (6, 10, 40, true);

-- Dumbbell row 24.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (7, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (7, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (7, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (7, 12, 12, false);

-- Lateral raises 24.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (8, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (8, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (8, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (8, 12, 5, false);

-- Squat 25.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 9, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 9, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 8, 34, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (9, 8, 36, true);

-- RDL 25.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (10, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (10, 9, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (10, 9, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (10, 9, 34, true);

-- Pullups 27.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (11, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (11, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (11, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (11, 6, -35, true);


-- Overhead press 27.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (12, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (12, 10, 20, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (12, 10, 24, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (12, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (12, 7, 26, true);

-- Dumbbell row 27.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (13, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (13, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (13, 12, 12, false);

-- Barbell row 28.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (14, 12, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (14, 12, 26, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (14, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (14, 9, 34, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (14, 8, 34, true);

-- Skullcrushers 28.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (15, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (15, 10, 10, false);

-- Pullups 29.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (16, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (16, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (16, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (16, 7, -35, true);

-- Bench press 29.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 12, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 8, 46, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 8, 46, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (17, 6, 46, true);

-- Barbell curls 29.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (18, 8, 20, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (18, 10, 16, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (18, 10, 16, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (18, 10, 16, false);

-- Deadlifts 30.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 50, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 56, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 56, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (19, 7, 56, false);

-- Rear shoulder flys 30.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (20, 12, 3, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (20, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (20, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (20, 10, 5, false);

-- Calf raises 30.05
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (21, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (21, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (21, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (21, 12, 10, false);

-- Pullups 01.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 6, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (22, 4, -35, true);

-- Overhead press 01.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (23, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (23, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (23, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (23, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (23, 6, 26, true);

-- Squat 02.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 9, 36, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (24, 8, 40, true);

-- Calf raises 02.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (25, 15, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (25, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (25, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (25, 12, 10, false);

-- Pullups 03.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (26, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (26, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (26, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (26, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (26, 4, -35, true);

-- Incline bench press 03.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (27, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (27, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (27, 9, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (27, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (27, 9, 40, true);

-- Dumbbell curls 03.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (28, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (28, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (28, 9, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (28, 10, 10, false);

-- Pullups 07.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (29, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (29, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (29, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (29, 6, -35, true);

-- Deadlifts 07.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 8, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 8, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 7, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 7, 50, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 6, 56, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 6, 56, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (30, 6, 56, false);

-- Lateral raises 07.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (31, 10, 3, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (31, 10, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (31, 10, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (31, 10, 5, false);

-- Pullups 09.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (32, 7, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (32, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (32, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (32, 7, -35, true);

-- Bench press 09.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 12, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 7, 50, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 9, 46, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (33, 8, 46, true);

-- Barbell row 09.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (34, 12, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (34, 10, 30, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (34, 10, 30, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (34, 10, 30, true);

-- Pullups 11.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (35, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (35, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (35, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (35, 8, -35, true);

-- Squat 11.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (36, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (36, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (36, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (36, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (36, 7, 40, true);

-- Calf raises 11.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (37, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (37, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (37, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (37, 12, 10, false);

-- Overhead press 12.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (38, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (38, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (38, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (38, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (38, 8, 26, true);

-- Lateral raises 12.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (39, 10, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (39, 10, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (39, 10, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (39, 10, 5, false);

-- Deadlifts 15.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (40, 8, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (40, 8, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (40, 7, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (40, 7, 50, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (40, 6, 56, false);

-- Dumbbell curls 15.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (41, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (41, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (41, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (41, 12, 10, false);

-- Pullups 16.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (42, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (42, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (42, 8, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (42, 8, -35, true);

-- Incline bench press 16.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (43, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (43, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (43, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (43, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (43, 8, 40, true);

-- Squat 18.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (44, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (44, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (44, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (44, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (44, 7, 40, true);

-- Shrugs 18.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (45, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (45, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (45, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (45, 12, 10, false);

-- Overhead press 19.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 10, 16, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (46, 8, 26, true);

-- Barbell row 19.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 10, 36, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 10, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (47, 8, 40, true);

-- Pullups 20.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (48, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (48, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (48, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (48, 10, -35, true);

-- Bench press 20.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 8, 50, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 8, 50, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (49, 5, 50, true);

-- Lateral raises 20.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (50, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (50, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (50, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (50, 12, 5, false);

-- Squat 25.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (51, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (51, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (51, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (51, 8, 40, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (51, 8, 40, true);

-- RDL 25.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (52, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (52, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (52, 8, 36, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (52, 8, 36, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (52, 8, 36, false);

-- Calf raises 25.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (53, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (53, 12, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (53, 12, 10, false);

-- Pullups 26.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (54, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (54, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (54, 10, -35, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (54, 10, -35, true);

-- Bench press 26.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 10, 30, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 10, 40, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 7, 50, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 6, 50, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (55, 6, 50, true);

-- Dumbbell row 26.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (56, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (56, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (56, 12, 12, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (56, 12, 12, false);

-- Lateral raises 26.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (57, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (57, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (57, 12, 5, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (57, 12, 5, false);

-- Pullups 28.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (58, 5, -25, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (58, 5, -25, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (58, 5, -25, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (58, 5, -25, true);

-- Overhead press 28.06
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (59, 10, 10, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (59, 10, 20, false);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (59, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (59, 8, 26, true);
insert into exercise_sets (exercise_id, reps, additionalweight, isperformedtofailure) values (59, 8, 26, true);
