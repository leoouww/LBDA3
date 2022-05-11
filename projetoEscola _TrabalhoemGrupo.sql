/*
Projeto BANCO DE DADOS:
NOME:Leonardo Rodrigues de Castro PT3008479
NOME:Lorrans Matildes PT3010376
NOME:Luís Antônio Nascimento Júnior PT3009696
NOME:Thiago da Silva Ferreira PT300984X
 */


create database projetoEscola;

use projetoEscola;

create table alunos(
	matricula varchar(8),
	nome varchar(30),
	rua varchar(30),
	numero int,
	cep varchar(10),
	cidade varchar(10),
	primary key (matricula)
);
create table telefone_aluno(
    matricula_aluno varchar(8),
	telefone varchar(15),
	primary key (matricula_aluno, telefone),
	foreign key (matricula_aluno) references Alunos(matricula)on delete cascade on update cascade
);
create table professores(
	cod_prof varchar(5),
	nome varchar(30),
	endereco varchar(50),
	cidade varchar(20),
	primary key (cod_prof)
);

create table cursos(
	cod_curso int not null auto_increment,
	nome varchar(50),
	primary key (cod_curso)
);	

create table disciplinas(
	codigo int not null auto_increment,
	nome varchar(30),
	carga_horario int,
	cod_curso int,
	primary key (codigo),
    foreign key (cod_curso) references cursos(cod_curso) on delete cascade on update cascade
);
create table turma (
	codigo int,
    cod_turma int not null auto_increment,
    cod_prof varchar(5),
    ano numeric(4,0),
    periodo varchar(10),
    primary key (cod_turma),
    foreign key (codigo) references disciplinas(codigo) on delete cascade on update cascade,
    foreign key (cod_prof) references professores(cod_prof) on delete cascade on update cascade
);
 create table historico(
	codigo int,
    matricula varchar(8),
    cod_turma int,
    cod_prof varchar(5),
	ano numeric(4,0),
    frequencia int,
    nota int, 
    primary key(codigo,matricula,cod_turma,cod_prof),
    foreign key (codigo) references disciplinas(codigo)on delete cascade on update cascade,
    foreign key (matricula) references alunos(matricula)on delete cascade on update cascade,
    foreign key (cod_turma) references turma(cod_turma)on delete cascade on update cascade,
    foreign key (cod_prof) references professores(cod_prof)on delete cascade on update cascade
 );

-- 1- Adicione 5 registros em cada uma das tabelas; (0,5)
-- add alunos
insert into alunos values ('RA187258','Adriano Silva','pedro valdivia','10','06879-005','Sao Paulo');
insert into alunos values ('RA187259','Pedro Henrique','av goncalves','21','06879-105','Sao Paulo');
insert into alunos values ('RA187260','Mateus Araujo','boa vista','410','06849-004','Sao Paulo');
insert into alunos values ('RA187261','Neymar Junior','25 de marco','140','06879-052','Sao Paulo');
insert into alunos values ('RA187262','Roberto Barros','9 de julho','16','06879-200','Sao Paulo');

-- add telefone
insert into telefone_aluno values ('RA187258','11-99876-4456');
insert into telefone_aluno values ('RA187259','11-97863-4788');
insert into telefone_aluno values ('RA187260','11-96541-5101');
insert into telefone_aluno values ('RA187261','11-96358-9874');
insert into telefone_aluno values ('RA187262','11-94789-2263');

-- add professores
insert into professores values ('RP001','Renato Dias','Rua Cafeilandia,30', 'Barueri');
insert into professores values ('RP002','Lindomar Rosa','Rua Jesus,10', 'São Paulo');
insert into professores values ('RP003','Lucas Bianco','Avenida Xingu,122', 'Jandira');
insert into professores values ('RP004','Pedro Lobo','Rua Dos Cantos,30', 'Osasco');
insert into professores values ('RP005','Larissa Diniz','Travessa Vinte e Cinco,1', 'Barueri');

-- add cursos
insert into cursos (nome) values ('Analise e Desenvolvimento de Sistemas');
insert into cursos (nome) values ('Letras');
insert into cursos (nome) values ('Engenharia elétrica');
insert into cursos (nome) values ('Administração');
insert into cursos (nome) values ('Arquitetura');

-- add disciplinas 
insert into disciplinas values (default,'Banco de Dados','40','1');
insert into disciplinas values (default,'Ingles','20','2');
insert into disciplinas values (default,'Fisica','50','3');
insert into disciplinas values (default,'Contabilidade','30','4');
insert into disciplinas values (default,'Redes','10','5');

-- add turmas
insert into turma (codigo, cod_prof, ano, periodo) values (1, 'RP001', 2018, 'manhã');
insert into turma (codigo, cod_prof, ano, periodo) values (2, 'RP002', 2016, 'tarde');
insert into turma (codigo, cod_prof, ano, periodo) values (3, 'RP003', 2018, 'noite');
insert into turma (codigo, cod_prof, ano, periodo) values (4, 'RP004', 2017, 'noite');
insert into turma (codigo, cod_prof, ano, periodo) values (5, 'RP005', 2017, 'tarde');
select * from turma;

-- add historico
insert into historico values ('1','RA187259','1','RP001','2018','60','5');
insert into historico values ('3','RA187258','3','RP002','2020','90','10');
insert into historico values ('2','RA187260','2','RP003','2018','70','4');
insert into historico values ('2','RA187261','2','RP003','2021','80','5');
insert into historico values ('1','RA187262','1','RP001','2019','76','9');

/* 2-	Adicione uma nova tabela a base de dados que contenha pelo menos 3 colunas.
Adicione 5 registros a essa tabela (0,5) */
create table biblioteca(
	id_livro int not null,
    nome varchar(30),
    matricula varchar(8),
    primary key (id_livro),
	foreign key (matricula) references alunos(matricula)on delete cascade on update cascade
);
insert into biblioteca values ('160','Fundamentos de Fisica','RA187258');
insert into biblioteca values ('200','O livro da Fisica','RA187258');
insert into biblioteca values ('488','Fisica para Universitarios','RA187258');
insert into biblioteca values ('654','SQL para leigos','RA187262');
insert into biblioteca values ('401','Moby Dick','RA187261');

/* 3-	Altere a tabela criada no exercício 2 de maneira a
incluir uma nova coluna que possua o tipo DATA; (0,5) */
alter table biblioteca add column data_retirada date;
update biblioteca set data_retirada = '2021-05-06' where id_livro = 160;
update biblioteca set data_retirada = '2021-05-06' where id_livro = 488;
update biblioteca set data_retirada = '2021-05-06' where id_livro = 200;
update biblioteca set data_retirada = '2021-10-23' where id_livro = 401;
update biblioteca set data_retirada = '2021-08-24' where id_livro = 654;

-- 4 - Atualize a Carga horária de todas as disciplinas com um aumento de 10%.
-- exemplo 1
Update disciplinas set carga_horario = carga_horario * 0.10 + carga_horario where codigo <> 0;
-- exemplo 2
/*update disciplinas set carga_horario = carga_horario*0.10 + carga_horario where codigo = '1';
update disciplinas set carga_horario = carga_horario*0.10 + carga_horario where codigo = '2';
update disciplinas set carga_horario = carga_horario*0.10 + carga_horario where codigo = '3';
update disciplinas set carga_horario = carga_horario*0.10 + carga_horario where codigo = '4';
update disciplinas set carga_horario = carga_horario*0.10 + carga_horario where codigo = '5';*/

/*5 - Pesquise por todos os alunos com nota inferior a 6 que realizaram
a disciplina BANCO DE DADOS durante os anos de 2015 a 2019.
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0)*/
select alunos.nome, nota from alunos,historico 
where alunos.matricula = historico.matricula 
and nota < '6'
and ano between 2015 and 2019 and codigo = '1';

/* 6 - Pesquise por todas as disciplinas que o aluno “RA187258” cursou
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0)*/
select disciplinas.nome from historico,disciplinas
where disciplinas.codigo = historico.codigo
and matricula = 'ra187258';

/* 7 - Pesquise por todas as disciplinas de cada curso. Ordene o resultado por nome do
curso em ordem crescente e pelo nome da disciplina em ordem decrescente. (1,0)*/

-- add um registro para visualizar melhor o resultado do comando
 insert into disciplinas values (default, 'Logistica','50','4');

 select cursos.nome as 'Curso', disciplinas.nome as 'Disciplina'
 from cursos,disciplinas where cursos.cod_curso = disciplinas.cod_curso
 order by cursos.nome, disciplinas.nome desc;

/*8 - Pesquise a quantidade de disciplina que cada curso possui.
Informe o nome do curso seguido pela Quantidade.
Utilize Alias para renomear a coluna com a quantidade de disciplinas. (1,0)*/

 select cursos.nome as 'Curso', count(*) as 'Quantidade de Disciplinas'
 from cursos,disciplinas where cursos.cod_curso = disciplinas.cod_curso
 group by cursos.nome;

-- 9 - Informe o nome de todos os professores que lecionaram em turmas no ano de 2018. (1,0)

select nome from professores,historico
where professores.cod_prof = historico.cod_prof and ano = '2018';

/* 10-	Identifique a quantidade de alunos que reprovaram por frequência (<75%) em cada disciplina.
Agrupe o resultado por nome da disciplina. (1,0)*/

select nome as 'Disciplina', count(*) as 'Quantidade de reprovados'
from disciplinas, historico
where disciplinas.codigo = historico.codigo
and frequencia < 75 group by disciplinas.nome;

/* 11-	Selecione a nota e o nome dos alunos que tiveram a
maior nota na disciplina de Banco de Dados
(Obs. Seu comando deve identificar qual é a maior nota). (1,0)*/

select nome, max(nota) from alunos,historico
where alunos.matricula = historico.matricula and codigo = '1';

/* 12-	Crie um comando utilizando LEFT JOIN
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0)*/

select * from alunos left join biblioteca
on alunos.matricula = biblioteca.matricula;
