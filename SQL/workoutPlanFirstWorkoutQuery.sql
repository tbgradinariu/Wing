explain analyze
select 
	workout_plans.id, 
	workout_plans.user_id, 
	workout_plans.name, 
	workout_plans.start_date,
	workout_plans.end_date,
	s
	w11.name as first_workout_main_exercise_name,
	w12.name as first_workout_secondary_exercise_name,
	w13.name as first_workout_third_exercise_name,
	w14.name as first_workout_fourth_exercise_name,
	w15.name as first_workout_fifth_exercise_name,

	w21.name as second_workout_main_exercise_name,
	w22.name as second_workout_secondary_exercise_name,
	w23.name as second_workout_third_exercise_name,
	w24.name as second_workout_fourth_exercise_name,
	w25.name as second_workout_fifth_exercise_name,

	w31.name as third_workout_main_exercise_name,
	w32.name as third_workout_secondary_exercise_name,
	w33.name as third_workout_third_exercise_name,
	w34.name as third_workout_fourth_exercise_name,
	w35.name as third_workout_fifth_exercise_name,

	w41.name as fourth_workout_main_exercise_name,
	w42.name as fourth_workout_secondary_exercise_name,
	w43.name as fourth_workout_third_exercise_name,
	w44.name as fourth_workout_fourth_exercise_name,
	w45.name as fourth_workout_fifth_exercise_name,

	w51.name as fifth_workout_main_exercise_name,
	w52.name as fifth_workout_secondary_exercise_name,
	w53.name as fifth_workout_third_exercise_name,
	w54.name as fifth_workout_fourth_exercise_name,
	w55.name as fifth_workout_fifth_exercise_name,

	w61.name as sixth_workout_main_exercise_name,
	w62.name as sixth_workout_secondary_exercise_name,
	w63.name as sixth_workout_third_exercise_name,
	w64.name as sixth_workout_fourth_exercise_name,
	w65.name as sixth_workout_fifth_exercise_name,

	w71.name as seventh_workout_main_exercise_name,
	w72.name as seventh_workout_secondary_exercise_name,
	w73.name as seventh_workout_third_exercise_name,
	w74.name as seventh_workout_fourth_exercise_name,
	w75.name as seventh_workout_fifth_exercise_name
from workout_plans

left join workout_templates w1 on w1.id = workout_plans.first_workout_id
left join exercise_templates w11 on w11.id = w1.main_exercise_id
left join exercise_templates w12 on w12.id = w1.secondary_exercise_id
left join exercise_templates w13 on w13.id = w1.auxiliary_exercise_id
left join exercise_templates w14 on w14.id = w1.auxiliary_exercise_id_2
left join exercise_templates w15 on w15.id = w1.auxiliary_exercise_id_3

left join workout_templates w2 on w2.id = workout_plans.second_workout_id
left join exercise_templates w21 on w21.id = w2.main_exercise_id
left join exercise_templates w22 on w22.id = w2.secondary_exercise_id
left join exercise_templates w23 on w23.id = w2.auxiliary_exercise_id
left join exercise_templates w24 on w24.id = w2.auxiliary_exercise_id_2
left join exercise_templates w25 on w25.id = w2.auxiliary_exercise_id_3

left join workout_templates w3 on w3.id = workout_plans.third_workout_id
left join exercise_templates w31 on w31.id = w3.main_exercise_id
left join exercise_templates w32 on w32.id = w3.secondary_exercise_id
left join exercise_templates w33 on w33.id = w3.auxiliary_exercise_id
left join exercise_templates w34 on w34.id = w3.auxiliary_exercise_id_2
left join exercise_templates w35 on w35.id = w3.auxiliary_exercise_id_3

left join workout_templates w4 on w4.id = workout_plans.fourth_workout_id
left join exercise_templates w41 on w41.id = w4.main_exercise_id
left join exercise_templates w42 on w42.id = w4.secondary_exercise_id
left join exercise_templates w43 on w43.id = w4.auxiliary_exercise_id
left join exercise_templates w44 on w44.id = w4.auxiliary_exercise_id_2
left join exercise_templates w45 on w45.id = w4.auxiliary_exercise_id_3

left join workout_templates w5 on w5.id = workout_plans.fifth_workout_id
left join exercise_templates w51 on w51.id = w5.main_exercise_id
left join exercise_templates w52 on w52.id = w5.secondary_exercise_id
left join exercise_templates w53 on w53.id = w5.auxiliary_exercise_id
left join exercise_templates w54 on w54.id = w5.auxiliary_exercise_id_2
left join exercise_templates w55 on w55.id = w5.auxiliary_exercise_id_3

left join workout_templates w6 on w6.id = workout_plans.sixth_workout_id
left join exercise_templates w61 on w61.id = w6.main_exercise_id
left join exercise_templates w62 on w62.id = w6.secondary_exercise_id
left join exercise_templates w63 on w63.id = w6.auxiliary_exercise_id
left join exercise_templates w64 on w64.id = w6.auxiliary_exercise_id_2
left join exercise_templates w65 on w65.id = w6.auxiliary_exercise_id_3

left join workout_templates w7 on w7.id = workout_plans.seventh_workout_id
left join exercise_templates w71 on w71.id = w7.main_exercise_id
left join exercise_templates w72 on w72.id = w7.secondary_exercise_id
left join exercise_templates w73 on w73.id = w7.auxiliary_exercise_id
left join exercise_templates w74 on w74.id = w7.auxiliary_exercise_id_2
left join exercise_templates w75 on w75.id = w7.auxiliary_exercise_id_3