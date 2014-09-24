<?php

/// Connects to the database
/// Returns [MongoDB]database
function connect() {
    try {
        $connection = new MongoClient();
        $db = $connection->windowworld;
    } catch (exception $e) {
        print_error("Unable to connect to database. ".$e);
    }
    return $db;
}

?>
