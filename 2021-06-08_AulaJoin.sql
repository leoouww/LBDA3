/*Rertorne as informações de Classroom que estejam em um prédio*/
select classroom.building, classroom.room_number, classroom.capacity
from classroom 
inner join department on classroom.building = department.building; 


/*Retorne as informações tanto das Classroom que estejam num prédio como as que não estejam.*/
select *
from classroom 
left join department on classroom.building = department.building; 


/*Retorne as informações apenas das Classroom que não estejam num prédio.*/ 
select *
from classroom 
left join department on classroom.building = department.building
where department.building is null; 

/*Retorne as informações de Classroom e departento, considerando também os prédios que não tenham classroom vinculadas e vice-versa.*/
select *
from classroom 
right join department on classroom.building = department.building;


/*Uso FullJoin*/
select *
from classroom 
right join department on classroom.building = department.building
union
select *
from classroom 
left join department on classroom.building = department.building;
