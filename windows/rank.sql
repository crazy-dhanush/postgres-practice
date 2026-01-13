--Number and rank employees in each department based on salary 
CREATE TABLE Empl (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Empl (id, name, department, salary) VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 6000),
(3, 'Carol', 'IT', 6000),
(4, 'David', 'HR', 5500),
(5, 'Eve', 'IT', 7000);

SELECT
    id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM Empl
ORDER BY department, salary DESC;


output

id | name  | department | salary | row_num | rank | dense_rank
----+-------+------------+--------+---------+------+------------
  4 | David | HR         |   5500 |       1 |    1 |          1
  1 | Alice | HR         |   5000 |       2 |    2 |          2
  5 | Eve   | IT         |   7000 |       1 |    1 |          1
  2 | Bob   | IT         |   6000 |       2 |    2 |          2
  3 | Carol | IT         |   6000 |       3 |    2 |          2