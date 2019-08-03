-- Part 1: "List the following details of each employee: employee number, last name, first name, gender, and salary."

-- Making emp.no less ambiguous by tying it to employees.emp_no
SELECT employees.emp_no, first_name, last_name, gender, salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- Part 2: "List employees who were hired in 1986."

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' AND '1987-01-01';

-- Part 3: "List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates."

-- Making dept_no less ambiguous by tying it to department.dept_no, making emp_no less ambiguous again
SELECT department.dept_no, dept_name, employees.emp_no, last_name, first_name, from_date, to_date
FROM department
-- Joining department and dept_manager together
JOIN dept_manager
ON department.dept_no = dept_manager.dept_no
-- Joinging employee data to the already conjoined dept/dept_manager
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- Part 4: "List the department of each employee with the following information: employee number, last name, first name, and department name."

-- Making emp.no less ambiguous by tying it to employees.emp_no
SELECT employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
-- Joining dept_emp and employees
JOIN employees
ON dept_emp.emp_no = employees.emp_no
-- Joinging department to the already conjoined emp/dept_emp
JOIN department
ON dept_emp.dept_no = department.dept_no;

-- Part 5: "List all employees whose first name is "Hercules" and last names begin with "B.""

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Part 6: "List all employees in the Sales department, including their employee number, last name, first name, and department name."

-- Making emp.no less ambiguous by tying it to employees.emp_no
SELECT employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
-- Joining dept_emp and employees
JOIN employees
ON dept_emp.emp_no = employees.emp_no
-- Joinging department to the already conjoined emp/dept_emp
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE dept_name = 'Sales';

-- Part 7: "List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name."

-- Making emp.no less ambiguous by tying it to employees.emp_no
SELECT employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
-- Joining dept_emp and employees
JOIN employees
ON dept_emp.emp_no = employees.emp_no
-- Joinging department to the already conjoined emp/dept_emp
JOIN department
ON dept_emp.dept_no = department.dept_no
-- Specifying Sales or Development
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- Part 8: "In descending order, list the frequency count of employee last names, i.e., how many employees share each last name."

SELECT last_name,
-- Counting the number of times a last name apears and aliasing it to frequency
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;