-- Project P 유저 테이블
CREATE TABLE P_Users(
	id VARCHAR2(20) PRIMARY KEY,
	pwd VARCHAR2(20) NOT NULL,
	email VARCHAR2(30),
	pnum VARCHAR2(11),
	regdate DATE
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE P_board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL,
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);
CREATE SEQUENCE P_board_file_seq;

--게시글을 저장할 테이블
CREATE TABLE P_board_talk(
	num NUMBER PRIMARY KEY,			--글 번호
	writer VARCHAR2(100) NOT NULL,	--작성자(로그인된 아이디
	title VARCHAR2(100) NOT NULL,	--제목
	content CLOB,					--글 내용
	viewCount NUMBER,				--조회수
	regdate DATE					--글 작성일
);
CREATE SEQUENCE P_board_talk_seq; 