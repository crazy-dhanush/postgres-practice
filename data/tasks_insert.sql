INSERT INTO tasks (id, task_name, parent_task_id) VALUES
(1, 'Project Setup', NULL),
(2, 'Requirement Analysis', 1),
(3, 'Design', 1),
(4, 'Backend Development', 3),
(5, 'Frontend Development', 3),
(6, 'Testing', 1),
(7, 'Unit Testing', 6),
(8, 'Integration Testing', 6);