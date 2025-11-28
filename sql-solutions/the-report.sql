-- Soal 1: The Report
-- Link: https://www.hackerrank.com/challenges/the-report/problem
-- Tujuan: Map students to grades dengan logic display khusus

WITH student_grades AS (
    SELECT 
        s.name,
        s.marks,
        g.grade
    FROM students s
    JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
)
SELECT
    CASE 
        WHEN grade < 8 THEN NULL 
        ELSE name 
    END AS student_name,
    grade,
    marks
FROM student_grades
ORDER BY 
    grade DESC,
    student_name ASC,
    marks ASC;
