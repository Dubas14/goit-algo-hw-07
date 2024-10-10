import random
from faker import Faker
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from conf.models import Group, Teacher, Subject, Student, Grade, Base

engine = create_engine('postgresql://postgres:123456@localhost/postgres')

Session = sessionmaker(bind=engine)
session = Session()

fake = Faker('uk_UA')


def create_groups():
    groups = []
    for _ in range(3):
        group = Group(name=fake.word().capitalize())
        groups.append(group)
    session.add_all(groups)
    session.commit()
    return groups


def create_teachers():
    teachers = []
    for _ in range(3):
        teacher = Teacher(fullname=fake.name())
        teachers.append(teacher)
    session.add_all(teachers)
    session.commit()
    return teachers


def create_subjects(teachers):
    subjects = []
    for _ in range(random.randint(5, 8)):
        subject = Subject(name=fake.word().capitalize(), teacher=random.choice(teachers))
        subjects.append(subject)
    session.add_all(subjects)
    session.commit()
    return subjects


def create_students(groups):
    students = []
    for _ in range(30):  # Генеруємо 30 студентів
        student = Student(fullname=fake.name(), group=random.choice(groups))
        students.append(student)
    session.add_all(students)
    session.commit()
    return students


def create_grades(students, subjects):
    grades = []
    for student in students:
        for subject in subjects:
            for _ in range(random.randint(10, 20)):
                grade = Grade(
                    student=student,
                    subject=subject,
                    grade=random.randint(0, 100),
                    grade_date=fake.date_this_decade()
                )
                grades.append(grade)
    session.add_all(grades)
    session.commit()


def seed_database():
    Base.metadata.create_all(engine)

    groups = create_groups()
    teachers = create_teachers()
    subjects = create_subjects(teachers)
    students = create_students(groups)
    create_grades(students, subjects)

    print("Database has been seeded with random data!")


if __name__ == '__main__':
    seed_database()

    session.close()
