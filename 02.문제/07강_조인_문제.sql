--1. Equi조인을 사용하여SCOTT 사원의 부서번호와 부서이름을 출력하세요
SELECT e.ename, d.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno
AND e.ename = 'SCOTT';

--2. Inner 조인과on연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과지역명을출력하세요.
SELECT e.ename, d.dname, d.loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno;

--3. INNER 조인Using 연산자를사용하여10번 부서에 속하는 모든 담당업무의고유 목록을 부서의지역명을포함하여출력하세요.
SELECT e.job,d.loc
FROM employee e INNER JOIN department d
USING (dno)
WHERE dno = '10';

--4. Natural조인을 사용하여커미션을받는 모든 사원의 이름, 부서이름, 지역명을출력하세요
SELECT ename,dname,loc
FROM employee NATURAL JOIN department
WHERE job = 'SALESMAN';

--5. Equal 조인과Wild카드를 사용해서이름에A가포함된 모든 사원의 이름과 부서명을출력하세요.
SELECT e.ename,d.dname
FROM employee e,department d
WHERE e.dno = d.dno
AND e.ename LIKE '%A%';

--6. Natural 조인을 사용하여NEW York에 근무하는모든 사원의 이름, 업무 부서번호및 부서명을출력하세요.
SELECT e.ename, e.job, dno, d.dname, d.loc
FROM employee e NATURAL JOIN department d
WHERE d.loc = 'NEW YORK';

--7. Self Join을 사용하여사원의 이름및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요. 
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)
SELECT emp.ename AS "사원이름(Employee)",emp.eno AS "사원번호(emp#)",
       man.ename AS "관리자이름(Manager)",man.eno AS "관리자번호(Mgr#)"
FROM employee emp, employee man
WHERE emp.manager = man.eno;

--8. Outter조인self 조인을 사용하여관리자가없는 사원을 포함하여사원번호를기준으로내림차순 정렬하여클릭하세요
--각 열의 별칭은 사원이름(Employee)사원번호(emp#)관리자이름(Manager)관리자번호(Mgr#)
SELECT emp.ename AS "사원이름(Employee)",emp.eno AS "사원번호(emp#)",
       man.ename AS "관리자이름(Manager)",man.eno AS "관리자번호(Mgr#)"
FROM employee emp, employee man
WHERE emp.manager = man.eno(+)
ORDER BY emp.eno DESC;

--9. Self조인을 사용하여 지정한 사원(SCOTT)의 이름, 부서번호, 지정한 사원과 동일한 부서에서근무하는 사원을 출력하세요
--각 열의 별칭은 이름, 부서번호, 동료로 지정하세요
SELECT emp.ename AS "이름", emp.dno AS"부서번호",coo.ename AS"동료"
FROM employee emp, employee coo
WHERE emp.ename = 'SCOTT'
AND emp.dno = coo.dno
AND coo.ename <> 'SCOTT';


--10. Self 조인을 사용하여WARD 사원보다늦게 입사한 사원의 이름과 입사일을출력하세요.
SELECT ward.hiredate AS"WARD의 입사일",aft.ename AS"후배 이름",aft.hiredate AS"후배 입사일"
FROM employee ward, employee aft
WHERE ward.ename = 'WARD' 
AND ward.hiredate < aft.hiredate;

--11. Self조인을 사용하여관리자보다먼저 입사한모든 사원의 이름 및 입사일을관리자의이름 및입사입과함께 출력하세요. 
--각 열의 별칭은 사원이름(Ename) 사원입사일(HIERDATE) 관리자 이름(Ename) 관리자 입사입(HIERDATE)로 출력하세요.
SELECT s.ename AS"사원이름(Ename)",
       s.hiredate AS"사원입사일(HIERDATE)",
       m.ename AS"관리자 이름(Ename)",
       m.hiredate AS"관리자 입사입(HIERDATE)"
FROM employee s, employee m
WHERE m.eno = s.manager
AND s.hiredate < m.hiredate;