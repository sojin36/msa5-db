-- 내장 함수 (Function)

-- ----------------
-- 데이터 타입 변환 함수
-- ----------------
SELECT 
	CAST(1234 AS CHAR(6));
	, CONVERT (1234, CHAR(6))
;
SELECT 
	CAST(emp_id AS CHAR(20))
FROM employees
WHERE emp_id = 100006
;

-- ----------------
-- 제어흐름 함수
-- ----------------
-- IF (수식, 참임 경우의 값, 거짓일 경우의 값)
SELECT
	`name`
	, gender
	, IF (gender = 'M' ,'남자', '여자') ko_gender
FROM employees
;


-- IFNULL (수식1, 수식2)
-- 수식1이 null이면 수식2반환, 아니면 수식 1 반환
SELECT
	IFNULL (fire_at, '재직중')
	, fire_at
FROM employees
;


-- NULLIF (수식1, 수식2)
-- 수식1과 수식2를 비교해서 같으면 NULL 반환
-- 다르면 수식1 반환
SELECT
	NULLIF (gender, 'M')
FROM employees
;


-- CASE ~ WHEN ~ ELSE ~ END
SELECT 
	CASE gender
		WHEN 'M' THEN '남자'
		WHEN 'F' THEN '여자'
		ELSE '기타'
	END ko_gender
FROM employees


-- --------------------
-- 문자열 함수
-- --------------------
-- 문자열 연결
SELECT CONCAT('하이', ' ', '소진');
SELECT CONCAT(`name`, ' ', gender) FROM employees;


-- 구분자로 문자열을 연결
SELECT CONCAT_WS(', ', '자바', 'HTML');


-- 숫자에 자릿수(,) 및 소수점 자리수 표시
SELECT FORMAT(salary, 0) FROM salaries;


-- 문자열의 왼쪽/ 오른쪽부터 길이만큼 잘라 반환
SELECT LEFT('123456', 2)	
,RIGHT ('123456', 2, '0') RPAD ('123',6, '0')

-- 문자열의 좌/우 공백 제거
SELECT
	` test `
	, TRIM ('  test')


-- 왼쪽부터 구분자가 n번째 만큼 나오면 그 이후 버림
SELECT SUBSTRING_INDEX(
	'abc-test_1103.htt'
	, '.'
	, 2 			
)txt;
		 	
		 	
-- 영어 대/소문자 변경
SELECT UPPER ('asdfwSDf'), LOWER ('asWEFDfdf');
			
			
-- ------------
-- 수학함수
-- ------------
-- 올림, 반올림, 버림
SELECT CEIL(3.14), ROUND(3.14), FLOOR(3.14);
			
-- 절대값
SELECT ABS(-1), ABS(1);
			
-- 소수점을 기준으로 특정 자리수까지 구하고 나머지는 버림
SELECT TRUNCATE(1.19, 0);

-- ---------------------
-- 날짜 및 시간관련 함수
-- ---------------------
-- 현재 날짜 및 시간 변환 (YYYY-MM-DD hh:mi:ss)
SELECT NOW();

-- (YYYY-MM-DD)
SELECT DATE('2026-11-09 16:05:39');
SELECT DATE(created_at) FROM employees;

-- 날짜의 단위기간에 따라 더한 날짜/시간 반환
SELECT ADDDATE(NOW(), INTERVAL 1 YEAR);
			

-- 순차함수
-- ------------------
-- RANK() OVER(ORDER BY 컬럼 ASC/DESC)
-- 지정한 컬럼을 기준으로 순위를 매겨 반환
-- 동일한 값이 있는 경우 동일한 순위를 부여	
SELECT
	emp_id
	, salary
	, RANK() OVER(ORDER BY salary DESC) `rank`
FROM salaries
WHERE
	end_at IS NULL
;	
			
			
-- ROW_NUMBER() OVER(ORDER BY salary DESC)
-- 레코드에 순위를 매겨 반환
-- 동일한 값이 있는 경우에도 각 행에 고유한 번호 부여
SELECT
	emp_id
	, salary
	, ROW_NUMBER() OVER(ORDER BY salary DESC) `rank`
FROM salaries
WHERE
	end_at IS NULL
;	


