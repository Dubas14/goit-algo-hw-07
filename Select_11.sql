SELECT round(AVG(g.grade), 0) AS avg_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
JOIN students s ON g.student_id = s.id
WHERE t.fullname = 'Віктор Колісниченко' AND s.fullname = 'Едита Парасюк';