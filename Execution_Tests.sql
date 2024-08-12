
-------------------------------- Description File --------------------------------

 --- in this file we tested all database objects as Procedures & Views & Functions 
 --- WE started with Views then Functions
 --- then tested different procedures to update & insert & Delete in different tables
 --- tested Procedures the Exam process (Create Exam & Answer & Grade Exam )
 --- tested Functions to show statistics

---           <<------------------------------------------------------------------------------------------------------------>>
--		                  <<----------------------------------------------------------------------->>
--						                <<------------------------------------------->>


--This View shows the Branch details such as Branch_ID, Branch_Name
Select * From Branch_Details_View
GO

--This View shows the Track details such as Track_ID, Track_Name, Department_ID.
SELECT * FROM Track_Details_View
GO
--This View shows the Department details such as Department_ID, Department_Name, Instuctor_Manager.
SELECT * FROM Department_Details_View
GO

--This View shows the Instructor details such as :Instructor_ID, Instructor_Name, Instructor_Email, Instructor_Phone, Instructor_Salary, Department_ID.
SELECT * FROM Instructor_Details_View
GO

--This View shows the Course details such as Course_ID, Course_Name, Min_Degree, Max_Degree.
SELECT * FROM Course_Details_View
GO

--This View shows the Details of the Intake such as Intake_ID, Intake_Name, Intake_Year. 
SELECT * FROM Intake_Details_View
Go

--This View shows the details of the Student such as : Student_ID, Student_Name, Student_Email, Student_Phone, Intake_ID, Branch_ID, Track_ID.
SELECT * FROM Student_Details_View
Go

--This View shows the details of the Question_Pool such as : Question_ID, Question_Name, Question_Type, Correct_Answer, Mcq_Options, Question_Degree, Course_ID.
SELECT * FROM Question_Pool_Details_View
GO

--This View shows the details of the Exam such as : Exam_ID, Exam_Type, Allowance_Options, Total_Time, Start_Time, End_Time, Exam_Year, Intake_ID, Track_ID, Course_ID, Instructor_ID.
SELECT * FROM Exam_Details_View
GO

--This View shows the details of the Student_Course such as : Student_Course_ID, Student_ID, Course_ID.
SELECT * FROM Student_Course_Details_View
Go

--This View shows the details of the Exam_Question such as : Exam_Question_ID, Exam_ID, Question_ID.
SELECT * FROM Exam_Question_Details_View
Go

--This View shows the details of the MCQ Options in the Exam such as : Question_Mcq_Options , Question_Id , Mcq_Option.
SELECT * FROM Question_MCQ_Qptions_View
GO
---------------------------------------------------------------------------
--Functions Description
Go

--This function will return the grades for a specific student, including details about the courses they are enrolled in.
DECLARE @StudentID INT = 1
SELECT * FROM GetStudentGrades(@StudentID)
GO


--This function will provide the grades of all students in the courses taught by a specific instructor, including details about each student and their grades.
DECLARE @InstructorID INT = 11
SELECT * FROM dbo.GetStudentGradestoInstructor(@InstructorID)
GO


--This function will provide an overview of the grades of all students across all courses, including details about the students, courses, and instructors.
SELECT * FROM GetStudentGradestoManager()


-----------------------------------------------------------------------------

/**FUNCTION CheckValidEmail

The function text value to check if it is a valid email address
if the email is valid it returns 1, if unvalid returns 0
example will return 1:**/

SELECT dbo.CheckValidEmail('Example@example.com')

/*---FUNCTIONCheckValidPhone
The function text value to check if it is a valid egyptian phone number
if the phone number is valid it returns 1, if unvalid returns 0
example will return 1:*/
SELECT dbo.CheckValidPhone('01123562410')


/*---FUNCTION text_grade
the function checks the keywords that should exist in the answer
and return the grade based on the number of keyword words
that exist in the student answer
@best_answer keywords sperated by *
@student_answer is the answer to be checked
@q_grade the grade of the question

example:*/

SELECT dbo.text_grade('sql*server*t-sql', 'Microsoft sql server using t-sql', 10)

/*+---PROCEDURE InsertCourse 
The procedure insert new course 

Example
EXEC InsertCourse @cre_name = 'course name', @mx_degree = 20, @mn_degree =0

Note @mx_degree and @mn_degree have deafult values of 100 and 0 so you can just
use */

EXEC InsertCourse @cre_name = 'course name'


/*+---PROCEDURE UpdateCourse 
The procedure update course info

you need to input a valid course id to update
the 3 other inputs are not all required only input a value for what you want to update
NOTE -- max needs to be more than min degree with at least 5 numbers and both more than 0

Example:*/
EXEC UpdateCourse @crs_id =5 ,@cre_name ='x',@mx_degree =100 ,@mn_degree =0

/*+---PROCEDURE DeleteCourse
The procedure deletes course based on the course id
example: change 1 by the course id you want to delete*/

EXEC DeleteCourse 5



/*+---PROCEDURE InsertInstructor
The procedure insert new instructor
 
ALL VALUES ARE REQUIRED

example: */

EXEC InsertInstructor @ins_name = 'Ahmed' , @ins_email = 'shehab@gmail.com', @ins_salary = 1000, @ins_phone = '01056243505' ,@dept_id = 2

/*+---PROCEDURE UpdateInstructor
You need to input a valid instructor id to update
all the other inputs are not required only input what you need to update

example:
@ins_id 
@ins_name 
@ins_email 
@ins_phone 
@ins_salary 
@ins_dep */

EXEC UpdateInstructor @ins_id =2, @ins_phone = '01007523650'

/*+---PROCEDURE DeleteInstructor
The procedure deletes instructor based on the instructor id
example:
change 1 by the instructor id you want to delete */

EXEC DeleteInstructor 2

/*+---PROCEDURE InsertInsCou
this procedure inserts a course for an instructor for a certain year

All values are required
example:*/

EXEC InsertInsCou @course_id = 1, @instructor_id = 9 , @year = 2017




/*+---PROCEDURE UpdateInsCou
This procedure used to update table Instuctor_Course

this procedure offer 2 use cases 
--- choosing a certain year is optional but recommended
--- you can use it with any case using @year = and choose the year

1- Update a course to a new course for a certain instructor 
example:
EXEC UpdateInsCou @course_id = 1, @instructor_id = 1 , @new_course_id = 2, @year = 2017


2- Update an instructor to a new instructor for a certain course 
example:
EXEC UpdateInsCou @course_id = 1, @instructor_id = 1 , @new_course_id = 2, @year = 2017
*/
EXEC UpdateInsCou @course_id = 1, @instructor_id = 9 , @new_course_id = 2, @year = 2017

/*+---PROCEDURE DeleteInsCou
This procedure used to delete from the table Instuctor_Course

this procedure offer 3 use cases 
--- choosing a certain year is optional but recommended
--- you can use it with any case using @year = and choose the year

1- delete a certain instructor from a certain course
EXEC DeleteInsCou @course_id = 1, @instructor_id = 1

2- delete all instructors from a certain course
EXEC DeleteInsCou @course_id = 1, @delete_all = 0
replace the 1 with the wanted course id. and use this as it is  @delete_all = 0 

3- delete all courses for a certain instructor
EXEC DeleteInsCou @instructor_id = 1, @delete_all = 0
replace the 1 with the wanted instructor id. and use this as it is  @delete_all = 0 
*/
EXEC DeleteInsCou @course_id = 2, @instructor_id = 9 ,@year = 2017

-------------------------------------------------------------------------------------------------->>>




-----	Training manager can add and edit: Branches, tracks in each department, and add new intake.
--This Procedure will check if this branch and the year exists will show a message , If not it will add the Branch and the 
EXEC AddBranch  'Main Branch'  ---- add Branch
--This Procedure will check if this Branch and the year exists will show a message , If not it will add the Branch and the 
EXEC editBranch 1, 'Cairo'        ---- edit Branch
--This Procedure will check if this Track and the year exists will show a message , If not it will add the Track and the 
Exec Track_update 1 , '.net'          ---- edit Branch

--This Procedure will check if this Track and the year exists will show a message , If not it will add the Track and the year
Exec insert_Track  '.net'                  ---- add Track

--This Procedure will check if this intake and the year exists will show a message , If not it will add the intake and the year

EXEC AddNewIntake 'Intake 46', 2026

--- add students, and define their personal data, intake, branch, and track.

Exec [usp_AddStudent] 'Sherif','sherif234@gmail.com','01012'

---------------------------------------------------------------------------->>>
---------------------------------------------------------------------------->>>

/**create_exam SP
•	Name: create_exam
•	Type: Stored Procedure
•	Usage: takes exam metadata as: exam type, allowance options, start time, 
end time, branch id, track id, course id and instructor id 
from instructor with check validation that instructor teaches this course in this year, then insert it in exam table.*/

EXECUTE create_exam 'frist_time','solve all Quetions','2026-07-25 14:10','2024-07-26 16:10',1,1,1,1,11

/**show_Student SP
•	Name: show_Student
•	Type: Stored Procedure
•	Usage: shows all students that enrolled in this course to make instructor 
select all / some of them to do the exam.*/ 
EXECUTE show_Student

/*select_student SP
•	Name: select_student
•	Type: Stored Procedure
•	Usage: this sp takes all for select all students in this course or specific student
ids to do the exam, then insert selected student ids into Student_answer table.*/

EXECUTE select_student 'All'

/*show_question SP
•	Name: show_question
•	Type: Stored Procedure
•	Usage: this sp retrieves all course questions in details as Question ID,
Question Name, MCQ options (for MCQ questions), and Question Degree for the latest exam to the instructor to 
select from them exam questions*/

EXECUTE show_quetion

/*select_Question SP
•	Name: select_Question
•	Type: Stored Procedure
•	Usage: this sp takes from instructor the number of needed questions or
question ids and inserts selected questions into exam question table.
When instructor enters question ids, SP ensures that the sum of selected question degrees 
equal course max degrees*/

EXEcute select_Qustion '11*12*13*14'

/*
Name: exam_metadata
Type: View
Usage: This view displays metadata for the latest exam, including the following details:
Exam Type, Course Name, Allowance Options, Total Time and Exam Year.
*/

-- test results
select * from exam_metadata

------------------------------------------------------------------------------------------

/*
Name: show_exam 
Type: View
Usage: This view displays exam questions for specific exam, including the following details:
Question Name, Question Type (mcq, T or F, text) , (mcq options only for mcq questions) and Question Degree.
*/

-- test results
select * from show_exam

------------------------------------------------------------------------------------------------

/*
Name: display_exam
Type: Stored Procedure
Usage: This procedure takes student id then:
	   check he exists in student answer exam table specifically for this exam 
	   and check current date is between start date and end date (datetime)
	   if all is valid, display exam metadata and exam questions based on its order in exam question table
	   it continues till the end time then stop 
	   if not, print Not Valid To Enter The Exam!.
*/

-- test results
execute display_exam 3

-------------------------------------------------------------------------------------

/*
Name: take_answer
Type: Stored Procedure
Usage: This procedure takes student id and student answer then checks:
	  if student answer is empty varchar or null (not submit answer before exam end time)
	  then insert No answers provided in student answer column
	  if not, then insert the answer value in student answer column

  *Notice*
   For more accuracy and restrictions, i make the insertion of student answer will be
   for the first submit only from authorised students in the time allowed. 
*/  



-- test results
execute take_answer 3, ' a * b * t * c * data warehouse is an enterprise system used for the analysis * f * d '

----------------------------------------------------------------------------------------------

/*
Name: update_instructor_salaries
Type: Stored Procedure
Usage: This procedure takes department number and salary increase amount for this department
	  and then using cursor update salaries for each instructor in this department
      with the new value = old salary + increase amount.
*/

-- test results
execute update_instructor_salaries 2, 1300


/*Correction
•	Name: correction
•	Type: Stored Procedure
•	Usage: Exam correction */

Execute correction


  /*
Name: rank_students
Type: Stored Procedure
Usage: This procedure takes course id and display all student details that enrolled in this course
	  and ranking them with their course grades.
*/

-- test results
execute rank_students 1    