select 
	workout_plans.name, 
	workout_plans.start_date, 
	workout_plans.end_date, 
	workout_template_to_workout_plan.workout_template_id, 
	workout_template_to_workout_plan.day_of_week,
	exercise_templates.exercise_type_id,
	exercise_templates.name
from workout_plans
    join workout_template_to_workout_plan on workout_plans.id = workout_template_to_workout_plan.workout_plan_id
    join exercise_template_to_workout_template on workout_template_to_workout_plan.workout_template_id = exercise_template_to_workout_template.workout_template_id
    join exercise_templates on exercise_templates.id = exercise_template_to_workout_template.exercise_template_id;