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
'�λ걤����','����','����','911001','��','���� ����б���?','�����',
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














