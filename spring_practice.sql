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

SELECT * FROM users
ORDER BY reg_date;

SELECT COUNT(*) FROM freeboard;

SELECT * FROM freeboard
ORDER BY bno DESC
LIMIT 0, 10;
#206~ DESC
# (page-1) *cpp

drop table users;
CREATE TABLE users(
	user_id VARCHAR(50) PRIMARY KEY,
   user_pw VARCHAR(50) NOT NULL,
   user_name VARCHAR(50) NOT NULL,
   user_nick VARCHAR(50) NOT NULL,
   user_phone VARCHAR(50),
   user_email1 VARCHAR(50),
   user_email2 VARCHAR(50),
   addr_mine VARCHAR(300),
   addr_close VARCHAR(300),
   reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   temperature INT NOT NULL DEFAULT '0'
);

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

SELECT count(*) FROM users
		WHERE user_id='abc1234';
SELECT user_id, user_pw FROM users
		WHERE user_id='abc1234'AND user_pw='aaa11111';
        
select * from jdbc_board;

SELECT 
	user_name, user_phone1, user_phone2,
	user_email1, user_email2, addr_basic,
    addr_detail, addr_zip_num, 
    f.bno, f.title, f.reg_date
FROM users u 
LEFT JOIN freeboard f
ON u.user_id = f.writer
WHERE u.user_id = 'abc1234'
ORDER BY f.bno DESC
LIMIT 0, 10;

SELECT * FROM freeboard;
commit;

CREATE TABLE freereply(
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT,
    
    FOREIGN KEY (bno) 
    REFERENCES freeboard(bno)
    ON DELETE CASCADE,
    
    reply VARCHAR(1000),
    reply_id VARCHAR(50),
    reply_pw VARCHAR(50),
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL 
);

UPDATE freereply 
SET update_date = '2023-05-24 00:00:00'
WHERE rno = 11;

SELECT * FROM freereply;

SELECT * FROM freeboard;

SELECT f.*,
	(SELECT COUNT(*) FROM freereply WHERE bno = f.bno)
    AS reply_cnt
FROM freeboard f
ORDER BY bno DESC
LIMIT 0, 10;    

SELECT f.*, r.reply_cnt
FROM freeboard f
LEFT JOIN (SELECT bno, COUNT(*) AS reply_cnt FROM freereply
GROUP BY bno) r
ON f.bno = r.bno
ORDER BY bno DESC
LIMIT 0, 10;

#SNS 게시판
CREATE TABLE snsboard(
	bno INT PRIMARY KEY AUTO_INCREMENT,
    writer VARCHAR(50) NOT NULL, 
    upload_path VARCHAR(100) NOT NULL,
    file_loca VARCHAR(100) NOT NULL,
    file_name VARCHAR(50) NOT NULL,
    file_real_name VARCHAR(50) NOT NULL,
    content VARCHAR(2000),
    reg_Date DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM snsboard;







CREATE TABLE party (
	party_no INT PRIMARY KEY AUTO_INCREMENT,
	rest_id VARCHAR(100) NOT NULL,
    writer VARCHAR(50),
    title VARCHAR(50),
    content VARCHAR(200),
    reg_date DATETIME DEFAULT current_timestamp,
    update_date DATETIME DEFAULT current_timestamp
);

INSERT INTO party VALUES('2', 'k', 'b', 'c', 'd', '2023-05-24 19:40:00', '2023-05-24 19:41:00' );

SELECT * FROM party;
SELECT * 
		FROM party
		ORDER BY party_no DESC;
        
CREATE TABLE store(
	sno INT PRIMARY KEY AUTO_INCREMENT,
    siteTel VARCHAR(100) NOT NULL,
    rdnWhlAddr VARCHAR(300) NOT NULL,
    bplcNm VARCHAR(50) NOT NULL,
    uptaeNm VARCHAR(20) NOT NULL,
    x long NOT NULL, y long NOT NULL
);        

INSERT INTO store VALUES
('2', '027653606', '서울특별시 종로구 돈화문로5길 18 (돈의동)', '둘둘치킨', '한식', '199137.684631002', '452059.348314465'),
('3', '027356644', '서울특별시 종로구 인사동14길 8 (관훈동)', '가회', '한식', '198565.903249145', '452491.15799313'),
('4', '0237893446', '서울특별시 중구 무교로 17-23 (무교동)', '남도 수랏간', '일식', '198046.780200218', '198046.780200218'),
('5', '0222784975', '서울특별시 중구 충무로2길 32-4, 1층 (충무로4가)', '제주 연탄집', '일식', '199466.317788539', '451108.71319358'),
('6', '027948829', '서울특별시 중구 세종대로18길 2 (태평로2가)', '프라자', '경양식', '197923.196829665', '451275.673249671'),
('7', '023181118', '서울특별시 용산구 독서당로 22 (한남동,1층점포19호)', '한남설렁탕', '한식', '197923.196829665', '447561.558961093'),
('8', '0222826818', '서울특별시 성동구 행당로 119-6 (행당동)', '오코노미 앤 우동', '정종/대포집/소주방', '202780.288666842', '450670.722648427'),
('9', '024654999', '서울특별시 광진구 동일로22길 81 (화양동)', '스마일맥주', '호프/통닭', '206000.986088047', '448808.090477312');

SELECT * FROM store;


 CREATE TABLE review(
 	review_no INT PRIMARY KEY AUTO_INCREMENT,
 	writer VARCHAR(50) NOT NULL,
 	rest_id VARCHAR(50) NOT NULL,
 	content VARCHAR(3000) NOT NULL,
 	reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 	update_date DATETIME DEFAULT NULL
 );
INSERT INTO review VALUES
('1', '오정원', 'dhwjd', '여긴콘텐트', '2023-05-30 19:15:00', '2023-05-30 19:16:00');
DROP TABLE review;