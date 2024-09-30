SELECT s.fullname , g.grade, g.grade_date 
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
JOIN groups gr ON s.group_id = gr.id
WHERE gr.name = 'місце' 
  AND sub.name = 'століття' 
  AND g.grade_date = (
    SELECT MAX(g2.grade_date)
    FROM grades g2
    JOIN students s2 ON g2.student_id = s2.id
    WHERE s2.group_id = gr.id 
      AND g2.subject_id = sub.id
)
ORDER BY s.fullname ;
