SELECT * FROM dept_emp;
/* 
List the following details of each employee: 
employee number, last name, first name, gender, and salary
*/

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

/*List employees who were hired in 1986. */

SELECT first_name, last_name, hire_date FROM employees
WHERE employees.hire_date LIKE '1986%';

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name, 
and start and end employment dates. */

SELECT d.dept_no, d.dept_name, dm.from_date, dm.to_date, e.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
JOIN departments AS d
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;

/* List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;

/*
List all employees whose first name is "Hercules" and last names begin with "B."
*/

SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name Like 'B%';

/* List all employees in the Sales department, 
including their employee number, last name, first name, and department name.*/

SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_no IN ('d005','d007')
	)
);

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_no ='d005'
	)
);

/*In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/

SELECT last_name, COUNT(last_name) AS "ln count"
FROM employees
GROUP BY last_name 
ORDER BY "ln count" DESC;

