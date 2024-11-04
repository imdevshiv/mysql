
create database assignmentjoin;

use assignmentjoin;
-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Insert sample data into students table
INSERT INTO students (student_id, name, age) VALUES
(1, 'John', 20),
(2, 'Alice', 22),
(3, 'Bob', 21);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);

-- Insert sample data into courses table
INSERT INTO courses (course_id, course_name, instructor) VALUES
(101, 'Math', 'Professor X'),
(102, 'English', 'Professor Y'),
(103, 'Science', 'Professor Z');

-- Create student_courses table
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    grade VARCHAR(2), -- Assuming grades are represented by letters (e.g., A, B, C)
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data into student_courses table
INSERT INTO student_courses (student_id, course_id, grade) VALUES
(1, 101, 'A'),
(1, 102, 'B'),
(2, 103, 'A'),
(3, 101, 'C');


-- Show table
SELECT * FROM COURSES;
SELECT * FROM STUDENT_COURSES;
SELECT * FROM STUDENTS;

-- INNER JOIN







