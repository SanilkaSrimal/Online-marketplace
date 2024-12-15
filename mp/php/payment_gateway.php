<?php
include '../connection/connection.php';
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Check if product_name and user_id are passed in the URL
if (!isset($_GET['product_name']) || !isset($_GET['user_id'])) {
    echo "<div class='alert alert-danger'>Product name or user ID is missing.</div>";
    exit();
}

$product_name = mysqli_real_escape_string($conn, $_GET['product_name']);
$user_id = intval($_GET['user_id']);

// Fetch product details from the database based on the product name
$product_query = $conn->query("SELECT * FROM Products WHERE name = '$product_name'");

if ($product_query->num_rows > 0) {
    $product = $product_query->fetch_assoc();
} else {
    echo "<div class='alert alert-danger'>Invalid product.</div>";
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Payment Gateway</title>
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center">Payment Gateway</h2>
        <form action="process_payment.php" method="POST">
            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
            <input type="hidden" name="user_id" value="<?php echo $user_id; ?>">

            <div class="mb-3">
                <label for="product_name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="product_name" name="product_name" value="<?php echo htmlspecialchars($product['name']); ?>" readonly>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" name="price" value="<?php echo htmlspecialchars($product['price']); ?>" readonly>
            </div>

            <button type="submit" class="btn btn-primary w-100">Confirm Payment</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
