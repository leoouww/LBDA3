/*Teste utilizando os operadores lógicos*/
select not 10;
select ! (NOT 10);

SELECT 0 || NULL;

select null || 1;

select 1 && null;
select 0 && 0;

select 1 XOR 1 XOR 1 xor 0;
select 0 xor 1;

/*Funções Agregadas: Conjunto ou Multiconjunto de valores como entrada e retorna um único valor*/

select avg(salary)
from instructor
where dept_name = 'Comp. Sci.';

select count(distinct ID)
from teaches
where semester = 'Spring' and year = 2010;

select count(*) as tuplas
from course;


select dept_name, max(salary) as 'maior salário'
from instructor
group by dept_name; 

select dept_name, min(salary) as 'menor salário'
from instructor
group by dept_name
order by min(salary) desc;

select dept_name, min(salary) as 'menor salário', max(salary) as 'maior salário', count(ID) as 'número de instrutores'
from instructor 
group by dept_name;

select avg(salary), dept_name
from instructor
group by dept_name
having avg(salary) < 90000;

select section.course_id, section.sec_id, course.title, count(takes.ID)
from section, course, takes
where section.semester = 'Fall' and section.year = 2009
group by section.sec_id;

select course_id, 	sec_id, title as 'Título do Curso', count(distinct ID) as '# Matrículas'
from (section natural join course) natural join takes
where semester = 'Fall'
and year = 2009
group by course_id, sec_id, title;


select count(ID)
from instructor
where dept_name = 'Astronomy';


select dept_name, min(tot_cred) as 'min(tot_Cred)', max(tot_cred) as 'max(tot_Cred)', count(*) as 'count(dept_name)'
from student
where tot_cred > (select avg(tot_cred) from student)
group by dept_name;

select avg(tot_cred) from student;