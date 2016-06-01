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