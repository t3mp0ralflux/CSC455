USE --insert database name here--
drop table if exists employees ;
drop table if exists parts; 
drop table if exists customers; 
drop table if exists orders;
drop table if exists odetails;
drop table if exists zipcodes;

create table zipcodes
	(ZIP		int not null, 
	 CITY		varchar(20)
	 primary key (ZIP)
	)
	
create table employees
	(ENO		smallint not null,
	 ENAME		varchar(15),
	 ZIP		int,
	 HDATE		date,
	 primary key (ENO),
	 foreign key (zip) references zipcodes(ZIP)
	)

create table parts
	(PNO		int not null, 
	 PNAME		varchar(50), 
	 QOH		smallint,
	 PRICE		numeric(4,2),
	 LEVEL		tinyint,
	 primary key (PNO),
	)

create table customers
	(CNO			smallint not null, 
	 CNAME			varchar(20) not null, 
	 STREET 		varchar(50), 
	 ZIP			int,
	 PHONE			varchar(15)
	 primary key (CNO),
	 foreign key (zip) references zipcodes(zip)
	)

create table orders
	(ONO			smallint not null,
	CNO				smallint not null,
	ENO				smallint not null,
	RECEIVED		date not null,
	SHIPPED			date,
	 primary key (ONO),
	 foreign key (CNO) references customers(CNO),
	 foreign key (ENO) references employees(ENO)
	)

create table odetails
	(ONO			smallint not null, 
	 PNO			int not null,
	 QTY			tinyint check >0, 
	 primary key (ONO, PNO),
	 foreign key (ONO) references orders(ONO),
	 foreign key (PNO) references parts(PNO)
	);