WITH RECURSIVE pattern AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num+1 FROM pattern WHERE num<5
)

SELECT REPEAT ('* ',num) AS Pattern FROM pattern;