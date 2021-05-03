--01강. 데이터베이스 개요와 집합체 ~ 02강. 데이터조회하기 ~ 03강. 데이터 자료형
DESC employee

SELECT sysdate FROM dual;

SELECT * FROM employee;

SELECT * FROM department;

SELECT eno,ename,salary*12+NVL(commission,0)  "연   봉" FROM employee;

SELECT DISTINCT eno, dno FROM employee;

SELECT eno,ename FROM employee WHERE salary>=1500;

SELECT eno,ename,salary FROM employee WHERE ename='SCOTT';

SELECT eno,ename,salary,hiredate FROM employee WHERE hiredate<'19810501';

SELECT * FROM employee WHERE dno=10 AND job = 'MANAGER';

SELECT * FROM employee WHERE dno=10 OR job = 'MANAGER';

SELECT * FROM employee WHERE NOT dno=10;

SELECT * FROM employee WHERE dno<>10;

SELECT * FROM employee WHERE salary>=1000 AND  salary<=1500;

SELECT * FROM employee WHERE salary<1000 OR salary>1500;
--커미션이 300 500 1400인 사원의 정보를 조회하는 예
SELECT * FROM employee WHERE commission= 300 OR commission= 500 OR commission= 1400;

SELECT * FROM employee WHERE salary NOT BETWEEN 1000 AND 1500;

SELECT * FROM employee WHERE hiredate BETWEEN '19820101' AND '19821231';

SELECT * FROM employee WHERE commission IN (300,500,1400);

SELECT * FROM employee WHERE ename LIKE 'F%'; -- 이름 첫글자가 F인 사람

SELECT * FROM employee WHERE ename LIKE '%M%'; -- 이름에 M가 들어가는 사람

SELECT * FROM employee WHERE ename LIKE '%N'; --이름의 끝이 N인 사람

SELECT * FROM employee WHERE ename LIKE '__A%'; -- 이름에 세번째 글자가 A인 사람

SELECT * FROM employee WHERE commission = null; -- 결과 x

SELECT * FROM employee WHERE commission IS NULL; --결과 O

SELECT * FROM employee WHERE commission IS NOT null ORDER BY ename DESC; -- 이름을 내림차순

SELECT * FROM employee WHERE commission IS NOT null ORDER BY ename ASC; -- 이름을 오름

SELECT * FROM employee
ORDER BY salary DESC, ename ASC; -- 급여 내림차순 같은급여가 있으면 이름을 오름차순으로 정렬

SELECT to_char(sysdate,'YYYY/ MM/ DD/ DAY HH24: MI:SS') FROM dual;

SELECT ename, hiredate, TO_CHAR(hiredate,'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY')
FROM employee;

SELECT ename, to_char(salary, 'L999,999') FROM employee;

SELECT ename, hiredate FROM employee
WHERE hiredate = to_date(19810220);

SELECT to_number('100,000','999,999') - to_number('50,000','999,999') FROM dual;
 