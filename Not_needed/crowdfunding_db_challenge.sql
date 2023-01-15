SELECT * FROM campaign;
SELECT * FROM email_contacts_remaining_goal_amount;

SELECT cf_id,
backers_count
FROM campaign
WHERE (outcome = 'live')
ORDER BY backers_count DESC;

SELECT cf_id, COUNT(backer_id)
FROM backers
GROUP BY cf_id
ORDER BY count DESC;

SELECT co.first_name, 
	co.last_name, 
	co.email,
	(c.goal - c.pledged) AS remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM contacts AS co
LEFT JOIN campaign AS c
ON (co.contact_id = c.contact_id)
WHERE (outcome = 'live')
ORDER BY remaining_goal_amount DESC;

SELECT b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	c.company_name,
	c.description,
	c.end_date,
	(c.goal - c.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS b
LEFT JOIN campaign AS c
ON (b.cf_id = c.cf_id)
WHERE (outcome = 'live')
ORDER BY b.last_name;


