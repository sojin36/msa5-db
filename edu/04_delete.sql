-- DELETE 문
-- DML 중 하나로 저장되어있는 기존 데이터 삭제위해 사용

-- DELETE FROM 테이블명
-- [WHERE 조건];
DELETE FROM employees
WHERE
	emp_id = 100005
	;