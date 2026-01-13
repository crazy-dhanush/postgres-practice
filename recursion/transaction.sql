CREATE TABLE IF NOT EXISTS transactions (
txn_id INT PRIMARY KEY,
txn_type VARCHAR(30),
parent_txn_id INT,
amount DECIMAL(10,2)
);


INSERT INTO transactions (txn_id, txn_type, parent_txn_id, amount) VALUES
(1001, 'PAYMENT', NULL, 500.00),
(1002, 'REFUND', 1001, -200.00),
(1003, 'REVERSAL', 1002, -100.00),
(1004, 'ADJUSTMENT', 1003, -50.00),
(1005, 'REFUND', 1001, -50.00);

WITH RECURSIVE txn_chain AS (
    SELECT
        txn_id,
        txn_type,
        parent_txn_id,
        amount,
        1 AS level
    FROM transactions
    WHERE parent_txn_id IS NULL

    UNION ALL
    SELECT
        t.txn_id,
        t.txn_type,
        t.parent_txn_id,
        t.amount,
        tc.level + 1
    FROM transactions t
    JOIN txn_chain tc
        ON t.parent_txn_id = tc.txn_id
)
SELECT * FROM txn_chain
ORDER BY level, txn_id;



output
 txn_id |  txn_type  | parent_txn_id | amount  | level
--------+------------+---------------+---------+-------
   1001 | PAYMENT    |               |  500.00 |     1
   1002 | REFUND     |          1001 | -200.00 |     2
   1005 | REFUND     |          1001 |  -50.00 |     2
   1003 | REVERSAL   |          1002 | -100.00 |     3
   1004 | ADJUSTMENT |          1003 |  -50.00 |     4
(5 rows)