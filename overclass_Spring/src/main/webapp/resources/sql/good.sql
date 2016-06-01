drop table good cascade constraints;
create table good(
	good_user varchar2(12) not null,
	dno number not null,
	foreign key (good_user) references oc_user (user_id),
	foreign key (dno) references oc_document (dno)
);