/*Achar o salário mais alto de da tabela instrutor */
select salary from instructor order by salary desc;
select max(salary) from instructor;


/*
Achar o id, o nome e o salario dos instrutores que ganham o salário mais alto (pode haver mais de um com o mesmo salário). 
*/
select 
