<?php
session_start();

include 'includes/_config.php';
include 'includes/_functions.php';
include 'includes/_database.php';

preventCSRF();

// Add a new product from form
if (isset($_REQUEST['token']) && !checkTransactionInfo($_REQUEST) && $_SESSION['token'] === $_REQUEST['token']) {

        $_SESSION['formData'] = [
            'transaction_name' => $_REQUEST['name'],
            'date' => $_REQUEST['date'],
            'transaction_amount' => $_REQUEST['amount'],
            'transaction_category' => $_REQUEST['category']
        ];
    

    $insert = $dbAccount->prepare("INSERT INTO `transaction`(`name`, `amount`, `date_transaction`, id_category) VALUES (:name, :amount, :date_transaction, :id_category);");

    $isInsertOk = $insert->execute([
        'name' => strip_tags($_REQUEST['name']),
        'amount' => strip_tags($_REQUEST['amount']),
        'date_transaction' => $_REQUEST['date'],
        'id_category' => $_REQUEST['category']
    ]);

    if ($isInsertOk) {
        var_dump("ok");
        // addMessage('insert_ok');
    } else {
        var_dump("error");
        // addError('insert_ko');
    }
}