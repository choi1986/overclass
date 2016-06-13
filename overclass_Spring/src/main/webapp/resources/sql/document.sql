
drop table oc_document cascade constraints;
create table oc_document(
	dno number primary key,
	writer varchar2(12) not null,
	content varchar2(600) not null,
	tag varchar2(210),
	writedate date default sysdate,
	image varchar2(120),
	goodcnt number default 0,
	replycnt number default 0,
	foreign key (writer) references oc_user (user_id)
);

drop sequence oc_document_seq;
create sequence oc_document_seq
	start with 1
	increment by 1
	nocycle
	nocache;

	select *from OC_DOCUMENT

insert into oc_document (dno, writer, content, tag, image) values(oc_document_seq.nextval, 'test1', '테스트1이쓴글', '태그1', '');
	
insert into oc_document (dno, writer, content, tag, image) 
(select oc_document_seq.nextval, writer, content, tag, image from oc_document);
