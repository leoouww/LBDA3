/*
	1 - Achar o número máximo de matriculados, por todas as seções, 
		no Outono (Fall) de 2009.
*/
select sec_id as 'seção', count(distinct ID) as 'Matrículas'
from takes
where semester = 'Fall'
and year = 2009
group by sec_id;

/*
  2 - Encontre o número de matrículas realizadas em cada seção de curso
	  que foi oferecida  no outono (Fall) de 2009.  A relação resultante 
      deverá mostrar os atributos: course_id, sec_id, Título do curso e 
      número de matrículas
*/
select course_id, 	sec_id, title as 'Título do Curso', count(distinct ID) as '# Matrículas'
from (section natural join course) natural join takes
where semester = 'Fall'
and year = 2009
group by course_id, sec_id, title;

/*
	3 - Para cada seção do curso oferecida em 2009, ache a média 
    do total de créditos (tot_cred) de todos os alunos matriculados 
    na seção, se a seção tiver pelo menos 2 alunos A relação resultante
    deverá mostrar os atributos: course_id, sec_id, semestre, ano
    e média do total de créditos
*/
select course_id, sec_id, semester, year, avg(tot_cred)
from section,student
where year = 2009 and (select count(ID) from takes) > 2
group by sec_id;
