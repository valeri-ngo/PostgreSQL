SELECT
    b.booking_id AS booking_id,
    b.apartment_id AS apartment_id,
    c.companion_full_name AS companion_full_name
FROM
    bookings AS b
JOIN
    customers AS c
ON
    b.customer_id = c.customer_id
WHERE b.apartment_id IS NULL
;