select * from semester


-----------1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table --------
-------- created in SQL Task 8) based on studentname column --------

create procedure cond_pro(@name varchar(25))
as
begin
select * from semester where studentname=@name
end
exec cond_pro 'VIKRAM'



-------USING IF THEN IN PROCEDURE ----

ALTER procedure name_finding(@names varchar(25))
as 
begin
  if((select studentname from semester where studentname=@names)=@names)
   begin
   SELECT * FROM SEMESTER WHERE studentname=@names
   end
else
begin
print' THE STUDENT ' + @names +' IS NOT PRESENT IN THE TABLE'
end
end

EXEC name_finding 'VIJAF'

-----2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.----


alter procedure remarks
as

begin
select studentid,studentname,securedmarks,
case

when(securedmarks>=480 and securedmarks<=500)then 'A+'
when(securedmarks>=450 and securedmarks<480)then 'A'
when(securedmarks>=400 and securedmarks<450)then 'A-'
else 
'B'
end as 'remarks'
from semester
end

exec remarks



---3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)---
--- 1) temp table ---

--LOCAL ---
create table #templocal(
name varchar(20)
)
insert into #templocal values ('vikram ')
select * from #templocal

--- GLOBAL ---
create table ##tempglobal(
name varchar(20)
)
insert into ##tempglobal values ('vikram')
select * from ##tempglobal

--- 2)table variable ---

--LOCAL--

declare @temp_var table(
name varchar(25)
)
insert into @temp_var values('VIKRAM')
SELECT * from @temp_var

--- 3)temp procedures ---

---LOCAL---

create procedure #loc_proc
as
begin
print 'IM THE LOCAL PROCEDURE '
END

EXEC #loc_proc

--- GLOBAL ---

ALTER procedure ##loc_proc
as
begin
print 'IM THE GLOBAL PROCEDURE '
END

EXEC ##loc_proc
