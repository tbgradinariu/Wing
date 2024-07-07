 select users.name, 
        workout_plans.target_weekly_workout_days, 
        workout_plans.start_date, 
        workouts.name, 
        workouts.date, 
        exercise_templates.name, 
        exercise_sets.reps, 
        exercise_sets.additionalweight from users
left join workout_plans on users.id = workout_plans.user_id
left join workouts on workout_plans.id = workouts.workout_plan_id
left join exercises on workouts.id = exercises.workout_id
left join exercise_templates on exercises.exercise_template_id = exercise_templates.id
left join exercise_sets on exercises.id = exercise_sets.exercise_id;

  name  | target_weekly_workout_days | start_date |           name           |        date         |          name           | reps | additionalweight 
--------+----------------------------+------------+--------------------------+---------------------+-------------------------+------+------------------
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |   11 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |   10 |               34
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |   10 |               44
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |    9 |               46
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Bench press             |    7 |               46
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Barbell row             |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Barbell row             |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Barbell row             |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Barbell row             |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-19 05:30:00 | Barbell row             |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Pull ups                |    5 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Pull ups                |    5 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Pull ups                |    6 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Pull ups                |    5 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Overhead press          |    8 |               24
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Overhead press          |    8 |               24
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-21 05:30:00 | Overhead press          |    8 |               24
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Pull ups                |    6 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   12 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Inclined bench press    |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Dumbbell row            |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-24 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |    9 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |    9 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |    8 |               34
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Squats                  |    8 |               36
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Romanian deadlifts(RDL) |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Romanian deadlifts(RDL) |    9 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Romanian deadlifts(RDL) |    9 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-05-25 05:30:00 | Romanian deadlifts(RDL) |    9 |               34
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Pull ups                |    6 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Overhead press          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Overhead press          |   10 |               24
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Overhead press          |    7 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Dumbbell row            |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-05-27 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Barbell row             |   12 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Barbell row             |   12 |               26
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Barbell row             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Barbell row             |    9 |               34
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Barbell row             |    8 |               34
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Skullcrushers           |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-05-28 05:30:00 | Skullcrushers           |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |   12 |               20
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |    8 |               46
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |    8 |               46
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Bench press             |    6 |               46
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Barbell curls           |    8 |               20
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Barbell curls           |   10 |               16
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Barbell curls           |   10 |               16
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-05-29 05:30:00 | Barbell curls           |   10 |               16
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               20
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               30
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               40
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               50
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Deadlifts               |    7 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Rear delt fly           |   12 |                3
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Rear delt fly           |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Rear delt fly           |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Rear delt fly           |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-05-30 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    6 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Pull ups                |    4 |              -35
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Overhead press          |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push/pull       | 2024-06-01 05:30:00 | Overhead press          |    6 |               26
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |    9 |               36
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Calf raises             |   15 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-02 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Pull ups                |    4 |              -35
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Inclined bench press    |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Inclined bench press    |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Inclined bench press    |    9 |               40
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Inclined bench press    |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Inclined bench press    |    9 |               40
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Dumbbell curls          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Dumbbell curls          |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Dumbbell curls          |    9 |               10
 Tibi   |                          4 | 2024-07-08 | Chest+back               | 2024-06-03 05:30:00 | Dumbbell curls          |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Pull ups                |    6 |              -35
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    8 |               20
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    7 |               40
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    7 |               50
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    6 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    6 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Deadlifts               |    6 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Lateral raises          |   10 |                3
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-07 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Pull ups                |    7 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |   12 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |    7 |               50
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |    9 |               46
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Bench press             |    8 |               46
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Barbell row             |   12 |               20
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Barbell row             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Barbell row             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Barbell row             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Squats                  |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Squats                  |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Squats                  |    7 |               40
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs                     | 2024-06-11 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Overhead press          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Vertical push            | 2024-06-12 05:30:00 | Lateral raises          |   10 |                5
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Deadlifts               |    8 |               20
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Deadlifts               |    8 |               30
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Deadlifts               |    7 |               40
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Deadlifts               |    7 |               50
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Deadlifts               |    6 |               56
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Dumbbell curls          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Dumbbell curls          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Dumbbell curls          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Deadlifts                | 2024-06-15 05:30:00 | Dumbbell curls          |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Pull ups                |    8 |              -35
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Inclined bench press    |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Inclined bench press    |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Inclined bench press    |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Inclined bench press    |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Incline bench press      | 2024-06-16 05:30:00 | Inclined bench press    |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Squats                  |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Squats                  |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Squats                  |    7 |               40
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Shrugs                  |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Shrugs                  |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Shrugs                  |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Legs+traps               | 2024-06-18 05:30:00 | Shrugs                  |   12 |               10
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |   10 |               10
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |   10 |               16
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |   10 |               20
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |   10 |               36
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |    8 |               40
 Tibi   |                          4 | 2024-07-08 | OHP+rows                 | 2024-06-19 05:30:00 | Barbell row             |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |    8 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |    8 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Bench press             |    5 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press      | 2024-06-20 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Squats                  |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Squats                  |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Squats                  |    8 |               40
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Romanian deadlifts(RDL) |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Romanian deadlifts(RDL) |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Romanian deadlifts(RDL) |    8 |               36
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Romanian deadlifts(RDL) |    8 |               36
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Romanian deadlifts(RDL) |    8 |               36
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Squat+RDL                | 2024-06-25 05:30:00 | Calf raises             |   12 |               10
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Pull ups                |   10 |              -35
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |   10 |               30
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |   10 |               40
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |    7 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |    6 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Bench press             |    6 |               50
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Dumbbell row            |   12 |               12
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+Bench press+rows | 2024-06-26 05:30:00 | Lateral raises          |   12 |                5
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Pull ups                |    5 |              -25
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Pull ups                |    5 |              -25
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Pull ups                |    5 |              -25
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Pull ups                |    5 |              -25
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Overhead press          |   10 |               10
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Overhead press          |   10 |               20
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Pullups+OHP              | 2024-06-28 05:30:00 | Overhead press          |    8 |               26
 Tibi   |                          4 | 2024-07-08 | Horizontal push/pull     | 2024-06-09 05:30:00 | Pull ups                |    7 |              -35
 Roxana |                          3 | 2024-07-08 | Cardio workout           | 2024-07-08 09:00:00 |                         |      |                 
 Roxana |                          3 | 2024-07-08 | Pilates workout          | 2024-07-09 09:00:00 |                         |      |                 
 Roxana |                          3 | 2024-07-08 | Pilates workout          | 2024-07-12 09:00:00 |                         |      |                 
 Roxana |                          3 | 2024-07-08 | Cardio workout           | 2024-07-10 09:00:00 |                         |      |                 
(279 rows)

