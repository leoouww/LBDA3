create database Locadora;

use Locadora;

create table cliente(
	CPF varchar(14), /* 000.000.000-00 */
    Nome varchar(25) NOT NULL,
    Nascimento date, /* YYYY/MM/DD */
    CEP varchar(10), /*00.000-000 */
    Rua varchar(100),
    Número varchar(10) default '0000000000',
    
    primary key (CPF)
);
insert into cliente values ('321.321.321-76', 'Rogerio', '1989/02/21', '12.433-200', 'José Ramalho','1000');
insert into cliente values ('321.321.321-76', 'Ana', '1989/02/21', '12.433-200', 'José Ramalho','1000'); /* erro */
insert into cliente values ('222.333.444-55', 'Pedro', '1989/02/21', '12.433-200', 'José Ramalho','1000');
insert into cliente (Nome, CPF) values ('Paulo', '555.555.555-33');
insert into cliente (CPF) values ('666.666.555-33'); /* erro */


create table jogo(
	Código int AUTO_INCREMENT,
    Nome varchar(30) NOT NULL,
    Data_Lançamento DATE,
    Plataforma varchar(100),
    Descrição varchar(200),
    Gênero varchar(100),
    
    primary key (Código)
);

insert into jogo values (null, 'Matrix', '1999/02/03', 'PS2', 'Jogo Novo', 'Ação');
insert into jogo (Nome, Gênero) values ('Harry Potter', 'Aventura');
delete from jogo where Código=2;
/* insert into jogo (Data_Lançamento) values ('2000/01/01') where Gênero='Aventura';   Ainda não deu certo - perguntar ao professor*/

select * from Locadora.jogo;

create table Locação(
	NumeroPedido int,
    CPF_Cliente varchar(14) NOT NULL,
    
    primary key (NumeroPedido),
    foreign key (CPF_Cliente) references cliente(CPF) on delete cascade on update cascade 
);


create table Videogame(
	Código int auto_increment,
    Nome varchar(100),
    DataCompra date,
    CPF varchar(14),
    qtd_horas int,
    
    primary key (Código),
    foreign key (CPF) references cliente(CPF) on delete cascade on update cascade
); 

create table Telefones_Cliente(
    CPF varchar(14),
    Telefones varchar(14),
    
    primary key (CPF, Telefones),
    foreign key (CPF) references cliente(CPF)
);

insert into Telefones_Cliente values ('351.884.128-96', '(11)94068-2251');
insert into Telefones_Cliente values ('351.884.128-96', '(11)94068-2252');
insert into Telefones_Cliente values ('351.884.128-99', '(11)94068-2251');
insert into Telefones_Cliente values ('351.884.128-99', '(11)94068-2251'); /* ERRO: Essa query dará erro porque a tabela tem duas chaves primárias e ela não aceita que as duas sejam iguais */

create table Cliente_Jogo(
	Codigo int,
    CPF varchar(14),
    Data_Solicitacao date,
    
    primary key (Codigo, CPF),
    foreign key (CPF) references cliente(CPF) on delete cascade on update cascade,
    foreign key (Codigo) references Jogo(Codigo) on delete cascade on update cascade
	
);

create table Locacao_Jogo(
	NumeroPedido int,
    Codigo int,
    
    primary key(NumeroPedido, Codigo),
    foreign key (NumeroPedido) references locação(NumeroPedido) on delete cascade on update cascade,
    foreign key (Codigo) references jogo(Código) on delete cascade on update cascade
);

delete from cliente where CPF='321.321.321-76';

show tables; /* Comando que mostra todas tabelas criadas */

desc cliente; /*Comando para apresentar o específico da tabela cliente */ 
    