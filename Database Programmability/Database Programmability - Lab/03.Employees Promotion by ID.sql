CREATE PROCEDURE sp_increase_salary_by_id(id INT) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE employees AS e
    SET salary = salary * 1.05
    WHERE e.employee_id = id;
END; $$;