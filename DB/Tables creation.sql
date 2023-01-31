create table Users
(
id_user		int identity,
username	varchar(20),
passwd		varchar(20),
constraint pk_users PRIMARY KEY (id_user)
)

create table Wallets
(
id_wallet	int identity,
walletName	varchar(20),
constraint pk_wallets PRIMARY KEY(id_wallet)
)

create table Wallets_x_users
(
id_user		int ,
id_wallet	int ,
constraint pk_wallets_x_users PRIMARY KEY (id_user,id_wallet),
constraint fk_wallet_x_user_user FOREIGN KEY (id_user) REFERENCES users(id_user),
constraint fk_wallet_x_user_wallet FOREIGN KEY (id_wallet) REFERENCES wallets(id_wallet),
)

create table FixedExpense
(
id_fixedExpense	int identity,
mount			decimal(18,2),
name			varchar(15),
description		varchar(100),
constraint pk_fixedExpense PRIMARY KEY(id_fixedExpense)
)

create table FixedExpense_x_wallets
(
id_fixedExpense		int,
id_wallet			int,
constraint pk_fixedExpense_x_wallets PRIMARY KEY(id_fixedExpense, id_wallet),
constraint fk_fixedExpense_x_wallets_fixedExpense FOREIGN KEY (id_fixedExpense) REFERENCES FixedExpense (id_fixedExpense),
constraint fk_fixedExpense_x_wallets_wallet FOREIGN KEY (id_wallet) REFERENCES wallets (id_wallet),
)

create table TypeOfMovements
(
id_typeMovement		int identity,
name				varchar(20),
constraint pk_typeOfMovements PRIMARY KEY(id_typeMovement)
)

create table Clasifications
(
id_clasification	int identity,
name				varchar(20),
description			varchar(100),
constraint pk_clasification	PRIMARY KEY (id_clasification)
)

create table Persons
(
idPerson	int identity,
name		varchar(20),
surname		varchar(20),
debt		decimal(18,2),
constraint pk_person PRIMARY KEY(idPerson)
)

create table Movements
(
id_movement			int identity,
id_wallet			int not null,
descrip				varchar(100),
isDebt				varchar(1) default 'N',
idDeudor			int,
mount				decimal(18,2) not null,
id_typeMovement		int not null,
id_clasification	int not null,
date				datetime not null,
constraint pk_movement PRIMARY KEY (id_movement),
constraint fk_movement_wallet FOREIGN KEY (id_wallet) REFERENCES Wallets(id_wallet),
constraint fk_movement_typeOfMovement FOREIGN KEY (id_typeMovement) REFERENCES typeOfMovements(id_typeMovement),
constraint fk_movement_clasification FOREIGN KEY (id_clasification) REFERENCES clasifications (id_clasification),
constraint fk_movement_person FOREIGN KEY (idDeudor) REFERENCES persons (idPerson)
)

create database WalletManagerDB
use WalletManagerDB
select * from movements
insert into Users values('gastonmastra','123')