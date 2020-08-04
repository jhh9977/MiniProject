create table member(
id 	 varchar2(30) primary key,
pwd	 varchar2(40),
name	 varchar2(30),
nickname varchar2(30) unique,
email	 varchar2(50) not null,
phone    varchar2(50) not null,
addr	 varchar2(200) not null,
point    number,
type 	 number
);

create table board(
num		     number primary key,
g_name		 varchar2(30) references member(nickname) on delete cascade,
s_name		 varchar2(30) references shop(name) on delete cascade,
w_date		 date,
content		 varchar2(500) not null,
score        number
);

insert into board values(seq_board.nextval, 'kitri', '치킨가게', sysdate, '이집 치킨 존맛', 5);
create table shop(
num		 	 number primary key,
id			 references member(id) on delete cascade,
name		 varchar2(30) unique,
menu		 varchar2(200) not null,
location	 varchar2(100) not null,
phone    	 varchar2(50),
img		 	 varchar2(500),
content   	 varchar2(500),
category	 varchar2(200),
queue_num	 number,
viewcount	 number,
scoreavg	 number
);

create table queue(
num			 number primary key,
s_name		 varchar2(30) references shop(name) on delete cascade,
g_name		 varchar2(30) references member(nickname) on delete cascade,
pnum		 number,
r_date		 date
);
insert into queue values(seq_queue.nextval, '치킨가게', 'kitri', 2, sysdate);

create table log(
num			 number primary key,
s_name		 varchar2(30),
g_name		 varchar2(30), 
pnum		 number,
r_date		 date
);

create sequence seq_shop;
create sequence seq_log;
create sequence seq_board;
create sequence seq_queue;

select * from member;
select * from shop;
select * from board;
select * from queue;
select * from log;

delete from queue where g_name='guest2';


drop table member cascade constraints;
drop table shop cascade constraints;
drop table board cascade constraints;
drop table queue cascade constraints;
drop table log cascade constraints;

drop sequence seq_shop;
drop sequence seq_log;
drop sequence seq_board;
drop sequence seq_queue;
