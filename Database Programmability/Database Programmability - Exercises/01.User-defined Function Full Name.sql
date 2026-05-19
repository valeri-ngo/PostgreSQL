CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR(20), last_name VARCHAR(20))
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
BEGIN
    IF first_name IS NULL AND last_name IS NULL THEN
        RETURN NULL;

    ELSIF first_name IS NULL THEN
        RETURN INITCAP(last_name);
    ELSIF last_name IS NULL THEN
        RETURN INITCAP(first_name);
    ELSE
        RETURN INITCAP(first_name || ' ' || last_name);
    END IF;
END; $$;

SELECT fn_full_name('fred', 'sanford');
SELECT fn_full_name('', 'SIMPSONS');
SELECT fn_full_name('JOHN', '');
SELECT fn_full_name(NULL, NULL);