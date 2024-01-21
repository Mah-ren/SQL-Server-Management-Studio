create database DefaultConstraint

use DefaultConstraint

create table persons(
	id  int not null,
	name nvarchar(100) default 'Mahmoud Ahmed'
);

select * from persons;

alter table persons
add constraint df_country
default 1 for id

--use master
--exec sp_renamedb 'DefaultConstraint', 'Constraint';

alter table persons
add age int check (age >= 18);

select * from persons
insert into persons
values
(2, 'eye', 'eye', 18);

create table Employees(
	id int,
	name nvarchar(100),
	age int,
	 constraint check_person check (age <= 18 and age >= 9 and id <> 10)
);
