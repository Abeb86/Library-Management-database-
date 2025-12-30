# Library Management Database

A MySQL database schema for a library management system.

## Prerequisites

- MySQL Server installed and running
- MySQL command-line client or MySQL Workbench
- Database user with appropriate permissions

## Setup Instructions

### Option 1: Using MySQL Command Line (Recommended)

1. **Open Command Prompt or PowerShell** in this directory

2. **Connect to MySQL:**
   ```bash
   mysql -u root -p
   ```
   (Enter your MySQL root password when prompted)

3. **Run the schema file:**
   ```bash
   source sql/schema.sql
   ```
   Or from the command line directly:
   ```bash
   mysql -u root -p < sql/schema.sql
   ```

4. **Run the seed data file:**
   ```bash
   mysql -u root -p LibraryDB2 < sql/seed.sql
   ```

### Option 2: Using Batch Script (Windows)

Run the provided batch script:
```bash
.\setup_database.bat
```

You'll be prompted for your MySQL root password.

### Option 3: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open `sql/schema.sql` in MySQL Workbench
4. Execute the script (Ctrl+Shift+Enter or click the Execute button)
5. Repeat for `sql/seed.sql` (make sure to select `LibraryDB2` as the default schema first)

### Option 4: Run Individual Files

**Run schema only:**
```bash
mysql -u root -p < sql/schema.sql
```

**Run seed data only:**
```bash
mysql -u root -p LibraryDB2 < sql/seed.sql
```

**Run queries file (when available):**
```bash
mysql -u root -p LibraryDB2 < sql/queries.sql
```

## Database Structure

The database `LibraryDB2` contains the following main entities:
- Users (Staff and Members)
- Books, Authors, Publishers, Categories
- Loans, Fines, Payments
- Rooms and Reservations
- Vendors and Donations
- Reviews and Notifications

## Useful MySQL Commands

**Connect to the database:**
```bash
mysql -u root -p LibraryDB2
```

**Show all tables:**
```sql
SHOW TABLES;
```

**Describe a table:**
```sql
DESCRIBE TableName;
```

**Exit MySQL:**
```sql
EXIT;
```

## Troubleshooting

- **"Access denied" error**: Make sure you're using the correct username and password
- **"Database already exists"**: The schema file uses `CREATE DATABASE IF NOT EXISTS`, so this is safe
- **"Unknown database"**: Run the schema.sql file first to create the database
- **Path issues**: Make sure you're in the project root directory when running commands

