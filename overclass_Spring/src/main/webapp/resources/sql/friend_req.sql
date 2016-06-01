drop table friend_req; 
create table friend_req(
	friend_sender varchar2(12) not null,
	friend_receiver varchar2(12) not null
);

drop table friend_rel;
create table friend_rel(
	friend_sender varchar2(12) not null,
	friend_receiver varchar2(12) not null
);