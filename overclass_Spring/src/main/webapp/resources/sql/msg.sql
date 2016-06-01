drop table oc_msg cascade constraints;
create table oc_msg(
	sender varchar2(12) not null,
	receiver varchar2(12) not null,
	content varchar2(210) not null,
	writedate date default sysdate
);