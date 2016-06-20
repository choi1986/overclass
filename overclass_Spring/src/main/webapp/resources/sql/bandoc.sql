drop table oc_bandoc cascade constraints;
create table oc_bandoc(
	dno number not null, -- 신고된글의 글번호
	writer varchar2(12), -- 신고된글의 글 작성자
	content varchar2(120), -- 신고된글의 글 내용
	tag varchar2(210), -- 신고된글의 태그
	image varchar2(300), -- 신고된글의 사진
	goodcnt number, -- 신고된글의 좋아요 카운트
	user_image varchar2(300), -- 신고된글의 작성자 프로필 사진 
	reportno number primary key, -- 신고 번호
	report_content varchar2(210), -- 신고 사유
	reporter varchar2(12) not null, -- 신고자
	reportdate date, -- 신고처리일자
);

drop sequence oc_bandoc_seq;
create sequence oc_bandoc_seq
	start with 1
	increment by 1
	nocycle
	nocache;

