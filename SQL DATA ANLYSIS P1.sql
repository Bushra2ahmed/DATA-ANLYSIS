use employees;
-- 1 list of employees by department 
select * from employees;
select * from departments;
select * from salaries
-- q1 query for employees with department name include emp name 1 name last namedep no and dep name ;

select e.emp_no ,e.first_name , e.last_name employees , d.dept_no , d.dept_name from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
-- 2.Current and past salaries of  employees
-- question :- - write a query to retrieve all   salary record of given employees (by employee number) .include employee number , salary from_date and  to_date

select * from salaries
where emp_no ='10044'
order by  salary desc Limit 1
-- 3. Employees with specific titles
-- Question :- - write a query to find all   employee who held specific title(eg :engineer) .include employee number ,  first  name , last  name 
select  e.emp_no ,e.first_name , e.last_name ,title  from employees as e 
Join titles as t
on e.emp_no = t.emp_no
where title = 'Engineer'
-- 4. Department with their manager
-- Question :- - write a query to list all  department along with their manager .include department number ,department name manager employee number first  name , last  name 
select  d.dept_no , d.dept_name,e.emp_no ,e.first_name , e.last_name  from departments as d 
join dept_manager as dm 
on d.dept_no = dm.dept_no
join employees as e 
on e.emp_no = dm.emp_no
-- 5. Employee count  by department
-- Question :- - write a query to count number of employee in each department . Include department number ,department name and employee count
select  d.dept_no , dept_name, count(de.emp_no) as emp_count from departments as d
join dept_emp as de 
on d.dept_no = de.dept_no
group by dept_no,dept_name 
-- 6. Employee’s birthdate in a given year
--  Question :- - write a query to find all employees born  in specific year(1953). Include employee number ,first  name , last  name  and birthdate
select emp_no ,first_name , last_name,birth_date from employees
where year(birth_date)  = 1954
-- 7. Employee hired in last 50 year
-- Question :- - write a query to find all employees hired in last 50 year. Include employee number ,first  name , last  name  and hire date
select emp_no ,first_name , last_name, hire_date from employees
where hire_date <=  DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
-- 8. Average salary by department
--  Question :- - write a query to calculate average salary of each department Include department number ,department name   and average salary
select  d.dept_no , d.dept_name, avg(s.salary)  as avg_salary  from departments as d
join dept_emp as de 
on de.dept_no = d.dept_no
join salaries as s on de.emp_no = s.emp_no
group by d.dept_no, d.dept_name 
-- 9. Gender distribution by each department
-- Question :- - write a query to find gender distribution in each department Include department number ,department name   and count of male and female
select  d.dept_no , d.dept_name,
sum(case when e.gender = 'M' then 1  else 0 end ) as male_count,
sum(case when e.gender = 'F' then 1  else 0 end) as female_count
from departments as d
join dept_emp as de 
on de.dept_no = d.dept_no
join employees as e 
on de.emp_no = e.emp_no
group by d.dept_no , d.dept_name
-- 10. Longest serving employees
-- Question :- - write a query to find employee who have served longest in company Include employee number ,first  name , last  name and number of year they served 
select emp_no, first_name, last_name,
timestampdiff(year, hire_date, CURDATE()) as year_served
from employees 
order by year_served desc
limit 10 