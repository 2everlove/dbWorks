CREATE TABLE MENU 
(	
    	MENU_ID VARCHAR2(50 BYTE) PRIMARY KEY, 
	UP_MENU_ID VARCHAR2(50 BYTE), 
    	TITLE VARCHAR2(50 BYTE), 
	URL VARCHAR2(50 BYTE), 
	SORT NUMBER(2,0), 
	VISIBLE CHAR(1 BYTE)
);

drop table menu;

Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m01','대메뉴1','/board/list',null,1,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m02','대메뉴2','/board/list',null,2,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m03','대메뉴3','/board/list',null,3,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m05','1-중메뉴1','/board/list','m01',1,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m06','1-중메뉴2','/board/list','m01',2,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m07','2-중메뉴1','/board/list','m02',1,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m08','3-중메뉴1','/board/list','m03',1,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m09','5-메뉴1','/board/list','m03',1,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m10','5-메뉴2','/board/list','m03',2,'Y');
Insert into MENU (MENU_ID,TITLE,URL,UP_MENU_ID,SORT,VISIBLE) values ('m11','5-메뉴3','/board/list','m03',3,'Y');


commit;