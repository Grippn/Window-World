<?php

function print_error($message) {
    echo json_encode(array("error"=>true, "error_message"=>$message));
    exit;
}
?>
