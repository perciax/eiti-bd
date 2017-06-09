---------------------------------------------------------
SELECT * FROM USERS;
SELECT * FROM LEVELS;
SELECT * FROM COURSES;
SELECT * FROM REALISATIONS;
SELECT * FROM Words;
SELECT * FROM Categories;

----------------------------------------------------------
SELECT Courses.CourseID, Courses.CourseName, Levels.Name AS "Level"
FROM Courses
INNER JOIN Levels ON Courses.CourseLevel=Levels.ID;

-------------------------------------------------------------
SELECT r.REALISATIONID, u.login, c.COURSENAME, l.name AS "Level"
FROM (((Realisations r 
INNER JOIN Users u ON u.id=r.userid)
INNER JOIN Courses c ON c.courseid=r.courseid)
INNER JOIN Levels l ON c.courselevel=l.id)
ORDER BY "Level";

-----------------------------------------------------------------
SELECT w.WordEN, c.CategoryName 
FROM ((WORDS_CATEGORIES wc
INNER JOIN Words w ON wc.wordID=w.WordID)
INNER JOIN Categories c ON wc.categoryID=c.categoryID);

---------------------------------------------------------------
SELECT c.CourseName, cat.CategoryName 
FROM ((COURSES_CATEGORIES cc
INNER JOIN Courses c ON cc.CourseID=c.CourseID)
INNER JOIN Categories cat ON cc.categoryID=cat.categoryID);

---------------------------------------------------------------
Select Count(*) FROM WORDS w
INNER JOIN Levels l on w.wordlevel=l.id
WHERE l.name='Elementary'; 

---------------------------------------------------------------
Select l.name AS "Level", Count(*) FROM WORDS w
INNER JOIN Levels l on w.wordlevel=l.id
Group by l.name;

---------------------------------------------------------------
Select l.name AS "Level", Count(*) FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
Group by l.name;
--------------------------------------------------------------

Select l.name AS "Level", Count(*) FROM courses c
INNER JOIN Levels l on c.courselevel=l.id
Group by l.name;

---------------------------------------------------------------
SELECT u.firstname AS "FIRSTNAME", u.lastname AS "LASTNAME", COUNT(r.RealisationID) AS "COURSECOUNT" 
FROM Users u
INNER JOIN realisations r ON u.id=r.USERID
GROUP BY u.firstname,u.lastname
HAVING COUNT(r.RealisationID) > 1
ORDER BY COUNT(r.RealisationID) DESC;

----------------------------------------------------------------
