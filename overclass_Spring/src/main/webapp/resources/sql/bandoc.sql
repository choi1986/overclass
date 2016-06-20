drop table oc_bandoc cascade constraints;
create table oc_bandoc(
	dno number not null, -- �Ű�ȱ��� �۹�ȣ
	writer varchar2(12), -- �Ű�ȱ��� �� �ۼ���
	content varchar2(120), -- �Ű�ȱ��� �� ����
	tag varchar2(210), -- �Ű�ȱ��� �±�
	image varchar2(300), -- �Ű�ȱ��� ����
	goodcnt number, -- �Ű�ȱ��� ���ƿ� ī��Ʈ
	user_image varchar2(300), -- �Ű�ȱ��� �ۼ��� ������ ���� 
	reportno number primary key, -- �Ű� ��ȣ
	report_content varchar2(210), -- �Ű� ����
	reporter varchar2(12) not null, -- �Ű���
	reportdate date, -- �Ű�ó������
);

drop sequence oc_bandoc_seq;
create sequence oc_bandoc_seq
	start with 1
	increment by 1
	nocycle
	nocache;

