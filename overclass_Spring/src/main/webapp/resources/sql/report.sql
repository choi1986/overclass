drop table msg;
create table msg(
	msg_sender varchar2(12) not null,
	msg_receiver varchar2(12) not null,
	msg_content varchar2(210) not null,
	msg_writedate date default sysdate
);