<?php
require_once("error_handling.php");
require_once("model/user.php");

if (!isset($_GET["operation"])) {
    print_error("No operation specified.");
}
$operation = htmlspecialchars($_GET["operation"]);

if ($operation == "login") {
    if (!isset($_GET["username"]) || !isset($_GET["password"])) {
        print_error("Login failed. No authentication provuser_ided");
    }
    $username = htmlspecialchars($_GET["username"]);
    $password = htmlspecialchars($_GET["password"]);
    $user_id = login($username, $password);
    if (!$user_id) {
        print_error("Login failed. Authentication provuser_ided is incorrect.");
    }
    $_SESSION["user_id"] = $user_id;
    echo json_encode(array("error"=>false, "operation"=>"login", "user_id"=>$user_id));
    return;
}
if ($operation == "create_user") {
   if (!isset($_GET["username"]) || !isset($_GET["password"]) || !isset($_GET["email"])) {
        print_error("All required information not provided (username, password, email)");
    }
    $username = htmlspecialchars($_GET["username"]);
    $password = htmlspecialchars($_GET["password"]);
    $email = htmlspecialchars($_GET["email"]);
    $result = create_user($username, $password, $email);
    if ($result["error"]) {
        print_error($result["error_message"]);
    }
    $user_id = login($username, $password);
    if (!$user_id) {
        print_error("Account created but login failed.");
    }
    $_SESSION["user_id"] = $user_id;
    return;
}
if (!isset($_SESSION["user_id"])) {
    print_error("User not authenticated.  Login is required");
}

$user_id = $_SESSION["user_id"];
if (!verify_user($user_id)) {
    print_error("User id is invalid");
}

if ($operation == "load_startup") {
    $user_data = get_user_data($user_id);
    $data = array_merge($user_data);
    echo json_encode($data);
    return;
}
?> 
