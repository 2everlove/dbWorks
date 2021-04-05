SELECT * FROM v$resource_limit WHERE resource_name IN ('processes','sessions');

ALTER SYSTEM SET processes = 300 scope=spfile;

commit; -- 이후 services.msc -> oracleservicexe 다시시작해야 set값 적용됨

show parameters processes;