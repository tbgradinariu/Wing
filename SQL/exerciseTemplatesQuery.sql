select 
	exercise_templates.name, 
	exercise_types.name as exercise_type, 
	m1.name as main_muscle_group,
	m2.name as secondary_muscle_group,
	m3.name as third_muscle_group,
	m4.name as fourth_muscle_group,
	m5.name as fifth_muscle_group
from exercise_templates
left join exercise_types on exercise_types.id = exercise_templates.exercise_type_id
left join muscle_groups m1 on m1.id = exercise_templates.muscle_group_id
left join muscle_groups m2 on m2.id = exercise_templates.secondary_muscle_group_id
left join muscle_groups m3 on m3.id = exercise_templates.third_muscle_group_id
left join muscle_groups m4 on m4.id = exercise_templates.fourth_muscle_group_id
left join muscle_groups m5 on m5.id = exercise_templates.fifth_muscle_group_id;