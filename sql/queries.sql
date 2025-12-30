
USE LibraryDB2;


SELECT
  m.MemberId,
  m.FirstName,
  m.LastName,
  u.Username,
  u.AccountStatus,
  u.StreetNo,
  u.BuildingName,
  u.ZipCode
FROM Member m
JOIN UserReg u ON m.UserId = u.UserId
WHERE u.AccountStatus = 'active'
  AND (u.StreetNo LIKE '%Main Rd%' OR u.StreetNo LIKE '%Main Road%');

-- -----------------------------
-- Q3: Count available copies per title
-- -----------------------------
SELECT
  b.BookId,
  b.Title,
  COUNT(*) AS AvailableCopies
FROM BookCopy bc
JOIN Book b ON bc.BookId = b.BookId
WHERE bc.AvailabilityStatus = 'available'
GROUP BY b.BookId, b.Title
ORDER BY AvailableCopies DESC, b.Title;



SELECT
  s.StaffId,
  s.FirstName,
  s.LastName,
  s.Position,
  s.HireDate,
  u.Username,
  u.AccountStatus
FROM Staff s
LEFT JOIN UserReg u ON s.UserId = u.UserId
ORDER BY s.LastName, s.FirstName;


-- -----------------------------
-- Q9: Average rating per book
-- -----------------------------
SELECT
  b.BookId,
  b.Title,
  AVG(br.Rating) AS AvgRating,
  COUNT(*) AS ReviewCount
FROM Book b
JOIN BookReview br ON b.BookId = br.BookId
GROUP BY b.BookId, b.Title
ORDER BY AvgRating DESC, ReviewCount DESC;


-- -----------------------------
-- Q11: Vendor supply counts (how many copies supplied by each vendor)
-- -----------------------------
SELECT
  v.VendorId,
  v.VendorName,
  COUNT(*) AS SuppliedCopies
FROM Vendor v
JOIN BookCopy bc ON v.VendorId = bc.VendorId
GROUP BY v.VendorId, v.VendorName
ORDER BY SuppliedCopies DESC;

-- -----------------------------
-- Q12: Average fine per violation type
-- -----------------------------
SELECT
  f.FineReason,
  AVG(f.FineAmount) AS AvgFine,
  COUNT(*) AS CountFines
FROM Fine f
GROUP BY f.FineReason
ORDER BY AvgFine DESC;

-- -----------------------------
-- Q13: Suspended members
-- -----------------------------
SELECT
  m.MemberId,
  m.FirstName,
  m.LastName,
  u.Username,
  u.AccountStatus
FROM Member m
JOIN UserReg u ON m.UserId = u.UserId
WHERE u.AccountStatus = 'suspended'
ORDER BY m.LastName, m.FirstName;

-- -----------------------------
-- Q14: Lost revenue projection (sum price of LOST book copies)
-- (joins BookCopy → Book → Price concept from testing section) :contentReference[oaicite:6]{index=6}
-- -----------------------------
SELECT
  SUM(p.Price) AS LostRevenueProjection
FROM BookCopy bc
JOIN Book b ON bc.BookId = b.BookId
JOIN Price p ON b.PageCount = p.PageCount
WHERE bc.AvailabilityStatus = 'Lost';

-- -----------------------------
-- Q15: Top 3 borrowers (most loans) (captured in figures OCR)
-- -----------------------------
SELECT
  m.FirstName,
  m.LastName,
  COUNT(l.LoanId) AS TotalLoans
FROM Member m
JOIN Loan l ON m.MemberId = l.MemberId
GROUP BY m.MemberId, m.FirstName, m.LastName
ORDER BY TotalLoans DESC
LIMIT 3;

-- -----------------------------
-- Q16: Books published before 2000 (captured in figures OCR)
-- -----------------------------
SELECT
  BookId,
  Title,
  PublicationYear
FROM Book
WHERE PublicationYear < 2000
ORDER BY PublicationYear, Title;

-- -----------------------------
-- Q17: User notifications (retrieve all notifications for a specific username) (captured in figures OCR)
-- -----------------------------
SET @username = '2023006251';

SELECT
  n.NotificationType,
  n.Message,
  n.SendAt,
  n.IsRead,
  n.NotifyVia
FROM Notification n
JOIN UserReg u ON n.UserId = u.UserId
WHERE u.Username = @username
ORDER BY n.SendAt DESC;

-- -----------------------------
-- Q18: Computer Engineering authors (distinct authors with books in that category) (captured in figures OCR)
-- -----------------------------
SELECT DISTINCT
  a.FirstName,
  a.LastName
FROM Author a
JOIN Writes w ON a.AuthorId = w.AuthorId
JOIN Book b ON w.BookId = b.BookId
JOIN Category c ON b.CategoryId = c.CategoryId
WHERE c.CategoryName = 'Computer Engineering'
ORDER BY a.LastName, a.FirstName;

-- -----------------------------
-- Q19: Log entries by date (range filter) (captured in figures OCR)
-- -----------------------------
SET @start_dt = '2025-11-01 00:00:00';
SET @end_dt   = '2025-11-25 23:59:59';

SELECT
  u.Username,
  le.ActionType,
  le.LogAt
FROM LogEntry le
JOIN UserReg u ON le.UserId = u.UserId
WHERE le.LogAt BETWEEN @start_dt AND @end_dt
ORDER BY le.LogAt DESC;

-- -----------------------------
-- Q20: 'Programming' books search (title/metadata keyword search)
-- -----------------------------
SELECT
  b.BookId,
  b.Title,
  c.CategoryName,
  p.PublisherName
FROM Book b
JOIN Category c ON b.CategoryId = c.CategoryId
JOIN Publisher p ON b.PublisherId = p.PublisherId
WHERE b.Title LIKE '%Programming%'
ORDER BY b.Title;

-- -----------------------------
-- Q21: Find member by card (captured in figures OCR)
-- -----------------------------
SET @card_number = 'CARD-002';

SELECT
  m.FirstName,
  m.LastName,
  lc.CardStatus,
  lc.CardNumber,
  lc.ExpiryDate
FROM LibraryCard lc
JOIN Member m ON lc.MemberId = m.MemberId
WHERE lc.CardNumber = @card_number;

-- -----------------------------
-- Q22: Fine payment breakdown (group by PaymentStatus) (captured in figures OCR)
-- -----------------------------
SELECT
  f.PaymentStatus,
  COUNT(*) AS CountFines,
  SUM(f.FineAmount) AS TotalFineAmount
FROM Fine f
GROUP BY f.PaymentStatus
ORDER BY CountFines DESC;

-- -----------------------------
-- Q23: Multi-Author Identification (books with more than one author) :contentReference[oaicite:7]{index=7}
-- -----------------------------
SELECT
  b.Title,
  COUNT(w.AuthorId) AS AuthorCount
FROM Book b
JOIN Writes w ON b.BookId = w.BookId
GROUP BY b.BookId, b.Title
HAVING AuthorCount > 1
ORDER BY AuthorCount DESC, b.Title;

-- -----------------------------
-- Q24: Books with price greater than 15 (Price table is normalized)
-- -----------------------------
SELECT
  b.Title,
  p.Price
FROM Book b
JOIN Price p ON b.PageCount = p.PageCount
WHERE p.Price > 15
ORDER BY p.Price DESC, b.Title;
