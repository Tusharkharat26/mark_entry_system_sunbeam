-- COURSES TABLE
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
);

-- BATCHES TABLE
CREATE TABLE batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- MODULES TABLE
CREATE TABLE modules (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    module_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- GROUPS TABLE (Not in your code, but required from image)
CREATE TABLE groups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    group_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- STUDENTS TABLE
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    batch_id INT NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

-- STAFF TABLE
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

-- STAFF-MODULE MAPPING (Many-to-many-like design)
CREATE TABLE staff_module (
    staff_id INT,
    module_id INT,
    PRIMARY KEY (staff_id, module_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

-- EXAMS TABLE
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT NOT NULL,
    exam_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

-- MARKS TABLE
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    UNIQUE (exam_id, student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- MODULE GRADES TABLE
CREATE TABLE module_grades (
    module_grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    module_id INT NOT NULL,
    grade VARCHAR(2) NOT NULL,
    completion_date DATE,
    UNIQUE (student_id, module_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);
