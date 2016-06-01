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