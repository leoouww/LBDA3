
/*EX 1> Encontre todos os estudantes (*) cujo nome comece com a letra M tenha a letra A e termine com a letra E.*/
select name 
from student
where name like 'M%A%E';

/*EX2> Selecione o nome do estudante, o departamento, o título do curso e 
a nota de todos os estudantes que tiraram conceito C na disciplina de 
'Image Processing' (Dica 1. Sua consulta deve incluir image processing. 
Dica 2. Utilize as FK para unir as tabelas.)
*/
select distinct student.name, student.dept_name, course.title, takes.grade
from student, course, takes, section
where section.course_id = course.course_id and takes.ID = student.ID and course.title = 'Image Processing' and takes.grade like 'C%';


/*EX3> Retorne o título de todos os cursos ofertados entre 2003 e 2005.*/
select distinct course.title
from course, section
where course.course_id = section.course_id and section.year between 2003 and 2005;

/*EX4> Selecione o nome do instrutor (advisor) e o nome do estudante orientado por ele.
  Renomeie o nome da coluna do instrutor para Orientador e o nome da coluna do estudante para Orientando.
*/
select instructor.name as 'Orientador', student.name as 'Orientando'
from instructor, student, advisor
where advisor.s_id = student.ID and advisor.i_ID = instructor.ID;

/*EX5> Selecione todos os departamentos. ordene o resultado do orcamento (budget) mais alto para o mais baixo.
*/
select dept_name
from department
order by budget desc;

