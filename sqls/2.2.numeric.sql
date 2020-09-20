SELECT count(*)
FROM SYS.T1
where fid is not null and REGEXP_REPLACE(fid, '[0-9]+', '') is null;
