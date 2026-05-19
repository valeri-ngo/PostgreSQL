CREATE FUNCTION fn_is_word_comprised
    (
        set_of_letters VARCHAR(50),
        word VARCHAR(50)
    )
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
    current_index INT := 1;
    current_char VARCHAR(1);
    lower_case_letters VARCHAR(50);
    lower_case_word VARCHAR(50);
    BEGIN
        lower_case_letters := LOWER(set_of_letters);
        lower_case_word := LOWER(word);

        WHILE current_index <= LENGTH(lower_case_word) LOOP
            current_char := SUBSTRING(lower_case_word FROM current_index FOR 1);

            IF current_char BETWEEN 'a' AND 'z' THEN
                IF POSITION(current_char IN lower_case_letters) = 0 THEN
                    RETURN FALSE;
                END IF;
            END IF;

            current_index := current_index + 1;
        
        END LOOP;
        
        RETURN TRUE;
END;$$;


SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
SELECT fn_is_word_comprised('ois tmiah%f', 'Sofia');
SELECT fn_is_word_comprised('bobr', 'Rob');
SELECT fn_is_word_comprised('papopep', 'toe');
SELECT fn_is_word_comprised('R@o!B$B', 'Bob');