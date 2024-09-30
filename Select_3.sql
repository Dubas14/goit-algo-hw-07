SELECT g.name AS group_name, round(AVG(gr.grade), 0) AS avg_grade
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN grades gr ON s.id = gr.student_id
JOIN subjects sub ON gr.subject_id = sub.id
WHERE sub.name = 'століття'
GROUP BY g.id;