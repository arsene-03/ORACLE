--04강. 다양한 함수
SELECT ASCII('I'), CHR(74), ASCIISTR('붉'), UNISTR('\BDA9')
FROM dual;


SELECT LENGTH('banana'), LENGTH('이조전랑'), LENGTHB('banana'), LENGTHB('이조전랑')
FROM dual;

SELECT CONCAT ('여러분',' 반가워요')
FROM dual;

SELECT CONCAT (ename, job), ename || ':' || job
FROM employee;

SELECT INSTR('이것이 통닭인가 갈비인가','인가',8)
FROM dual;

SELECT LOWER ('hello world'), UPPER ('hello world'), INITCAP ('hello world')
FROM dual;

SELECT REPLACE('이것은 통닭인가 갈비인가','통닭','양념 치킨')
FROM dual;

SELECT TRANSLATE('이것은 통닭인가 갈비인가','통닭','양념 치킨')
FROM dual;

SELECT SUBSTR('국가과학기술자문회의',5,3)
FROM dual;

SELECT LPAD('인권',10,'*'), RPAD('인권',10,'*')
FROM dual;

SELECT LTRIM('      이번생은')--아무것도 안쓰면 공백제거
, RTRIM('망했어요ㅋㅋㅋㅋ','ㅋ')
FROM dual;

SELECT TRIM('     이번생은        '),TRIM(BOTH 'ㅋ' FROM '망했어요ㅋㅋㅋㅋ'),
TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋ망했어욬ㅋㅋㅋㅋ'),
TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋ망했어욬ㅋㅋㅋㅋ')
FROM dual;

SELECT REGEXP_COUNT('이것이 오라클이다','이') --특정 글자가 몇번 들어가 있는가
FROM dual;

SELECT ROUND(to_date('2021/05/20','YYYY/MM/DD'),'Q')
FROM dual;

SELECT ADD_MONTHS(sysdate,+3)--오늘로부터 3개월 후
FROM dual;

SELECT sysdate+7 FROM dual; --오늘로 부터 7일 후

SELECT sysdate, current_date, current_timestamp  --> 현재 날짜 연월일 / 연월일/ 연월일시분초밀리초지역
FROM dual;

SELECT LAST_DAY(sysdate) FROM dual; -- 이번달의 마지막 날

SELECT NEXT_DAY(sysdate,'월요일') FROM dual; -- 오늘 날자기준으로 다음 월요일의 날짜 출력

SELECT MONTHS_BETWEEN('2021-08-27',sysdate) FROM dual; --오늘 날자기준으로 해당 날자 남은 개월

SELECT NUMTODSINTERVAL(360000,'SECOND') --360000초가 몇일인지
FROM dual;

SELECT NUMTOYMINTERVAL(3.14,'YEAR')
FROM dual;

SELECT NULLIF('A','A'),NULLIF('A','B')
FROM dual;

SELECT ename, dno,
DECODE(dno, 10, '경리부',
            20,'연구부',
            30,'영업부',
            40,'총무부',
            '대기조') AS "부서이름"-- dno 가 10이면 경리부 20이면 연구부,,,,, 없다면 대기조
FROM employee;

SELECT ename, dno, -- dno가 10이면 경리부 ~~ 없다면 대기조
    CASE WHEN dno=10 THEN '경리부'
         WHEN dno=20 THEN '연구부'
         WHEN dno=30 THEN '영업부'
         WHEN dno=40 THEN '총무부'
         ELSE '대기조'
    END
FROM employee;

SELECT * FROM userTBL;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC),username,height FROM userTBL;

SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC),username,height,addr FROM userTBL;

SELECT ROW_NUMBER() OVER(PARTITION BY dno ORDER BY salary DESC), ename,salary,dno FROM employee;

SELECT DENSE_RANK() OVER(ORDER BY height DESC),username,height FROM userTBL;

SELECT NTILE(3) OVER (ORDER BY height DESC),username,height FROM userTBL;

SELECT username, height,height-LEAD(height,1,0)OVER(ORDER BY height DESC) FROM userTBL;

----------------------------------------------------------------------------------
--05강. 그룹함수
SELECT sum(salary), ROUND(avg(salary)),MAX(salary),MIN(salary)
FROM employee;

SELECT MAX(ename),MIN(ename),MAX(hiredate),MIN(hiredate)
FROM employee;

SELECT count(*) FROM employee;

SELECT count(commission) FROM employee; --commission 이라는 컬럼의 튜플수

SELECT count(DISTINCT dno) -- 중복된것을 제외한 dno의 갯수
FROM employee;

--SELECT ename, MAX(salary) -- 일반컬럼과 그룹함수 같이 놓을 수 없음
--FROM employee;

SELECT dno,sum(salary) --그룹으로 묶은 컬럼은 일반컬럼과 그룹함수 혼용가능
FROM employee
GROUP BY dno;

SELECT dno,job,sum(salary)
FROM employee
GROUP BY dno,job
ORDER BY dno;

--SELECT job,sum(salalry) -- 그룹함수의 조건으로 WHERE절 사용 불가능
--FROM employee
--WHERE avg(salary)>=2000
--GROUP BY job;

SELECT job,sum(salary)
FROM employee
GROUP BY job
HAVING avg(salary)>=2000;

SELECT * FROM employee;

--예제: 부서별 최고 급여가 3000 이상인 부서의 번호와 부서별 최고 급여구하기
SELECT dno,MAX(salary) AS "최고급여"
FROM employee
GROUP BY dno
HAVING MAX(salary)>=3000;

--예제: 매니저를 제외하고 급여 총액이 5000이상인 담당 업무(job)별 급여 총액과 해당 인원구하기
SELECT job,sum(salary) AS "급여총액",count(*)AS "인원수"
FROM employee
WHERE job !='MANAGER'
GROUP BY job
HAVING sum(salary)>=5000
ORDER BY sum(salary) DESC;

--예제: 부서별 평균 급여중 최고 평균 급여를 조회하기
SELECT MAX(avg(salary))
FROM employee
GROUP BY dno; --평균의 그룹

SELECT job,dno,sum(salary)
FROM employee
GROUP BY ROLLUP (job,dno)  --dno를기준으로 중간합계
ORDER BY job;
