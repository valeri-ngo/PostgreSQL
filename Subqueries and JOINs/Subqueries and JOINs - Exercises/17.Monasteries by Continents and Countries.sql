UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries (monastery_name, country_code)
VALUES
    ('Hanga Abbey', 'TZ');

SELECT
    ct.continent_name,
    c.country_name,
    COUNT(m.id) AS monastery_count
FROM continents AS ct
LEFT JOIN countries AS c USING (continent_code)
LEFT JOIN monasteries AS m USING (country_code)
WHERE c.three_rivers IS NOT true
GROUP BY
    ct.continent_name,
    c.country_name
ORDER BY
    monastery_count DESC,
    c.country_name ASC;