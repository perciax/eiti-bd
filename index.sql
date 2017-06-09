EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('mpercin1','Categories');

drop index cat_idx1;
create index cat_idx1 on Categories(parentid);
drop index cat_idx2;
create index cat_idx2 on Categories(parentid, categoryid);

alter index cat_idx1 visible;
alter index cat_idx2 visible;

explain plan for
select parentid from categories where parentid =100 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from categories where parentid =100 order by 1;

explain plan for
select parentid from categories where parentid between 1 and 399 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from categories where parentid between 1 and 399 order by 1;