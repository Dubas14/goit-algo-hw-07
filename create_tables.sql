drop table if exists groups;
create table groups (
	id SERIAL primary key,
	name VARCHAR(50) not NULL
);

drop table if exists students;
create table students (
	id SERIAL primary key,
	fullname VARCHAR (150) not null,
	group_id INTEGER references groups(id)
);

drop table if exists teachers;
create table teachers (
	id SERIAL primary key,
	fullname VARCHAR (150) not null
);

drop table if exists subjects;
create table subjects (
	id SERIAL primary key,
	name VARCHAR (175) not null,
	teacher_id INTEGER references teachers(id)
);

drop table if exists grades;
create table grades(
	id SERIAL primary key,
	student_id INTEGER references students (id),
	subject_id INTEGER references subjects (id),
	grade INTEGER check (grade >= 0 and grade <= 100),
	grade_date DATE not null 
);



