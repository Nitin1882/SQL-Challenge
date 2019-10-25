DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_emp;

--table schema for departments table
CREATE TABLE departments (
    dept_no varchar PRIMARY KEY,
    dept_name varchar NOT NULL
);
SELECT * FROM departments;

--table schema for employees table
CREATE TABLE employees(
    emp_no serial PRIMARY KEY NOT NULL,
    birth_date date,
    first_name varchar(30)NOT NULL,
    last_name varchar(30) NOT NULL,
    gender char(1) NOT NULL,
    hire_date date NOT NULL
);
SELECT * FROM employees;

--table schema for dept_emp junction table
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no varchar NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    from_date date,
    to_date date,
    PRIMARY KEY (emp_no,dept_no)
);
SELECT * FROM dept_emp;

--table schema for dept_manager table
CREATE TABLE dept_manager (
    dept_no varchar  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    from_date date,
    to_date date,
	PRIMARY KEY(dept_no,emp_no)
);
SELECT * FROM dept_manager;

----table schema for salaries table
CREATE TABLE salaries (
    emp_no serial PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary int NOT NULL,
    from_date date,
    to_date date    
);
SELECT * FROM salaries;

----table schema for titles table
CREATE TABLE titles (
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    title varchar(50) NOT NULL,
    from_date date,
    to_date date
);
DROP TABLE titles;
SELECT * FROM titles;



