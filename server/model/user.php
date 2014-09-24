<?php

require_once("database.php");

// ****************************************
// ************ PUBLIC METHODS ************
// ****************************************


/// Login for a user
/// Arguments: ([string]username, [string]password)
/// Returns: if successful [string]user_id
/// Returns: if unsuccessful [bool]false
function login($username, $password) {
    $db = connect();
    $query = array("username"=>$username);
    try {
        $user = $db->users->findOne($query);
        if (!$user) {
            return false;
        }
        if ($user["password"] == $password) {
            return (string)$user["_id"];
        }
    } catch (Exception $e) {
        print_error("Unable to query for login. ".$e);
    }
    return false;
}

/// Valididates a user id with the database
/// Arguments: ([string]user_id)
/// Returns: [bool]success
function verify_user($user_id) {
    $db = connect();
    $query = array("_id"=>new MongoId($user_id));
    try {
        $cursor = $db->users->findOne($query);
        return $cursor !== NULL;
    } catch (Exception $e) {
        print_error("Unable to verify user. ".$e);
    }
    return false;
}

/// Gets all user data for startup loading
/// Arguments: ([string]user_id)
/// Returns: [dictionary]user_Data
function get_user_data($user_id) {
    $db = connect();
    $query = array("_id"=>new MongoId($user_id));
    try {
        $cursor = $db->users->findOne($query);
        if ($cursor !== NULL) {
            return $cursor;
        }
    } catch (Exception $e) {
        print_error("Unable to find user. ".$e);
    }
    return array("error"=>true, "error_message"=>"Unable to find user for user id");

}

/// Creates a user in the database
/// Arguments: ([string]username, [string]password, [string]email)
/// Returns: [dictionary]results { [bool]error, [string]error_message } 
function create_user($username, $password, $email) {
    $db = connect();
    if (account_exists($username, $email)) {
        return array("error"=>true, "error_message"=>"Username or email already exist in an account");
    }
    $insert = array(
        "username"=>$username,
        "password"=>$password,
        "email"=>$email
    );
    try {
        $result = $db->users->insert($insert, array('w'=>true));
        if (isset($result) && $result["ok"] == 1) {
            return array("error"=>false);
        }
        return array("error"=>true, "error_message"=> "Unable to create new user ".$result);
    } catch (Exception $e) {
        print_error("Error in creating a new user ".$e);
    }
    return array("error"=>true, "error_message"=> "Unable to create new user ");

}

// ****************************************
// ************ PRIVATE HELPERS ***********
// ****************************************

/// Checks if the username or email already exist
/// Arguments: ([string]username, [string]email)
/// Returns: [bool]true if either are already in database
function account_exists($username, $email) {
    $db = connect();
    $queries = array(
        array("username"=>$username), 
        array("email"=>$email)
    );
    foreach ($queries as $query) {
        try {
            $cursor = $db->users->findOne($query);
            if ($cursor !== NULL) {
                return true;
            }
        } catch (Exception $e) {
            print_error("Unable to lookup existing accounts for username and email check ".$e);
        }
    }
    return false;
}


?>
