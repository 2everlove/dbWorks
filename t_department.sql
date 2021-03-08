-- copying department table
CREATE TABLE t_department
    AS
        SELECT
            *
        FROM
            departments;
    
--테이블 구조보기
DESC t_department;

-- 테이블 보기
SELECT
    *
FROM
    t_department;

-- 정렬 내림차순(desc), 오름차순(asc)
SELECT
    *
FROM
    t_department
ORDER BY
    department_id DESC;

--자료 삽입
INSERT INTO t_department VALUES (
    271,
    'WORLD_JOB',
    300,
    1800
);

ROLLBACK; --실행 취소(트랜잭션이 취소됨)
COMMIT; -- 수행완료(트랜잭션 완료)

--자료 삭제
DELETE FROM t_department
WHERE
    department_id = 271;

-- 자료 변경(수정)
UPDATE t_department
SET
    manager_id = 300
WHERE 
    department_id = 270;