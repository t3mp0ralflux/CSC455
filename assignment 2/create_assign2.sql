drop table if exists odetails;
drop table if exists orders;
drop table if exists customers; 
drop table if exists parts;
drop table if exists employees;
drop table if exists zipcodes;

create table zipcodes
	(ZIP		int not null, 
	 CITY		varchar(20),
	 primary key (ZIP)
	) ENGINE = INNODB;
	
create table employees
	(ENO		smallint not null,
	 ENAME		varchar(15),
	 ZIP		int,
	 HDATE		date,
	 primary key (ENO),
	 foreign key (zip) references zipcodes(ZIP)
	) ENGINE = INNODB;

create table parts
	(PNO		int not null, 
	 PNAME		varchar(50), 
	 QOH		smallint,
	 PRICE		numeric(4,2),
	 LEVEL		tinyint,
	 primary key (PNO)
	) ENGINE = INNODB;

create table customers
	(CNO			smallint not null, 
	 CNAME			varchar(20) not null, 
	 STREET 		varchar(50), 
	 ZIP			int,
	 PHONE			varchar(15),
	 primary key (CNO),
	 foreign key (zip) references zipcodes(zip)
	) ENGINE = INNODB;

create table orders
	(ONO			smallint not null,
	CNO				smallint not null,
	ENO				smallint not null,
	RECEIVED		date not null,
	SHIPPED			date,
	 primary key (ONO),
	 foreign key (CNO) references customers(CNO) on delete cascade,
	 foreign key (ENO) references employees(ENO)
	) ENGINE = INNODB;

create table odetails
	(ONO			smallint not null, 
	 PNO			int not null,
	 QTY			tinyint,
	 CHECK (QTY>0),	 
	 primary key (ONO, PNO),
	 foreign key (ONO) references orders(ONO) on delete cascade,
	 foreign key (PNO) references parts(PNO)
	) ENGINE = INNODB;