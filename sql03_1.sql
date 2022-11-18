USE goverment;

CREATE TABLE test(NAME VARCHAR(50), POINT INT);

INSERT INTO test VALUES ("김기태",100);
INSERT INTO test VALUES ("김도연",80);

SELECT * FROM test;

-- 공지사항 테이블
CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),
	content VARCHAR(1000),
	regdate DATETIME DEFAULT NOW(),
	visited INT DEFAULT 0
);

DESC notice;

INSERT INTO notice(title, content) VALUES (?,?);
UPDATE notice SET title=?, content=? WHERE NO=?;
DELETE from notice WHERE NO=?;
SELECT * FROM notice;
SELECT * FROM notice GROUP BY regdate desc;
SELECT * FROM notice WHERE NO=?;
UPDATE notice SET visited=visited+1 WHERE NO=?;
COMMIT;

-- 사용자(회원) 테이블
CREATE TABLE user(
	id VARCHAR(30) PRIMARY KEY,
	pw VARCHAR(300) NOT NULL,
	name VARCHAR(50) NOT NULL,
	point INT DEFAULT 0,
	grade VARCHAR(4) DEFAULT "F",
	visted INT DEFAULT 1,
	tel VARCHAR(11),
	addr VARCHAR(150),
	email VARCHAR(100),
	birth DATE,
	regdate DATETIME DEFAULT NOW()
);

DROP TABLE USER;
DESC user;

INSERT INTO user(id, pw, name, tel, addr, email, birth) VALUES (?,?,?,?,?,?,?); 
UPDATE user SET pw=?, name=?, tel=?, addr=?, email=?, addr=?, birth=? WHERE id=?;
UPDATE user SET visted=visted+1 WHERE id=?;
UPDATE user SET point=POINT+5 WHERE id=?;
UPDATE user SET pw=?, name=?, tel=?, addr=?, email=?, addr=?, birth=? WHERE id=?;
UPDATE user SET pw=?, name=?, point=?, grade=?, tel=?, addr=?, email=?, addr=?, birth=? WHERE id=?;
DELETE FROM user WHERE id=?;
SELECT * FROM user;
SELECT * FROM user ORDER BY regdate DESC;
SELECT * FROM user WHERE id=?;

UPDATE user SET grade="A" WHERE id="admin";
COMMIT;

-- 이미지 저장 테이블
CREATE TABLE pic(
	no INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20),
	picname VARCHAR(150)
);
ALTER TABLE pic ADD COLUMN pos INT default 1; 
DESC pic;
SELECT * FROM pic;
SELECT * FROM pic WHERE tourno=?;
INSERT INTO pic(tourno, picname) VALUES (?,?);
DELETE FROM pic WHERE no=?;
DELETE FROM pic WHERE tourno=?;
UPDATE pic SET tourno=?, picname=? WHERE NO=?;
COMMIT;

-- 장소 테이블
CREATE TABLE tour(
	no INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20),	-- 카테고리 타입 - 마지막 레코드의 no+1
	cate VARCHAR(20),
	place VARCHAR(100),
	comment1 VARCHAR(1000),
	comment2 VARCHAR(1000)
);
ALTER TABLE tour ADD COLUMN addr VARCHAR(200);
DESC tour;
SELECT * FROM tour;
SELECT comment2 FROM tour;
select * from tour where place like CONCAT('%','통영','%');
INSERT INTO tour(tourno, cate, place, comment1, comment2) VALUES (?,?,?,?,?); 
UPDATE tour SET tourno=?, cate=?, place=?, comment1=?, comment2=? WHERE no=?;
DELETE FROM tour WHERE NO=?;
update tour set addr="경상남도 통영시 도남동 319-3" WHERE tourno="B001";
update tour set addr="경상남도 통영시 발개로 205" WHERE tourno="B002";
update tour set addr="경상남도 통영시 발개로 172-12" WHERE tourno="B003";
update tour set addr="경상남도 통영시 동피랑1길 6-18" WHERE tourno="A004";
update tour set addr="경상남도 통영시 남망공원길 29" WHERE tourno="A005";
COMMIT;