USE LibraryDB2;

CREATE ROLE IF NOT EXISTS 'staff';
CREATE ROLE IF NOT EXISTS 'member';

GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Book        TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.BookCopy   TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Category   TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Author     TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Writes     TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Publisher  TO 'staff';

GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Loan        TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Fine        TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Payment     TO 'staff';

GRANT SELECT, UPDATE ON LibraryDB2.Member   TO 'staff';
GRANT SELECT, UPDATE ON LibraryDB2.UserReg  TO 'staff';
GRANT SELECT          ON LibraryDB2.LibraryCard TO 'staff';

GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Room            TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.RoomReservation TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Location        TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Shelf           TO 'staff';

GRANT SELECT, INSERT ON LibraryDB2.LogEntry     TO 'staff';
GRANT SELECT, INSERT ON LibraryDB2.Notification TO 'staff';

GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Donation TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Donates  TO 'staff';
GRANT SELECT, INSERT, UPDATE ON LibraryDB2.Vendor   TO 'staff';

GRANT SELECT ON LibraryDB2.Book       TO 'member';
GRANT SELECT ON LibraryDB2.BookCopy   TO 'member';
GRANT SELECT ON LibraryDB2.Category   TO 'member';
GRANT SELECT ON LibraryDB2.Author     TO 'member';
GRANT SELECT ON LibraryDB2.Writes     TO 'member';
GRANT SELECT ON LibraryDB2.Publisher  TO 'member';

GRANT SELECT ON LibraryDB2.Loan        TO 'member';
GRANT SELECT ON LibraryDB2.Fine        TO 'member';
GRANT SELECT ON LibraryDB2.Payment     TO 'member';
GRANT SELECT ON LibraryDB2.Notification TO 'member';
GRANT SELECT ON LibraryDB2.BookReview   TO 'member';
GRANT SELECT ON LibraryDB2.LibraryCard  TO 'member';

GRANT INSERT ON LibraryDB2.BookReview      TO 'member';
GRANT INSERT ON LibraryDB2.RoomReservation TO 'member';

CREATE USER IF NOT EXISTS 'staff_user'@'%'  IDENTIFIED BY 'ChangeMe_Staff!';
CREATE USER IF NOT EXISTS 'member_user'@'%' IDENTIFIED BY 'ChangeMe_Member!';

GRANT 'staff'  TO 'staff_user'@'%';
GRANT 'member' TO 'member_user'@'%';

SET DEFAULT ROLE 'staff'  TO 'staff_user'@'%';
SET DEFAULT ROLE 'member' TO 'member_user'@'%';

FLUSH PRIVILEGES;
