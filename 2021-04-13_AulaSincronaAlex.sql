/*Minimundo Farmacia criado pelo Professor na aula Síncrona*/

create database farmacia;

use farmacia;

create database if not exists farmacia; 

show databases; /*Para mostrar todos os .. do banco de dados */

create table nomedatabelaasercriada like nomedatabelacopiada;

truncate table nomedatabela; /*Para isso, e pssível apagar todos os registros da tabela, sem excluir a estrutura*/

drop table nomedatabela; /*Para isso, e pssível apagar toda a estrutura da tabela.. precisa dar drop em todas que tem FK a ela*/

/*
As tuplas são as linhas dentro de uma tabela. 
As relações são as tabelas. 
Atributos são as colunas dentro de uma relação.
O UNIQUE garante que um dado não será repetido, Mas não torno o atributo uma chave primária.
Super Chave é quando uma ou mais colunas é suficiente para identificar de forma única um cliente na tabela. Além da chave primária, se tem um pouco mais de informação a mais que permite identificar de maneiro melhor os registros
O conceito Chave Candidata é quando a partir de um conjunto de atributos, eu vou pegar o mínimo possível para tornar um cliente único.
Chave Primária é a Chave Candidata
Chave Estrangeira é aquela que  
*/