--TABLE

create table dept(
    id_dept number,
    department varchar2(3),
    constraint pk_id_dept primary key(id_dept)
);
create table teacher(
    id number,
    name varchar2(15),
    dept_id number,
    designation varchar2(15),
    constraint pk_id primary key (id),
    constraint fk_dept foreign key (dept_id) references dept(id_dept)
);
create table student(
    student_id number,
    name varchar2(15),
    dept_id number,
    semester number,
    constraint pk_stid primary key(student_id),
    constraint fk_deptst foreign key (dept_id) references dept(id_dept)
);
create table book(
    book_id number,
    book_name varchar2(15),
    book_author varchar2(15),
    constraint pk_book primary key (book_id)
);
create table courses(
    course_id number,
    course_name varchar2(15),
    dept number,
    book number,
    constraint pk_id_course primary key (course_id),
    constraint fk_dept_course foreign key (dept) references dept(id_dept),
    constraint fk_book foreign key (book) references book(book_id)
);

alter table courses add course_code varchar2(10);

--values

--dept
insert into dept values(1,'MCE');
insert into dept values(2,'EEE');
insert into dept values(3,'TVE');
insert into dept values(4,'CSE');
insert into dept values(5,'CEE');

--teachers
insert into teacher values(1,'Muhammad',4,'Professor');
insert into teacher values(2,'Ahmad',2,'Professor');
insert into teacher values(3,'John',1,'Professor')
insert into teacher values(4,'Tariq',5,'Professor');

--student
insert into student values(1711204042,'Porinita',4,5);
insert into student values(1711202042,'Salman',2,5);
insert into student values(1711201042,'Rayaan',1,5);
insert into student values(1711205042,'Maheer',5,5);

--book
insert into book values(1,'Computers','Arthur');
insert into book values(2,'C programming','Herbert Schilt');
insert into book values(3,'Circuits','David');
insert into book values(4,'MOSFETS','Richard');
insert into book values(5,'Intro to CEE','Ben');
insert into book values(6,'Water resource','DrinkWater');
insert into book values(7,'ME 101','Robert');
insert into book values(8,'Fluid','Charles');

--courses
insert into courses values(1,'OS',4,2,'CSE 4501');
insert into courses values(2,'Circuits',2,3,'EEE 4502');
insert into courses values(3,'Intro to mecha',1,7,'MCE 4503');
insert into courses values(4,'Intro to civil',5,5,'CEE 4504');


--PL SQL functions

------------------inserting data----------------------

--insert into teachers
create or replace trigger teacher_insert
after insert on teacher for each row
declare 
BEGIN
    dbms_output.put_line('Added information about the instructor');
End;
/

create or REPLACE procedure insert_teacher(iden in number,instructor in varchar2,dept_id in number,desi in varchar2)
as
BEGIN
insert into teacher values(iden,instructor,dept_id,desi);
END;
/

set serveroutput on
declare
iden number;
instructor varchar2(15);
dept_id number;
desi varchar2(15);
BEGIN
iden := '&id';
instructor := '&name';
dept_id:= '&dept_id';
desi := '&designation';
insert_teacher(iden,instructor,dept_id,desi);
END;
/

--insert into students
create or replace trigger student_insert
after insert on student for each row
declare 
BEGIN
    dbms_output.put_line('Added information about the student');
End;
/

create or replace procedure insert_student(id in number, n in varchar2,d in number,s in number)
as
BEGIN
insert into student values(id,n,d,s);
End;
/

set serveroutput on
declare 
id  number;
n  varchar2(15);
d number;
s number;
BEGIN
id := '&student_id';
n := '&name';
d := '&dept_id';
s := '&semester';
insert_student(id,n,d,s);
end;
/

--insert into courses
create or replace trigger course_insert
after insert on courses for each row
declare 
BEGIN
    dbms_output.put_line('Course information added to the database');
End;
/

create or replace procedure insert_course(id in number,c_name in varchar2,d in number, b in number,cc in varchar2)
as
BEGIN
insert into courses values(id,c_name,d,b,cc);
end;
/

set serveroutput on
declare 
id  number;
c_name  varchar2(15);
d number;
b number;
cc varchar2(10);
BEGIN
id := '&course_id';
c_name := '&course_name';
d := '&dept';
b := '&book';
cc := '&course_code';
insert_course(id,c_name,d,b,cc);
end;
/

--insert into books
create or replace trigger book_insert
after insert on book for each row
declare
BEGIN
    dbms_output.put_line('Book has been added which will be part of your course even though you will never read it before the exam :)');
End;
/

create or replace procedure insert_book(id in number,b in varchar2,a in varchar2)
as 
BEGIN
insert into book values(id,b,a);
end;
/

set serveroutput on 
declare
id number;
b varchar2(15);
a varchar2(15);
BEGIN
id := '&book_id';
b := '&book_name';
a := '&book_author';
insert_book(id,b,a);
End;
/

---update

--update teacher
create or replace trigger teacher_update
after update on teacher for each row
declare
Begin
    dbms_output.put_line('Information about that instructor has been updated.');
end;
/

create or replace procedure update_teacher(teach_id in number,instructor in varchar2,dept in number,desi in varchar2)
as 
BEGIN
    update teacher set name = instructor, dept_id = dept,designation = desi where  id = teach_id;
end;
/

set serveroutput on 
declare
teach_id number;
instructor varchar2(15);
dept number;
desi varchar2(15);
Begin
teach_id := '&id';
instructor := '&new_or_old_name';
dept := '&new_or_old_dept_id';
desi := '&new_or_old_designation';
update_teacher(teach_id,instructor,dept,desi);
end;
/

--update student
create or replace trigger student_update
after update on student for each row
declare
Begin
    dbms_output.put_line('Information about that student has been updated.');
end;
/

create or replace procedure update_student(id in number, n in varchar2,d in number,s in number)
as 
BEGIN
    update student set name = n, dept_id = d,semester = s where  student_id = id ;
end;
/

set serveroutput on
declare
id number;
n varchar2(15);
d number;
s number;
Begin
id := '&student_id';
n :='&new_or_old_name';
d := '&new_or_old_dept_id';
s := '&new_or_old_semester';
update_student(id,n,d,s);
end;
/

--update courses
create or replace trigger course_update
after update on courses for each row
declare
Begin
    dbms_output.put_line('Information about that course has been updated.');
end;
/
create or replace procedure update_course(id in number,c_name in varchar2,d in number, b in number,cc in varchar2)
as 
BEGIN
    update courses set course_name = c_name, dept = d,book = b ,course_code = cc where  course_id = id ;
end;
/

set serveroutput on
declare 
id  number;
c_name  varchar2(15);
d number;
b number;
cc varchar2(10);
BEGIN
id := '&course_id';
c_name := '&new_or_old_course_name';
d := '&new_or_old_dept';
b := '&new_or_old_book';
cc := '&new_or_old_course_code';
update_course(id,c_name,d,b,cc);
end;
/

--update books
create or replace trigger book_update
after update on book for each row
declare
Begin
    dbms_output.put_line('Information about the book has been updated.');
end;
/

create or replace procedure update_book(id in number,b in varchar2,a in varchar2)
as 
BEGIN
    update book set book_name = b,book_author=a where  book_id = id ;
end;
/

set serveroutput on 
declare
id number;
b varchar2(15);
a varchar2(15);
BEGIN
id := '&book_id';
b := '&new_or_old_book_name';
a := '&new_or_old_book_author';
update_book(id,b,a);
End;
/

-----delete 
--delete teacher
create or replace trigger teacher_delete
after delete on teacher for each row
declare
Begin
    dbms_output.put_line('Information about the instructor has been removed.');
end;
/

create or replace procedure delete_teacher(teach_id in number)
as 
BEGIN
    delete from teacher where id = teach_id;
end;
/
set serveroutput on
declare
id number;
Begin
id := '&id';
delete_teacher(id);
end;
/
--delete courses
create or replace trigger course_delete
after delete on courses for each row
declare
Begin
    dbms_output.put_line('Course removed.');
end;
/
create or replace procedure delete_course(id in number)
as
Begin
    delete from courses where course_id = id;
end;
/
set serveroutput on
declare
id number;
Begin
id := '&id';
delete_course(id);
end;
/

--delete student
create or replace trigger student_delete
after delete on student for each row
declare
Begin
    dbms_output.put_line('Student removed.');
end;
/
create or replace procedure delete_student(id in number)
as
Begin
    delete from student where student_id = id;
end;
/
set serveroutput on
declare
id number;
Begin
id := '&id';
delete_student(id);
end;
/
--delete book
create or replace trigger book_delete
after delete on book for each row
declare
Begin
    dbms_output.put_line('Book removed.');
end;
/
create or replace procedure delete_book(id in number)
as
Begin
    delete from book where book_id = id;
end;
/
set serveroutput on
declare
id number;
Begin
id := '&id';
delete_book(id);
end;
/

--cursor to view books or courses
create or replace procedure view_books_or_courses(something varchar2)
is 
    cursor cbooks
    is
        select *from book;
    cursor ccourses
    is
        select *from courses;

    pbooks cbooks%ROWTYPE;
    pcourses ccourses%ROWTYPE;
BEGIN
    IF something like 'books' then open cbooks;
        dbms_output.put_line('ID    BOOK NAME        BOOK AUTHOR');
        dbms_output.put_line('----------------------------------');
        loop
            fetch cbooks into pbooks;
            exit when cbooks%NOTFOUND;
            dbms_output.put_line(pbooks.book_id||'    '||pbooks.book_name||'        '||pbooks.book_author);
        end loop;
    ELSIF something like 'course' then open ccourses;
        dbms_output.put_line('COURSE_ID    COURSE_NAME      DEPARTMENT    BOOK   COURSE CODE');
        dbms_output.put_line('-------------------------------------------------------------');
        loop
            fetch ccourses into pcourses;
            exit when ccourses%NOTFOUND;
            dbms_output.put_line(pcourses.course_id||'     '||pcourses.course_name||'      '||pcourses.dept||'    '|| pcourses.book||'   '||pcourses.course_code);
        end loop;
    else
        dbms_output.put_line('You must choose between books or courses');
    end if;
end;
/

set serveroutput on
declare
something varchar2(25);
Begin
    something := '&Select_books_or_courses';
    view_books_or_courses(something);
end;
/
