drop table reply;
create table reply(
	reply_num number primary key,
	user_id varchar2(12) not null,
	doc_num number not null,
	reply_content varchar2(150) not null
);