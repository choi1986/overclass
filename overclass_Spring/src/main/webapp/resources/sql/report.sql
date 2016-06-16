drop table oc_report cascade constraints;
create table oc_report(
	reportno number primary key,
	reporter varchar2(12) not null,
	dno number not null,
	content varchar2(120),
	reportdate date,	-- �Ű�ó������
	foreign key (dno) references oc_document (dno)
);