-- 1. 직급테이블의 모든 정보를 조회해주세요.
SELECT *
FROM titles;

-- 2. 현재 급여가 60,000,000 이하인 사원의 사번을 조회해 주세요.
SELECT emp_id
FROM employees
WHERE salary <= 60000000;

-- => 답
SELECT emp_id
FROM salaries
WHERE end_at IS NULL AND salary <= 60000000


-- 3. 현재 급여가 60,000,000에서 70,000,000인 사원의 사번을 조회해 주세요.
SELECT emp_id
FROM salaries
WHERE
	salary BETWEEN '60000000' AND '70000000';



-- 4. 사원번호가 10001, 10005인 사원의 사원테이블의 모든 정보를 조회해 주세요.
SELECT *
FROM employees
WHERE emp_id IN ('10001' ,'10005');


-- 5. 직급에 '사'가 포함된 직급코드와 직급명을 조회해 주세요.
SELECT title_code, title 
FROM titles
WHERE title LIKE '%사%';


-- 6. 사원(퇴사자포함) 이름 오름차순으로 정렬해서 조회해 주세요.
SELECT
	*
FROM employees
ORDER BY `name` DESC, fire_at;

-- => 답
SELECT `name`
FROM employees
ORDER BY `name` ASC;


-- 7. 사원별(퇴사자포함) 전체 급여의 평균을 조회해 주세요.
SELECT
	emp.emp_id
	, (
		SELECT 
			 AVG (sal.salary)
		FROM salaries sal
		WHERE sal.emp_id = emp.emp_id
	) avg_sal
FROM employees emp
;

-- => 답
SELECT emp_id,CEIL(AVG(salary)) avg_sal
FROM salaries
GROUP BY emp_id;



-- 8. 사원별(퇴사자포함) 전체 급여의 평균이 30,000,000 ~ 50,000,000인,
--   사원번호와 평균급여를 조회해 주세요.
SELECT
	emp.emp_id, 
	, (
		SELECT 
			 AVG (sal.salary)
		FROM salaries sal
		WHERE sal.emp_id = emp.emp_id
	) avg_sal
FROM employees emp
;

-- => 답
SELECT emp_id, AVG(salary) avg_sal
FROM salaries
GROUP BY emp_id
	HAVING avg_sal BETWEEN 30000000 AND 50000000;




-- 9. 사원별(재직중인) 전체 급여 평균이 70,000,000이상인,
--   사원의 사번, 이름, 성별을 조회해 주세요.
SELECT emp.emp_id, emp.`name`, emp.gender,
	(
		SELECT
			AVG(sal.salary >= '70000000')
		FROM salaries sal
	
	)
FROM employees emp; 

-- => 답
SELECT emp.emp_id, emp.`name`, emp.gender
FROM employees emp
WHERE emp.emp_id IN(
	SELECT emp_id
	FROM salaries sal
	WHERE end_at IS NULL
	GROUP BY sal.emp_id
		HAVING AVG(salary) >= 70000000
);




-- 10. 현재 직급이(재직중인) 'T005'인,
--   사원의 사원번호와 이름을 조회해 주세요.
SELECT emp.emp_id, emp.`name`
	(
		SELECT 
			WHERE title_emps.title_code = 'T005'
FROM employees emp;

--
SELECT emp.emp_id, emp.`name`
FROM employees emp;

--
	SELECT emp_id
	WHERE title_emps.title_code = 'T005'
	FROM title_emps;
	
-- 
	SELECT emp_id, title_code
	FROM title_emps;

-- => 답
SELECT emp.emp_id, emp.`name`
FROM employees emp
WHERE emp.fire_at IS NULL AND emp.emp_id IN (
	SELECT tie.emp_id
	FROM title_emps tie
	WHERE tie.title_code = 'T005' AND tie.end_at IS NULL
);