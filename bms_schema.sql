CREATE TABLE IF NOT EXISTS Author (
    AuthorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DOB DATE,
    Bio TEXT
);

CREATE TABLE IF NOT EXISTS Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);
CREATE TABLE IF NOT EXISTS Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationDate DATE,
    Age INT,
    Price NUMERIC(10, 2),
    DiscountedPrice NUMERIC(10, 2),
    CategoryID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Author (FirstName, LastName, DOB, Bio)
VALUES 
('J.K.', 'Rowling', '1965-07-31', 'Author of Harry Potter'),
('George', 'Orwell', '1903-06-25', 'Author of 1984');


INSERT INTO Category (CategoryName, Description)
VALUES 
('Fantasy', 'Books with magical worlds'),
('Dystopian', 'Books about futuristic oppressive societies');


INSERT INTO Book (Title, AuthorID, ISBN, PublicationDate, Age, Price, DiscountedPrice, CategoryID)
VALUES
('Harry Potter and the Philosopher''s Stone', 1, '9780747532743', '1997-06-26', 9, 20.00, 15.00, 1),
('1984', 2, '9780451524935', '1949-06-08', 16, 18.00, 12.00, 2);