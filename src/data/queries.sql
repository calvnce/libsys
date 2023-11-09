SELECT 
    b.id, b.isbn, b.title, b.category, b.pub_year, a.author_name, p.pub_name
FROM 
    Publishers p
INNER JOIN Books b
    ON p.id=b.pub_id
INNER JOIN Authors a
    ON b.author_id=a.id
ORDER BY b.title;