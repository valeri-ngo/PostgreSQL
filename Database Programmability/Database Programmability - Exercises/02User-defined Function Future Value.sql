CREATE OR REPLACE FUNCTION fn_calculate_future_value (
    initial_sum INT,
    yearly_interest_rate NUMERIC,
    number_of_years INT
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    future_value NUMERIC;
BEGIN
    future_value := TRUNC(initial_sum * POWER(1 + yearly_interest_rate, number_of_years),4);

    RETURN
        future_value;
END;
$$;

SELECT fn_calculate_future_value (1000, 0.1, 5);
SELECT fn_calculate_future_value(2500, 0.30, 2);
SELECT fn_calculate_future_value(500, 0.25, 10);
