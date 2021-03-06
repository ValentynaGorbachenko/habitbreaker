select * from habits;
select * from users;
select * from violations;
select * from helpers;

SELECT * FROM habits WHERE holder_id = 1;
DELETE FROM habits WHERE id = 9;

INSERT INTO `habitbreakerdb`.`violations` (`created_at`, `updated_at`, `habit_id`, `helper_id`) VALUES (NOW(), NOW(), '1', 2);
select * from helpers;
INSERT INTO `habitbreakerdb`.`helpers` (`created_at`, `updated_at`, `habit_id`, `helper_id`) VALUES (NOW(), NOW(), 1, 3);

SELECT * FROM habits WHERE id = 1;

SELECT * FROM violations WHERE habit_id IN(
	SELECT habit_id 
    FROM violations
    WHERE habit_id = 1
) ;


SELECT * FROM users
WHERE users.id NOT IN (
	SELECT follower_id
    FROM follows
    WHERE followed_id =2
) AND users.id !=2;

SELECT COUNT(violations.habit_id) as count FROM violations;
# show_habit page
SELECT * FROM violations 
LEFT JOIN users ON users.id = violations.helper_id
LEFT JOIN habits ON habits.id = violations.habit_id
WHERE habit_id = 1;

SELECT violations.created_at as viol_date, violations.id as viol_id, concat(users.first_name, ' ', users.last_name) as helper_name, violations.helper_id, users.email as helper_email, habits.amount as amount, habits.habit_name as habit_name, habits.created_at as habit_date, habits.id as habit_id  FROM violations  LEFT JOIN users ON users.id = violations.helper_id LEFT JOIN habits ON habits.id = violations.habit_id WHERE habit_id = 1;

SELECT * FROM helpers
LEFT JOIN users ON helper_id = users.id
LEFT JOIN habits ON habit_id = habits.id
#LEFT JOIN violations ON helpers.id = violations.habit_id
WHERE habit_id = 1;

# all helpers by habit_id
SELECT users.id as helper_id, concat(users.first_name, ' ', users.last_name) as helper_name , users.email as helper_email  FROM users 
WHERE users.id in (
	SELECT helpers.helper_id FROM helpers
    WHERE habit_id = 1
);
# all violation by habit_id
SELECT violations.created_at as viol_date, violations.id as viol_id, concat(users.first_name, ' ', users.last_name) as helper_name, violations.helper_id, users.email as helper_email, habits.amount as amount, habits.habit_name as habit_name, habits.created_at as habit_date, habits.id as habit_id  FROM violations  LEFT JOIN users ON users.id = violations.helper_id LEFT JOIN habits ON habits.id = violations.habit_id WHERE habit_id = 1;
select * from helpers;


SELECT habits.id, habits.habit_name, habits.holder_id, habits.amount, users.first_name FROM habits
LEFT JOIN users ON users.id = habits.holder_id
LEFT JOIN helpers ON habits.id = helpers.habit_id
WHERE helpers.helper_id = 1;



