use CSC455_Classwork;
drop table if exists CSC455_Classwork.Assignment2.employees ;
drop table if exists CSC455_Classwork.Assignment2.parts; 
drop table if exists CSC455_Classwork.Assignment2.customers; 
drop table if exists CSC455_Classwork.Assignment2.orders;
drop table if exists CSC455_Classwork.Assignment2.odetails;
drop table if exists CSC455_Classwork.Assignment2.zipcodes;

create table CSC455_Classwork.Assignment2.zipcodes
	(ZIP		int not null, 
	 CITY		varchar(20)
	 primary key (ZIP)
	)
	
create table CSC455_Classwork.Assignment2.employees
	(ENO		smallint not null,
	 ENAME		varchar(15),
	 ZIP		int,
	 HDATE		date,
	 primary key (ENO),
	 foreign key (zip) references CSC455_Classwork.Assignment2.zipcodes(ZIP)
	)

create table CSC455_Classwork.Assignment2.parts
	(PNO		int not null, 
	 PNAME		varchar(50), 
	 QOH		smallint,
	 PRICE		numeric(4,2),
	 LEVEL		tinyint,
	 primary key (PNO),
	)

create table CSC455_Classwork.Assignment2.customers
	(CNO			smallint not null, 
	 CNAME			varchar(20) not null, 
	 STREET 		varchar(50), 
	 ZIP			int,
	 PHONE			varchar(15)
	 primary key (CNO),
	 foreign key (zip) references CSC455_Classwork.Assignment2.zipcodes(zip)
	)

create table CSC455_Classwork.Assignment2.orders
	(ONO			smallint not null,
	CNO				smallint not null,
	ENO				smallint not null,
	RECEIVED		date not null,
	SHIPPED			date,
	 primary key (ONO),
	 foreign key (CNO) references CSC455_Classwork.Assignment2.customers(CNO),
	 foreign key (ENO) references CSC455_Classwork.Assignment2.employees(ENO)
	)

create table CSC455_Classwork.Assignment2.odetails
	(ONO			smallint not null, 
	 PNO			int not null,
	 QTY			tinyint, 
	 primary key (ONO, PNO),
	 foreign key (ONO) references CSC455_Classwork.Assignment2.orders(ONO) ,
	 foreign key (PNO) references CSC455_Classwork.Assignment2.parts(PNO)
	)