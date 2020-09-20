select count(*) from SYS.T1 where REGEXP_LIKE(FID, '^[0-9]+$');
