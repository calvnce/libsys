SELECT 
    b.id, b.isbn, b.title, b.category, b.pub_year, a.author_name, p.pub_name
FROM 
    Publishers p
INNER JOIN Books b
    ON p.id=b.pub_id
INNER JOIN Authors a
    ON b.author_id=a.id
ORDER BY b.title;

-- SELECT USER
SELECT 
    e.id, e.first_name,e.last_name
FROM Employees e
    INNER JOIN Accounts a
    ON e.id=a.employee_id
WHERE 
    a.username='' AND a.password=;