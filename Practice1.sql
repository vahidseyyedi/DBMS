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
SELECT t1.fname, t1.lname
FROM teachers t1
LEFT JOIN enrollment e1 on (e1.tid = t1.id AND grade < 10)
WHERE e1.id is null  

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
WHERE t1.id not IN (
    SELECT *
    FROM teachers t2
    INNER JOIN enrollments e1 ON (t2.id = e1.tid AND e1.grade>=10)
)

--3 join
SELECT t1.fname t1.lname
FROM teachers t1
LEFT JOIN enrollments e1 on (t1.id = e1.tid and e1.grade<10)
LEFT JOIN enrollments e2 on (t1.id = e1.tid and e1.termid != e2.termid)

--3set-operator
SELECT t1.fname t1.lname
FROM teachers t1
LEFT JOIN enrollments e1 on (e1.tid = t1.id and e1.grade<10)
INTERSECT
FROM teachers t2
INNER JOIN enrollments e2 on (t2.id = e2.tid)
INNER JOIN enrollments e3 on (t2.id = e2.tid AND e1.termid != e2.termid)

--3 nested_query 
SELECT t1.fname t1.lname
FROM teachers t1
INNER JOIN enrollments e1 on (t1.id =e1.tid and e1.grade<10)
WHERE e1.termid != e2.termid (
    SELECT *
    FROM teachers t2
    INNER JOIN enrollments e2 on (t2.id = e2.tid)
)

--4 join
SELECT s1.lname s1.fname
FROM students s1
LEFT JOIN enrollments e1 on (s1.id = e1.sid and e1.grade<10)
LEFT JOIN enrollments e2 on (s1.id = e2.sid and e2.tid != e1.tid )
WHERE e1.id I not null and e2.id Is null

--4 set_operator 
SELECT s1.fname s1.lname
FROM students s1
INNER JOIN enrollments e1 on (s1.id = e1.id and e1.grade < 10)
INTERSECT
FROM teachers t1
INNER JOIN enrollments e2 on (t1.id = e2.tid and e2.grade <10 )

--4 nested_query 
SELECT s1.fname s1.lname 
FROM students s1
INNER JOIN enrollments e1 on (s1.id = e1.id and e1.grade < 10)
WHERE e1.sid not in (
SELECT s2.id
FROM students s2
INNER JOIN enrollments e2 on (e1.sid = e2.sid and e2.tid != e1.tid and grade<10)
)
