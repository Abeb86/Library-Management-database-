USE LibraryDB2;

-- ============================================================
-- 1. UserReg (must be first - referenced by Staff and Member)
-- ============================================================
INSERT IGNORE INTO UserReg (UserId, Username, Email, Password, RegistrationDate, Role, AccountStatus, ZipCode, StreetNo, BuildingName) VALUES
(1, 'nerissa.g', 'nerissa@aurak.ac.ae', 'hash999', '2018-01-15', 'staff', 'active', '00000', 'Univ St', 'Admin Bldg'),
(2, '2023006231', '2023006231@aurak.ac.ae', 'pw_nasis', '2023-09-01', 'member', 'active', '00000', 'Hostel 1', 'Block A'),
(3, '2023006224', '2023006224@aurak.ac.ae', 'pw_daniel', '2023-09-01', 'member', 'active', '00000', 'Hostel 1', 'Block A'),
(18, 'john.doe', 'john.doe@aurak.ac.ae', 'pw_john', '2020-05-20', 'staff', 'active', '00000', 'Univ St', 'Admin Bldg');

-- ============================================================
-- 2. Staff
-- ============================================================
INSERT IGNORE INTO Staff (UserId, H_Staff, Essn, FirstName, LastName, Dept, Position, HireDate, Email) VALUES
(1, NULL, 'ESSN-001', 'Nerissa', 'Gonzales', 'circulation', 'manager', '2018-01-15', 'nerissa@aurak.ac.ae'),
(18, NULL, 'ESSN-002', 'John', 'Doe', 'reference', 'librarian', '2020-05-20', 'john.doe@aurak.ac.ae');

-- ============================================================
-- 3. Member
-- ============================================================
INSERT IGNORE INTO Member (MemberId, UserId, MemberNumber, FirstName, LastName) VALUES
(1, 2, '2023006231', 'Nasis', 'Gurmu'),
(2, 3, '2023006224', 'Daniel', 'Negasa');

-- ============================================================
-- 4. Vendor (required before BookCopy)
-- ============================================================
INSERT IGNORE INTO Vendor (VendorId, VendorName, ContactPersonName, Email, VendorType, Street, ZipCode, BuildingName) VALUES
(1, 'Magrudys Enterprise', 'Sales Dept', 'university@magrudys.com', 'Bookseller', 'Sheikh Zayed Rd', '00000', 'Magrudy Mall'),
(2, 'Kinokuniya', 'Mr. Sato', 'dubai@kinokuniya.com', 'Bookseller', 'Dubai Mall', '00001', 'Dubai Mall');

-- ============================================================
-- 5. RoomCapacity (required before Room)
-- ============================================================
INSERT IGNORE INTO RoomCapacity (RoomType, Capacity) VALUES
('reading_area', 100),
('study_room', 6),
('meeting_room', 20);

-- ============================================================
-- 6. Room (required before Location)
-- ============================================================
INSERT IGNORE INTO Room (RoomId, RoomNumber, RoomType) VALUES
(1, 'Saqr-Main', 'reading_area'),
(2, 'Saqr-Study-A', 'study_room'),
(3, 'Saqr-Study-B', 'study_room'),
(4, 'Saqr-Meeting-1', 'meeting_room');

-- ============================================================
-- 7. Location (required before Shelf)
-- ============================================================
INSERT IGNORE INTO Location (LocationId, Section, FloorLevel, RoomId) VALUES
(1, 'Engineering Reference', 'Ground Floor', 1),
(2, 'Mathematics Reserve', 'Ground Floor', 1),
(3, 'Fiction Corner', 'Floor 1', 1);

-- ============================================================
-- 8. Shelf
-- ============================================================
INSERT IGNORE INTO Shelf (LocationId, ShelfNo, Capacity, CurrentOccupancy) VALUES
(1, 1, 20, 5),
(1, 2, 15, 3),
(1, 3, 20, 10),
(2, 1, 25, 0),
(2, 2, 25, 0),
(3, 1, 50, 20),
(3, 2, 50, 5);

-- ============================================================
-- 9. Category
-- ============================================================
INSERT IGNORE INTO Category (CategoryId, CategoryName, Description, Location, IsActive) VALUES
(1, 'Computer Engineering', 'Hardware, embedded systems, digital design', 'Engineering Reference', TRUE),
(2, 'Computer Science', 'Algorithms, programming, software engineering', 'Engineering Reference', TRUE),
(3, 'Mathematics', 'Calculus, linear algebra, statistics', 'Mathematics Reserve', TRUE),
(4, 'Fiction', 'Novels and literature', 'Fiction Corner', TRUE);

-- ============================================================
-- 8. Publisher + phone + website
-- ============================================================
INSERT IGNORE INTO Publisher (PublisherId, PublisherName, Country, Email, EstablishedYear, Address) VALUES
(1, 'Pearson', 'USA', 'contact@pearson.com', 1844, '221B Publisher St'),
(2, 'O\'Reilly Media', 'USA', 'info@oreilly.com', 1978, '1005 Gravenstein Hwy'),
(3, 'Springer', 'Germany', 'support@springer.com', 1842, 'Springer Campus');

INSERT IGNORE INTO PublisherPhoneNumber (PublisherId, PhoneNumber) VALUES
(1, '+1-555-1001'),
(2, '+1-555-2002'),
(3, '+49-555-3003');

INSERT IGNORE INTO PublisherWebsite (PublisherName, Website) VALUES
('Pearson', 'https://www.pearson.com'),
('O\'Reilly Media', 'https://www.oreilly.com'),
('Springer', 'https://link.springer.com');

-- ============================================================
-- 12. Price (normalized by PageCount)
-- ============================================================
INSERT IGNORE INTO Price (PageCount, Price) VALUES
(250, 20.00),
(300, 25.00),
(450, 35.00),
(600, 45.00);

-- ============================================================
-- 11. Book
-- ============================================================
INSERT IGNORE INTO Book (BookId, ISBN, Title, PublicationYear, Edition, PageCount, CategoryId, PublisherId) VALUES
(1, '978-0131103627', 'The C Programming Language', 1988, '2nd', 250, 2, 1),
(2, '978-0132350884', 'Clean Code', 2008, '1st', 450, 2, 1),
(3, '978-1492056355', 'Designing Data-Intensive Applications', 2017, '1st', 600, 2, 2),
(4, '978-0387984038', 'Introduction to Algorithms', 2009, '3rd', 600, 2, 3),
(5, '978-0321573513', 'Signals and Systems', 2010, '2nd', 300, 1, 1),
(6, '978-0007350803', 'The Hobbit', 1937, '1st', 300, 4, 3);

-- ============================================================
-- 13. Author
-- ============================================================
INSERT IGNORE INTO Author (AuthorId, FirstName, LastName, Nationality, Biography, Email, Phone) VALUES
(1, 'Brian', 'Kernighan', 'Canadian', 'Computer scientist and author.', 'bk@example.com', '+1-555-4001'),
(2, 'Dennis', 'Ritchie', 'American', 'Creator of C language.', 'dr@example.com', '+1-555-4002'),
(3, 'Robert', 'Martin', 'American', 'Software engineer, author (Uncle Bob).', 'rm@example.com', '+1-555-4003'),
(4, 'Martin', 'Kleppmann', 'German', 'Author and researcher.', 'mk@example.com', '+1-555-4004'),
(5, 'Thomas', 'Cormen', 'American', 'Co-author of CLRS.', 'tc@example.com', '+1-555-4005'),
(6, 'J.R.R.', 'Tolkien', 'British', 'Author of fantasy literature.', 'jt@example.com', '+44-555-4006');

-- ============================================================
-- 18. Writes (Book–Author)
-- ============================================================
INSERT IGNORE INTO Writes (BookId, AuthorId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(6, 6);

-- ============================================================
-- 32. BookCopy (copies supplied by vendors)
-- AvailabilityStatus enum: 'available','borrowed','reserved','lost','damaged'
-- ============================================================
INSERT IGNORE INTO BookCopy (Barcode, AcquisitionDate, AvailabilityStatus, BookId, VendorId) VALUES
('BC-0001', '2024-01-10', 'available', 1, 1),
('BC-0002', '2024-01-10', 'available', 1, 1),
('BC-0003', '2024-02-02', 'available', 2, 2),
('BC-0004', '2024-02-02', 'borrowed',  2, 2),
('BC-0005', '2024-03-05', 'available', 3, 2),
('BC-0006', '2024-03-05', 'lost',      4, 1),
('BC-0007', '2024-04-11', 'damaged',   5, 1),
('BC-0008', '2024-05-01', 'available', 6, 2);

-- ============================================================
-- 20. Loan (circulation workflow)
-- Loan table uses Barcode column (not BookId)
-- ============================================================
INSERT IGNORE INTO Loan (LoanId, Barcode, LoanDate, DueDate, ReturnDate, LoanStatus, MemberId) VALUES
(1, 'BC-0004', '2025-11-01', '2025-11-15', NULL, 'ongoing', 1),
(2, 'BC-0001', '2025-10-01', '2025-10-15', '2025-10-12', 'returned', 2),
(3, 'BC-0006', '2025-10-10', '2025-10-20', NULL, 'overdue', 1);

-- ============================================================
-- 21. Fine (linked to Loan via (LoanId, IssueDate) primary key in your schema)
-- ============================================================
INSERT IGNORE INTO Fine (FineAmount, FineReason, IssueDate, PaymentStatus, PaymentDate, LoanId, MemberId) VALUES
(20.00, 'Overdue book', '2025-10-21', 'unpaid', NULL, 3, 1);

-- ============================================================
-- 22. Payment (example payment for fines)
-- NOTE: your Payment table references FineId in a simplified way in the draft.
-- If it fails due to FK mismatch, we’ll fix Payment to reference (LoanId, IssueDate) properly.
-- ============================================================
INSERT IGNORE INTO Payment (PaymentDate, PaymentMethod, TransactionReference, FineId, MemberId) VALUES
('2025-10-25', 'card', 'TXN-10001', 3, 1);

-- ============================================================
-- 24. BookReview (member feedback)
-- ============================================================
INSERT IGNORE INTO BookReview (ReviewAt, BookId, Rating, ReviewText, ReviewDate, Title) VALUES
('2025-11-02 14:00:00', 2, 5, 'Very practical coding principles.', '2025-11-02', 'Excellent'),
('2025-11-03 10:30:00', 1, 4, 'Classic book, still useful.', '2025-11-03', 'Great read');

-- ============================================================
-- 25. Notification (alerts)
-- ============================================================
INSERT IGNORE INTO Notification (NotificationType, Message, SendAt, IsRead, NotifyVia, UserId) VALUES
('due_soon', 'Your book is due in 2 days.', '2025-11-13 09:00:00', FALSE, 'email', 2),
('fine',     'You have an unpaid fine.',   '2025-10-22 09:00:00', FALSE, 'system', 2);

-- ============================================================
-- 26. LogEntry (audit trail)
-- ============================================================
INSERT IGNORE INTO LogEntry (LogAt, ActionType, UserId) VALUES
('2025-11-01 12:00:00', 'loan_created', 2),
('2025-10-21 08:00:00', 'fine_issued',  2),
('2025-10-25 16:30:00', 'payment_made', 2);

-- ============================================================
-- 28/29. Donation + Donates (donation workflow)
-- ============================================================
INSERT IGNORE INTO Donation (DonationId, DonorName, DonorContact, DonorDate, BookId, AcceptanceStatus) VALUES
(1, 'Alumni Office', 'alumni@aurak.ac.ae', '2025-11-10', NULL, 'accepted'),
(2, 'Local Sponsor', 'sponsor@example.com', '2025-11-11', NULL, 'pending');

INSERT IGNORE INTO Donates (DonationId, BookId) VALUES
(1, 6),
(1, 3),
(2, 5);
