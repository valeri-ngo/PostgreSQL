CREATE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR(30)
AS $$
BEGIN
    RETURN CASE
        WHEN level <= 40 THEN 'Normal Difficulty'
        WHEN level BETWEEN 41 AND 60 THEN 'Nightmare Difficulty'
        ELSE 'Hell Difficulty'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT
    user_id,
    level,
    cash,
    fn_difficulty_level(u_g.level) AS difficulty_level
FROM users_games AS u_g
ORDER BY u_g.user_id ASC;