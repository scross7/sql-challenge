-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM "Employees" as e
JOIN "Salaries" as s
ON (e.emp_no = s.emp_no)

-- 2. List employees who were hired in 1986.

SELECT e.emp_no, e.last_name, e.first_name, e.hire_date
FROM "Employees" as e
WHERE EXTRACT (year FROM "hire_date") = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM "Departments" as d
JOIN "Dept_Manager" as dm
ON (d.dept_no = dm.dept_no)
	JOIN "Employees" as e
	ON (dm.emp_no = e.emp_no)
ORDER BY d.dept_no, dm.from_date

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" as e
JOIN "Dept_Emp" as de
ON (de.emp_no = e.emp_no)
    JOIN "Departments" as d
    ON (de.dept_no = d.dept_no)

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name
FROM "Employees" as e
WHERE (e.first_name = 'Hercules' AND e.last_name LIKE 'B%')
ORDER BY e.last_name ASC

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" as e
JOIN "Dept_Emp" as de
ON (e.emp_no = de.emp_no)
    JOIN "Departments" as d
    ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales')

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" as e
JOIN "Dept_Emp" as de
ON (e.emp_no = de.emp_no)
    JOIN "Departments" as d
    ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development')
ORDER BY e.emp_no ASC

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT e.last_name
FROM "Employees" as e
ORDER BY e.last_name DESC

SELECT DISTINCT COUNT (e.last_name) AS "last_name_count", e.last_name
FROM "Employees" as e
GROUP BY e.last_name
ORDER BY "last_name_count" DESC