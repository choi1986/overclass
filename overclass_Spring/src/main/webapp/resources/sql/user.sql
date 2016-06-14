drop table oc_user cascade constraints;
create table oc_user(
	user_id varchar2(12) primary key,
	user_pwd varchar2(12) not null,
	user_name varchar2(15) not null,
	user_email varchar2(30) not null,
	user_tel varchar2(13) not null,
	user_loc varchar2(150) not null,
	user_hobby1 varchar2(15) not null,
	user_hobby2 varchar2(15) not null,
	user_birth varchar2(6) not null,
	user_gender varchar2(3) not null,
	user_pwdq varchar2(99) not null,
	user_pwda varchar2(99) not null,
	user_joindate date default sysdate,
	user_image varchar2(300) default '/resources/img/profile_default.jpg',
	user_logincnt number default 0,
	user_admin number default 0
);

alter table oc_user add column sessionkey varchar2(50) not null default 'none';
alter table oc_user add column sessionlimit timestamp;