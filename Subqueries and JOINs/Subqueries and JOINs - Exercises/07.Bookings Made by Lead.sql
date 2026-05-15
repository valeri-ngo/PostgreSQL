SELECT
    b.apartment_id AS apartment_id,
    b.booked_for AS booked_for,
    c.first_name AS first_name,
    c.country AS country
FROM
    bookings AS b
INNER JOIN
    customers AS c
ON 
    b.customer_id = c.customer_id
WHERE
    c.job_type = 'Lead'
;