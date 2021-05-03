--1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하세요
SELECT SUBSTR(hiredate,0,4)AS "입사년도",SUBSTR(hiredate,6,2)AS "입사한 달"
FROM employee;

--2. SUBSTR 함수를 사용하여4월에 입사한 사원을출력하세요
SELECT *
FROM employee
WHERE SUBSTR(hiredate,6,2)='04';

--3. MOD 함수를 사용하여사`원번호가짝수인 사람만 출력하세요
SELECT *
FROM employee
WHERE MOD(eno,2) = 0;


--4. 입사일을 연도는2자리(YY), 월은 숫자(MON)로표시하고요일은 약어(DY)로 지정하여출력하세요.
SELECT TO_CHAR(hiredate, 'YY/MM/MON/DD/DY')
FROM employee;

--5. 올해 며칠이 지났는지출력하세요. 현재 날짜에서 올해1월1일을 뺀 결과를 출력하고TO_DATE 함수를 사용하여데이터 형을 일치시키시오
SELECT ROUND(SYSDATE - TO_DATE('2021/01/01','YY/MM/DD'),1)
FROM dual;

--6. 사원들의상관 사번을 출력하되상관이 없는 사원에 대해서는NULL 대신에0을 출력하세요
SELECT ename, NVL2(manager,manager,0)AS"상사번호"
FROM employee;

--7. DECODE 함수로 직급에 따라 급여를 인상하도록 하세요. 직급이'ANAIYST'인 사원은200, 'SALESMAN'인 사원은180, 'MANAGER'인 사원은150,'CLERK'인 사원은100을 인상하세요
SELECT ename,job,salary AS "원래월급",
DECODE(job, 'ANALYST', salary+200,
            'SALESMAN', salary+180,
            'MANAGER', salary+150,
            'CLERK', salary+100,
            salary) AS "인상된 월급"
FROM employee;

