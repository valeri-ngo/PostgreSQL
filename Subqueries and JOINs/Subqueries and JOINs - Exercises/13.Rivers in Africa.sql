SELECT
    c.country_name AS country_name,
    r.river_name AS river_name
FROM
    countries AS c
    LEFT JOIN
        countries_rivers AS c_r
        ON
            c.country_code = c_r.country_code
    LEFT JOIN
        rivers AS r
        ON
            c_r.river_id = r.id
    WHERE
        c.continent_code = 'AF'
    ORDER BY
        c.country_name ASC
        LIMIT 5
;