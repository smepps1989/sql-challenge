-- List the employee number, last name, first name, sex, and salary of each employee
SELECT
    e.employee_id,
    e.last_name,
    e.first_name,
    e.sex,
    e.salary
FROM employees e
LEFT JOIN emp_salaries s ON e.employee_id = s.emp_salaries;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986; 

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
    dm.department_id,
    d.department_n,
    e.employee_id,
    e.last_name,
    e.first_name
FROM employees e
LEFT JOIN dept_managers dm ON e.employee_id = dm.manager_id
LEFT JOIN department d ON dm.department_id = d.department_id
WHERE employee_id IN (SELECT manager_id FROM dept_managers)
ORDER BY e.employee_id ASC;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
    d.department_id,
    dp.department_n,
    e.employee_id,
    e.last_name,
    e.first_name
FROM employees e 
LEFT JOIN dept_employees dp ON e.employee_id = dp.employee_id
LEFT JOIN d ON d.department_id = dp.department_id;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
    first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT
    e.employee_id,
    e.last_name,
    e.first_name
FROM employees e
LEFT JOIN dept_employees de ON e.employee_id = de.employee_id
LEFT JOIN department d ON de.department_id = d.department_id
WHERE d.department_n =  'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
    e.employee_id,
    e.last_name,
    e.first_name,
    d.department_n
FROM employees e
LEFT JOIN dept_employees de ON e.employee_id = de.employee_id
LEFT JOIN department d ON de.department_id = d.department_id
WHERE d.department_n IN  ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
last_name, 
COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;