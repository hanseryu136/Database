# 날짜 : 2026/05/06
# 이름: 한세류
# 내용 : 3장 제약조건

use studydb;

#실습 3-1. 기본키 실습
CREATE TABLE User2(
	userid VARCHAR(10) PRIMARY KEY, 
    name VARCHAR(10),
    birth CHAR(10),
    addr VARCHAR(50)
);

#실습 3-2. User2 데이터 추가
INSERT INTO User2 VALUES ('A101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO User2 VALUES ('A102', '김춘추', '1972-05-02', '경남 김해시');
INSERT INTO User2 VALUES ('A103', '장보고', '1983-03-09', '경남 김해시');
INSERT INTO User2 VALUES ('A104', '강감찬', '1993-01-06', '경남 김해시');
INSERT INTO User2 VALUES ('A105', '이순신', '1999-02-09', '경남 김해시');
SELECT * FROM User2;

#실습 3-3. User3 고유키 실습하기
CREATE TABLE User3 (
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10),
    hp CHAR(13) UNIQUE,
    addr VARCHAR(50)
);

#실습 3-4. User3 데이터 추가하기
INSERT INTO User3 VALUES ('A101', '김유신', '1968-05-09', '010-1111-1111', '경남 김해시');
INSERT INTO User3 VALUES ('A102', '김춘추', '1972-05-02', '010-1111-1112','경남 김해시');
INSERT INTO User3 VALUES ('A103', '장보고', '1983-03-09', '010-1111-1113','경남 김해시');
INSERT INTO User3 VALUES ('A104', '강감찬', '1993-01-06', '010-1111-1114','경남 김해시');
INSERT INTO User3 VALUES ('A105', '이순신', '1999-02-09', '010-1111-1115','경남 김해시');

INSERT INTO User3 (userid, birth, addr, name)
						VALUES ('A108', '1983-03-22', '부산 동래구', '송상현');

INSERT INTO User3 SET
					userid = 'B101',
					name = '홍길동',
					birth = '1992-05-09',
					addr = '부산 연제구',

SELECT * FROM User3


#실습 3-5. User3 왜리키 실습하기
CREATE TABLE Parent(
	pid		VARCHAR(10) PRIMARY KEY,
    name 	VARCHAR(10),
    birth 	CHAR(10),
	addr 	VARCHAR(100)
);

CREATE TABLE Child(
	cid		VARCHAR(10) PRIMARY KEY,
    name 	VARCHAR(10),
    birth 	CHAR(10) UNIQUE,	-- 고유키, 중복방지, NULL허용
	addr 	VARCHAR(100),
    FOREIGN KEY (parent) REFERENCES Parent (pid)
);

















