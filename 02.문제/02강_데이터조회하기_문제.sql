--1. 덧셈 연산을 이용하여 모든 사원에 대하여 $300의 급여 인산을 계산한후 사원의 이름, 급여 인상된 급여출력
SELECT Ename, salary+300 AS "인상된 급여" FROM employee;

--2. 사원의 이름, 급여, 연간 총수입을 총수입이 많은것 부터 작은순으로 출력하세요
SELECT ename,salary,(salary*12+100)as "연간 총수입" FROM employee ORDER BY "연간 총수입" DESC;

--3. 급여가 2000이 넘는 사원의 이름과 급여를 급여가 많은것부터 작은순으로 출력하세요
SELECT ename,salary FROM employee WHERE salary>2000 ORDER BY Salary DESC;

--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하세요
SELECT eno, ename, dno FROM employee WHERE eno IN (7788);

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하세요
 SELECT ename, salary FROM employee WHERE salary Not BETWEEN 2000 And 3000;
 
 --6. 1981년 2월 20일 부터 1981년 5월1일 사이에 입사한 사원의 이름, 담담업무, 입사일을 출력하세요
 SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN '19810220' AND '19810501';
 
 --7. 부서 번호가 20및 30에 속하는 사원의 이름과 부서번호를 출력하되 이름을 내림차순으로 영문자 순으로 출력하세요
 SELECT ename,dno FROM employee WHERE dno IN (20,30) ORDER BY ename DESC;
 
 --8. 사원 급여가 2000에서 3000사이에 포함되고 부서번호가 20또는 30인 사원의 이름과 급여와 부서번호를 출력하되 이름을 오른차순으로 출력하세요
 SELECT ename, salary, dno FROM employee WHERE (salary BETWEEN 2000 AND 3000) AND dno IN(20,30) ORDER BY ename ASC ;
 
 --9. 1981년도에 입사한 사원의 이름과 입사일을 출력하세요(Like 와일드카드)
 SELECT ename, hiredate FROM employee WHERE hiredate LIKE '1981%';
 
 --10. 관리자가 없는 사원의 이름과 담담업무를 출력하세요
 SELECT ename, job FROM employee WHERE manager IS null;
 
 --11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순으로 정렬하여 출력하세요
 SELECT ename, salary, commission FROM employee WHERE job = 'SALESMAN' ORDER BY salary DESC,commission DESC;
 
 --12. 이름의 세번째 문자가 R인 사원을 출력하세요
 SELECT ename FROM employee WHERE ename LIKE '__R%'; 
 
 --13. 이름에 A와 E를 모두 포함하는 사원의 이름을 출력하세요
 SELECT ename FROM employee WHERE ename LIKE '%A%E%' OR ename LIKE '%E%A%';
 
 --14. 담당업무가 사무원(CLERK)또는 영업사원(SALESMAN)이면서 급여가$1600, $950 또는 $1300이 아닌 사원의 이름 담당업무, 급여를 출력하세요
 SELECT ename, job, salary FROM employee WHERE job in('CLERK','SALESMAN') AND salary NOT IN(1600,950,1300); 
 
 --15. 커미션이 $500이상인 사원의 이름과 급여 및 커미션을 출력하세요
 SELECT ename,salary,commission FROM employee WHERE commission>=500;