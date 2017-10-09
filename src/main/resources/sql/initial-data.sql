insert into role values ('role_user', 'user');
insert into role values ('role_admin', 'administrator');
insert into role values ('role_remote', 'remote user');

insert into app_user values ('clarence', 'clarence', 'clarence ho', 'prospring3', '2011-10-21', 'prospring3', '2011-10-21');
insert into app_user values ('admin', 'admin', 'administrator', 'prospring3', '2011-10-21', 'prospring3', '2011-10-21');
insert into app_user values ('remote', 'remote', 'remote user', 'prospring3', '2011-10-21', 'prospring3', '2011-10-21');
insert into app_user values ('user', 'user', 'normal user', 'prospring3', '2011-10-21', 'prospring3', '2011-10-21');

insert into user_role_detail values ('clarence','role_admin');
insert into user_role_detail values ('clarence','role_user');
insert into user_role_detail values ('admin','role_admin');
insert into user_role_detail values ('admin','role_user');
insert into user_role_detail values ('remote','role_remote');
insert into user_role_detail values ('user','role_user');

insert into category values ('java', null);
insert into category values ('spring', null);
insert into category values ('jpa', null);
insert into category values ('spring batch', 'spring');
insert into category values ('spring integration', 'spring');
insert into category values ('spring webflow', 'spring');
insert into category values ('spring roo', 'spring');
insert into category values ('hibernate', 'jpa');
insert into category values ('eclipse link', 'jpa');
insert into category values ('collections', 'java');
insert into category values ('jsr-303', 'java');