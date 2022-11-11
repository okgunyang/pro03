CREATE TABLE test(NAME VARCHAR(50), POINT INT);
govermentgoverment
INSERT INTO test VALUES ("김기태",100);
INSERT INTO test VALUES ("김도연",80);

SELECT * FROM test;

CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),
	content VARCHAR(1000),
	regdate DATETIME DEFAULT NOW(),
	visited INT DEFAULT 0
);

DESC notice;

INSERT INTO notice(title, content) VALUES ("테스트 글1", "테스트 글2 내용입니다.");

COMMIT;

SELECT * FROM notice;
