CREATE OR REPLACE FUNCTION where_unique(val IN VARCHAR2)
    RETURN INTEGER IS
BEGIN
    for i in 1..LENGTH(val)
        loop
            IF REGEXP_COUNT(val, SUBSTR(val, i, 1)) > 1 THEN
                RETURN 0;
            end if;
        end loop;
    RETURN 1;
EXCEPTION
    WHEN VALUE_ERROR THEN RETURN 0;
END where_unique;

select FID from SYS.T1 where REGEXP_LIKE(FID, '^[0-9]+$') and where_unique(FID) = 1;

