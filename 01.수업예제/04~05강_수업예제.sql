--04悪. 陥丞廃 敗呪
SELECT ASCII('I'), CHR(74), ASCIISTR('采'), UNISTR('\BDA9')
FROM dual;


SELECT LENGTH('banana'), LENGTH('戚繕穿櫛'), LENGTHB('banana'), LENGTHB('戚繕穿櫛')
FROM dual;

SELECT CONCAT ('食君歳',' 鋼亜趨推')
FROM dual;

SELECT CONCAT (ename, job), ename || ':' || job
FROM employee;

SELECT INSTR('戚依戚 搭岸昔亜 哀搾昔亜','昔亜',8)
FROM dual;

SELECT LOWER ('hello world'), UPPER ('hello world'), INITCAP ('hello world')
FROM dual;

SELECT REPLACE('戚依精 搭岸昔亜 哀搾昔亜','搭岸','丞割 帖轍')
FROM dual;

SELECT TRANSLATE('戚依精 搭岸昔亜 哀搾昔亜','搭岸','丞割 帖轍')
FROM dual;

SELECT SUBSTR('厩亜引俳奄綬切庚噺税',5,3)
FROM dual;

SELECT LPAD('昔映',10,'*'), RPAD('昔映',10,'*')
FROM dual;

SELECT LTRIM('      戚腰持精')--焼巷依亀 照床檎 因拷薦暗
, RTRIM('諺梅嬢推せせせせ','せ')
FROM dual;

SELECT TRIM('     戚腰持精        '),TRIM(BOTH 'せ' FROM '諺梅嬢推せせせせ'),
TRIM(LEADING 'せ' FROM 'せせせ諺梅嬢?Dせせせせ'),
TRIM(TRAILING 'せ' FROM 'せせせ諺梅嬢?Dせせせせ')
FROM dual;

SELECT REGEXP_COUNT('戚依戚 神虞適戚陥','戚') --働舛 越切亜 護腰 級嬢亜 赤澗亜
FROM dual;

SELECT ROUND(to_date('2021/05/20','YYYY/MM/DD'),'Q')
FROM dual;

SELECT ADD_MONTHS(sysdate,+3)--神潅稽採斗 3鯵杉 板
FROM dual;

SELECT sysdate+7 FROM dual; --神潅稽 採斗 7析 板

SELECT sysdate, current_date, current_timestamp  --> 薄仙 劾促 尻杉析 / 尻杉析/ 尻杉析獣歳段腔軒段走蝕
FROM dual;

SELECT LAST_DAY(sysdate) FROM dual; -- 戚腰含税 原走厳 劾

SELECT NEXT_DAY(sysdate,'杉推析') FROM dual; -- 神潅 劾切奄層生稽 陥製 杉推析税 劾促 窒径

SELECT MONTHS_BETWEEN('2021-08-27',sysdate) FROM dual; --神潅 劾切奄層生稽 背雁 劾切 害精 鯵杉

SELECT NUMTODSINTERVAL(360000,'SECOND') --360000段亜 護析昔走
FROM dual;

SELECT NUMTOYMINTERVAL(3.14,'YEAR')
FROM dual;

SELECT NULLIF('A','A'),NULLIF('A','B')
FROM dual;

SELECT ename, dno,
DECODE(dno, 10, '井軒採',
            20,'尻姥採',
            30,'慎穣採',
            40,'恥巷採',
            '企奄繕') AS "採辞戚硯"-- dno 亜 10戚檎 井軒採 20戚檎 尻姥採,,,,, 蒸陥檎 企奄繕
FROM employee;

SELECT ename, dno, -- dno亜 10戚檎 井軒採 ~~ 蒸陥檎 企奄繕
    CASE WHEN dno=10 THEN '井軒採'
         WHEN dno=20 THEN '尻姥採'
         WHEN dno=30 THEN '慎穣採'
         WHEN dno=40 THEN '恥巷採'
         ELSE '企奄繕'
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
--05悪. 益血敗呪
SELECT sum(salary), ROUND(avg(salary)),MAX(salary),MIN(salary)
FROM employee;

SELECT MAX(ename),MIN(ename),MAX(hiredate),MIN(hiredate)
FROM employee;

SELECT count(*) FROM employee;

SELECT count(commission) FROM employee; --commission 戚虞澗 鎮軍税 透巴呪

SELECT count(DISTINCT dno) -- 掻差吉依聖 薦須廃 dno税 姐呪
FROM employee;

--SELECT ename, MAX(salary) -- 析鋼鎮軍引 益血敗呪 旭戚 兜聖 呪 蒸製
--FROM employee;

SELECT dno,sum(salary) --益血生稽 広精 鎮軍精 析鋼鎮軍引 益血敗呪 肇遂亜管
FROM employee
GROUP BY dno;

SELECT dno,job,sum(salary)
FROM employee
GROUP BY dno,job
ORDER BY dno;

--SELECT job,sum(salalry) -- 益血敗呪税 繕闇生稽 WHERE箭 紫遂 災亜管
--FROM employee
--WHERE avg(salary)>=2000
--GROUP BY job;

SELECT job,sum(salary)
FROM employee
GROUP BY job
HAVING avg(salary)>=2000;

SELECT * FROM employee;

--森薦: 採辞紺 置壱 厭食亜 3000 戚雌昔 採辞税 腰硲人 採辞紺 置壱 厭食姥馬奄
SELECT dno,MAX(salary) AS "置壱厭食"
FROM employee
GROUP BY dno
HAVING MAX(salary)>=3000;

--森薦: 古艦煽研 薦須馬壱 厭食 恥衝戚 5000戚雌昔 眼雁 穣巷(job)紺 厭食 恥衝引 背雁 昔据姥馬奄
SELECT job,sum(salary) AS "厭食恥衝",count(*)AS "昔据呪"
FROM employee
WHERE job !='MANAGER'
GROUP BY job
HAVING sum(salary)>=5000
ORDER BY sum(salary) DESC;

--森薦: 採辞紺 汝液 厭食掻 置壱 汝液 厭食研 繕噺馬奄
SELECT MAX(avg(salary))
FROM employee
GROUP BY dno; --汝液税 益血

SELECT job,dno,sum(salary)
FROM employee
GROUP BY ROLLUP (job,dno)  --dno研奄層生稽 掻娃杯域
ORDER BY job;
