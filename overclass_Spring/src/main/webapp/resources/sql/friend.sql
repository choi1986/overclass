drop table oc_friend_req cascade constraints; 
create table oc_friend_req(
	sender varchar2(12) not null,
	receiver varchar2(12) not null
);

drop table oc_friend_rel cascade constraints;
create table oc_friend_rel(
	sender varchar2(12) not null,
	receiver varchar2(12) not null
);