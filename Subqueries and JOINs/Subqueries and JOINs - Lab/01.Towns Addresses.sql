SELECT
	t.town_id,
	t.name AS town_name,
	a.address_text
FROM towns as t
JOIN addresses as a
	ON a.town_id = t.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY town_id, address_id
;