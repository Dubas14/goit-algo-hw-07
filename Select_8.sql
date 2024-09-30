SELECT round(AVG(grade), 0) AS avg_grade
FROM grades gr
JOIN subjects sub ON gr.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE t.fullname = 'Віктор Колісниченко';