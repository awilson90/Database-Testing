# Data Analysis
# Once you have a complete database, do the following:

# 1)	List the following details of each employee: employee number, last name, first name, gender, and salary.

select t1.emp_no, t1.last_name, t1.first_name, t1.gender, t2.salary
from employees t1
inner join salaries t2 on t2.emp_no = t1.emp_no
order by 1;

# 2)		List employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date FROM employees
WHERE hire_date BETWEEN '1985/12/31' AND '1986/01/01';

# 3)		List the manager of each department with the following information: department number... 
#			...department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT t1.dept_no, t2.dept_name, t1.emp_no, t3.last_name, t3.first_name, t1.from_date, t1.to_date
FROM dept_manager t1
INNER JOIN departments t2 ON t2.dept_no = t1.dept_no
INNER JOIN employees t3 ON t3.emp_no = t1.emp_no;

# 4)		List the department of each employee with the following information: employee number...
#			...last name, first name, and department name.

SELECT t1.emp_no, t3.last_name, t3.first_name, t2.dept_name
FROM dept_emp t1
INNER JOIN departments t2 ON t2.dept_no = t1.dept_no
INNER JOIN employees t3 ON t3.emp_no = t1.emp_no;

# 5)		List all employees whose first name is "Hercules" and last names begin with "B.

SELECT emp_no, last_name, first_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

# 6)		List all employees in the Sales department, including their employee number, last name... 
#			...first name, and department name.

SELECT t1.emp_no, t3.last_name, t3.first_name, t2.dept_name
FROM dept_emp t1
INNER JOIN departments t2 ON t2.dept_no = t1.dept_no
INNER JOIN employees t3 ON t3.emp_no = t1.emp_no
WHERE t2.dept_name = 'Sales';

# 7)		List all employees in the Sales and Development departments, including their employee number... 
#			...last name, first name, and department name.

SELECT t1.emp_no, t3.last_name, t3.first_name, t2.dept_name
FROM dept_emp t1
INNER JOIN departments t2 ON t2.dept_no = t1.dept_no
INNER JOIN employees t3 ON t3.emp_no = t1.emp_no
WHERE t2.dept_name IN ('Sales','Development');

# 8)		In descending order, list the frequency count of employee last names,
#			i.e., how many employees share each last name.

select last_name, count(last_name) as "Total Name Count" 
from employees
group by last_name
order by 2 desc;
