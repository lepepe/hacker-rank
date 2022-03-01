SELECT
    con.contest_id, con.hacker_id, con.name,
    SUM(total_submissions), SUM(total_accepted_submissions),
    SUM(total_views), SUM(total_unique_views)
FROM Contests con
JOIN Colleges col ON col.contest_id = con.contest_id
JOIN Challenges c ON c.college_id = col.college_id
LEFT JOIN
    (
        SELECT
            challenge_id,
            SUM(total_views) as total_views,
            sum(total_unique_views) as total_unique_views
        FROM view_stats
        GROUP BY challenge_id
    ) vs ON c.challenge_id = vs.challenge_id
LEFT JOIN
    (
        SELECT
            challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM submission_stats
        GROUP BY challenge_id
    ) ss ON c.challenge_id = ss.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING SUM(total_submissions) <> 0 or
SUM(total_accepted_submissions) <> 0 or
SUM(total_views) <> 0 or
SUM(total_unique_views) <> 0
ORDER BY contest_id;
