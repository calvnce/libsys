SELECT 
    b.id, b.isbn, b.title, b.category, b.pub_year, a.author_name, p.pub_name
FROM 
    Publishers p
INNER JOIN Books b
    ON p.id=b.pub_id
INNER JOIN Authors a
    ON b.author_id=a.id
ORDER BY b.title;


SELECT 
    b.id, b.isbn, b.title, b.category, b.pub_year, a.author_name, p.pub_name
FROM 
    Publishers p
INNER JOIN Books b
    ON p.id=b.pub_id
INNER JOIN Authors a
    ON b.author_id=a.id
WHERE 
    b.pub_year=2022
ORDER BY b.title;

SELECT 
    e.id, e.first_name,e.last_name
FROM Employees e
    INNER JOIN Accounts a
    ON e.id=a.employee_id
WHERE 
    a.username='' AND a.password=;


-- Fetch Borrowings
SELECT m.first_name,m.last_name, b.title, br.issued_on,br.due_on
FROM Books b
INNER JOIN Borrowings br
ON b.id=br.book_id
INNER JOIN Members m
ON m.id=br.member_id;

-- Fetch Fines

SELECT 
    m.first_name, m.last_name, b.title, br.issued_on, br.due_on,f.amount
FROM Books b
    INNER JOIN Borrowings br
        ON b.id=br.book_id
    INNER JOIN Members m
        ON m.id=br.member_id
    INNER JOIN Fines f
        ON br.id=f.borrowing_id;

-- Get details of all members
SELECT * FROM Members;


SELECT 
    m.first_name, m.last_name, m.category, m.status, m.email, m.phone
FROM 
    Members m
WHERE 
    m.category='Premium' AND m.status='Active'
ORDER BY 
    m.first_name;



SELECT 
    b.id, b.title, b.pub_year
FROM 
    Books b 
    INNER JOIN (
                SELECT 
                    br.book_id, COUNT(br.book_id) as borrow_count
                FROM  
                    Borrowings br
                GROUP BY 
                    br.book_id
                ORDER BY 
                    borrow_count DESC
                LIMIT 5

            ) AS br
    ON b.id=br.book_id;
