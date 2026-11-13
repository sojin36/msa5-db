-- --------------
-- INDEX
-- --------------
-- INDEX 확인
SHOW TABLES;
SHOW INDEX FROM employees;

-- 0.03초 정도?
SELECT * FROM employees WHERE `name` = '소진';

-- INDEX 생성
ALTER TABLE employees
ADD INDEX idx_employees_name(`name`);

-- INDEX 제거
ALTER TABLE employe
DROP index