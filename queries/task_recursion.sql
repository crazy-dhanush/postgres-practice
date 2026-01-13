WITH RECURSIVE task_hierarchy AS (
    SELECT id, task_name, parent_task_id, 1 AS level
    FROM tasks
    WHERE parent_task_id IS NULL
    UNION ALL
    SELECT t.id, t.task_name, t.parent_task_id, th.level + 1
    FROM tasks t
    JOIN task_hierarchy th ON t.parent_task_id = th.id
)
SELECT * FROM task_hierarchy
ORDER BY level, parent_task_id;
