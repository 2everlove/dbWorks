show parameter sec_case; --대문자 설정인지 체크
alter SYSTEM set sec_case_sensitive_logon = false; -- true면 false로
SELECT * FROM dba_users WHERE username = 'spring'; --접속 name 중복 체크
create user spring IDENTIFIED by spring; --없으므로 spring 생성
grant CONNECT, resource, dba to spring; -- 권한 주고 접속 실행