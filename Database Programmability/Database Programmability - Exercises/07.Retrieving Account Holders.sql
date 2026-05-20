CREATE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
    searched_balance NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE holder RECORD;
BEGIN
    FOR holder IN
        SELECT
            a_h.first_name,
            a_h.last_name,
            SUM(a.balance) AS total_balance
        FROM account_holders AS a_h
        JOIN accounts AS a
            ON a.account_holder_id = a_h.id
        GROUP BY a_h.id, a_h.first_name, a_h.last_name
        HAVING
            SUM(a.balance) >= searched_balance
        ORDER BY
            a_h.first_name, a_h.last_name
    LOOP
        RAISE NOTICE '% % - %',
        holder.first_name,
        holder.last_name,
        holder.total_balance;
    END LOOP;
END;
$$;

CALL sp_retrieving_holders_with_balance_higher_than(20000);
