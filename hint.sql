EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('mpercin1','Levels');
EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('mpercin1','Courses')

drop index courseidx1;
create index courseidx1 on Courses(CourseID);
drop index courseidx2;
create index courseidx2 on Courses(CourseLevel);
drop index courseidx3;
create index courseidx3 on Courses(CourseID,CourseLevel);
drop index courseidx4;
create index courseidx4 on Courses(CourseName);
drop index courseidx5;
create index courseidx5 on Courses(CourseName,CourseID,CourseLevel);

alter index courseidx1 visible;
alter index courseidx2 visible;
alter index courseidx3 visible;
alter index courseidx4 visible;
alter index courseidx5 visible;

explain plan for
Select l.name AS "Level", c.Coursename FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
ORDER BY l.id;

SELECT *
from table (dbms_xplan.display);

alter index courseidx1 invisible;
alter index courseidx2 invisible;
alter index courseidx3 invisible;
alter index courseidx4 invisible;
alter index courseidx5 invisible;

explain plan for
Select l.name AS "Level", c.Coursename FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
ORDER BY l.id;

SELECT *
from table (dbms_xplan.display);

alter index courseidx1 visible;
alter index courseidx2 visible;
alter index courseidx3 visible;
alter index courseidx4 visible;
alter index courseidx5 visible;

explain plan for
Select + use_merge(l,c) l.name AS "Level", c.Coursename FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
ORDER BY l.id;

SELECT *
from table (dbms_xplan.display);

---------------------------------------------------------------------
alter index courseidx1 visible;
alter index courseidx2 visible;
alter index courseidx3 visible;
alter index courseidx4 visible;
alter index courseidx5 visible;

explain plan for
Select + ordered l.name AS "Level", c.Coursename FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
ORDER BY l.id;

SELECT *
from table (dbms_xplan.display);
