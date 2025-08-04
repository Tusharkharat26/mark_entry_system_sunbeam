CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    course_id INT
    batch_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

{# CREATE TABLE teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    hire_date DATE NOT NULL
); #}

CREATE TABLE modules (
    course_id INT
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(255) NOT NULL,
    
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

CREATE TABLE batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    module_id INT,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE staff (
    staff_id INT,
    module_id INT,
    staff_name VARCHAR(255) not NULL
    role VARCHAR(255)   not  NULL
    PRIMARY KEY (staff_id, module_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT,
    course_name VARCHAR(255) not null
    staff_id INT,
    
    
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
{# CREATE TABLE se (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT,
    teacher_id INT,
    session_type VARCHAR(50) NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
); #}

{# CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    student_id INT,
    attendance_status VARCHAR(10) NOT NULL,
    UNIQUE (session_id, student_id),
    FOREIGN KEY (session_id) REFERENCES session(session_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
); #}

{# CREATE TABLE lab_records (
    lab_record_id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    student_id INT,
    lab_work_details TEXT,
    submission_date DATE,
    grade DECIMAL(5,2),
    UNIQUE (session_id, student_id),
    FOREIGN KEY (session_id) REFERENCES session(session_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
); #}

CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT,
    
    exam_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT,
    student_id INT,
    score DECIMAL(5,2) NOT NULL,
    UNIQUE (exam_id, student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

{# CREATE TABLE exam_attendance (
    exam_attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT,
    student_id INT,
    attendance_status VARCHAR(10) NOT NULL,
    UNIQUE (exam_id, student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
); #}

CREATE TABLE module_grades (
    module_grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    module_id INT,
    grade VARCHAR(2) NOT NULL,
    completion_date DATE,
    UNIQUE (student_id, module_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);