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

-- ��й�ȣ ����
-- 1. ���� ������?   2. ���� ģ�� ģ�� �̸���?   3. ���� ������?   4. ���� ��� �б���?   5. �θ���� ������?   6. ���� ��1ȣ��?

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
	reportdate date default sysdate,	-- �Ű�ó������
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
	dno number not null, -- �Ű�ȱ��� �۹�ȣ
	writer varchar2(12), -- �Ű�ȱ��� �� �ۼ���
	content varchar2(120), -- �Ű�ȱ��� �� ����
	tag varchar2(210), -- �Ű�ȱ��� �±�
	image varchar2(300), -- �Ű�ȱ��� ����
	mapLoc varchar2(210),
	mapXY varchar2(210),
	goodcnt number, -- �Ű�ȱ��� ���ƿ� ī��Ʈ
	user_image varchar2(300), -- �Ű�ȱ��� �ۼ��� ������ ���� 
	reportno number primary key, -- �Ű� ��ȣ
	report_content varchar2(210), -- �Ű� ����
	reporter varchar2(12) not null, -- �Ű���
	reportdate date -- �Ű�ó������
);

drop sequence oc_bandoc_seq;
create sequence oc_bandoc_seq
	start with 1
	increment by 1
	nocycle
	nocache;
