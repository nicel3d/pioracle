CREATE FUNCTION is_number(p_string IN VARCHAR2)
    RETURN INT
    IS
    v_new_num NUMBER;
BEGIN
    v_new_num := TO_NUMBER(p_string);
    RETURN 1;
EXCEPTION
    WHEN VALUE_ERROR THEN
        RETURN 0;
END is_number;

SELECT FID FROM t1 where is_number(FID) != 0;