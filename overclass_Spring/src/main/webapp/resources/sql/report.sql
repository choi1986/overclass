drop table oc_report cascade constraints;
create table oc_report(
	reportno number primary key,
	reporter varchar2(12) not null,
	dno number not null,
	content varchar2(120),
	reportdate date,	-- 신고처리일자
	foreign key (reporter) references oc_user (user_id),
	foreign key (dno) references oc_document (dno)
);