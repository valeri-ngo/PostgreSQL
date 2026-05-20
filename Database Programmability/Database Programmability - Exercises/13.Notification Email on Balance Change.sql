CREATE TABLE notification_emails(
    id SERIAL PRIMARY KEY,
    recipient_id INT,
    subject TEXT,
    body TEXT
);

CREATE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO notification_emails(
        recipient_id,
        subject,
        body
    )

    VALUES(
        NEW.account_id,
        CONCAT(
            'Balance change for account: ',
            NEW.account_id
        ),
        CONCAT(
            'On ',
            CURRENT_DATE,
            ' your balance was changed from ',
            NEW.old_sum,
            ' to ',
            NEW.new_sum,
            '.'
        )
    );

    RETURN NEW;
END;
$$;

CREATE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE
ON logs
FOR EACH ROW
WHEN(NEW.old_sum IS DISTINCT FROM NEW.new_sum)
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();