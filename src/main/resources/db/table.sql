SET SQL_SAFE_UPDATES=0;

create database jintao_sharebooklease;
use jintao_sharebooklease;
commit;

create table b_user
(
	u_uuid int auto_increment primary key,
    u_email varchar(255) not null,
    u_name varchar(255) not null,
    u_password varchar(255) not null,
    u_sex varchar(255) not null, -- 只能 ‘男’ 或 ‘女’ 
    u_identityCard varchar(255) not null,
    u_phone varchar(255) not null,
    u_address varchar(255) not null,
    u_balance DECIMAL(8,2) 
);
insert into b_user values('1','1067955735@qq.com','jintao01','password1','男','441588799563214755','13160675555','珠海市','500');
insert into b_user values('2','jintao_chen@foxmail.com','jintao02','password1','男','441588799563214755','13160675555','珠海市','500');
-- select * from b_user;

create table b_admin
(
	a_uuid int auto_increment primary key,
    a_email varchar(255) not null,
    a_password varchar(255) not null 
);
insert into b_admin values ('1','admin@qq.com','password1');

create table b_site
(
	s_uuid int auto_increment primary key,
    s_name varchar(255) not null,
    s_longitude varchar(255) not null, -- 经度 
    s_latitude varchar(255) not null,  -- 纬度 
    s_capacity int not null -- 容量 
);
insert into b_site values('1', '0', '0' ,'0' ,'0');
insert into b_site values('2', '弘毅楼', '113.546959','22.373509' ,'10');
insert into b_site values('3', '求是楼', '113.53842','22.375005' ,'10');
insert into b_site values('4', '明德楼', '113.545741','22.369249' ,'10');
-- update b_site set s_capacity =10;
-- drop table b_site;
-- select * from b_site;

create table b_bike
(
	b_uuid int auto_increment primary key,
    b_id varchar(255) not null,
--  b_price DECIMAL(8,2) not null,--
    b_status varchar(255) not null, -- 0代表空闲，1代表使用中，2代表损坏，3代表修理中,4代表闲置，5代表报废 
    s_uuid int not null, -- 1代表在使用中,没有停靠站点.其他则代表站点ID 
	foreign key (s_uuid) references b_site(s_uuid)
);
--  insert into b_bike values ('1','001','1','1');insert into b_bike values ('2','002','5','1');
 -- insert into b_bike values ('3','003','0','2');insert into b_bike values ('4','004','0','2');
--  insert into b_bike values ('5','005','0','3');insert into b_bike values ('6','006','0','3');
 -- insert into b_bike values ('7','007','0','4');insert into b_bike values ('8','008','0','4');
--  insert into b_bike values ('9','009','0','2');insert into b_bike values ('10','010','0','4');
 -- insert into b_bike values ('5','0','3');insert into b_bike values ('6','0','3');
-- delete from b_bike;
-- select * from b_bike  where b_status != 1;
-- select count(*) from b_bike where s_uuid = '3';
-- select * from b_bike as a,b_site as b where a.s_uuid=b.s_uuid order by a.b_uuid limit 0,2;
-- select a.*,b.s_name from b_bike a, b_site b where b_status != 1 and a.s_uuid = b.s_uuid;
-- select * from b_bike a, b_site b where  (a.s_uuid = '2' or  a.s_uuid = '4') and b_status != 1 and a.s_uuid = b.s_uuid and b_status = '0';
-- select * from b_bike as a,b_site as b where a.s_uuid=b.s_uuid and b_status = '0';

create table b_lease
(
	l_uuid int auto_increment primary key ,
--  l_id varchar(255) not null,
    l_leaseTime varchar(255) not null,
    l_returnTime varchar(255) ,
    l_money DECIMAL(8,2) not null default 0,
    l_status varchar(2) not null, -- 0代表未归还，1代表已归还
    l_money_status varchar(2) not null default 0, -- 0代表未支付，1代表已支付
    u_uuid int not null,
    b_uuid int not null,
	l_leaseSite int ,
    l_returnSite int default 1,
    foreign key (u_uuid) references b_user(u_uuid),
    foreign key (b_uuid) references b_bike(b_uuid),
    foreign key (l_leaseSite) references b_site(s_uuid),
    foreign key (l_returnSite) references b_site(s_uuid)
);
-- alter table b_lease modify l_id int auto_increment;
-- select * from b_lease;
-- select * from b_lease where DATEDIFF(l_leaseTime,'2015-11-11')>=0 and DATEDIFF(l_leaseTime,'2018-11-11')<=0
-- select a.*,b.u_name,d.s_name from b_lease a, b_user b, b_bike c, b_site d
     		-- where a.u_uuid = b.u_uuid and a.b_uuid = c.b_uuid and c.s_uuid = d.s_uuid;

create table b_deposit   -- 押金表 --
(
	d_uuid int auto_increment primary key ,
    d_status varchar(2) not null, -- 0代表没付过押金，1代表付了押金 --
    d_money decimal(8,2) not null,
    u_uuid int,
    foreign key (u_uuid) references b_user(u_uuid)
);
-- insert into b_deposit values ('1','1','500','1');
-- insert into b_deposit values ('2','1','500','2');
-- drop table b_deposit;
-- insert into b_deposit values ('1','0','jintao02');
-- select * from b_deposit;