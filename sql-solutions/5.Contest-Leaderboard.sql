-- Soal 5 : Contest Leaderboard
-- Link: https://www.hackerrank.com/challenges/contest-leaderboard
-- Tujuan: Agregasi bertingkat (max per (hacker, challenge) kemudian sum per hacker), join ke master Hackers, filter skor nol

SELECT
    m.hacker_id,
    h.name,
    SUM(m.max_score) as total_score
FROM (
    SELECT
        s.hacker_id,
        s.challenge_id,    
        MAX(s.score) as max_score
    FROM
        Submissions s
    GROUP BY
        s.hacker_id, s.challenge_id
) m
JOIN Hackers h ON m.hacker_id = h.hacker_id
GROUP BY m.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, m.hacker_id ASC;
