DECLARE
    numsConsistent NUMBER := 2000;
    nums           NUMBER := 100000 - numsConsistent;
    nums1          NUMBER := round(nums * 0.01);
    nums2          NUMBER := round(nums * 0.8);
    nums3          NUMBER := round(nums * 0.05);
begin
    for i in 1..numsConsistent
        loop
            insert into SYS.T1(FID) values (dbms_random.STRING('x', i));
        end loop;
    loop
        insert into SYS.T1(FID) values (dbms_random.STRING('x', round(DBMS_RANDOM.VALUE(1, 2000))));
        nums1 := nums1 - 1;
        EXIT WHEN nums1 <= 0;
    end loop;
    loop
        insert into SYS.T1(FID) values (dbms_random.VALUE(0, round(DBMS_RANDOM.VALUE(1, 2000))));
        nums2 := nums2 + 1;
        EXIT WHEN nums2 <= 0;
    end loop;
    loop
        insert into SYS.T1(FID) values ('');
        nums3 := nums3 + 1;
        EXIT WHEN nums3 < 0;
    end loop;
end;