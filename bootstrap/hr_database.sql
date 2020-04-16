MariaDB [(none)]> use hr;
Database changed


MariaDB [hr]> create table countries(
    -> country_id char(2),
    -> country_name varchar(40),
    -> region_id int,
    -> primary key(country_id)
    -> );
Query OK, 0 rows affected (0.331 sec)
MariaDB [hr]> desc countries;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | char(2)     | NO   | PRI | NULL    |       |
| country_name | varchar(40) | YES  |     | NULL    |       |
| region_id    | int(11)     | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.018 sec)


MariaDB [hr]>  create table dept(
    ->      dept_id varchar(10) primary key,
    ->     dept_name varchar(30),
    ->     location_id int ,
    ->      foreign key(location_id) references locations(location_id));
Query OK, 0 rows affected (0.461 sec)


MariaDB [hr]> desc dept
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| dept_id     | varchar(10) | NO   | PRI | NULL    |       |
| dept_name   | varchar(30) | YES  |     | NULL    |       |
| location_id | int(11)     | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.035 sec)

MariaDB [hr]> create table jobs(
    ->     job_id varchar(10) primary key,
    ->     job_title  varchar(35) not null,
    ->    min_salary int(6),
    ->    max_salary int(6)
    -> );
Query OK, 0 rows affected (0.289 sec)
MariaDB [hr]> desc jobs;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| job_id     | varchar(10) | NO   | PRI | NULL    |       |
| job_title  | varchar(35) | NO   |     | NULL    |       |
| min_salary | int(6)      | YES  |     | NULL    |       |
| max_salary | int(6)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.033 sec)


create table employee(
    ->     emp_id varchar(20) primary key,
    ->      f_name varchar(20) not NULL,
    ->      l_name varchar(20) not NULL,
    ->      email varchar(20) ,
    ->      ph_no varchar(12),
    ->      hired_date date not NULL,
    ->      job_id int ,
    ->      comm int,
    ->      mgr_id varchar(30),
    ->     dept_id varchar(20),
    ->      sal int
    ->      check (sal>0) ,
    ->      foreign key(dept_id) references dept(dept_id));
Query OK, 0 rows affected (0.284 sec)

MariaDB [hr]> alter table employee
    -> add foreign key(mgr_id) references(emp_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(emp_id)' at line 2
MariaDB [hr]> alter table employee
    -> add foreign key(mgr_id) references employee(emp_id);
Query OK, 0 rows affected (1.012 sec)
Records: 0  Duplicates: 0  Warnings: 0
MariaDB [hr]> desc employee
    -> ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| emp_id     | varchar(20) | NO   | PRI | NULL    |       |
| f_name     | varchar(20) | NO   |     | NULL    |       |
| l_name     | varchar(20) | NO   |     | NULL    |       |
| email      | varchar(20) | YES  |     | NULL    |       |
| ph_no      | varchar(12) | YES  |     | NULL    |       |
| hired_date | date        | NO   |     | NULL    |       |
| job_id     | int(11)     | YES  |     | NULL    |       |
| comm       | int(11)     | YES  |     | NULL    |       |
| mgr_id     | varchar(30) | YES  | MUL | NULL    |       |
| dept_id    | varchar(20) | YES  | MUL | NULL    |       |
| sal        | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
11 rows in set (0.079 sec)



create table locations(
    -> location_id int(4) not null primary key,
    -> street_address varchar(40),
    -> postal_code varchar(12),
    -> city varchar(30) not null,
    -> state_province varchar(25),
    -> country_id char(2),
    -> foreign key(country_id) references countries(country_id)
    -> );
Query OK, 0 rows affected (0.502 sec)
MariaDB [hr]> desc locations;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| location_id    | int(4)      | NO   | PRI | NULL    |       |
| street_address | varchar(40) | YES  |     | NULL    |       |
| postal_code    | varchar(12) | YES  |     | NULL    |       |
| city           | varchar(30) | NO   |     | NULL    |       |
| state_province | varchar(25) | YES  |     | NULL    |       |
| country_id     | char(2)     | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.025 sec)

MariaDB [hr]> alter table departments
    -> add foreign key(location_id) references locations(location_id);
Query OK, 0 rows affected (1.050 sec)
Records: 0  Duplicates: 0  Warnings: 0


MariaDB [hr]> create table regions(
    -> region_id int not null primary key,
    -> region_name varchar(25)
    -> );
Query OK, 0 rows affected (0.259 sec)
MariaDB [hr]> desc regions;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| region_id   | int(11)     | NO   | PRI | NULL    |       |
| region_name | varchar(25) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.032 sec)

MariaDB [hr]> insert into jobs values (123, 'Accountant' , 15000 , 25000);
Query OK, 1 row affected (0.339 sec)

MariaDB [hr]> insert into jobs values (124, 'Team Leader' , 20000 , 30000);
Query OK, 1 row affected (0.087 sec)

MariaDB [hr]> insert into jobs values (125, 'Manager' , 25000 , 35000);
Query OK, 1 row affected (0.045 sec)

MariaDB [hr]> insert into jobs values (126, 'Executive' , 35000 , 50000);
Query OK, 1 row affected (0.052 sec)

MariaDB [hr]> insert into jobs values (127, 'CEO' , 40000 , 55000);
Query OK, 1 row affected (0.137 sec)

MariaDB [hr]> select *from jobs;
+--------+-------------+------------+------------+
| job_id | job_title   | min_salary | max_salary |
+--------+-------------+------------+------------+
| 123    | Accountant  |      15000 |      25000 |
| 124    | Team Leader |      20000 |      30000 |
| 125    | Manager     |      25000 |      35000 |
| 126    | Executive   |      35000 |      50000 |
| 127    | CEO         |      40000 |      55000 |
+--------+-------------+------------+------------+
5 rows in set (0.018 sec)


MariaDB [hr]> select *from jobs;
+--------+-------------+------------+------------+
| job_id | job_title   | min_salary | max_salary |
+--------+-------------+------------+------------+
| 123    | Accountant  |      15000 |      25000 |
| 124    | Team Leader |      20000 |      30000 |
| 125    | Manager     |      25000 |      35000 |
| 126    | Executive   |      35000 |      50000 |
| 127    | CEO         |      40000 |      55000 |
+--------+-------------+------------+------------+
5 rows in set (0.018 sec)

MariaDB [hr]> insert into regions values (7025, 'Manipur');
Query OK, 1 row affected (0.042 sec)

MariaDB [hr]> insert into regions values (7035, 'Nagaland');
Query OK, 1 row affected (0.060 sec)

MariaDB [hr]>  insert into regions values (7038, 'kolkata');
Query OK, 1 row affected (0.185 sec)

MariaDB [hr]>  insert into regions values (7040, 'delhi');
Query OK, 1 row affected (0.063 sec)

MariaDB [hr]>  insert into regions values (7045, 'bangaluru');
Query OK, 1 row affected (0.084 sec)

MariaDB [hr]> select * from regions
    -> ;
+-----------+-------------+
| region_id | region_name |
+-----------+-------------+
|      7025 | Manipur     |
|      7035 | Nagaland    |
|      7038 | kolkata     |
|      7040 | delhi       |
|      7045 | bangaluru   |
+-----------+-------------+
5 rows in set (0.000 sec)

MariaDB [hr]> delete from regions;
Query OK, 5 rows affected (1.279 sec)

MariaDB [hr]> insert into regions values(7025,'kolkata');
Query OK, 1 row affected (0.040 sec)

MariaDB [hr]> insert into regions values(7035,'Berlin');
Query OK, 1 row affected (0.071 sec)

MariaDB [hr]> insert into regions values(7051,'helsinki');
Query OK, 1 row affected (0.029 sec)

MariaDB [hr]> insert into regions values(7071,'nairobi');
Query OK, 1 row affected (0.146 sec)

MariaDB [hr]> insert into regions values(7063,'tokyo');
Query OK, 1 row affected (0.028 sec)

MariaDB [hr]> select * from regions;
+-----------+-------------+
| region_id | region_name |
+-----------+-------------+
|      7025 | kolkata     |
|      7035 | Berlin      |
|      7051 | helsinki    |
|      7063 | tokyo       |
|      7071 | nairobi     |
+-----------+-------------+
5 rows in set (0.001 sec)
MariaDB [hr]> insert into countries values (11, 'Germany' , 7035);
Query OK, 1 row affected (0.033 sec)

MariaDB [hr]> insert into countries values (12, 'India' , 7025);
Query OK, 1 row affected (0.169 sec)

MariaDB [hr]> insert into countries values (13, 'Finland' , 7051);
Query OK, 1 row affected (0.041 sec)

MariaDB [hr]> insert into countries values (14, 'kenya' , 7071);
Query OK, 1 row affected (0.085 sec)

MariaDB [hr]> insert into countries values (15, 'Japan' , 7063);
Query OK, 1 row affected (0.068 sec)

MariaDB [hr]> select * from countries;
+------------+--------------+-----------+
| country_id | country_name | region_id |
+------------+--------------+-----------+
| 11         | Germany      |      7035 |
| 12         | India        |      7025 |
| 13         | Finland      |      7051 |
| 14         | kenya        |      7071 |
| 15         | Japan        |      7063 |
+------------+--------------+-----------+
5 rows in set (0.001 sec)


MariaDB [hr]>  insert into locations values (127880, '14/7 p.majumder road', '700078' , 'Westbengal' , 'kolkata', 12);
Query OK, 1 row affected (0.157 sec)


MariaDB [hr]>  insert into locations values (127887, 'Laajalahdentie 23', '00330' , 'Uusimaa' , 'helsinki', 13);
Query OK, 1 row affected (0.053 sec)

MariaDB [hr]>  insert into locations values (127889, '7 Chome-3-1 Hongo', '113-8654' , 'Kantō' , 'tokyo', 15);
Query OK, 1 row affected (0.058 sec)

MariaDB [hr]>  insert into locations values (127890, 'Badensche Str. 52', '10825' , 'Brandenburg' , 'Berlin', 11);
Query OK, 1 row affected (0.055 sec)

MariaDB [hr]>  insert into locations values (127891, 'Karen Rd', '18725' , 'nairobi' , 'nairobi', 14);
Query OK, 1 row affected (0.047 sec)

MariaDB [hr]> select * from locations;
+-------------+----------------------+-------------+-------------+----------------+------------+
| location_id | street_address       | postal_code | city        | state_province | country_id |
+-------------+----------------------+-------------+-------------+----------------+------------+
|      127880 | 14/7 p.majumder road | 700078      | Westbengal  | kolkata        | 12         |
|      127887 | Laajalahdentie 23    | 00330       | Uusimaa     | helsinki       | 13         |
|      127889 | 7 Chome-3-1 Hongo    | 113-8654    | Kanto       | tokyo          | 15         |
|      127890 | Badensche Str. 52    | 10825       | Brandenburg | Berlin         | 11         |
|      127891 | Karen Rd             | 18725       | nairobi     | nairobi        | 14         |
+-------------+----------------------+-------------+-------------+----------------+------------+
5 rows in set (0.000 sec)

MariaDB [hr]> insert into employee values('E125','Suresh','Kumar','suresh.kumar@gmail.com','+917850632541','2017/10/13',123,NULL,NULL,'D1396',15000);
Query OK, 1 row affected, 2 warnings (0.067 sec)

MariaDB [hr]> insert into dept values('D1389','Sales',127880);
Query OK, 1 row affected (0.044 sec)

MariaDB [hr]> insert into dept values('D2589','Shipping',127887);
Query OK, 1 row affected (0.050 sec)


MariaDB [hr]>  insert into dept values('D2679','IT',127890);
Query OK, 1 row affected (0.114 sec)

MariaDB [hr]>  insert into dept values('D2679','ITinsert into dept values('D1859','Public Relations',137877);',127891);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'D1859','Public Relations',137877);',127891)' at line 1
MariaDB [hr]> insert into dept values('D1859','Public Relations',127891);
Query OK, 1 row affected (0.082 sec)

MariaDB [hr]> insert into dept values('D1559','Human Resources',127880);
Query OK, 1 row affected (0.061 sec)

MariaDB [hr]>  insert into dept values('D4059','Accounting',127880);
Query OK, 1 row affected (0.059 sec)

MariaDB [hr]> insert into dept values('D7559','Marketing',127887);
Query OK, 1 row affected (0.108 sec)

MariaDB [hr]> select *from dept;
+---------+------------------+-------------+
| dept_id | dept_name        | location_id |
+---------+------------------+-------------+
| D1389   | Sales            |      127880 |
| D1396   | Administration   |      127887 |
| D1559   | Human Resources  |      127880 |
| D1859   | Public Relations |      127891 |
| D2589   | Shipping         |      127887 |
| D2679   | IT               |      127890 |
| D4059   | Accounting       |      127880 |
| D7559   | Marketing        |      127887 |
+---------+------------------+-------------+
8 rows in set (0.001 sec)

MariaDB [hr]> alter table dept add mgr_id varchar(30);
Query OK, 0 rows affected (0.283 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [hr]> alter table dept add foreign key(mgr_id) references employee(emp_id);
Query OK, 8 rows affected (1.276 sec)
Records: 8  Duplicates: 0  Warnings: 0


MariaDB [hr]> insert into employee values('E420','Sumeli','Rani','sumeli.rani@gmail.com','+728500632541','2017/09/23',124,1500,'E125','D1389',10000);
Query OK, 1 row affected, 2 warnings (0.119 sec)

MariaDB [hr]>  update dept set mgr_id='E420' where dept_id='D1389';
Query OK, 1 row affected (0.035 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [hr]> insert into employee values('E442','Rani','Shraddha','s.rani@gmail.com','+728500688541','2018/09/13',126,1200,'E420','D1389',8000);
Query OK, 1 row affected, 1 warning (0.048 sec)

MariaDB [hr]>  update dept set mgr_id='E420' where dept_id='D1389';
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [hr]> insert into employee values('E422','Raghav','Singh','s.raghav@gmail.com','+818588552541','2018/10/10',124,NULL,'E125','D2679',12000);
Query OK, 1 row affected, 1 warning (0.057 sec)

MariaDB [hr]> update employee set job_id=127 where emp_id='E125';
Query OK, 1 row affected (0.107 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [hr]>  insert into employee values('E252','Sia','Bundela','s.bundela@gmail.com','+818586655541','2018/12/10',123,NULL,'E125','D7559',16000);
Query OK, 1 row affected, 1 warning (0.051 sec)

MariaDB [hr]> insert into employee values('E239','Riya','Shaw','r.shaw@gmail.com','+819874655541','2018/12/12',126,NULL,'E252','D7559',16000);
Query OK, 1 row affected, 1 warning (0.122 sec)

MariaDB [hr]>  insert into employee values('E519','Anita','Misra','a.misra@gmail.com','+819877754841','2017/12/12',124,NULL,'E125','D4059',20000);
Query OK, 1 row affected, 1 warning (0.055 sec)


MariaDB [hr]> insert into employee values('E127','Pankaj','Dev','p.dev@gmail.com','+919563214891','2017/08/17',126,NULL,'E125','D1859',19000);
Query OK, 1 row affected, 1 warning (0.050 sec)

MariaDB [hr]> update dept set mgr_id = 'E125' where dept_id = 'D1396';
Query OK, 1 row affected (0.051 sec)
Rows matched: 1  Changed: 1  Warnings: 0


MariaDB [hr]> update dept set mgr_id = 'E127' where dept_id = 'D1859';
Query OK, 1 row affected (0.133 sec)
Rows matched: 1  Changed: 1  Warnings: 0


MariaDB [hr]>  update dept set mgr_id = 'E422' where dept_id = 'D2679';
Query OK, 1 row affected (0.140 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [hr]> update dept set mgr_id = 'E519' where dept_id = 'D4059';
Query OK, 1 row affected (0.055 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [hr]> update dept set mgr_id = 'E252' where dept_id = 'D7559';
Query OK, 1 row affected (0.041 sec)
Rows matched: 1  Changed: 1  Warnings: 0


MariaDB [hr]> select *from dept;
+---------+------------------+-------------+--------+
| dept_id | dept_name        | location_id | mgr_id |
+---------+------------------+-------------+--------+
| D1389   | Sales            |      127880 | E420   |
| D1396   | Administration   |      127887 | E125   |
| D1559   | Human Resources  |      127880 | NULL   |
| D1859   | Public Relations |      127891 | E127   |
| D2589   | Shipping         |      127887 | NULL   |
| D2679   | IT               |      127890 | E422   |
| D4059   | Accounting       |      127880 | E519   |
| D7559   | Marketing        |      127887 | E252   |
+---------+------------------+-------------+--------+
8 rows in set (0.001 sec)

MariaDB [hr]> select * from employee;
+--------+--------+----------+----------------------+--------------+------------+--------+------+--------+---------+-------+
| emp_id | f_name | l_name   | email                | ph_no        | hired_date | job_id | comm | mgr_id | dept_id | sal   |
+--------+--------+----------+----------------------+--------------+------------+--------+------+--------+---------+-------+
| E125   | Suresh | Kumar    | suresh.kumar@gmail.c | +91785063254 | 2017-10-13 |    127 | NULL | NULL   | D1396   | 15000 |
| E127   | Pankaj | Dev      | p.dev@gmail.com      | +91956321489 | 2017-08-17 |    126 | NULL | E125   | D1859   | 19000 |
| E239   | Riya   | Shaw     | r.shaw@gmail.com     | +81987465554 | 2018-12-12 |    126 | NULL | E252   | D7559   | 16000 |
| E252   | Sia    | Bundela  | s.bundela@gmail.com  | +81858665554 | 2018-12-10 |    123 | NULL | E125   | D7559   | 16000 |
| E420   | Sumeli | Rani     | sumeli.rani@gmail.co | +72850063254 | 2017-09-23 |    124 | 1500 | E125   | D1389   | 10000 |
| E422   | Raghav | Singh    | s.raghav@gmail.com   | +81858855254 | 2018-10-10 |    124 | NULL | E125   | D2679   | 12000 |
| E442   | Rani   | Shraddha | s.rani@gmail.com     | +72850068854 | 2018-09-13 |    126 | 1200 | E420   | D1389   |  8000 |
| E519   | Anita  | Misra    | a.misra@gmail.com    | +81987775484 | 2017-12-12 |    124 | NULL | E125   | D4059   | 20000 |
+--------+--------+----------+----------------------+--------------+------------+--------+------+--------+---------+-------+
8 rows in set (0.001 sec)

MariaDB [hr]> create table job_history(
    ->  emp_id varchar(10),
    ->  start_date date not NULL,
    ->  end_date date not NULL,
    ->      job_id int ,
    ->     dept_id varchar(30),
    ->      foreign key(emp_id) references employee(emp_id),
    ->      foreign key(job_id) references jobs(job_id),
    ->      foreign key(dept_id) references dept(dept_id),primary key(emp_id, start_date));
Query OK, 0 rows affected (0.442 sec)

MariaDB [hr]> desc  job_history;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| emp_id     | varchar(10) | NO   | PRI | NULL    |       |
| start_date | date        | NO   | PRI | NULL    |       |
| end_date   | date        | NO   |     | NULL    |       |
| job_id     | int(11)     | YES  | MUL | NULL    |       |
| dept_id    | varchar(30) | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.035 sec)

MariaDB [hr]> insert into job_history values('E125','2017/10/13','2020/04/12',127,'D1396');
Query OK, 1 row affected (0.065 sec)


MariaDB [hr]> insert into job_history values('E127','2017/08/17','2020/04/12',126,'D1859');
Query OK, 1 row affected (0.053 sec)

MariaDB [hr]> insert into job_history values('E239','2018/12/12','2020/04/12',126,'D7559');
Query OK, 1 row affected (0.050 sec)

MariaDB [hr]> insert into job_history values('E420','2017/09/23','2020/04/12',124,'D1389');
Query OK, 1 row affected (0.048 sec)

MariaDB [hr]> insert into job_history values('E422','2018/10/10','2019/04/05',124,'D2679');
Query OK, 1 row affected (0.046 sec)

MariaDB [hr]> select * from job_history;
+--------+------------+------------+--------+---------+
| emp_id | start_date | end_date   | job_id | dept_id |
+--------+------------+------------+--------+---------+
| E125   | 2017-10-13 | 2020-04-12 |    127 | D1396   |
| E127   | 2017-08-17 | 2020-04-12 |    126 | D1859   |
| E239   | 2018-12-12 | 2020-04-12 |    126 | D7559   |  
| E420   | 2017-09-23 | 2020-04-12 |    124 | D1389   |
| E422   | 2018-10-10 | 2019-04-05 |    124 | D2679   |
+--------+------------+------------+--------+---------+
7 rows in set (0.001 sec)




MariaDB [hr]> insert into job_history values('E442','2018/09/13','2018/12/12',126,'D1389');
Query OK, 1 row affected (0.054 sec)

MariaDB [hr]> insert into job_history values('E519','2017/12/12','2020/04/12',124,'D4059');
Query OK, 1 row affected (0.041 sec)


MariaDB [hr]> update job_history set end_date='2019/08/15' where emp_id='E239';
Query OK, 1 row affected (0.059 sec)
Rows matched: 1  Changed: 1  Warnings: 0


MariaDB [hr]> update job_history set end_date='2019/12/12' where emp_id='E239';
Query OK, 1 row affected (0.074 sec)
Rows matched: 1  Changed: 1  Warnings: 0


MariaDB [hr]> select * from job_history;
+--------+------------+------------+--------+---------+
| emp_id | start_date | end_date   | job_id | dept_id |
+--------+------------+------------+--------+---------+
| E125   | 2017-10-13 | 2020-04-12 |    127 | D1396   |
| E127   | 2017-08-17 | 2020-04-12 |    126 | D1859   |
| E239   | 2018-12-12 | 2019-12-12 |    126 | D7559   |
| E252   | 2018-12-10 | 2020-04-12 |    123 | D7559   |
| E420   | 2017-09-23 | 2020-04-12 |    124 | D1389   |
| E422   | 2018-10-10 | 2019-04-05 |    124 | D2679   |
| E442   | 2018-09-13 | 2018-12-12 |    126 | D1389   |
| E519   | 2017-12-12 | 2020-04-12 |    124 | D4059   |
+--------+------------+------------+--------+---------+
10 rows in set (0.001 sec)



