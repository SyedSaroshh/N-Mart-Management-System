<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ProductTab.css">
    <h1>Add Product Info</h1>
</head>
<body>

<?php
// Define variables to store user inputs and error messages
$value1 = "";
$value2 = "";
$value3 = "";
$value4 = "";
$error = "";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    // Retrieve user inputs from the form
    $value1 = $_POST["value1"];
    $value2 = $_POST["value2"];
    $value3 = $_POST["value3"];
    $value4 = $_POST["value4"];

    // Validate if the first value is an integer
    if (!is_numeric($value3) || intval($value3) != $value3) 
	{
        $error = "Error: Please enter a valid integer for Product Quantity.";
    } 
	if (!is_numeric($value4) || intval($value4) != $value4) 
	{
        $error = "Error: Please enter a valid integer for Product Cost.";
    } 
	else
	{
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mmm";
$inventoryid='Invent1';

$conn = new mysqli($servername, $username, $password, $dbname);
	$sql = "INSERT INTO product (Product_ID,Name,Cost,Stock)
            VALUES ('$value1', '$value2', '$value3', '$value4')";
			

    if (mysqli_query($conn, $sql)) 
	{
        echo "Data inserted successfully.";
    } else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
	}
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <label for="value1">Product ID:</label>
    <input type="text" id="value1" name="value1" value="<?php echo $value1; ?>" required><br>

    <label for="value2">Name Of Product:</label>
    <input type="text" id="value2" name="value2" value="<?php echo $value2; ?>" required><br>

    <label for="value3">Available Quantity(Integer):</label>
    <input type="text" id="value3" name="value3" value="<?php echo $value3; ?>" required><br>

    <label for="value4"> Cost(Integer):</label>
    <input type="text" id="value4" name="value4" value="<?php echo $value4; ?>" required><br>

    <button type="submit">Submit</button>
</form>

<?php
// Display error message if there is any
if (!empty($error)) {
    echo "<p class='error-message'>$error</p>";
}
?>


</body>
</html>
