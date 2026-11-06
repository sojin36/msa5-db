-- SELECT 절 : 조회한 데이터 중 특정 컬럼만 출력

SELECT
	emp_id
	, `NAME` -- 백틱으로 감싸면, 컬럼으로 인식 시킴
	, gender
FROM employees -- 테이블 지정
;

-- Asterrisr (*) : 모든 컬럼 조회

-- WHERE 절 : 특정 컬럼의 값이 조건에 맞는 데이터만 조회
-- 사번이 1009인 사원이 모든 정보를 조회해주세요.

SELECT
	*
FROM employees
WHERE
	emp_id = 10009
;


-- 사원명이 "박보람"인 사원이 정보를 조회해 주세요.
SELECT
	*
FROM employees
WHERE
	`name` = "박보람"
;


-- 생일이 2000-01-01 이후인 사원 모두 찾아주세요.
SELECT
	*
FROM employees
WHERE
	birth >= '2000-01-01'
;

-- 퇴사하지 않은 사원 정보 다 주세요.
SELECT
	*
FROM employees
WHERE
	fire_at IS NOT NULL
;

-- 1990년 생인 사원을 조회해 주세요.
SELECT
	*
FROM employees
WHERE
	birth >= '1990-01-01' 
	AND birth <= '1990-12-31'
;


-- 이름이 '김철수' 또는 '정유리'인 사원을 조회해 주세요.
SELECT
	*
FROM employees
WHERE
	'name' = '김철수'
	OR 'name' = '정유리'
;

-- 1990년생 이거나, 이름이 '정유리'인 사원을 조회
SELECT
	*
FROM employees
WHERE
	(birth >= '1990-01-01' 
	AND birth <= '1990-12-31')
	OR 'name' = '정유리'
;


-- BETWEEN 연산자: 지정한 범위 내의 데이터를 조회
SELECT
	*
FROM employees
WHERE
	birth BETWEEN  '1990-01-01'  AND '1990-12-31'
;

-- IN 연산자 : 다수의 지정한 값과 일치하는 데이터를 조회
SELECT
	*
FROM employees
WHERE
 `name` IN ('박보람', '정유리')
;


-- 사번이 10001, 10005, 10006인 사원의 모든 정보 조회
SELECT
	*
FROM employees
WHERE
 emp_id IN ('10001', '10005', '10006')
;

-- LIKE 절 : 문자열의 내용을 조회
-- %: 글자수와 상관없이 조회할 경우 사용
-- 이름이 '우'로 끝나는 사원 조회
SELECT
	*
FROM employees
WHERE
 `name` LIKE '%우'
;

-- (_): 언더바의 개수만큼 글자수를 허용해서 조회
SELECT
	*
FROM employees
WHERE
	`name` LIKE '_우%'
;


-- ORDER BY 절 : 조회한 데이터를 정렬
SELECT
	*
FROM employees
ORDER BY `name` DESC, birth
;

-- LIMIT 키워드, OFFSET 키워드 : 출력의 개수를 제한
SELECT
	*
FROM employees
LIMIT 5 OFFSET 5
;





