Create database QLNguoiDung
go
use QLNguoiDung
go
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) NOT NULL,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME NULL,
    created_at DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE Products (
    product_id INT IDENTITY(1,1) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_price FLOAT NOT NULL, -- Sử dụng FLOAT thay vì DOUBLE trong SQL Server
    product_description TEXT NOT NULL,
    updated_at DATETIME NULL,
    created_at DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) NOT NULL,
    user_id INT NOT NULL,
    updated_at DATETIME NULL,
    created_at DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE Order_Details (
    order_detail_id INT IDENTITY(1,1) NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    updated_at DATETIME NULL,
    created_at DATETIME DEFAULT GETDATE()
);


-- Dữ liệu mẫu User
INSERT INTO Users (user_name, user_email, user_pass, updated_at, created_at)
VALUES
('Nguyễn Văn An', 'nguyen.van.an@example.com', 'password123', NULL, GETDATE()),
('Trần Thị Bích', 'tran.thi.bich@example.com', 'securepass', NULL, GETDATE()),
('Lê Hoàng Cường', 'le.hoang.cuong@example.com', 'strongpwd', NULL, GETDATE()),
('Mai Lan Hương', 'mai.lan.huong@example.com', 'mypassword', NULL, GETDATE()),
('Phạm Minh Tuấn', 'pham.minh.tuan@example.com', '123456', NULL, GETDATE()),
('Nguyễn Thị Hoa', 'nguyen.thi.hoa@example.com', 'qwerty', NULL, GETDATE()),
('Đỗ Văn Minh', 'do.van.minh@example.com', 'admin123', NULL, GETDATE()),
('Trần Văn Hùng', 'tran.van.hung@example.com', 'hunter2', NULL, GETDATE()),
('Nguyễn Thị Ánh', 'nguyen.thi.anh@example.com', 'secret', NULL, GETDATE()),
('Phạm Văn Long', 'pham.van.long@example.com', 'longpass', NULL, GETDATE());
GO
--Câu 1
SELECT user_id, user_name, user_email
FROM Users
ORDER BY user_name ASC;
GO
--câu 2
SELECT TOP 7 user_id, user_name, user_email
FROM Users
ORDER BY user_name ASC;
GO
--câu 3
SELECT user_id, user_name, user_email
FROM Users
WHERE user_name LIKE '%a%'
ORDER BY user_name ASC;
GO
--câu 4
SELECT user_id, user_name, user_email
FROM Users
WHERE LEFT(user_name, 1) = 'm';
GO
--câu 5
SELECT user_id, user_name, user_email
FROM Users
WHERE RIGHT(user_name, 1) = 'i';
GO
--câu 6
SELECT user_id, user_name, user_email
FROM Users
WHERE user_email LIKE '%@gmail.com';
GO
--câu 7
SELECT user_id, user_name, user_email
FROM Users
WHERE user_email LIKE '%@gmail.com'
  AND LEFT(user_name, 1) = 'm';
GO
--câu 8
SELECT user_id, user_name, user_email
FROM Users
WHERE user_email LIKE '%@gmail.com'
  AND user_name LIKE '%i%'
  AND LEN(user_name) > 5;
GO
--câu 9
SELECT user_id, user_name, user_email
FROM Users
WHERE user_name LIKE '%a%'
  AND LEN(user_name) BETWEEN 5 AND 9
  AND user_email LIKE '%@gmail.com'
  AND user_email LIKE '%i%';
GO
--câu 10
SELECT user_id, user_name, user_email
FROM Users
WHERE (user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9)
   OR (user_name LIKE '%i%' AND LEN(user_name) < 9)
   OR (user_email LIKE '%@gmail.com' AND user_email LIKE '%i%');
