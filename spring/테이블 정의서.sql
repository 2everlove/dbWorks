create table employees1 (
    employe number(6, 0) PRIMARY KEY,
    first_name varchar2(20 byte) not null ,
    last_name varchar2(25 BYTE) not null,
    email varchar2(25 byte),
    phone_number varchar2(20 byte) not null,
    hire_date date default sysdate,
    job_id varchar2(10 byte),
    salary number(8,2) not null,
    commision_pct number(2,2) not null,
    manager_id number(6,0) not null,
    department_id number(4,0) not null,
    CONSTRAINT fk_jobid FOREIGN KEY(job_id) REFERENCES jobs(job_id),
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

select * from employees;