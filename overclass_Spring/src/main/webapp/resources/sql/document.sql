drop table oc_document cascade constraints;
create table oc_document(
	dno number primary key,
	writer varchar2(12) not null,
	content varchar2(900) not null,
	tag varchar2(210),
	writedate date default sysdate,
	image varchar2(300),
	mapLoc varchar2(210),
	mapXY varchar2(210),
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

insert into oc_document (dno, writer, content, tag, image, mapLoc) 
(select oc_document_seq.nextval, writer, content, tag, image, mapLoc from oc_document);
