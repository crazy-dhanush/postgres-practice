CREATE TABLE IF NOT EXISTS tasks (
    id INT PRIMARY KEY,
    task_name VARCHAR(50),
    parent_task_id INT
);