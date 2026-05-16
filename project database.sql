-- Create Database
CREATE DATABASE Library;
USE Library;

-- Table: Books

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    category VARCHAR(30),
    available_copies INT
);

-- Table: Members

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);

-- Table:Loan

CREATE TABLE Loan (
   Loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    Borrow_date DATE,
   Return_date DATE,
    
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert Data

INSERT INTO Books VALUES (1, 'Database', 'Elmasri','Education',5);
INSERT INTO Books VALUES (2, 'Networks', 'Tanenbaum','Technology',3);

INSERT INTO Members VALUES (1, 'Ali','ali@gmail.com','01063871950');
INSERT INTO Members VALUES (2, 'shrouk','shrouk@gmail.com','01021224173');

INSERT INTO Loan VALUES (1, 1, 1, '2024-01-01', '2024-01-10');
INSERT INTO Loan VALUES (2, 2, 2, '2024-01-05', NULL);

-- Queries

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loan;

-- Join Query

SELECT Members.name, Books.title,Loan.Loan
FROM Loan
JOIN Members ON Members.member_id =Loan.member_id
JOIN Books ON Books.book_id = Loan.book_id;