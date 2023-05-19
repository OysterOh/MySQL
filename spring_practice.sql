#해당 계정이 어떤 데이터베이스를 사용할 지 명시하는 문장
use spring;

CREATE TABLE scores(
	stu_id INT PRIMARY KEY AUTO_INCREMENT,
    stU_name varCHAr(30) NOt NULL,
    kor INT DEFAULT 0,
    eng INT DEFAULT 0,
    math INT DEFAULT 0,
    total INT DEFAULT 0,
    average DECIMAL(5, 2)
);

CREATE TABLE jdbc_board(
	board_no INT PRIMARY KEY AUTO_INCREMENT,
    writer VARCHAR(30) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(2000),
    reg_date DATETIME DEFAULT current_timestamp
);

#자유게시판 테이블 추가 0515
CREATE TABLE freeboard(
	bno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    content VARCHAR(3000) NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);

SELECT * FROM freeboard;

SELECT COUNT(*) FROM freeboard;

SELECT * FROM freeboard
ORDER BY bno DESC
LIMIT 0, 10;
#206~ DESC
# (page-1) *cpp

drop table users;

CREATE TABLE users(
	user_id VARCHAR(50) PRIMARY KEY NOT NULL,
    user_pw VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    user_phone1 VARCHAR(50),
    user_phone2 VARCHAR(50),
    user_email1 VARCHAR(50),
    user_email2 VARCHAR(50),
    addr_basic VARCHAR(300),
    addr_detail VARCHAR(300),
    addr_zip_num VARCHAR(50),
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users VALUES ('abc1234', 'aaa11111', '이름', '폰1', '폰2', '이메일1', '이메일2', '주소', '상세주소', '집넘', '2023-05-19 14:46:00');
SELECT * FROM users;
SELECT * FROM users WHERE user_id = 'dhwjddnjs';
commit;

SELECT count(*) FROM users
		WHERE user_id='abc1234';
SELECT user_id, user_pw FROM users
		WHERE user_id='abc1234'AND user_pw='aaa11111';
        
select * from jdbc_board;