CREATE VIEW continent_currency_usage AS
WITH currency_counts AS (
    SELECT
        continent_code,
        currency_code,
        COUNT(currency_code) AS currency_usage
    FROM countries
    GROUP BY
        continent_code,
        currency_code
    HAVING COUNT(currency_code) > 1
),
ranked_currency_counts AS (
    SELECT
        continent_code,
        currency_code,
        currency_usage,
        DENSE_RANK() OVER (
            PARTITION BY continent_code
            ORDER BY currency_usage DESC
        ) AS currency_rank
    FROM currency_counts
)
SELECT
    continent_code,
    currency_code,
    currency_usage
FROM ranked_currency_counts
WHERE currency_rank = 1
ORDER BY currency_usage DESC;