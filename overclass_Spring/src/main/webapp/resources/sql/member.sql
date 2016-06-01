drop table member;
create table member(
	user_id varchar2(12) primary key,
	user_pwd varchar2(12) not null,
	user_name varchar2(15) not null,
	user_email varchar2(30) not null,
	user_tel varchar2(13) not null,
	user_loc varchar2(15) not null,
	user_hobby varchar2(15) not null,
	user_birth varchar2(6) not null,
	user_gender varchar2(3) not null,
	user_pwdq number not null,
	user_pwda varchar2(99) not null,
	user_joindate date default sysdate,
	user_image varchar2(120) default '/img/profile_default.jpg',
	user_logincnt number,
	user_admin number default 0,
)