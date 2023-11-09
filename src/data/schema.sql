CREATE TABLE IF NOT EXISTS Employees (
    id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address VARCHAR(350) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    id CHAR(36) PRIMARY KEY,
    employee_id CHAR(36) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT emp_id_unique UNIQUE (employee_id),
    CONSTRAINT fk_employees_account FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Members (
    id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address VARCHAR(350) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    category VARCHAR(15) DEFAULT 'Basic',
    status VARCHAR(15) DEFAULT 'Active',
    joined_on DATE DEFAULT CURRENT_DATE,
    ends_on DATE DEFAULT DATE_ADD(CURRENT_DATE, INTERVAL 12 MONTH),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Authors (
    id CHAR(36) PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    address VARCHAR(350) NOT NULL,
    email VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS Publishers (
    id CHAR(36) PRIMARY KEY,
    pub_name VARCHAR(25) NOT NULL,
    address VARCHAR(350) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Books (
    id CHAR(36) PRIMARY KEY,
    author_id CHAR(36),
    pub_id CHAR(36),
    isbn VARCHAR(15) NOT NULL,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(25) NOT NULL,
    pub_year INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT isbn_unique UNIQUE (isbn),
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Authors (id) ON DELETE CASCADE,
    CONSTRAINT fk_books_publisher FOREIGN KEY (pub_id) REFERENCES Publishers (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Borrowings (
    id CHAR(36) PRIMARY KEY,
    book_id CHAR(36) NOT NULL,
    member_id CHAR(36) NOT NULL,
    employee_id CHAR(36) NOT NULL,
    issued_on DATE DEFAULT CURRENT_DATE,
    due_on DATE DEFAULT DATE_ADD(CURRENT_DATE, INTERVAL 2 WEEK),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_borrowings_member FOREIGN KEY (member_id) REFERENCES Members (id) ON DELETE CASCADE,
    CONSTRAINT fk_borrowings_book FOREIGN KEY (book_id) REFERENCES Books (id) ON DELETE CASCADE,
    CONSTRAINT fk_borrowings_employee FOREIGN KEY (employee_id) REFERENCES Employees (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Fines (
    id CHAR(36) PRIMARY KEY,
    borrowing_id CHAR(36),
    amount DECIMAL(8, 2) NOT NULL,
    paid_on DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_fines_borrowings FOREIGN KEY (borrowing_id) REFERENCES Borrowings (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Payments (
    id CHAR(36) PRIMARY KEY,
    ref_number VARCHAR(36),
    member_id CHAR(36) NOT NULL,
    amount DECIMAL(8, 2) NOT NULL,
    reason VARCHAR(250) NOT NULL,
    paid_on DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_paymentss_members FOREIGN KEY (member_id) REFERENCES Members (id) ON DELETE CASCADE
);
