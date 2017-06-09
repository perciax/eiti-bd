-- USERS TABLE
INSERT INTO Users
VALUES (seq_user.nextval, 'jankow', NULL, 'Jan', 'Kowalski', 'jan.kowalski@domena.pl');
INSERT INTO Users
VALUES (seq_user.nextval, 'tadnow', NULL, 'Tadeusz', 'Nowak', 'tadzio.nowak@domena.pl');
INSERT INTO Users
VALUES (seq_user.nextval, 'annbuj', NULL, 'Anna', 'Bujalska', 'ankabuj@domena.pl');
INSERT INTO Users
VALUES (seq_user.nextval, 'adamal', NULL, 'Adam', 'Malysz', 'lecadas@domena.pl');
INSERT INTO Users
VALUES (seq_user.nextval, 'krzibi', NULL, 'Krzysztof', 'Ibisz', 'kibisz@domena.pl');
INSERT INTO Users
VALUES (seq_user.nextval, 'bonzo666', NULL, 'Mariusz', 'Polak', 'patriotam@domena.pl');

-- LEVELS TABLE
INSERT INTO Levels VALUES (seq_level.nextval, 'Beginner');
INSERT INTO Levels VALUES (seq_level.nextval, 'Elementary');
INSERT INTO Levels VALUES (seq_level.nextval, 'Intermediate');
INSERT INTO Levels VALUES (seq_level.nextval, 'Upper intermediate');
INSERT INTO Levels VALUES (seq_level.nextval, 'Advanced');
INSERT INTO Levels VALUES (seq_level.nextval, 'Proficiency');

-- COURSES TABLE
INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Animals', Levels.ID, 0
FROM Levels 
WHERE Name = 'Beginner';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Introduce yourself', Levels.ID, 0
FROM Levels 
WHERE Name = 'Beginner';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Colors', Levels.ID, 0
FROM Levels 
WHERE Name = 'Beginner';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Colors and shapes', Levels.ID, 0
FROM Levels 
WHERE Name = 'Elementary';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Animals', Levels.ID, 0
FROM Levels 
WHERE Name = 'Elementary';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Cooking', Levels.ID, 0
FROM Levels 
WHERE Name = 'Elementary';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'Your Resume', Levels.ID, 0
FROM Levels 
WHERE Name = 'Upper intermediate';

INSERT INTO Courses (CourseID, CourseName, CourseLevel, WordCount)
SELECT seq_course.nextval, 'StartUp', Levels.ID, 0
FROM Levels 
WHERE Name = 'Beginner';

-- REALISATIONS TABLE ------------------------------------------------------------
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 2, 3, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 2, 4, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 7, 3, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 7, 3, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 7, 3, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 3, 4, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 3, 5, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 5, 6, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 5, 7, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 5, 8, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 5, 9, CURRENT_TIMESTAMP);
INSERT INTO Realisations (RealisationID, UserID, CourseID, StartStamp)
VALUES (seq_realisation.nextval, 7, 8, CURRENT_TIMESTAMP);

-- WORDS TABLE ---------------------------------------
INSERT INTO Words
VALUES (seq_word.nextval, 'die Katze', 'a cat', 2, NULL, NULL);
INSERT INTO Words
VALUES (seq_word.nextval, 'der Hund', 'a dog', 2, NULL, NULL);
INSERT INTO Words
VALUES (seq_word.nextval, 'das Pferd', 'a horse', 3, NULL, NULL);
INSERT INTO Words
VALUES (seq_word.nextval, 'die Arbeit', 'a job', 2, NULL, NULL);
INSERT INTO Words
VALUES (seq_word.nextval, 'der Job', 'a job', 2, NULL, NULL);

-- CATEGORIES TABLE ---------------------------------------
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Animals', NULL);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Pets', 2);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Eating', NULL);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Tableware', 4);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Meals', 4);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Food', 4);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Fruits', 7);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Vegetables', 7);
INSERT INTO CATEGORIES
VALUES (seq_category.nextval, 'Job', NULL);

-- WORDS_CATEGORIES TABLE---------------------------------------
INSERT INTO WORDS_CATEGORIES
VALUES((SELECT WordID FROM WORDS WHERE WORDEN='a cat'),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Pets'));
INSERT INTO WORDS_CATEGORIES
VALUES((SELECT WordID FROM WORDS WHERE WORDEN='a dog'),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Pets'));
INSERT INTO WORDS_CATEGORIES
VALUES((SELECT WordID FROM WORDS WHERE WORDEN='a horse'),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Animals'));
        
-- COURSES_CATEGORIES TABLE---------------------------------------
INSERT INTO COURSES_CATEGORIES
VALUES((SELECT CourseID FROM COURSES WHERE CourseName='Animals' AND COURSELEVEL=2),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Pets')); 
INSERT INTO COURSES_CATEGORIES
VALUES((SELECT CourseID FROM COURSES WHERE CourseName='Animals' AND COURSELEVEL=2),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Animals'));
INSERT INTO COURSES_CATEGORIES
VALUES((SELECT CourseID FROM COURSES WHERE CourseName='Cooking'),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Food'));
INSERT INTO COURSES_CATEGORIES
VALUES((SELECT CourseID FROM COURSES WHERE CourseName='Cooking'),
        (SELECT CategoryID FROM CATEGORIES WHERE CATEGORIES.CATEGORYNAME='Meals'));

-- WORDS_REALISATIONS TABLE---------------------------------------

-- KURS ZE WSZYSTKIMI SLOWAMI Z POZIOMU BEGINNER --
INSERT INTO WORDS_REALISATIONS 
SELECT w.WordID, 
    (SELECT RealisationID FROM REALISATIONS WHERE REALISATIONID=12), -- StartUp
    CURRENT_DATE
FROM Words w
INNER JOIN Levels l ON w.WordLevel = l.ID
WHERE l.Name='Beginner';

-- COMMIT --------------------------------------------------
commit;
