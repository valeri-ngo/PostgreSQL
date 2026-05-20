CREATE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE(
    total_cash NUMERIC
)
AS $$
BEGIN
    RETURN QUERY
    SELECT ROUND(SUM(r.cash), 2) AS total_cash
    FROM (
        SELECT
            ug.cash,
            ROW_NUMBER() OVER (ORDER BY ug.cash DESC) AS row_num
        FROM users_games AS ug
        JOIN games AS g
            ON g.id = ug.game_id
        WHERE g.name = game_name
    ) AS r
    WHERE r.row_num % 2 = 1;
END;
$$ LANGUAGE plpgsql;

SELECT fn_cash_in_users_games('Love in a mist');
SELECT fn_cash_in_users_games('Delphinium Pacific Giant');