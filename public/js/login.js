document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn form gửi đi mặc định

    // Lấy giá trị từ các trường input
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Xử lý đăng nhập (ví dụ: gửi dữ liệu đến server)
    console.log('Tên đăng nhập:', username);
    console.log('Mật khẩu:', password);

    // Kiểm tra đăng nhập thành công hay thất bại
    if (username === 'admin' && password === 'password') {
        alert('Đăng nhập thành công!');
        // Chuyển hướng đến trang chủ hoặc trang khác
        window.location.href = 'index.html';
    } else {
        alert('Đăng nhập thất bại. Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.');
    }
});