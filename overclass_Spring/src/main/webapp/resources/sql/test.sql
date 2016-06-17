-- 비밀번호 질문
-- 1. 나의 고향은?   2. 나의 친한 친구 이름은?   3. 나의 별명은?   4. 나의 출신 학교는?   5. 부모님의 성함은?   6. 보물 제1호는?

insert into oc_user values('test1','1234','테스트1','test1@test.com','010-1111-5678',
'서울특별시','스포츠','독서','900101','남','나의 고향은?','인천',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test2','1234','테스트2','test2@test.com','010-5641-2135',
'인천광역시','음악','요리','950525','여','나의 친한 친구 이름은?','테스트3',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test3','1234','테스트3','test3@test.com','010-9786-4561',
'경기도','쇼핑','스포츠','930606','남','나의 별명은?','테스터',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test4','1234','테스트4','test4@test.com','010-6425-1632',
'대구광역시','독서','게임','000229','여','나의 출신학교는?','뉴욕주립대',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('test5','1234','테스트5','test5@test.com','010-1475-6759',
'광주광역시','게임','여행','911225','남','부모님의 성함은?','성유리',
sysdate,'/overclass/resources/img/profile_default.png',0,0);
insert into oc_user values('admin','admin','나관리','admin@overclass.co.kr','010-7777-7777',
'제주도','여행','요리','880505','남','보물제1호','스프링',
sysdate,'/overclass/resources/img/profile_default.png',0,1);
insert into oc_user values('test6','1234','테스트6','test6@test.com','010-1475-6759',
'부산광역시','독서','여행','911001','남','나의 출신학교는?','서울대',
sysdate,'/overclass/resources/img/profile_default.png',0,0,0,);


insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test1','첫번째글','등수놀이');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test2','우','등수놀이');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test3','안녛사에쇼','인사');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test4','반갑습니다','인사');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test5','돈주세요','요구');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test1','집','우');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test2','날이 덥습니다','날씨');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test3','건강 조심 하세요','날씨');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test4','결재 부탁 드립니다','요구');
insert into oc_document (dno,writer,content,tag) values (oc_document_seq.nextval,'test5','가갸거겨고교구고','요구');

select * from OC_DOCUMENT;
select * from OC_REPLY;














