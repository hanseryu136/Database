#날짜 : 2026/05/08
#이름 : 한세류
#내용 : 5장_데이터베이스_개체

#실습 5-1. 인덱스 조회
SHOW INDEX FROM User1;
SHOW INDEX FROM User2;
SHOW INDEX FROM User3;
SELECT * FROM User3;

#실습 5-2. 인덱스 생성 및 적용 
CREATE INDEX idx_user1_userid ON User1(userid);
ANALYZE TABLE User1;

#실습 5-3. 인덱스 삭제
DROP INDEX idx_user1_userid ON User1;

#실습 5-4. 뷰 생성
CREATE VIEW vw_user1 AS (SELECT name, hp, age FROM User1);
CREATE VIEW vw_user4_age_under30 AS (SELECT * FROM User4 WHERE age < 30);
CREATE VIEW vw_Employee_with_sales AS (
	SELECT
	 a.empno AS 직원번호,
	 b.name AS 직원이름,
	 b.job AS 직급,
	 c.dname AS 부서명,
	 a.year AS 매출년도,
	 a.month AS 월,
	 a.price AS 매출액
	FROM Sale AS a
	JOIN Employee AS b ON a.empno = b.empno
	JOIN Dept AS c ON b.depno = c.depNo
	);
    
#실습 5-5. 뷰 조회
SELECT * FROM vw_user1;
SELECT * FROM vw_user2_age_under30;

#실습 5-5. 뷰 삭제
DROP VIEW vw_user1;
DROP VIEW vw_user4_age_under30;

#실습 5-7. 프로시저 생성 및 실행 기본
DELIMITER $$
	CREATE PROCEDURE proc_test1()
	BEGIN
		SELECT * FROM Employee;
		SELECT * FROM Dept;
	END $$
	DELIMITER ;
    
CALL proc_test1();

#실습 5-8. 매개변수를 갖는 프로시저 생성 및 실행
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
	BEGIN
		SELECT * FROM Employee WHERE name=_userName;
	END $$
	DELIMITER ;
    
CALL proc_test2(‘김유신’);

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _job VARCHAR(10), IN _depno TINYINT)
	BEGIN
		SELECT * FROM Employee WHERE job=_job AND depno=_depno;
	END $$
	DELIMITER ;

CALL proc_test3(‘차장’, 101);

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT)
	BEGIN
		SELECT COUNT(*) INTO _count FROM Employee WHERE job=_job;
	END $$
	DELIMITER ;
    
CALL proc_test4(‘대리’, @_count);
SELECT CONCAT('_count : ', @_count)

#5-9. 프로시저 프로그래밍
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
		DECLARE _empno INT;
		select empno into _empno from Employee where name = _name;
		select * from Sale where empno = _empno;
	END $$
	DELIMITER ;
    
CALL proc_test5('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test6()
	BEGIN
		DECLARE num1 INT;
		DECLARE num2 INT;
        
		SET num1 = 1;
		SET num2 = 2;
        
		IF (NUM1 > NUM2) THEN
			SELECT 'NUM1이 NUM2보다 크다.' as 결과2;
		ELSE
			SELECT 'NUM1이 NUM2보다 작다.' as 결과2;
		END IF;
	END $$
	DELIMITER ;

CALL proc_test6();

DELIMITER $$
	CREATE PROCEDURE proc_test7()
	BEGIN
		DECLARE sum INT;
		DECLARE num INT;
        
		SET sum = 0;
		SET num = 1;
        
		WHILE (num <= 10) DO
			SET sum = sum + num;
			SET num = num + 1;
		END WHILE;
        
		SELECT sum AS '1부터 10까지 합계';
	END $$
	DELIMITER ;
    
CALL proc_test7();

#실습 5-10. 커서를 활용하는 프로시저
DELIMITER $$
CREATE PROCEDURE proc_test8()
BEGIN
	# 변수 선언
	DECLARE total INT DEFAULT 0;
	DECLARE price INT;
	DECLARE endOfRow BOOLEAN DEFAULT false;
    
	# 커서 선언
	DECLARE saleCursor CURSOR FOR
		SELECT price FROM Sale;
        
	# 반복 조건
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET endOfRow = TRUE;
        
	# 커서 열기
	OPEN saleCursor;
    
	cursor_loop: LOOP
    
		-- 커서가 가리키는 현재 행의 값을 temp 변수에 저장, 한 번 반복마다 한 행씩 이동
		FETCH saleCursor INTO price;
        
		IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
        
		SET total = total + price;
	END LOOP;
    
	SELECT total AS '전체 합계';
    
	CLOSE saleCursor;
END $$
DELIMITER ;

CALL proc_test8();

#실습 5-11. 저장 함수 생성 및 호출
-- root로 접속해서 아래 환경설정 후 다시 함수 생성
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
	CREATE FUNCTION func_test1(_empno INT) RETURNS INT
	BEGIN
		DECLARE total INT;
        
		SELECT SUM(price) INTO total FROM Sale WHERE empno = _empno;
        
		RETURN total;
	END $$
	DELIMITER ;
    
SELECT func_test1(1001);

DELIMITER $$
	CREATE FUNCTION func_test2(_price INT) RETURNS DOUBLE
	BEGIN
		DECLARE bonus DOUBLE;
        
		IF (_price >= 100000) THEN
			SET bonus = _price * 0.1;
		ELSE
			SET bonus = _price * 0.05;
		END IF;
        
	RETURN bonus;
	END $$
	DELIMITER ;

SELECT
	empno,
	year,
	month,
	price,
	func_test2(sale) as bonus
FROM Sale;