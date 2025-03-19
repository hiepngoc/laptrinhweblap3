document.getElementById('update-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn form gửi đi mặc định

    // Lấy giá trị từ các trường input
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    const email = document.getElementById('email').value;

    // Kiểm tra mật khẩu có trùng khớp không
    if (password !== confirmPassword) {
        alert('Mật khẩu không trùng khớp. Vui lòng nhập lại.');
        return;
    }

    // Xử lý cập nhật (ví dụ: gửi dữ liệu đến server)
    console.log('Tên đăng nhập:', username);
    console.log('Mật khẩu:', password);
    console.log('Email:', email);

    // Kiểm tra cập nhật thành công hay thất bại
    if (username && password && email) { // Kiểm tra các trường không rỗng
        alert('Cập nhật thành công!');
        // Chuyển hướng đến trang quản lý tài khoản hoặc trang khác
        window.location.href = 'account.html';
    } else {
        alert('Cập nhật thất bại. Vui lòng kiểm tra lại thông tin.');
    }
});