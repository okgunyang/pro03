USE goverment;

-- 이용후기 테이블
CREATE TABLE impress(
	no INT PRIMARY KEY AUTO_INCREMENT,
	cate VARCHAR(20),
	tourno VARCHAR(20),
	id VARCHAR(30),
	content VARCHAR(1000),
	star DOUBLE,
	imgSrc VARCHAR(150),
	regdate DATETIME default NOW()
);

DESC impress;
DROP table impress;
INSERT INTO impress(cate, tourno, id, content, star, imgSrc) VALUES (?,?,?,?,?,?);
DELETE FROM impress WHERE NO=?;
UPDATE impress SET content=?, star=? WHERE id=? AND NO=?;
SELECT * FROM impress;

-- 질문 및 답변
create table qna(
    no int primary key auto_increment,
    title varchar(100) not null,
    content varchar(1000) not null,
    author varchar(20) not null,
    regdate datetime default now(),
    lev int default 0,            -- 깊이
    parno INT,          			-- 부모글 번호
    sec char(1),                 -- 비밀글 여부
    visited INT DEFAULT 0
);
DESC qna;
INSERT INTO qna(title, content, author, lev, sec) VALUES (?,?,?,?,?);
INSERT INTO qna(title, content, author, lev, parno, sec) VALUES (?,?,?,?,?,?);
SELECT no FROM qna ORDER BY regdate DESC limit 1;
UPDATE qna SET parno=no WHERE lev = 0 AND no=?; 
UPDATE qna SET visited=visited_1 WHERE no=?;
UPDATE qna SET title=?, content=?, author=?, sec=?, lev=? WHERE no=?;
DELETE FROM qna WHERE no=?;
SELECT * FROM qna WHERE no=?
SELECT * FROM qna ORDER BY parno ASC, lev ASC, no ASC;
SELECT * FROM qna;

