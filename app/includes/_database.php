<?php

try {
    $dbAccount = new PDO(
        'mysql:host=db;dbname=accounts;charset=utf8',
        'userAccount',
        'dwwm2024'
    );

    $dbAccount->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (Exception $e) {
    die('ERREUR CONNEXION MYSQL' . $e->getMessage());
}