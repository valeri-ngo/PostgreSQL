CREATE PROCEDURE sp_deposit_money(
    account_id INT,
    money_amount NUMERIC(19, 4)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts
    SET balance = balance + sp_deposit_money.money_amount
    WHERE id = sp_deposit_money.account_id;

    COMMIT;
END;
$$;