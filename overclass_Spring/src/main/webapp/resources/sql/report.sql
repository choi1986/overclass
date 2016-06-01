drop table report;
create table report(
	rep_num number primary key,
	user_id varchar2(12) not null,
	doc_num number not null,
	rep_content varchar2(120),
	rep_date date	-- 신고처리일자
);