SELECT s.fullname , g.grade, sub.name AS subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN groups gr ON s.group_id = gr.id
JOIN subjects sub ON g.subject_id = sub.id
WHERE gr.name = 'хліб' AND sub.name = 'пастух';