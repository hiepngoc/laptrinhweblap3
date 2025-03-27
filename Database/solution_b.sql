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
-- Dữ liệu mẫu Order
INSERT INTO Orders (user_id, created_at)
VALUES
(1, '2024-01-15 10:00:00'),
(2, '2024-01-16 11:30:00'),
(1, '2024-01-17 14:15:00'),
(3, '2024-01-18 09:45:00'),
(2, '2024-01-19 16:00:00'),
(1, '2024-01-20 10:10:00'),
(4, '2024-01-21 17:30:00'),
(5, '2024-01-22 08:45:00'),
(3, '2024-01-23 15:20:00'),
(2, '2024-01-24 11:05:00');
GO
-- Dữ liệu mẫu Order_Details
INSERT INTO Order_Details (order_id, product_id)
VALUES
(1, 101),
(1, 102),
(2, 201),
(3, 101),
(4, 301),
(5, 202),
(5, 101),
(6, 302),
(6, 201),
(7, 101), 
(7, 202),
(8, 301), 
(9, 1023), 
(9, 201),
(10, 302);
GO
-- Dữ liệu mẫu Products
INSERT INTO Products (product_name, product_price, product_description)
VALUES
('Samsung Galaxy S23', 1000000, 'Điện thoại thông minh cao cấp của Samsung'),
('Apple iPhone 15', 1200000, 'Điện thoại thông minh mới nhất của Apple'),
('Xiaomi Redmi Note 12', 250000, 'Điện thoại tầm trung hiệu năng tốt'),
('Apple Watch SE', 300000, 'Đồng hồ thông minh của Apple'),
('Sony WH-1000XM5', 750000, 'Tai nghe chống ồn cao cấp của Sony'),
('Logitech M590', 450000, 'Chuột không dây đa năng của Logitech'),
('Dell XPS 15', 3500000, 'Laptop hiệu năng cao của Dell'),
('Canon EOS R6 Mark II', 5500000, 'Máy ảnh mirrorless chuyên nghiệp'),
('Samsung The Frame TV', 15000000, 'TV nghệ thuật của Samsung'),
('Google Pixel Buds Pro', 500000, 'Tai nghe không dây của Google');
GO
-- câu 1
SELECT u.user_id, u.user_name, o.order_id
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;
GO
-- câu 2
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS SoLuongDonHang
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY SoLuongDonHang DESC;
GO
-- câu 3
SELECT od.order_id, COUNT(od.product_id) AS SoSanPham
FROM Order_Details od
GROUP BY od.order_id;
GO
-- câu 4
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
ORDER BY o.order_id;
GO
-- câu 5
SELECT TOP 7 u.user_id, u.user_name, COUNT(o.order_id) AS SoLuongDonHang
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY SoLuongDonHang DESC;
GO
-- câu 6
SELECT DISTINCT TOP 7 u.user_id, u.user_name, o.order_id, p.product_name
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
ORDER BY u.user_id, o.order_id;
GO
-- câu 7
SELECT u.user_id, u.user_name, o.order_id, SUM(od.quantity * p.product_price) AS TongTien
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY u.user_id, u.user_name, o.order_id
ORDER BY u.user_id, o.order_id;
GO
-- câu 8
WITH OrderTotals AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(od.quantity * p.product_price) AS TongTien,
           ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY SUM(od.quantity * p.product_price) DESC) AS rn
    FROM Users u
    JOIN Orders o ON u.user_id = o.user_id
    JOIN Order_Details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, TongTien
FROM OrderTotals
WHERE rn = 1;
GO
-- câu 9
WITH OrderTotals AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(od.quantity * p.product_price) AS TongTien,
           COUNT(od.product_id) AS SoSanPham,
           ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY SUM(od.quantity * p.product_price) ASC) AS rn
    FROM Users u
    JOIN Orders o ON u.user_id = o.user_id
    JOIN Order_Details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, TongTien, SoSanPham
FROM OrderTotals
WHERE rn = 1;
GO
-- câu 10
WITH OrderTotals AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(od.quantity * p.product_price) AS TongTien,
           COUNT(od.product_id) AS SoSanPham,
           ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY COUNT(od.product_id) DESC) AS rn
    FROM Users u
    JOIN Orders o ON u.user_id = o.user_id
    JOIN Order_Details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, TongTien, SoSanPham
FROM OrderTotals
WHERE rn = 1;