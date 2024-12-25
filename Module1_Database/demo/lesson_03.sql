-- Mệnh đề SELECT
-- VD: lấy ra ngày hôm nay
SELECT CURRENT_DATE;
-- VD:
SELECT PI(), 1+2;
-- vd thay tên cột bằng as
SELECT "MySQL" AS "Database";
-- Mệnh đề from
-- VD: lấy ra tất cả mã đề thi
SELECT code
FROM exam;
-- vd: lấy ra tất cả câu hỏi
SELECT *
FROM question;
-- VD: lấy ra tất cả thời gian thi (không trùng nhau)
-- DISTINCT: => in ra những cái giá trị k trùng nhau ( tác dụng lọc
SELECT DISTINCT duration
FROM exam;

-- Mệnh đề WHERE
-- Toán tử: >, >=... !=  (<>)
-- VD: lấy ra account có id >5
SELECT *
FROM account
WHERE account_id >5;
