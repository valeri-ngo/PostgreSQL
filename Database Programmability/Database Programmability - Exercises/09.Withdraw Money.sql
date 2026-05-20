CREATE PROCEDURE sp_withdraw_money(
    account_id INT,
    money_amount NUMERIC(19, 4)
)
LANGUAGE plpgsql
AS $$
DECLARE current_balance NUMERIC(19, 4);
BEGIN
    SELECT balance INTO current_balance
    FROM accounts AS a
    WHERE a.id = sp_withdraw_money.account_id;

    IF current_balance IS NULL OR current_balance < sp_withdraw_money.money_amount THEN
        ROLLBACK;
    ELSE
        UPDATE accounts AS a
        SET balance = balance - sp_withdraw_money.money_amount
        WHERE a.id = sp_withdraw_money.account_id;
        
        COMMIT;
    END IF;
END;
$$;