-- USERS TABLE -----------------------------------
CREATE TABLE Users (
    ID int NOT NULL PRIMARY KEY,
    Login varchar2(255) NOT NULL,
    Pwd varchar2(255),
    LastName varchar2(255),
    FirstName varchar2(255),
    Email varchar2(255)
);

ALTER TABLE Users
ADD UNIQUE (Login);

CREATE SEQUENCE seq_user
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- LEVELS TABLE -----------------------------------------
CREATE TABLE Levels (
    ID int NOT NULL PRIMARY KEY,
    Name varchar2(255) UNIQUE NOT NULL
);

CREATE SEQUENCE seq_level
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- COURSES TABLE --------------------------------------------
CREATE TABLE Courses (
    CourseID int NOT NULL PRIMARY KEY,
    CourseName varchar2(255) NOT NULL,
    CourseLevel int NOT NULL,
    WordCount int,
    CONSTRAINT FK_LevelCourse FOREIGN KEY (CourseLevel)
    REFERENCES Levels(ID)
);

CREATE SEQUENCE seq_course
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- REALISATIONS TABLE ------------------------------------------------------------
CREATE TABLE Realisations (
    RealisationID int NOT NULL PRIMARY KEY,
    UserID int NOT NULL,
    CourseID int NOT NULL,
    StartStamp TIMESTAMP NOT NULL,
    EndStamp TIMESTAMP
);
ALTER TABLE Realisations
ADD CONSTRAINT FK_UserRealisation FOREIGN KEY (UserID)
REFERENCES Users(ID);

ALTER TABLE Realisations
ADD CONSTRAINT FK_CourseRealisation FOREIGN KEY (CourseID)
REFERENCES Courses(CourseID);

CREATE SEQUENCE seq_realisation
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- WORDS TABLE ------------------------------------------------------------
CREATE TABLE Words (
    WordID int NOT NULL PRIMARY KEY,
    WordDE varchar2(255) NOT NULL,
    WordEN varchar2(255) NOT NULL,
    WordLevel int NOT NULL,
    ExampleDE varchar2(255) NULL,
    ExampleEN varchar2(255) NULL,
    CONSTRAINT FK_LevelWord FOREIGN KEY (WordLevel)
    REFERENCES Levels(ID)
);

CREATE SEQUENCE seq_word
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- CATEGORIES TABLE ---------------------------------------
CREATE TABLE Categories (
    CategoryID int NOT NULL PRIMARY KEY,
    CategoryName varchar2(255) NOT NULL,
    ParentID int NULL,
    CONSTRAINT FK_ParentID foreign key (ParentID) 
    references categories (CategoryID)
    on delete set null
);

CREATE SEQUENCE seq_category
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- WORDS_CATEGORIES TABLE---------------------------------------
CREATE TABLE WORDS_CATEGORIES (
    WordID int NOT NULL,
    CategoryID int NOT NULL,
    CONSTRAINT FK_CategoryID foreign key (CategoryID) 
    references Categories (CategoryID)
    on delete cascade,
    CONSTRAINT FK_WordID foreign key (WordID) 
    references Words (WordID)
    on delete cascade,
    CONSTRAINT PK_WORD_CATEGORY PRIMARY KEY (WordID,CategoryID)
);

-- COURSES_CATEGORIES TABLE---------------------------------------
CREATE TABLE COURSES_CATEGORIES (
    CourseID int NOT NULL,
    CategoryID int NOT NULL,
    CONSTRAINT FK_CourseCategoryID foreign key (CategoryID) 
    references Categories (CategoryID)
    on delete cascade,
    CONSTRAINT FK_CategoryCourseID foreign key (CourseID) 
    references Courses (CourseID)
    on delete cascade,
    CONSTRAINT PK_COURSE_CATEGORY PRIMARY KEY (CourseID,CategoryID)
);

-- WORDS_REALISATIONS TABLE---------------------------------------
CREATE TABLE WORDS_REALISATIONS(
    WordID int NOT NULL,
    RealisationID int NOT NULL,
    nearestDate DATE NULL,
    CONSTRAINT FK_RealisationWordID foreign key (WordID) 
    references Words (WordID)
    on delete cascade,
    CONSTRAINT FK_WordRealisationID foreign key (RealisationID) 
    references Realisations (RealisationID)
    on delete cascade,
    CONSTRAINT PK_WORD_REALISATION PRIMARY KEY (WordID,RealisationID)
);

-- COMMIT -----------------------------------------------------
commit;
