drop table if exists user_role_detail;
drop table if exists COMMENT_ATTACHMENT_DETAIL;
drop table if exists ENTRY_ATTACHMENT_DETAIL;
drop table if exists category;
drop table if exists comment;
drop table if exists app_user;
drop table if exists entry;
drop table if exists role;
drop table if exists comment_H;
drop table if exists entry_H;
drop table if exists REVINFO;

create table role (
       role_id varchar(20) not null
     , description varchar(40)
     , primary key (role_id)
);

create table entry (
       id int not null auto_increment
     , subject varchar(50) not null
     , body varchar(2000) not null
     , post_date datetime not null
     , category_id varchar(20)
     , sub_category_id varchar(20)
     , created_by varchar(20) not null
     , created_date datetime not null
     , last_modified_by varchar(20) not null
     , last_modified_date datetime not null
     , version int not null default 0
     , primary key (id)
);

create table app_user (
       user_id varchar(20) not null
     , password varchar(20) not null
     , user_name varchar(40)
     , created_by varchar(20) not null
     , created_date datetime not null
     , last_modified_by varchar(20) not null
     , last_modified_date datetime not null
     , primary key (user_id)
);

create table comment (
       id int not null auto_increment
     , subject varchar(50) not null
     , body varchar(2000) not null
     , post_date datetime not null
     , entry_id int not null
     , reply_to varchar(20)
     , post_by varchar(20)
     , created_by varchar(20) not null
     , created_date datetime not null
     , last_modified_by varchar(20) not null
     , last_modified_date datetime not null
     , version int not null default 0
     , primary key (id)
     , constraint fk_comment_1 foreign key (entry_id)
                  references entry (id) on delete cascade
);

create table category (
       category_id varchar(20) not null
     , parent_category_id varchar(20)
     , primary key (category_id)
     , constraint fk_category_1 foreign key (parent_category_id)
                  references category (category_id) on delete cascade
);

create table ENTRY_ATTACHMENT_DETAIL (
       id int not null auto_increment
     , entry_id int not null
     , file_name varchar(255) not null
     , content_type varchar(50) not null
     , file_data blob
     , primary key (id)
     , constraint fk_entry_attachment_detail_1 foreign key (entry_id)
                  references entry (id) on delete cascade
);

create table COMMENT_ATTACHMENT_DETAIL (
       id int not null auto_increment
     , comment_id int not null
     , file_name varchar(255) not null
     , content_type varchar(50) not null
     , file_data blob
     , primary key (id)
     , constraint fk_comment_attachment_detail_1 foreign key (comment_id)
                  references comment (id) on delete cascade
);

create table user_role_detail (
       user_id varchar(20) not null
     , role_id varchar(20) not null
     , primary key (user_id, role_id)
     , constraint fk_user_role_detail_1 foreign key (user_id)
                  references app_user (user_id)
     , constraint fk_user_role_detail_2 foreign key (role_id)
                  references role (role_id)
);

create table entry_H (
       id int not null
     , subject varchar(50) not null
     , body varchar(2000) not null
     , post_date datetime not null
     , category_id varchar(20)
     , sub_category_id varchar(20)
     , created_by varchar(20) not null
     , created_date datetime not null
     , last_modified_by varchar(20) not null
     , last_modified_date datetime not null
     , version int not null default 0
	 , audit_revision int not null
	 , action_type int
	 , audit_revision_end int
	 , audit_revision_end_ts timestamp    
     , primary key (id, audit_revision)
);

create table comment_H (
       id int not null
     , subject varchar(50) not null
     , body varchar(2000) not null
     , post_date datetime not null
     , entry_id int not null
     , reply_to varchar(20)
     , post_by varchar(20)
     , created_by varchar(20) not null
     , created_date datetime not null
     , last_modified_by varchar(20) not null
     , last_modified_date datetime not null
     , version int not null default 0
     , audit_revision int not null
     , action_type int
     , audit_revision_end int
     , audit_revision_end_ts timestamp     
     , primary key (id, audit_revision)
);

create table REVINFO (
       revtstmp bigint not null
     , rev int not null auto_increment
     , primary key (rev)
);