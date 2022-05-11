/*
	LEONARDO RODRIGUES DE CASTRO
    PT3008479
    
    Atividade Não Avaliativa 
	Semana 5 13/04/2021
*/

/* 1 - Crie e teste comando show databases, create database, use e drop database*/
SHOW DATABASES;

CREATE DATABASE petshop;

USE petshop; 

DROP DATABASE petshop;


/*2 - Criando a tabela Funcionário*/
CREATE TABLE Funcionario(
	CPF varchar(25),
    Nome varchar(25),
    Rua varchar(25),
    Numero integer,
    Cidade varchar(25),
    
    Primary key (CPF)
);

/*Adicionando à tabela Funcionário, o atributo Salario com domínio numérico*/
ALTER TABLE Funcionario ADD Salario numeric(6,2);

/*solicitando mostrar a tabela Funcionario*/
DESC Funcionario;

/*Removendo a coluna número da tabela Funcionario*/
ALTER TABLE Funcionario DROP Numero;

/*Comando que permite remover todos os dados da tabela Funcionario, mantendo sua estrutura*/
TRUNCATE TABLE Funcionario;

/*Comando que permite remover toda a tabela, inclusive sua estrutura*/
DROP TABLE Funcionario;

select * from Funcionario;





