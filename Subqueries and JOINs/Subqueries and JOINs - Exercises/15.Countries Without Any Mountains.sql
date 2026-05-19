SELECT
    COUNT(*) AS countries_without_mountains
FROM
    countries AS c
LEFT JOIN
    mountains_countries AS m_c
    ON
        c.country_code = m_c.country_code
WHERE
    m_c.mountain_id IS NULL
;