SELECT
    m_c.country_code AS country_code,
    m.mountain_range AS mountain_range,
    p.peak_name AS peak_name,
    p.elevation AS elevation
FROM
    mountains AS m
    JOIN
        mountains_countries AS m_c
        ON
            m.id = m_c.mountain_id
    JOIN
        peaks AS p
        ON
            m_c.mountain_id = p.mountain_id
    WHERE
        p.elevation > 2835
        AND
        m_c.country_code = 'BG'
    ORDER BY
        p.elevation DESC
;