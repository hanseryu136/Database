# 날짜 : 2026/05/06
# 이름 : 한세류
# 내용 : 4장 SQL_고급

# 실습 4-1
CREATE TABLE Employee (
	empno INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    gender CHAR(1) NOT NULL,
    hp CHAR(13) UNIQUE NOT NULL,
    job VARCHAR(10),
    depno INT,
    regdate DATE NOT NULL
);

CREATE TABLE Dept (
	depno INT PRIMARY KEY,
    dname VARCHAR(10) NOT NULL,
    tel VARCHAR(12) NOT NULL
);

CREATE TABLE Sale (
	no INT AUTO_INCREMENT PRIMARY KEY,
    empno INT NOT NULL,
    year YEAR NOT NULL,
    month TINYINT NOT NULL,
    price INT DEFAULT 0
);

# 실습 4-2
-- Employee 
INSERT INTO Employee VALUES (1001, '김유신', 'M', '010-1234-1001', '부장', 101, '2025-11-19');
INSERT INTO Employee VALUES (1002, '김춘추', 'M', '010-1234-1002', '차장', 104, '2025-11-19');
INSERT INTO Employee VALUES (1003, '장보고', 'M', '010-1234-1003', '사원', 101, '2025-11-19');
INSERT INTO Employee VALUES (1004, '강감찬', 'M', '010-1234-1004', '대리', 102, '2025-11-19');
INSERT INTO Employee VALUES (1005, '신사임당', 'F', '010-1234-1005', '과장', 102, '2025-11-19');
INSERT INTO Employee VALUES (1006, '이황', 'M', '010-1234-1006', '차장', 103, '2025-11-19');
INSERT INTO Employee VALUES (1007, '이이', 'M', '010-1234-1007', '사원', 105, '2025-11-19');
INSERT INTO Employee VALUES (1008, '이순신', 'M', '010-1234-1008', '차장', 103, '2025-11-19');
INSERT INTO Employee VALUES (1009, '허난설헌', 'F', '010-1234-1009', '사원', 104, '2025-11-19');
INSERT INTO Employee VALUES (1009, '정약용', 'M', '010-1234-1010', '대리', 104, '2025-11-19');
SELECT * FROM Employee;

-- Dept
INSERT INTO Dept VALUES (101, '경영지원부', '051-512-1001');
INSERT INTO Dept VALUES (102, '영업부', '051-512-1002');
INSERT INTO Dept VALUES (103, '개발부', '051-512-1003');
INSERT INTO Dept VALUES (104, '인사부', '051-512-1004');
INSERT INTO Dept VALUES (105, '기획부', '051-512-1005');

-- Sale
INSERT INTO Sale (empno, year, month, price) VALUES (1001, 2018, 1, 98100);
INSERT INTO Sale (empno, year, month, price) VALUES (1002, 2018, 1, 136000);
INSERT INTO Sale (empno, year, month, price) VALUES (1003, 2018, 1, 80000);
INSERT INTO Sale (empno, year, month, price) VALUES (1004, 2018, 1, 78000);
INSERT INTO Sale (empno, year, month, price) VALUES (1005, 2018, 1, 93000);
INSERT INTO Sale (empno, year, month, price) VALUES (1006, 2018, 2, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES (1007, 2018, 2, 126000);
INSERT INTO Sale (empno, year, month, price) VALUES (1008, 2018, 2, 19000);
INSERT INTO Sale (empno, year, month, price) VALUES (1009, 2018, 2, 19000);
INSERT INTO Sale (empno, year, month, price) VALUES (1010, 2018, 2, 53000);
-- ----------------------------------------------------------------------------
INSERT INTO Sale (empno, year, month, price) VALUES (1011, 2019, 1, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES (1012, 2019, 1, 109000);
INSERT INTO Sale (empno, year, month, price) VALUES (1013, 2019, 1, 101000);
INSERT INTO Sale (empno, year, month, price) VALUES (1014, 2019, 1, 53000);
INSERT INTO Sale (empno, year, month, price) VALUES (1015, 2019, 1, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES (1016, 2019, 2, 160000);
INSERT INTO Sale (empno, year, month, price) VALUES (1017, 2019, 2, 101000);
INSERT INTO Sale (empno, year, month, price) VALUES (1018, 2019, 2, 43000);
INSERT INTO Sale (empno, year, month, price) VALUES (1019, 2019, 2, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES (1020, 2019, 2, 109000);
-- ----------------------------------------------------------------------------
INSERT INTO Sale (empno, year, month, price) VALUES (1021, 2020, 1, 201000);
INSERT INTO Sale (empno, year, month, price) VALUES (1022, 2020, 1, 63000);
INSERT INTO Sale (empno, year, month, price) VALUES (1023, 2020, 1, 74000);
INSERT INTO Sale (empno, year, month, price) VALUES (1024, 2020, 1, 122000);
INSERT INTO Sale (empno, year, month, price) VALUES (1025, 2020, 1, 111000);
INSERT INTO Sale (empno, year, month, price) VALUES (1026, 2020, 2, 120000);
INSERT INTO Sale (empno, year, month, price) VALUES (1027, 2020, 2, 93000);
INSERT INTO Sale (empno, year, month, price) VALUES (1028, 2020, 2, 84000);
INSERT INTO Sale (empno, year, month, price) VALUES (1029, 2020, 2, 180000);
INSERT INTO Sale (empno, year, month, price) VALUES (1030, 2020, 2, 76000);
-- ----------------------------------------------------------------------------
INSERT INTO Sale (empno, year, month, price) VALUES (1031, 2021, 1, 56000);
INSERT INTO Sale (empno, year, month, price) VALUES (1032, 2021, 1, 123000);
INSERT INTO Sale (empno, year, month, price) VALUES (1033, 2021, 1, 91000);
INSERT INTO Sale (empno, year, month, price) VALUES (1034, 2021, 1, 78000);
INSERT INTO Sale (empno, year, month, price) VALUES (1035, 2021, 2, 32000);
INSERT INTO Sale (empno, year, month, price) VALUES (1036, 2021, 2, 148000);
INSERT INTO Sale (empno, year, month, price) VALUES (1037, 2021, 2, 106000);
INSERT INTO Sale (empno, year, month, price) VALUES (1038, 2021, 2, 112000);
INSERT INTO Sale (empno, year, month, price) VALUES (1039, 2021, 3, 47000);
INSERT INTO Sale (empno, year, month, price) VALUES (1040, 2021, 3, 36000);
select * from Sale;

drop table Sale;

# 실습 4-3
SELECT * FROM Employee WHERE name = '김유신';
SELECT * FROM Employee WHERE job = '차장' AND depno = 101;
SELECT * FROM Employee WHERE job = '차장' OR depno = 101;
SELECT * FROM Employee WHERE name != '김춘추';
SELECT * FROM Employee WHERE name <> '김춘추';	-- != 연산자와 동일
SELECT * FROM Employee WHERE JOB = '사원' AND DEPNO = 10;
SELECT * FROM Employee WHERE job = '사원' OR job = '대리';
SELECT * FROM Employee WHERE job IN ('사원', '대리');	-- 위 OR 조건절과 동일
SELECT * FROM Employee WHERE depno IN (101, 102, 103);	
SELECT * FROM Employee WHERE name LIKE '김%'; -- % : 와일드카드, 아무 문자열
SELECT * FROM Employee WHERE name LIKE '%신';
SELECT * FROM Employee WHERE name LIKE '김__';	-- _글자수
SELECT * FROM Employee WHERE name LIKE '이_';
SELECT * FROM Employee WHERE name LIKE '_순 %';
SELECT * FROM Employee WHERE HP LIKE '010-%';
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPTNO = 10;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPTNO IN (10, 30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영__ _';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);


# 실습 4-4
SELECT * FROM Sale ORDER BY price;
SELECT * FROM Sale ORDER BY price ASC;	-- 오름차순
SELECT * FROM Sale ORDER BY price DESC;	-- 내림차순
SELECT * FROM Sale
	WHERE price > 50000 
    ORDER BY year DESC, month, price DESC;
SELECT * FROM Sale WHERE price > 50000 ORDER BY price DESC;
SELECT * FROM Employee ORDER BY name;
SELECT * FROM Employee ORDER BY regdate ASC;


# 실습 4-5
SELECT * FROM Sale LIMIT 3;
SELECT * FROM Sale LIMIT 0, 3;
SELECT * FROM Sale LIMIT 1, 2;
SELECT * FROM Sale LIMIT 5, 3;
SELECT * FROM Sale ORDER BY price DESC LIMIT 3, 5;
SELECT * FROM Sale WHERE price < 50000 ORDER BY price DESC LIMIT 3;
SELECT * FROM Sale
	WHERE price > 50000
    ORDER BY year DESC, month, price DESC
    LIMIT 5;


# 실습 4-6
SELECT SUM(price) AS 합계 FROM Sale;
SELECT AVG(price) AS 평균 FROM Sale;
SELECT MAX(price) AS 최대값 FROM Sale;
SELECT MIN(price) AS 최소값 FROM Sale;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND;
SELECT CEILING(RAND() * 10);
UPDATE Sale Set price = NULL WHERE no=3;

SELECT COUNT(price) AS 개수 FROM Sale;
SELECT COUNT(*) AS 튜플개수 FROM Sale;


SELECT LEFT('HELLO WORLD', 5);
SELECT RIGHT('HELLO WORLD', 5);
SELECT SUBSTRING('HELLO WORLD', 6, 5);
SELECT CONCAT('HELLO', 'WORLD');
SELECT CONCAT(empnd, name, hp) FROM Employee WHERE empno='1008';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO Employee SET
	empno = '1012',
    name = '을지문덕',
    gender = 'F',
    hp = '010-1234-1012',
    redate = NOW();

# 실습 4-7
-- 2018년 1월 매출의 총합


# 실습 4-8
-- 2019년 2월에 5만원 이상 매출에 대한 종합과 평균을 구하시오.


# 실습 4-9
-- 2020년 전체 매출 가운데 의지, 최고, 배출로 구하시오.


# 실습 4-10
SELECT * FROM Sale GROUP BY empo;
SELECT * FROM Sale GROUP BY year;
SELECT * FROM Sale GROUP BY empno, year;
SELECT empno, COUNT(*) AS 건수 FROM Sale GROUP BY empno;
SELECT empno, SUM(price) AS 합계 FROM Sale GROUP BY empno;
SELECT empno, AVG(price) AS 평균 FROM Sale GROUP BY empno;

SELECT empno, year, SUM(price) AS 합계
FROM Sale
GROUP BY empno, year

SELECT empno, year
FROM Sale
GROUP BY empno, year
ORDER BY year ASC, 합계 DESC;

SELECT empno, year, SUM(price) AS 합계
FROM Sale
GROUP BY empno, year
ORDER BY 합계 DESC;


# 실습 4-11
SELECT empno, SUM(price) AS 합계 FROM SALE
GROUP BY empno
HAVING 합계 >= 200000;

SELECT empno, year, SUM(price) AS 합계
FROM Sale
WHERE price >= 100000
GROUP BY emnpo, year
HAVING 합계 >= 200000
ORDER BY 합계 DESC;



# 실습 4-12
CREATE TABLE Sale2 LIKE Sale;
INSERT INTO Sale2 SELECT * FROM Sale;
UPDATE Sale2 SET year = year + 3;

SELECT * FROM Sale UNION SELECT * FROM Sale2;
SELECT * FROM Sale WHERE price >= 100000
UNION 
SELECT * FROM Sale2 WHERE price >= 100000;

SELECT empno, year, sale FROM Sale
UNION
SELECT empno, year, sale FROM Sale2;

SELECT empno, year, SUM(price) AS 합계
FROM Sale
GROUP BY empno, year
UNION
SELECT empno, year, SUM(price) AS 합계
FROM Sale2
GROUP BY empno, year
ORDER BY year ASC, 합계 DESC;


# 실습 4-13
SELECT * FROM Sale INNER JOIN Employee ON Sale.empno = Employee.empno;
SELECT * FROM Employee INNER JOIN Dept ON Employee.depno = Dept.depno;

SELECT * FROM Sale AS a JOIN Employee AS b  ON a.empno = b.empno;
SELECT * FROM Employee AS a JOIN Dept AS b  ON a.depno = b.depno;

SELECT * FROM Sale AS a, Employee AS B WHERE a.empno = b.empno;
SELECT * FROM Employee AS a, Dept AS B WHERE a.depno = b.depno;

SELECT a.no, a.empno, price, name, job FROM Sale AS a
JOIN Employee AS b  ON a.empno = b.empno
WHERE price >= 100000;

SELECT a.no, a.empno, b.name, b.job, year, SUM(price) AS 합계 FROM Sale AS a
	JOIN Employee AS b  ON a.empno = b.empno
	GROUP BY a.empno, a.year  HAVING 합계 >= 100000
    ORDER BY a.year ASC, 합계 DESC;
    
SELECT * FROM Sale AS a
JOIN Employee AS b  ON a.empno = b.empno
JOIN Dept AS c  ON b.depno = c.depNo;

SELECT a.no, a.empno, a.price, b.name, b.job, c.dname FROM Sale AS a
JOIN Employee AS b  ON a.empno = b.empno
JOIN Dept AS c ON b.depno = c.depNo;

SELECT a.no, a.empno, a.price, b.name, b.job, c.dname FROM Sale AS a
JOIN Employee AS b  ON a.empno = b.empno
JOIN Dept AS c ON b.depno = c.depNO;
WHERE price > 100000
ORDER BY price DESC;


# 실습 4-14
SELECT * FROM Sale AS a LEFT JOIN Employee AS b ON a.empno = b.empno;
SELECT * FROM Sale AS a RIGHT JOIN Employee AS b ON a.empno = b.empno;
SELECT a.no, a.empno, price, name, job  FROM Sale AS a
LEFT JOIN Employee AS b USING(empno);

SELECT a.no, a.empno, price, name, job  FROM Sale AS a
RIGHT JOIN Employee AS b USING(empno);


# 실습 4-15
-- 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
SELECT
	a.empno,
    a.name,
    a.job,
    b.dname
	FROM Employee AS a
		JOIN Dept AS b
			ON a.empno = b.empno;


# 실습 4-16
-- '김유신' 직원의 2019년도 매출의 합을 조회하시오.
SELECT SUM(price) AS 매출합
	FROM Employee AS a
	JOIN Sale AS b
	ON a.empno = b.empno;
	WHERE a.name = '김유신' AND b.year = 2019;

# 실습 4-17
-- 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원 이름,
-- 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬
SELECT empno, SUM(price) AS 매출합
	FROM Sale AS a
    JOIN employee AS b ON a.empno = b.empno
    JOIN Dept AS c ON b.depno = c.empno
	WHERE year = 2019 AND price >= 50000
	GROUP BY empno
    HAVING 매출합 >= 100000
	ORDER BY 매출합 DESC;



