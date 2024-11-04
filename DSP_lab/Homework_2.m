clc;clear;close all;

N = 10; 
M = 5;  

x = randi([0, 20], N, M);  

course_grades = zeros(1, M);  

for j = 1:M
    course_sum = 0;
    for i = 1:N
        course_sum = course_sum + x(i,j); 
    end
    course_grades(j) = course_sum / N; 
end

disp('Mean grade for each course:');
disp(course_grades);

weights = [3, 3, 1, 2, 3];  

gpa = (x * weights') / sum(weights);

disp('GPA of each student:');
disp(gpa);
