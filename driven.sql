-- Questão 01
select * from companies
LIMIT 5;

-- Questão 02
select * from companies
where "name" = 'Driven';

-- Questão 03
insert into companies (name,image_url)
values('Apple', 'https://picsum.photos/200/300');

-- Questão 04
delete FROM companies
where name = 'Apple';

-- Questão 05
update companies set name = 'Google'
where name ='Gogle';

-- Questão 06
update jobs set salary = 1500
where id = 1;

-- Questão 07
INSERT INTO experiences 
(user_id, company_id, role_id, start_date, end_date) 
VALUES
(3, 6, 5, '2024-11-09', null);

-- Questão 08
DELETE FROM applicants 
USING users, companies, roles, jobs 
WHERE applicants.user_id = users.id 
AND applicants.job_id = jobs.id 
AND users.name = 'Kelly' 
AND companies.name = 'Carrefour' 
AND roles.name = 'Engenheiro de Software Pleno' 
AND jobs.company_id = companies.id 
AND jobs.role_id = roles.id;

-- Questão 09
SELECT id, description, salary
FROM jobs
ORDER BY salary DESC
LIMIT 3;

-- Questão 10
SELECT jobs.id, companies.name AS company_name, jobs.salary
FROM jobs
JOIN companies ON jobs.company_id = companies.id
ORDER BY salary ASC
LIMIT 1;

-- Questão 11
SELECT users.id, users.name, cities.name AS city
FROM users
JOIN cities ON users.city_id = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- Questão 12
SELECT testimonials.id, testimonials.message, u1.name AS writer, u2.name AS recipient
FROM testimonials
JOIN users u1 ON testimonials.writer_id = u1.id
JOIN users u2 ON testimonials.recipient_id = u2.id;

-- Questão 13
SELECT educations.id, users.name, courses.name AS course, schools.name AS school, educations.end_date
FROM educations
JOIN users ON educations.user_id = users.id
JOIN courses ON educations.course_id = courses.id
JOIN schools ON educations.school_id = schools.id
WHERE educations.user_id = 5 AND educations.status = 'finished';

-- Questão 14
SELECT experiences.id, users.name, roles.name AS role, companies.name AS company, experiences.start_date
FROM experiences
JOIN users ON experiences.user_id = users.id
JOIN companies ON experiences.company_id = companies.id
JOIN roles ON experiences.role_id = roles.id
WHERE experiences.user_id = 10 AND experiences.end_date IS NOT NULL;

-- Questão 15
SELECT schools.id, schools.name AS school, courses.name AS course, companies.name AS company, roles.name AS role
FROM applicants
JOIN users ON applicants.user_id = users.id
JOIN educations ON educations.user_id = users.id
JOIN schools ON educations.school_id = schools.id
JOIN courses ON educations.course_id = courses.id
JOIN jobs ON applicants.job_id = jobs.id
JOIN companies ON jobs.company_id = companies.id
JOIN roles ON jobs.role_id = roles.id
WHERE companies.id = 1 
  AND roles.name = 'Engenheiro de Software Pleno' 
  AND jobs.active = true;


-- Questão 16
SELECT COUNT(*) AS current_experiences
FROM experiences
WHERE end_date is not NULL;

-- Questão 17
SELECT users.id, users.name, COUNT(educations.id) AS educations
FROM users
JOIN educations ON users.id = educations.user_id
GROUP BY users.id, users.name
ORDER BY educations DESC;

-- Questão 18
SELECT u.name AS writer, COUNT(t.id) AS testimonialCount
FROM testimonials t
JOIN users u ON t.writer_id = u.id
WHERE u.id = 9
GROUP BY u.name;

-- Questão 19
SELECT MAX(jobs.salary) AS maximum_salary, roles.name AS role
FROM jobs
JOIN roles ON jobs.role_id = roles.id
WHERE jobs.active = true
GROUP BY roles.name
ORDER BY maximum_salary;

-- Questão 20
SELECT schools.name AS school, courses.name AS course, COUNT(educations.id) AS student_count
FROM educations
JOIN schools ON educations.school_id = schools.id
JOIN courses ON educations.course_id = courses.id
WHERE educations.status = 'finished'
GROUP BY schools.name, courses.name
ORDER BY student_count DESC
LIMIT 3;

