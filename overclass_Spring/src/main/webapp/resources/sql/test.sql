-- ��й�ȣ ����
-- 1. ���� ������?   2. ���� ģ�� ģ�� �̸���?   3. ���� ������?   4. ���� ��� �б���?   5. �θ���� ������?   6. ���� ��1ȣ��?

insert into oc_user values('test1','1234','�׽�Ʈ1','test1@test.com','010-1111-5678',
'����Ư����','������','����','900101','��','���� ������?','��õ',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test2','1234','�׽�Ʈ2','test2@test.com','010-5641-2135',
'��õ������','����','�丮','950525','��','���� ģ�� ģ�� �̸���?','�׽�Ʈ3',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test3','1234','�׽�Ʈ3','test3@test.com','010-9786-4561',
'��⵵','����','������','930606','��','���� ������?','�׽���',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test4','1234','�׽�Ʈ4','test4@test.com','010-6425-1632',
'�뱸������','����','����','000229','��','���� ����б���?','�����ָ���',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test5','1234','�׽�Ʈ5','test5@test.com','010-1475-6759',
'���ֱ�����','����','����','911225','��','�θ���� ������?','������',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('admin','admin','������','admin@overclass.co.kr','010-7777-7777',
'���ֵ�','����','�丮','880505','��','������1ȣ','������',
sysdate,'/overclass/resources/img/profile_default.png',0,1);
insert into oc_user values('test6','1234','�׽�Ʈ6','test6@test.com','010-1475-6759',
'�λ걤����','����','����','913801','��','���� ����б���?','�����',
sysdate,'/overclass/resources/img/profile_default.png',0,0,0,);


insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test1','ù��°��','�������');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test2','��','�������');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test3','�Ȇ̻翡��','�λ�');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test4','�ݰ����ϴ�','�λ�');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test5','���ּ���','�䱸');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test1','��','��');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test2','���� �����ϴ�','����');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test3','�ǰ� ���� �ϼ���','����');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test4','���� ��Ź �帳�ϴ�','�䱸');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test5','�����Űܰ�����','�䱸');

select * from OC_DOCUMENT;
select * from OC_REPLY;

insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');
insert into oc_report (reportno, reporter, dno, content)
		values (oc_report_seq.nextval, 'test1', 132, '�׳�');

insert into oc_bandoc (dno, writer, content, tag, image, goodcnt, user_image, reportno, report_content, reporter, reportdate)
		(select oc_report.dno, oc_document.writer, oc_document.content, tag, image, goodcnt, user_image, reportno, oc_report.content report_content, reporter, reportdate 
				from oc_document, oc_user, oc_report
				where oc_document.dno = oc_report.dno AND oc_user.user_id = oc_document.writer );
				
select oc_report.dno, oc_document.writer, oc_document.content, tag, image, goodcnt, user_image, reportno, oc_report.content report_content, reporter, reportdate 
				from oc_document, oc_user, oc_report
				where oc_document.dno = oc_report.dno AND oc_user.user_id = oc_document.writer AND reportno = 9;

insert into oc_bandoc (dno, writer, content, tag, image, goodcnt, user_image, reportno, report_content, reporter, reportdate)
		values (114,'test1','content','tag','/overclass/image',2,'/overclass/userimage',10,'�Ű���','��','2016-06-17');




 select sender, content, writedate, read from oc_msg
where sender='test1';


select sender, receiver, content, TO_CHAR(writedate,'yyyymmddhh24miss') writedate, read
		from oc_msg
		where (sender = 'test1' and receiver = 'test2') OR (sender = 'test2' and receiver = 'test1')
		
select * from oc_msg


select user_id, user_name, user_image
		from oc_user
		where user_id != 'test1' AND user_id != 'admin' AND user_id LIKE 'te' || '%'
		order by user_id desc