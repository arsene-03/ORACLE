--1. 사원번호가 7788인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무) 하세요
SELECT ename,job
FROM employee
WHERE job = (SELECT job
             FROM employee
             WHERE eno = 7788);

--2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당업무)하세요
SELECT ename,job,salary
FROM employee
WHERE salary >  (SELECT salary
                 FROM employee
                 WHERE eno = 7499);
                    
--3. 최소 급여를 받는 사원의 이름, 담당업무 및 급여를 표시하세요(그룹함수)
SELECT ename, job, salary
FROM employee
WHERE salary = (SELECT MIN(salary)
                 FROM employee);
                

--4. 평균 급여가 가장 적은 업무를 찿아 직급과 평균 급여를 표시하세요
SELECT job,AVG(salary)
FROM employee
GROUP BY job
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                        FROM employee
                        GROUP BY job);

--5. 각 부서의 최소급여를받는 사원 이름,급여, 부서번호를표시하세요.
SELECT ename,salary,dno
FROM employee
WHERE salary IN (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);
                
--6. 담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가(ANALYST)아닌사원(사원번호, 이름, 담당업무,급여)들을 표시하세요                
SELECT eno,ename,job,salary
FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE job = 'ANALYST')
AND job NOT IN 'ANALYST';

--7. 매니저 없는 사원의 이름을 표시하세요
SELECT ename
FROM employee
WHERE NVL(manager,0) =0;

--8. 매니저 있는 사원의 이름을 표시하세요
SELECT ename
FROM employee
WHERE NVL(manager,0)<>0;

--9. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는질의를 작성하세요.(단BLAKE는제외)
SELECT ename,hiredate
FROM employee
WHERE job =ALL (SELECT job
                FROM employee
                WHERE ename = 'BLAKE')
AND ename != 'BLAKE';

--10. 급여가 평균보다많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대한 오름차순으로 정렬하세요
SELECT eno,ename,salary
FROM employee
WHERE salary >ANY (SELECT avg(salary)
                    FROM employee)
ORDER BY salary asc;

--11. 이름에K가 포함된 사원과 같은 부서에서일하는 사원의 사원번호와이름을 표시하는질의를 작성하세요.
SELECT eno,ename
FROM employee
WHERE dno IN (SELECT dno
                FROM employee
                WHERE ename LIKE '%K%');
                
--12. 부서위치가DALLAS인 사원의 이름과 부서번호 및 담당업무를표시하세요.
SELECT ename,dno,job
FROM employee
WHERE dno IN (SELECT dno
                FROM department
                WHERE loc = 'DALLAS');
                
SELECT e.ename, e.dno , e.job
FROM employee e, department d
WHERE e.dno = d.dno
AND d.loc = 'DALLAS';
--13. KING에게 보고하는사원의 이름과 급여를 표시하세요
SELECT ename,salary
FROM employee
WHERE manager IN (SELECT eno
                    FROM employee
                    WHERE ename='KING');
                    
--14. RESEARCH 부서의 사원에 대한 부서번호, 사원번호 및 담당업무를출력하세요
SELECT dno,eno,job
FROM employee
WHERE dno IN (SELECT dno
                FROM department
                WHERE dname = 'RESEARCH');
                
--15. 평균 급여보다많은 급여를 받고 이름에서 M이 포함된 사원과 같은 부서에서 근무하는사원의사원번호, 이름, 급여를 출력하세요
SELECT eno,ename,salary
FROM employee
WHERE salary >  (SELECT avg(salary)
                FROM employee)
AND dno = ANY(SELECT dno
            FROM employee
            WHERE ename LIKE '%M%');

                
--16. 평균 급여가 가장 적은 업무를 찾으세요
SELECT job,avg(salary)
FROM employee
GROUP BY job
HAVING avg(salary) IN (SELECT MIN(AVG(salary))
                        FROM employee
                        GROUP BY job);
                        

--17. 부하직원을가진 사원의 사원번호와이름을 출력하세요
SELECT eno,ename
FROM employee
WHERE eno IN (SELECT manager
                    FROM employee
                    WHERE manager IS NOT NULL);



                


SELECT AVG(SALAry)
fROM employee;
SELECT * FROM employee;
SELECT * FROM department;