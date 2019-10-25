--1.Lising details of employee with salary
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary 
FROM employees AS e
JOIN salaries AS s
ON e.emp_no=s.emp_no;

--2.Listing employees who were hired in 1986
SELECT emp_no, first_name, last_name,hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01'
AND '1986-12-31';
		   
--3. Listing the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name,dm.from_date, dm.to_date 
FROM dept_manager as dm
INNER JOIN employees as e ON dm.emp_no = e.emp_no
	INNER JOIN departments as d ON d.dept_no = dm.dept_no;

--4. Listing the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no = e.emp_no
			   INNER JOIN departments as d ON d.dept_no = de.dept_no;

--5. Listing all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
			   
--6. Listing all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no = e.emp_no
			   INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales';
			   
--7. Listing all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON de.emp_no = e.emp_no
			   INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';
			   
--8. In descending order, listing the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Total Employees" 
FROM employees
Group By last_name
ORDER By "Total Employees"  DESC;