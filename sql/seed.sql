USE LibraryDB2;

-- Clear existing data (optional - uncomment if you want to reset data)
-- DELETE FROM Staff;
-- DELETE FROM Member;
-- DELETE FROM UserReg;

-- 1. Users (UserReg)
INSERT IGNORE INTO UserReg
(UserId, Username, Email, Password, RegistrationDate, Role, AccountStatus, ZipCode, StreetNo, BuildingName)
VALUES
(1, 'nerissa.g', 'nerissa@aurak.ac.ae', 'hash999', '2018-01-15', 'staff', 'active', '00000', 'Univ St', 'Admin Bldg'),
(2, '2023006231', '2023006231@aurak.ac.ae', 'pw_nasis', '2023-09-01', 'member', 'active', '00000', 'Hostel 1', 'Block A'),
(3, '2023006224', '2023006224@aurak.ac.ae', 'pw_daniel', '2023-09-01', 'member', 'active', '00000', 'Hostel 1', 'Block A'),
(18, 'john.doe', 'john.doe@aurak.ac.ae', 'pw_john', '2020-05-20', 'staff', 'active', '00000', 'Univ St', 'Admin Bldg');

-- 2. Staff
INSERT INTO Staff (UserId, H_Staff, Essn, FirstName, LastName, Dept, Position, HireDate, Email) VALUES
(1,  NULL, 'ESSN-001', 'Nerissa', 'Gonzales', 'circulation', 'manager',  '2018-01-15', 'nerissa@aurak.ac.ae'),
(18, NULL, 'ESSN-002', 'John',    'Doe',      'reference',   'librarian','2020-05-20', 'john.doe@aurak.ac.ae');

-- 3. Members
INSERT INTO Member (UserId, MemberNumber, FirstName, LastName) VALUES
(2, '2023006231', 'Nasis', 'Gurmu'),
(3, '2023006224', 'Daniel', 'Negasa');

-- 12. RoomCapacity
INSERT INTO RoomCapacity (RoomType, Capacity) VALUES
('reading_area', 100),
('study_room', 6),
('meeting_room', 20);

-- 13. Room
INSERT INTO Room (RoomId, RoomNumber, RoomType) VALUES
(1, 'Saqr-Main', 'reading_area'),
(2, 'Saqr-Study-A', 'study_room'),
(3, 'Saqr-Study-B', 'study_room'),
(4, 'Saqr-Meeting-1', 'meeting_room');

-- 14. Location
INSERT INTO Location (LocationId, Section, FloorLevel, RoomId) VALUES
(1, 'Engineering Reference', 'Ground Floor', 1),
(2, 'Mathematics Reserve', 'Ground Floor', 1),
(3, 'Fiction Corner', 'Floor 1', 1);

-- 15. Shelf
INSERT INTO Shelf (LocationId, ShelfNo, Capacity, CurrentOccupancy) VALUES
(1, 1, 20, 5),
(1, 2, 15, 3),
(1, 3, 20, 10),
(2, 1, 25, 0),
(2, 2, 25, 0),
(3, 1, 50, 20),
(3, 2, 50, 5);

-- 16. Vendor
INSERT INTO Vendor (VendorId, VendorName, ContactPersonName, Email, VendorType, Street, ZipCode, BuildingName) VALUES
(1, 'Magrudys Enterprise', 'Sales Dept', 'university@magrudys.com', 'Bookseller', 'Sheikh Zayed Rd', '00000', 'Magrudy Mall'),
(2, 'Kinokuniya', 'Mr. Sato', 'dubai@kinokuniya.com', 'Bookseller', 'Dubai Mall', '00001', 'Dubai Mall');

