--1 join
SELECT s1.fname s1.lname
FROM students s1
INNER JOIN enrollments e1 ON (s1.id = e1.sid AND e1.grade<10)
INNER JOIN courses c1 ON (c1.name = 'DBMS' AND e1.cid = c1.id)

--1 set_operator
SELECT *
FROM students s1
EXCEPT
SELECT *
FROM students s2
INNER JOIN enrollments e1 ON (s2.id = e1.sid AND e1.grade>=10)
INNER JOIN courses c1 ON (c1.name = 'DB' AND c1.id = e1.cid)

--1 nested_query
SELECT *
FROM students s1
WHERE s1.id NOT IN (
    SELECT *
    FROM students s2
    INNER JOIN enrollments e1 ON (e1.sid = s2.id AND e1.grade>=10)
    INNER JOIN courses c1 ON (c1.name = 'DB' AND c1.id = e1.cid)
)

--2 join
SELECT t1.lname t1.fname
FROM teachers t1
INNER JOIN enrollments e1 ON (t1.id = e1.tid AND e1.grade>=10)
INNER JOIN teachers t1 ON (e1.tid )
------continue

--2 set_operator
SELECT t1.lname t1.fname
FROM teachers t1
EXCEPT
SELECT t2.lname t2.fname
FROM teachers t2
INNER JOIN enrollments e1 ON (t1.id = e1.tid AND e1.grade<10)

--2 nested_query
SELECT t1.lname t1.fname
FROM teachers t1
WHERE t1.id IN (
    SELECT *
    FROM teachers t2
    INNER JOIN enrollments e1 ON (t2.id = e1.tid AND e1.grade>=10)
)

--3 join
SELECT t1.lname t1.fname
FROM teachers t1
INNER JOIN enrollments e1 ON ()
