WITH full_score_submissions AS (
    SELECT 
        s.hacker_id,
        s.challenge_id
    FROM Submissions s
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
),
hacker_full_score_count AS (
    SELECT
        hacker_id,
        COUNT(DISTINCT challenge_id) as full_score_count
    FROM full_score_submissions
    GROUP BY hacker_id
    HAVING COUNT(DISTINCT challenge_id) > 1
)
SELECT 
    h.hacker_id,
    h.name
FROM Hackers h
JOIN hacker_full_score_count hfsc ON h.hacker_id = hfsc.hacker_id
ORDER BY 
    hfsc.full_score_count DESC,
    h.hacker_id ASC;
