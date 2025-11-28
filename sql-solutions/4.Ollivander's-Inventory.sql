-- Soal 4 : Ollivander's Inventory
-- Link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
-- Tujuan: Window Function

SELECT id, age, coins_needed, power
FROM (
    SELECT 
        w.id,
        p.age,
        w.coins_needed,
        w.power,
        ROW_NUMBER() OVER (
            PARTITION BY w.power, p.age 
            ORDER BY w.coins_needed
        ) as rnk
    FROM Wands w
    JOIN Wands_Property p ON w.code = p.code
    WHERE p.is_evil = 0
) ranked
WHERE rnk = 1
ORDER BY 
power DESC, 
age DESC;
