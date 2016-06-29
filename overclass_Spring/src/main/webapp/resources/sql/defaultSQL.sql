drop table oc_user cascade constraints;
create table oc_user(
	user_id varchar2(12) primary key,
	user_pwd varchar2(12) not null,
	user_name varchar2(15) not null,
	user_email varchar2(30) not null,
	user_tel varchar2(13) not null,
	user_loc varchar2(150) not null,
	user_hobby1 varchar2(15) not null,
	user_hobby2 varchar2(15) not null,
	user_birth varchar2(6) not null,
	user_gender varchar2(3) not null,
	user_pwdq varchar2(99) not null,
	user_pwda varchar2(99) not null,
	user_joindate date default sysdate,
	user_image varchar2(300) default '/resources/img/profile_default.jpg',
	user_logincnt number default 0,
	user_admin number default 0
	sessionkey varchar2(50) not null default 'none',
	sessionlimit timestamp
);

-- 비밀번호 질문
-- 1. 나의 고향은?   2. 나의 친한 친구 이름은?   3. 나의 별명은?   4. 나의 출신 학교는?   5. 부모님의 성함은?   6. 보물 제1호는?

drop table oc_document cascade constraints;
create table oc_document(
	dno number primary key,
	writer varchar2(12) not null,
	content varchar2(900) not null,
	tag varchar2(210),
	writedate date default sysdate,
	image varchar2(300),
	maploc varchar2(210),
	goodcnt number default 0,
	replycnt number default 0,
	mapxy varchar2(210)
	foreign key (writer) references oc_user (user_id)
);

drop sequence oc_document_seq;
create sequence oc_document_seq
	start with 1
	increment by 1
	nocycle
	nocache;

drop table oc_good cascade constraints;
create table oc_good(
	good_user varchar2(12) not null,
	dno number not null,
	foreign key (good_user) references oc_user (user_id),
	foreign key (dno) references oc_document (dno)
);

drop table oc_report cascade constraints;
create table oc_report(
	reportno number primary key,
	reporter varchar2(12) not null,
	dno number not null,
	content varchar2(120),
	reportdate date default sysdate,	-- 신고처리일자
	foreign key (dno) references oc_document (dno)
);

drop sequence oc_report_seq;
create sequence oc_report_seq
	start with 1
	increment by 1
	nocycle
	nocache;

drop table oc_reply cascade constraints;
create table oc_reply(
	rno number primary key,
	dno number not null,
	replyer varchar2(12) not null,
	content varchar2(150) not null,
	writedate date default sysdate,
	foreign key (replyer) references oc_user (user_id),
	foreign key (dno) references oc_document (dno)
);

drop sequence oc_reply_seq;
create sequence oc_reply_seq
	start with 1
	increment by 1
	nocycle
	nocache;
	
drop table oc_friend_req cascade constraints; 
create table oc_friend_req(
	sender varchar2(12) not null,
	receiver varchar2(12) not null
);

drop table oc_friend_rel cascade constraints;
create table oc_friend_rel(
	sender varchar2(12) not null,
	receiver varchar2(12) not null
);

drop table oc_msg cascade constraints;
create table oc_msg(
	sender varchar2(12) not null,
	receiver varchar2(12) not null,
	content varchar2(210) not null,
	writedate date default sysdate
	read number default 0 not null
);

drop table oc_bandoc cascade constraints;
create table oc_bandoc(
	dno number not null, -- 신고된글의 글번호
	writer varchar2(12), -- 신고된글의 글 작성자
	content varchar2(120), -- 신고된글의 글 내용
	tag varchar2(210), -- 신고된글의 태그
	image varchar2(300), -- 신고된글의 사진
	mapLoc varchar2(210),
	mapXY varchar2(210),
	goodcnt number, -- 신고된글의 좋아요 카운트
	user_image varchar2(300), -- 신고된글의 작성자 프로필 사진 
	reportno number primary key, -- 신고 번호
	report_content varchar2(210), -- 신고 사유
	reporter varchar2(12) not null, -- 신고자
	reportdate date -- 신고처리일자
);

drop sequence oc_bandoc_seq;
create sequence oc_bandoc_seq
	start with 1
	increment by 1
	nocycle
	nocache;
