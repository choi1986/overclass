drop table oc_user cascade constraints;
create table oc_user(
	user_id varchar2(12) primary key,
	user_pwd varchar2(12) not null,
	user_name varchar2(15) not null,
	user_email varchar2(30) not null,
	user_tel varchar2(13) not null,
	user_loc varchar2(15) not null,
	user_hobby varchar2(15) not null,
	user_birth varchar2(6) not null,
	user_gender varchar2(3) not null,
	user_pwdq number not null,
	user_pwda varchar2(99) not null,
	user_joindate date default sysdate,
	user_image varchar2(120) default '/img/profile_default.jpg',
	user_logincnt number,
	user_admin number default 0
);

drop table oc_document cascade constraints;
create table oc_document(
	dno number primary key,
	writer varchar2(12) not null,
	content varchar2(210) not null,
	tag varchar2(210),
	writedate date default sysdate,
	image varchar2(120),
	goodcnt number default 0,
	replycnt number default 0,
	foreign key (writer) references oc_user (user_id)
);

drop table good cascade constraints;
create table good(
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
	reportdate date,	-- 신고처리일자
	foreign key (reporter) references oc_user (user_id),
	foreign key (dno) references oc_document (dno)
);

drop table oc_reply cascade constraints;
create table oc_reply(
	rno number primary key,
	replyer varchar2(12) not null,
	dno number not null,
	content varchar2(150) not null,
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
);

