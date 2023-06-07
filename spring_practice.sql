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
	    sno INT NOT NULL,
	    bplc_nm VARCHAR(50) NOT NULL,
	    writer VARCHAR(50) NOT NULL,
	    title VARCHAR(100) NOT NULL,
	    content VARCHAR(3000) NOT NULL,
	    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	    update_date DATETIME DEFAULT NULL,
	    max INT NOT NULL,
	    upload_path VARCHAR(50),
	    file_name VARCHAR(200) NOT NULL,
	    view_num INT DEFAULT 0
	);

TRUNCATE party;
DROP TABLE party;
SELECT * FROM party;

CREATE TABLE participants (
    p_no INT PRIMARY KEY AUTO_INCREMENT,
    party_no INT NOT NULL,
    user_id VARCHAR(50) NOT NULL
);
DROP TABLE participants;

CREATE TABLE participants (
    p_no INT PRIMARY KEY AUTO_INCREMENT,
    party_no INT NOT NULL,
    user_id VARCHAR(50) NOT NULL
);
SELECT * FROM participants;

 INSERT INTO party
    (sno, bplc_nm, writer, title, content, max, file_name, upload_path)
    VALUES (1, 'Some Place', '박카스', 'Some Title', 'Some Content', 5, 'somefile.jpg', 'uploads');
    
    
INSERT INTO party VALUES('3', 'hansot', 'jungwon2433', 'c', 'd', '2023-05-31 19:40:00', '2023-06-02 07:41:00' );

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

SELECT * FROM store;

DROP TABLE review;

TRUNCATE review;
#review 후기 게시판
 CREATE TABLE review(
 	review_no INT PRIMARY KEY AUTO_INCREMENT,
 	writer VARCHAR(50) NOT NULL,
 	sno INT NOT NULL,
    title VARCHAR(300) NOT NULL,
 	content VARCHAR(3000) NOT NULL,
 	reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 	update_date DATETIME DEFAULT NULL
 );
INSERT INTO review VALUES
('1', '오정원', 'dhwjd', '제목', '여긴콘텐트', '2023-05-30 19:15:00', '2023-05-30 19:16:00');

INSERT INTO review (writer, sno, title, content, reg_date, update_date)
VALUES
    ('John Doe', 1, 'Great experience', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2023-06-02 10:00:00', NULL),
    ('Jane Smith', 2, 'Delicious food', 'Nulla vehicula tortor vitae ultrices iaculis.', '2023-05-02 14:30:00', NULL),
    ('Michael Johnson', 3, 'Friendly staff', 'Pellentesque commodo sapien ut velit pharetra, in semper purus feugiat.', '2023-05-03 16:45:00', NULL),
    ('Emily Davis', 4, 'Amazing service', 'Donec tincidunt lacus sit amet ipsum condimentum interdum.', '2023-05-04 09:15:00', NULL),
    ('Daniel Wilson', 5, 'Highly recommended', 'Vestibulum et lectus vel nulla iaculis hendrerit.', '2023-05-05 12:00:00', NULL),
    ('Olivia Martinez', 6, 'Cozy atmosphere', 'Cras eu sapien ut odio pulvinar vulputate nec eget nisi.', '2023-05-06 17:30:00', NULL),
    ('Sophia Taylor', 7, 'Excellent quality', 'Sed a felis finibus, tincidunt massa non, lobortis lacus.', '2023-05-07 13:20:00', NULL),
    ('William Anderson', 8, 'Good value for money', 'Vivamus fermentum mi a tellus pharetra finibus.', '2023-05-08 11:10:00', NULL),
    ('James Brown', 9, 'Quick service', 'Integer feugiat dolor sit amet est gravida, ut cursus ipsum pharetra.', '2023-05-09 15:40:00', NULL),
    ('Ava Thomas', 10, 'Tasty dishes', 'Fusce commodo odio et purus aliquet, in bibendum orci laoreet.', '2023-05-10 18:30:00', NULL);

SELECT * FROM review;
SELECT * FROM users;


DROP TABLE users;
DROP TABLE review;

#users 회원 정보
CREATE TABLE users(
   user_id VARCHAR(50) PRIMARY KEY,
   user_pw VARCHAR(300) NOT NULL,
   user_name VARCHAR(50) NOT NULL,
   user_nick VARCHAR(50) NOT NULL,
   user_email1 VARCHAR(50),
   user_email2 VARCHAR(50),
   addr_gu VARCHAR(300),
   addr_dong VARCHAR(300),
   reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE reviewReply;

#reviewReply 후기게시판 댓글
 CREATE TABLE reviewReply(
 	reply_no INT PRIMARY KEY AUTO_INCREMENT,
 	review_no INT NOT NULL,
 	reply VARCHAR(1000),
 	reply_id VARCHAR(50),
 	reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
 );
 
INSERT INTO reviewReply (reply_no, review_no, party_no, writer, content, reg_date, update_date)
VALUES (1, 14, 1, 'John Doe', 'Sample reply content', '2023-05-31 19:15:07', NULL);


SELECT * FROM reviewReply;

CREATE TABLE participants (
    p_no INT PRIMARY KEY AUTO_INCREMENT,
    party_no INT NOT NULL,
    user_id VARCHAR(50) NOT NULL
);

CREATE TABLE store (
    sno INT PRIMARY KEY,
    site_tel VARCHAR(30),
    rdn_whl_addr VARCHAR(100),
    bplc_nm VARCHAR(100),
    uptae_nm VARCHAR(20),
    dtlstatenm VARCHAR(10),
    x VARCHAR(50),
    y VARCHAR(50)
);
SELECT * FROM store;

SELECT * FROM party;
SELECT p.*, s.rdn_whl_addr FROM party p JOIN store s ON p.sno = s.sno ORDER BY party_no DESC 
LIMIT 0, 10; 


CREATE TABLE star(
    star_no INT PRIMARY KEY AUTO_INCREMENT,
    sno INT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    star_rate DOUBLE NOT NULL
);

CREATE TABLE partyLike(
    lno INT PRIMARY KEY AUTO_INCREMENT,
    party_no INT NOT NULL,
    user_id VARCHAR(50) NOT NULL
);

CREATE TABLE reviewLike(
    lno INT PRIMARY KEY AUTO_INCREMENT,
    review_no INT NOT NULL,
    user_id VARCHAR(50) NOT NULL
);


SELECT * FROM users;



