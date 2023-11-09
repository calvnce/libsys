INSERT INTO Employees (id, first_name, last_name, gender, address, email, phone)
VALUES
('123e4567-e89b-12d3-a456-426614174001', 'John', 'Doe', 'Male', '123 Main St', 'john.doe@example.com', '555-1234'),
('223e4567-e89b-12d3-a456-426614174002', 'Alice', 'Smith', 'Female', '456 Elm St', 'alice.s@example.com', '555-5678'),
('323e4567-e89b-12d3-a456-426614174003', 'Robert', 'Johnson', 'Male', '789 Oak St', 'robert.j@example.com', '555-9876'),
('423e4567-e89b-12d3-a456-426614174004', 'Ella', 'Williams', 'Female', '101 Pine St', 'ella.w@example.com', '555-3456'),
('523e4567-e89b-12d3-a456-426614174005', 'David', 'Brown', 'Male', '333 Elm St', 'david.b@example.com', '555-7890');

INSERT INTO Accounts (id, employee_id, username, password) VALUES
('223e4567-E89B-12d3-A456-426614178001', '123e4567-e89b-12d3-a456-426614174001', 'doe', 'doe12354'),
('223e4567-E89B-12d3-A456-426614178002', '223e4567-E89B-12d3-A456-426614174002', 'smith', 'smith1235');

INSERT INTO Members (id, first_name, last_name, gender, address, email, phone, category, status, joined_on, ends_on)
VALUES
('123e4567-e89b-12d3-a456-426614174006', 'Sarah', 'Lee', 'Female', '456 Oak St', 'sarah.l@example.com', '555-1111', 'Premium', 'Active', '2023-02-10', '2024-02-10'),
('223e4567-e89b-12d3-a456-426614174007', 'Michael', 'Smith', 'Male', '123 Pine St', 'michael.s@example.com', '555-2222', 'Basic', 'Active', '2023-03-15', '2024-03-15'),
('323e4567-e89b-12d3-a456-426614174008', 'Emily', 'Davis', 'Female', '789 Elm St', 'emily.d@example.com', '555-3333', 'Premium', 'Active', '2023-04-20', '2024-04-20'),
('423e4567-e89b-12d3-a456-426614174009', 'Daniel', 'Johnson', 'Male', '101 Oak St', 'daniel.j@example.com', '555-4444', 'Basic', 'Active', '2023-05-25', '2024-05-25'),
('523e4567-e89b-12d3-a456-426614174010', 'Olivia', 'Martin', 'Female', '555 Pine St', 'olivia.m@example.com', '555-5555', 'Premium', 'Active', '2023-06-30', '2024-06-30');


INSERT INTO Authors (id, author_name, address, email)
VALUES
('123e4567-e89b-12d3-a456-426614174011', 'James Wilson', '111 Main St', 'james.w@example.com'),
('223e4567-e89b-12d3-a456-426614174012', 'Sophia Adams', '222 Elm St', 'sophia.a@example.com'),
('323e4567-e89b-12d3-a456-426614174013', 'William Turner', '333 Oak St', 'william.t@example.com'),
('423e4567-e89b-12d3-a456-426614174014', 'Ava Parker', '444 Pine St', 'ava.p@example.com'),
('523e4567-e89b-12d3-a456-426614174015', 'Ethan Harris', '555 Elm St', 'ethan.h@example.com');


INSERT INTO Publishers (id, pub_name, address, email, phone)
VALUES
('123e4567-e89b-12d3-a456-426614174016', 'ABC Publishing', '111 Oak St', 'info@abcpub.com', '555-1111'),
('223e4567-e89b-12d3-a456-426614174017', 'XYZ Publications', '222 Main St', 'info@xyzpub.com', '555-2222'),
('323e4567-e89b-12d3-a456-426614174018', 'Wonder Books', '333 Elm St', 'info@wonderbooks.com', '555-3333'),
('423e4567-e89b-12d3-a456-426614174019', 'Readers Paradise', '444 Pine St', 'info@readersparadise.com', '555-4444'),
('523e4567-e89b-12d3-a456-426614174020', 'Dream Publishers', '555 Oak St', 'info@dreampub.com', '555-5555');


INSERT INTO Books (id, author_id, pub_id, isbn, title, category, pub_year)
VALUES
('123e4567-e89b-12d3-a456-426614174021', '123e4567-e89b-12d3-a456-426614174011', '123e4567-e89b-12d3-a456-426614174016', '978-1111111111', 'Adventure Awaits', 'Adventure', 2022),
('223e4567-e89b-12d3-a456-426614174022', '223e4567-e89b-12d3-a456-426614174012', '223e4567-e89b-12d3-a456-426614174017', '978-2222222222', 'Mystery Mansion', 'Mystery', 2020),
('323e4567-e89b-12d3-a456-426614174023', '323e4567-e89b-12d3-a456-426614174013', '323e4567-e89b-12d3-a456-426614174018', '978-3333333333', 'Sci-Fi Odyssey', 'Science Fiction', 2018),
('423e4567-e89b-12d3-a456-426614174024', '423e4567-e89b-12d3-a456-426614174014', '423e4567-e89b-12d3-a456-426614174019', '978-4444444444', 'Romantic Escapade', 'Romance', 2012),
('523e4567-e89b-12d3-a456-426614174025', '523e4567-e89b-12d3-a456-426614174015', '523e4567-e89b-12d3-a456-426614174020', '978-5555555555', 'Historical Chronicles', 'History', 2022),
('723e4567-e89b-12d3-a456-426614174027', '123e4567-e89b-12d3-a456-426614174011', '523e4567-e89b-12d3-a456-426614174020', '978-7777777777', 'Thriller Nights', 'Thriller', 2021),
('823e4567-e89b-12d3-a456-426614174028', '123e4567-e89b-12d3-a456-426614174011', '523e4567-e89b-12d3-a456-426614174020', '978-8888888888', 'Comedy Chaos', 'Comedy', 2017),
('923e4567-e89b-12d3-a456-426614174029', '123e4567-e89b-12d3-a456-426614174011', '523e4567-e89b-12d3-a456-426614174020', '978-9999999999', 'Horror House', 'Horror', 2015),
('b23e4567-e89b-12d3-a456-426614174031', '123e4567-e89b-12d3-a456-426614174011', '323e4567-e89b-12d3-a456-426614174018', '978-1111222233', 'Space Odyssey', 'Science Fiction', 2024),
('c23e4567-e89b-12d3-a456-426614174032', '123e4567-e89b-12d3-a456-426614174011', '323e4567-e89b-12d3-a456-426614174018', '978-1234123412', 'Historical Romance', 'Romance', 2010),
('d23e4567-e89b-12d3-a456-426614174033', '423e4567-e89b-12d3-a456-426614174014', '323e4567-e89b-12d3-a456-426614174018', '978-2345234523', 'Epic Fantasy', 'Fantasy', 2018),
('e23e4567-e89b-12d3-a456-426614174034', '423e4567-e89b-12d3-a456-426614174014', '323e4567-e89b-12d3-a456-426614174018', '978-3456345634', 'Psychological Thriller', 'Thriller', 2019),
('f23e4567-e89b-12d3-a456-426614174035', '423e4567-e89b-12d3-a456-426614174014', '323e4567-e89b-12d3-a456-426614174018', '978-4567456745', 'Historical Drama', 'History', 2017),
('g23e4567-e89b-12d3-a456-426614174036', '423e4567-e89b-12d3-a456-426614174014', '123e4567-e89b-12d3-a456-426614174016', '978-5678567856', 'Sci-Fi Adventure', 'Science Fiction', 2016),
('h23e4567-e89b-12d3-a456-426614174037', '223e4567-e89b-12d3-a456-426614174012', '123e4567-e89b-12d3-a456-426614174016', '978-6789678967', 'Romantic Comedy', 'Romance', 2021),
('i23e4567-e89b-12d3-a456-426614174038', '223e4567-e89b-12d3-a456-426614174012', '123e4567-e89b-12d3-a456-426614174016', '978-7890789078', 'Mystery Thriller', 'Mystery', 2019),
('j23e4567-e89b-12d3-a456-426614174039', '323e4567-e89b-12d3-a456-426614174013', '123e4567-e89b-12d3-a456-426614174016', '978-8901890189', 'Fantasy Adventure', 'Fantasy', 2015);


INSERT INTO Borrowings (id, member_id, book_id, employee_id, issued_on, due_on)
VALUES
('123e4567-e89b-12d3-a456-426614174026', '123e4567-e89b-12d3-a456-426614174006', '123e4567-e89b-12d3-a456-426614174021', '123e4567-e89b-12d3-a456-426614174001', '2023-02-01', '2023-02-15'),
('223e4567-e89b-12d3-a456-426614174027', '223e4567-e89b-12d3-a456-426614174007', '223e4567-e89b-12d3-a456-426614174022', '223e4567-e89b-12d3-a456-426614174002', '2023-03-01', '2023-03-15'),
('323e4567-e89b-12d3-a456-426614174028', '323e4567-e89b-12d3-a456-426614174008', '323e4567-e89b-12d3-a456-426614174023', '323e4567-e89b-12d3-a456-426614174003', '2023-04-01', '2023-04-15'),
('423e4567-e89b-12d3-a456-426614174029', '423e4567-e89b-12d3-a456-426614174009', '423e4567-e89b-12d3-a456-426614174024', '423e4567-e89b-12d3-a456-426614174004', '2023-05-01', '2023-05-15'),
('523e4567-e89b-12d3-a456-426614174030', '523e4567-e89b-12d3-a456-426614174010', '523e4567-e89b-12d3-a456-426614174025', '523e4567-e89b-12d3-a456-426614174005', '2023-06-01', '2023-06-15');


INSERT INTO Fines (id, borrowing_id, amount, paid_on)
VALUES
('123e4567-e89b-12d3-a456-426614174031', '123e4567-e89b-12d3-a456-426614174026', 15.00, '2023-02-16'),
('223e4567-e89b-12d3-a456-426614174032', '223e4567-e89b-12d3-a456-426614174027', 17.50, '2023-03-17'),
('323e4567-e89b-12d3-a456-426614174033', '323e4567-e89b-12d3-a456-426614174028', 13.00, '2023-04-18');


INSERT INTO Payments (id, ref_number, member_id, amount, reason, paid_on)
VALUES
('123e4567-e89b-12d3-a456-426614174034', 'PAY123454', '223e4567-e89b-12d3-a456-426614174007', 100.00, 'Membership fee', '2023-02-16'),
('123e4567-e89b-12d3-a456-426614174035', 'PAY123455', '123e4567-e89b-12d3-a456-426614174006', 50.00, 'Membership fee', '2023-03-22'),
('123e4567-e89b-12d3-a456-426614174036', 'PAY123456', '123e4567-e89b-12d3-a456-426614174006', 15.00, 'Fine Payment', '2023-02-19'),
('223e4567-e89b-12d3-a456-426614174037', 'PAY789012', '223e4567-e89b-12d3-a456-426614174007', 17.50, 'Fine Payment', '2023-03-17'),
('323e4567-e89b-12d3-a456-426614174038', 'PAY345678', '323e4567-e89b-12d3-a456-426614174008', 13.00, 'Fine Payment', '2023-04-18');
