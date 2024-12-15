<?php include '../connection/connection.php'; ?>
<?php
if (isset($_POST['register'])) {
    // Sanitize and validate inputs
    $username = $conn->real_escape_string(trim($_POST['username']));
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Hash the password
    $email = $conn->real_escape_string(trim($_POST['email']));
    $user_type = $conn->real_escape_string($_POST['user_type']);

    // Check if the username or email already exists
    $check_user = $conn->query("SELECT * FROM Users WHERE username = '$username' OR email = '$email'");
    if ($check_user->num_rows > 0) {
        echo "<div class='alert alert-danger mt-3'>Username or email already exists.</div>";
    } else {
        // Insert the new user into the database
        $sql = "INSERT INTO Users (username, password, email, user_type) 
                VALUES ('$username', '$password', '$email', '$user_type')";
        if ($conn->query($sql) === TRUE) {
            echo "<div class='alert alert-success mt-3'>User registered successfully! Redirecting to login page...</div>";
            echo "<meta http-equiv='refresh' content='2;url=login.php'>"; // Redirect after 2 minutes
        } else {
            echo "<div class='alert alert-danger mt-3'>Error: " . $conn->error . "</div>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/register_user.css">
    
</head>
<body>
    <h2><b>ONLINE MARKETPLACE</b></h2>
    <div class="container">
        <h2>User Registration</h2>
        <form action="register_user.php" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="user name"required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="mb-3">
                <label for="user_type" class="form-label">User Type</label>
                <select class="form-select" id="user_type" name="user_type" required>
                    <option value="buyer">Buyer</option>
                    <option value="seller">Seller</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100" name="register">Register</button>
            <p class="text">Do you have an account?<a href="login.php">login here</a></p>
        </form>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Marketplace. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
