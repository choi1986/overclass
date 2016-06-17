drop table oc_report cascade constraints;
create table oc_report(
	reportno number primary key,
	reporter varchar2(12) not null,
	dno number not null,
	content varchar2(120),
	reportdate date default sysdate,	-- 신고처리일자
	foreign key (dno) references oc_document (dno)
);

drop sequence oc_report_seq;
create sequence oc_report_seq
	start with 1
	increment by 1
	nocycle
	nocache;