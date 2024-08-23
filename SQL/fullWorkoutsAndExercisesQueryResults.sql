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

