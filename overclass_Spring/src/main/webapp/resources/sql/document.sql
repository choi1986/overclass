drop table document;
create table document(
	doc_num number primary key,
	user_id varchar2(12) not null,
	doc_content varchar2(210) not null,
	doc_tag varchar2(210),
	doc_writedate date default sysdate,
	doc_image varchar2(120),
	doc_goodcnt number default 0
)