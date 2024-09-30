SELECT DISTINCT sub.name AS subject_name
FROM subjects sub
JOIN grades gr ON sub.id = gr.subject_id
JOIN students s ON gr.student_id = s.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE s.fullname = 'Макар Носенко' AND t.fullname = 'Царенко Єлисавета Миронівна';