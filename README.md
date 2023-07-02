# <p align="center"> Course Management System </p>

<p align="justify">
This SQL project is on a Course Management System, that manages all the students who are currently taking a course and also the associated teachers, books and so on. In this system, there are five tables namely Student , Teacher, Courses, Books and Department.
</p>

<br>

<hr>

### Functions Implemented
- <p align="justify">For each table we have a function for entering and removing items with an appropriate trigger which prompts a message of an item either being added or removed when done so.</p> 
- <p align="justify">For each function we have the proper fields entered into the function as a parameter. The function is later called with the parameters initialized with the correct data types and then put into as parameters. As an example in the insert_teacher function, we just put in the query inside the function and then set the fields such as ID, Name, DeptID and Designation as parameters; which we initialize later as a procedural programming segment.</p> 
- <p align="justify">As for the delete functions, it is a similar story. We put in the query inside the function and then put the appropriate fields in as parameters.</p>
- <p align="justify">There's a corresponding update function for each function, which updates the entry accordingly.</p>
- <p align="justify">For the delete and update functions, we use the delete from and update/set queries respectively.</p>
- <p align="justify">There is a final implementation of cursors to view books and courses.</p>
- <p align="justify">The cursors will display the books and courses entities in the following formats:</p>

<br>

#### <p align="justify">The cursors will display the books and courses entities in the following formats:</p>

<hr>

<b>Courses</b>
| Course ID | Course Name | Department | Book | Course Code |
| --------- | ----------- | ---------- | ---- | ----------- |

<b>Books</b>
| ID | Book Name | Book Author |
| -- | --------- | ----------- |


<br>
<br>
<br>

#### <p align="center"> Copyright © Porinita Hoque (ID : 1711204042) </p>
