-- TRIGGER: INSERT USER ---------------------------------------
create or replace trigger user_insert_trg 
before insert on users 
for each row
begin
  :new.ID := seq_user.nextval;
end;

-- test
INSERT INTO Users
VALUES (null, 'adacez', NULL, 'Adam', 'Cez', 'acez@domena.pl');

SELECT * FROM Users;


-- TRIGGER: checking end date of realisation ------------------------------
create or replace trigger realisation_end_trg
before update on realisations
for each row
begin
  if :new.EndStamp < :old.startStamp then
    :new.EndStamp := :old.startStamp;
  end if;
end;

-- test
UPDATE realisations
SET EndStamp = '04-MAY-17 03.06.11.817740000 PM'
WHERE RealisationID= 13;

SELECT * FROM Realisations;

-- TRIGGER 
create or replace trigger course_insert_trg 
before insert on courses
for each row
begin
  if :new.wordCount = NULL OR :new.wordCount = 0 then
    SELECT Count(*) 
    INTO :new.WordCount FROM Words
    WHERE WordLevel=:new.CourseLevel;
  end if;
end;

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'City', Levels.ID, 0
FROM Levels 
WHERE Name = 'Elementary';

Select * FROM Courses;
