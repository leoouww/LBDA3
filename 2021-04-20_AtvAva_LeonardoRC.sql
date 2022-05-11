create database seguro;

show databases;

use seguro;

show tables;

desc carro;

describe possui;

create table pessoa(
idmotorista int(11),
nome varchar(45),
endereco varchar(250),

Primary Key (idmotorista)
); 

create table carro(
renavam int(11),
modelo varchar(45),
ano date, 

primary key (renavam)
);

create table acidente(
num_sinistro int(11),
data date,
local varchar(45),

primary key (num_sinistro)
);

create table possui(
idmotorista int(11),
renavam int(11),

primary key (idmotorista, renavam),
foreign key (idmotorista) references pessoa(idmotorista) on delete cascade on update cascade,
foreign key (renavam) references carro(renavam) on delete cascade on update cascade
);

create table participou(
num_sinistro int(11),
renavam int(11),
idmotorista int(11),
valor_dano decimal(10,2),

primary key (num_sinistro, renavam),
foreign key (num_sinistro) references acidente(num_sinistro) on delete cascade on update cascade,
foreign key (renavam) references carro(renavam) on delete cascade on update cascade,
foreign key (idmotorista) references pessoa(idmotorista) on delete cascade on update cascade
);

insert into pessoa values ('00000000000','Zero da Silva', 'Rua Zero, 15');
/*onde as informações entre parênteses vão ser diferentes para cada registro inserido, sobretudo a chave candidata idmotorista*/

insert into carro values ('1111111111','modelo A', '2000/01/01');
/*onde as informações entre parênteses vão ser diferentes para cada registro inserido, sobretudo a chave candidata renavam*/ 

insert into acidente values ('222222222','2021/06/30','local');
/*onde as informações entre parênteses vão ser diferentes para cada registro inserido, sobretudo a chave candidata num_sinistro*/

insert into possui values ('00000000000','1111111111');

insert into participou values ('35188412','1025698899','1025698899','1.00');

select * from possui;



