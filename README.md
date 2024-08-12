# Project Overview:
The project involves designing a comprehensive system to manage exams, questions, and results. It facilitates instructors in creating and managing exams,
while also providing a structured way to handle student data and course information.

# Key Features and Use Cases:
Question Pool Management:
Instructors can add, update, and delete questions, including multiple-choice, true/false, and text questions.
Course and Instructor Management:
The training manager can manage course information and instructors, ensuring up-to-date records for efficient operation.
Student Management:
Comprehensive management of student data, including personal information, intake details, and course enrolment.
Exam Creation and Assignment:
Instructors can create exams by selecting questions manually or randomly, set exam dates, and assign them to specific students.
Automated Result Calculation:
The system calculates and stores students' exam results, providing a clear view of their performance.

# Technologies Used:
SQL Server for database management
Advanced SQL queries and stored procedures for efficient data handling

# Challenges and Solutions:
One of the main challenges was optimizing query performance for handling complex data operations. By using appropriate indexing .

# More Details about Our Projet
This is a project implementation to simulate the exam system database at the Information Technology Institute (ITI) using (Microsoft SQL Server),
The institution has many branches, each of which has one or more directors and a number of graduates throughout the year,
The institution provides some tracks that are taught in it,
Our primary focus in this project was how a teacher can create an exam for his or her courses by either providing the system with the number of questions/scores
they want for the exam and then the system randomly selects that number of questions (MCQ, T/F and text) for their course from Question pool that contains all course questions,
Or the teacher can manually select/add the questions that the test should include from the question pool. We then focused on how the student would list their answers for that specific test,
Finally, how to evaluate the student's answer to this test and find out whether he passed the test or not automatically.
