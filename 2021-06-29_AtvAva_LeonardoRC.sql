-- Selecione todos os estudantes (*) que comecem com a letra A ou que comecem com a Letra R.
-- Ordene o resultado pelo nome dos estudantes em orderm crescente.

select distinct name
from student
where name like 'R%' or name like 'A%' 
order by name;

-- Selecione o nome do departamento, o valor mínimo de crédito, o valor máximo de crédito, 
-- a média dos créditos e a quantidade de alunos por departamento. Agrupe o resultado pelo
-- nome do departamento em ordem decrescente.
select distinct dept_name, min(tot_cred), max(tot_cred), avg(tot_cred), count(ID)
from student
group by dept_name;

-- Selecione o nome e o salário dos instrutores que possuem salários igual ou maior 
-- a média dos salários dos instrutores. Ordene o resultado do maior salário para o menor.
select name, salary
from instructor
where salary >= (select avg(salary) from instructor)
order by salary desc;

-- Escreva um comando que permita selecionar todos os estudantes 
-- que NÃO estão vinculados a um departamento (Utilize Left Join obrigatóriamente).
select distinct name	
from student
left join department on student.dept_name = department.dept_name 
where department.dept_name is null;


-- Retorne apenas os cursos que foram ofertados em alguma seção 
-- (Utilize INNER JOIN obrigatóriamente).
select distinct title
from course
inner join section on course.course_id = section.course_id

