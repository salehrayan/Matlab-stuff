clc;clear;close all;

grades = rand(40, 5) .* 20;
[max_grades, max_students] = max(grades);
[min_grades, min_students] = min(grades);

weights = [3, 3, 3, 2, 2];
gpa = (grades * weights') / sum(weights);

min_student_grade = min(grades, [], 2);
max_student_grade = max(grades, [], 2);

students_above_10 = sum(gpa > 10);
course_mean = mean(grades);
course_std = std(grades);

mean_gpa = mean(gpa);
std_gpa = std(gpa);
students_above_1std = sum(gpa > (mean_gpa + std_gpa));

disp('max course students:')
disp(max_students)
disp('min course students:')
disp(min_students)

disp('min and max grades of each student:')
for i = 1:length(min_student_grade)
    fprintf('student %d: (%.2f, %.2f)\n', i, min_student_grade(i), max_student_grade(i));
end

disp('above 10:')
disp(students_above_10)

disp('course mean:')
disp(course_mean)
disp('course std:')
disp(course_std)

disp('above 1 std:')
disp(students_above_1std)
