--06강. 서브쿼리
-- 최소급여를 받느 사원의 이름, 담당업무, 급여를 출력하세요
SELECT ename, job, salary--메인쿼리
FROM employee
WHERE salary = (SELECT min(salary)
                FROM employee);--서브퀴리

-- 부서별 최소급여가 30번 부서의 최소급여보다 큰 부서의 부서번호와 그때의 최소 급여를 출력해 봅시다(단일행 서브쿼리)
SELECT dno,MIN(salary)
FROM employee
GROUP BY dno
HAVING MIN(salary) > (SELECT MIN(salary)
                      FROM employee
                      WHERE dno=30);

-- 부서별 최소급여를 받는사원 번호와 이름을 출력하는 쿼리문(IN 연산자)
SELECT dno,eno,ename,salary
FROM employee
WHERE salary IN (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);
-------------위아래 같음---------------
SELECT dno,eno,ename,salary
FROM employee
WHERE salary = ANY (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);
                
-- 직급이 SALESMAN이 아니면서급여가 SALESMAN 보다 낮은 사원정보를 출력하세요(ANY 연산자) (salesman중 급여가 가장 많은사람보다 적은급여를 받는사람들)
SELECT * FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';
-------------위아래 같음---------------
SELECT * FROM employee
WHERE salary < (SELECT MAX(salary)
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';


-- 직급이 SALESMAN이 아니면서급여가 SALESMAN 보다 낮은 사원정보를 출력하세요(ALL 연산자) (salesman중 급여가 가장 적은 사람보다 적은급여를 받는사람들)
SELECT * FROM employee
WHERE salary < ALL(SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';
-------------위아래 같음---------------
SELECT * FROM employee
WHERE salary < (SELECT MIN(salary)
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';

------------------------------------------------------------------------------------
--07강. JOIN
SELECT * FROM employee; -- 튜플14개
SELECT * FROM department; -- 튜플4개
--카테시안 곱
SELECT * FROM employee, department; -- 카테시안곱 14x4

--EQUI 조인 = INNER 조인
SELECT * FROM employee, department
WHERE employee.dno = department.dno -- 튜플 14개
AND employee.eno = 7788;
----위아래 같음----
SELECT *
FROM employee INNER JOIN department -- INNER 조인
ON employee.dno = department.dno
WHERE employee.eno = 7788;

SELECT eno,ename,salary,dname,employee.dno --공통된 컬럼은반드시 어디서 가져왔는지 기입x
FROM employee,department
WHERE employee.dno = department.dno
AND empolyee.eno = 7788;

SELECT e.eno,e.ename,e.salary,d.dname,e.dno --별칭을 지정해 벼칭.칼럼 해도된다
FROM employee e,department d
WHERE e.dno = d.dno
AND e.eno = 7788;

--NATURAL 조인: 두테이블의 컬럼을 자동조사해 같은 두 컬럼을 기준으로 조합
SELECT e.eno,e.ename,e.salary,d.dname,dno -- 공통된 칼럼을 어디서가져왔는지 표시 x
FROM employee e NATURAL JOIN department d-- INNER 조인
WHERE e.eno = 7788;

--join using: 
SELECT *
FROM employee  JOIN department -- INNER 조인
USING (dno)
WHERE employee.eno = 7788;

--NON EQUI조인
SELECT e.ename, e.salary, s.grade  -- 정확히 일치x a와 b 값 사이에만 있다면
FROM employee e, salgrade s
WHERE e.salary BETWEEN losal AND hisal;
----위와 아래 같음-------
SELECT e.ename, e.salary, s.grade  -- 정확히 일치x a와 b 값 사이에만 있다면
FROM employee e, salgrade s
WHERE s.losal <= e.salary AND e.salary <= s.hisal;

--3중 조인
--사원이름과 소속부서이름, 급여와 급여등급 출력하세요
SELECT e.ename, d.dname, e.salary, s.grade
FROM employee e, department d, salgrade s
WHERE e.dno = d.dno
AND e.salary BETWEEN s.losal AND s.hisal;

--SELF 조인
-- 사원이름과 담당 매니저의 이름을 출력하세요
SELECT emp.ename AS "사원명", manager.ename AS "상관명"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno;

--outer 조인
-- 사원이름과 담당 매니저의 이름을 출력하세요(단 상관번호가 없는 경우도 출력)
--오라클전용방식
SELECT emp.ename AS "사원명", manager.ename AS "상관명"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno(+);
--표준 ANSI 방식
SELECT emp.ename AS "사원명", manager.ename AS "상관명"
FROM employee emp LEFT OUTER JOIN employee manager
ON emp.manager = manager.eno;