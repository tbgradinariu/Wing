select 
	count(workouts.id)
from workouts
	join workout_template_to_workout_plan on workouts.workout_template_id = workout_template_to_workout_plan.workout_template_id
where workout_template_to_workout_plan.workout_plan_id = 1;