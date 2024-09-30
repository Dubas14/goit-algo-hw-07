SELECT DISTINCT sub.name AS subject_name
FROM subjects sub
JOIN grades gr ON sub.id = gr.subject_id
JOIN students s ON gr.student_id = s.id
WHERE s.fullname = 'Марко Сірко';