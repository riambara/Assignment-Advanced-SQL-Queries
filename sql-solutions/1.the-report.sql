-- Soal 1: The Report
-- Link: https://www.hackerrank.com/challenges/the-report/problem
-- Tujuan: Map students to grades dengan logic display khusus

SELECT 
    CASE
        WHEN Grade < 8 THEN NULL
        ELSE Name
        END as Name,
    g.Grade,
    s.Marks 
FROM
    Students AS s 
JOIN
    Grades AS g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark    
ORDER BY
    g.Grade DESC,
    s.Name ASC,
    s.Marks ASC;
