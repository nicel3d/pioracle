CREATE OR REPLACE FUNCTION gen_number(i IN NUMBER)
    RETURN VARCHAR2 IS
    gluing VARCHAR2(2000);
    len    NUMBER;
BEGIN
    len := length(LPAD('x', i, 'x'));
    gluing := '';
    loop
        gluing := CONCAT(gluing, TO_CHAR(round(dbms_random.VALUE(0, 9))));
        EXIT WHEN length(gluing) >= len;
    end loop;
    RETURN gluing;
EXCEPTION
    WHEN VALUE_ERROR THEN RETURN '';
END gen_number;

DECLARE
    numsConsistent NUMBER := 2000;
    nums           NUMBER := 100000;
    nums1          NUMBER := round((nums * 0.1) - numsConsistent);
    nums2          NUMBER := round(nums * 0.85);
    nums3          NUMBER := round(nums * 0.05);
begin
    for i in 1..numsConsistent
        loop
            insert into SYS.T1(FID) values (gen_number(i));
        end loop;
    loop
        insert into SYS.T1(FID) values (gen_number(round(DBMS_RANDOM.VALUE(1, 2000))));
        nums1 := nums1 - 1;
        EXIT WHEN nums1 <= 0;
    end loop;
    loop
        insert into SYS.T1(FID) values (dbms_random.STRING('x', round(DBMS_RANDOM.VALUE(1, 2000))));
        nums2 := nums2 - 1;
        EXIT WHEN nums2 <= 0;
    end loop;
    loop
        insert into SYS.T1(FID) values ('');
        nums3 := nums3 - 1;
        EXIT WHEN nums3 <= 0;
    end loop;
end;
