/*Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write an SQL query to report the managers with at least five direct reports.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+ */

-- Solution:
SELECT
    e1.name
FROM employee e1
JOIN(
    SELECT
        managerId,
        COUNT(*) AS num_report
    FROM Employee
    GROUP BY managerId) e2
ON e1.id =e2.managerId
WHERE e2.num_report >= 5

-- Easier Solution:
SELECT name
FROM employee
WHERE id IN (
    SELECT
        managerId
    FROM employee
    GROUP BY managerId
    HAVING COUNT(*) >=5
)