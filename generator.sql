exec words_fill(1000);
exec courses_fill(1000);
exec categories_fill(3000);
exec realisations_fill(1000);

-- GENERATOR for Words table --------------------------------------------------
create or replace procedure words_fill(valmax integer )
is
    val_max number := valmax;
    sql_stmt    VARCHAR2(200);
    wordde varchar2(20);
    worden varchar2(20);
begin
    for i in 1..val_max loop
        wordde:=CONCAT('Wort_', TO_CHAR(i));
        worden:=CONCAT('Word_', TO_CHAR(i));
      sql_stmt:= 'insert into words values (seq_word.nextval,:1,:2,:3, NULL,NULL)';
      execute immediate sql_stmt USING wordde, worden, dbms_random.value(2,7);
    end loop;
    commit;
end;
-- EXEC
exec words_fill(1000);
-- TEST
SELECT * FROM Words;

-- GENERATOR for Courses table --------------------------------------------------
create or replace procedure courses_fill(valmax integer )
is
    val_max number := valmax;
    sql_stmt    VARCHAR2(200);
    course_name varchar2(20);
begin
    for i in 1..val_max loop
        course_name:=CONCAT('Course_', TO_CHAR(i));  
        sql_stmt:= 'insert into courses values (seq_course.nextval,:1,:2,0)';
        execute immediate sql_stmt USING course_name, dbms_random.value(2,7);
    end loop;
    commit;
end;
-- EXEC
exec courses_fill(1000);
-- TEST
SELECT * FROM Courses;

-- GENERATOR for Categories table --------------------------------------------------
create or replace procedure categories_fill(valmax integer )
is
    val_max number := valmax;
    sql_stmt    VARCHAR2(200);
    category_name varchar2(20);
    parent_id integer :=0;
begin
    for i in 1..val_max loop
        category_name:=CONCAT('Category_', TO_CHAR(i));  
        sql_stmt:= 'insert into Categories values (seq_category.nextval,:1,
                (SELECT CategoryID FROM 
                    (SELECT CategoryID FROM Categories
                    ORDER BY dbms_random.value) 
                WHERE rownum = 1)
                )';
        execute immediate sql_stmt USING category_name;
    end loop;
    commit;
end;
-- EXEC
exec categories_fill(1000);
-- TEST
SELECT * FROM Categories;

-- GENERATOR for Realisations table --------------------------------------------------
create or replace procedure realisations_fill(valmax integer )
is
    val_max number := valmax;
    sql_stmt    VARCHAR2(600);
begin
    for i in 1..val_max loop
        sql_stmt:= 'insert into Realisations values (seq_realisation.nextval,
                (SELECT ID FROM 
                    (SELECT ID FROM Users
                    ORDER BY dbms_random.value) 
                WHERE rownum = 1),
                (SELECT CourseID FROM 
                    (SELECT CourseID FROM Courses
                    ORDER BY dbms_random.value) 
                WHERE rownum = 1),
                CURRENT_TIMESTAMP,NULL
                )';
        execute immediate sql_stmt;
    end loop;
    commit;
end;
-- EXEC
exec realisations_fill(20);
-- TEST
SELECT * FROM Realisations;

