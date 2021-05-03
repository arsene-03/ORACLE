--1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균급여를 출력하세요. 
--   칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고평균에대해서는정수로 반올림 하세요
SELECT MAX(salary)AS "최고액(Maximun)",
       MIN(salary)AS "최저액(Minimun)",
       SUM(salary)AS "총액(Sum)",
       ROUND(AVG(salary),0)AS "평균 급여(Average)"
FROM employee;

--2. 각 담당업무유형별로 급여 최고액, 최저액, 총액 및 평균액을출력하세요. 
--   칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고평균에 대해서는 정수로 반올림 하세요
SELECT job AS "업무유형",
       MAX(salary)AS "최고액(Maximun)",
       MIN(salary)AS "최저액(Minimun)",
       SUM(salary)AS "총액(Sum)",
       ROUND(AVG(salary),0)AS "평균 급여(Average)"
FROM employee
GROUP BY job;

--3. Count(*)함수를이용해서담당업무가동일한 사원의 수를 출력하세요
SELECT job,count(dno)AS "사원수"
FROM employee
GROUP BY job;

--4. 관리자의수를 나열하세요. 칼럼의 별칭은COUNT(MANAGER)로출력하세요.
SELECT COUNT(DISTINCT MANAGER)AS "COUNT(MANAGER)"
FROM employee;

--5. 급여 최고액, 급여 최저액의차액을 출력하세요. 칼럼의 별칭DIFFERENCE로 지정하세요
SELECT MAX(salary)AS"급여 최고액",MIN(salary)AS"급여 최저액",MAX(salary)-MIN(salary)AS"DIFFERENCE"
FROM employee;

--6. 직급별 사원의 최저 급여를 출력하세요. 관리자를 알 수 없는 사원 및 최저 급여가2000미만인 그룹은 제외시키고급여에 대한 내림차순으로정렬하여 출력하세요.
SELECT job,MIN(salary)
FROM employee
WHERE MANAGER IS NOT NULL
GROUP BY job
HAVING MIN(salary)>=2000
ORDER BY MIN(salary) DESC;

--7. 각 부서에 대해 부서번호, 사원수, 부서내의모든 사원의 평균급여를출력하시오
--   칼럼의 별칭은부서번호(DNO), 사원수(Numberof PeoPle), 평균급여(Salary)로 지정하고
--   평균급여는소수점2째자리에서반올림 하세요
SELECT dno AS"부서번호(DNO)",
       COUNT(*) AS"사원수(Numberof PeoPle)",
       ROUND(avg(salary),2) AS "평균급여(Salary)"
FROM employee
GROUP BY dno;

--8. 각 부서에 대해 부서번호이름, 지역명, 사원수, 부서내의모든 사원의 평균 급여를 출력하시오. 
--   칼럼의 별칭은 부서번호이름(DName), 지역명(Location), 사원수(Numberof PeoPle), 평균급여(Salary)로 지정하고 평균급여는정수로 반올림하세요.
SELECT 
d.dname AS"부서번호이름(DName)",
d.loc AS"지역명(Location)",
COUNT(e.eno) AS"사원수(Numberof PeoPle)",
ROUND(AVG(e.salary),0) AS"평균급여(Salary)"
FROM employee e,department d
WHERE e.dno = d.dno
GROUP BY d.dname,d.loc;



--9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서10,20,30의 급여 총액을 각각 출력하시오. 
--   각 칼럼의 별칭은 각각job, 부서10,부서20, 부서30, 총액으로 지정하세요.
SELECT 
CASE WHEN dno = 10 THEN '부서10'
     WHEN dno = 20 THEN '부서20'
     WHEN dno = 30 THEN '부서30'
     END AS job,
sum(salary)AS "부서별 급여"
FROM employee 
GROUP BY dno
ORDER BY dno asc;


SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM SALGRADE;