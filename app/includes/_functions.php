<?php

/**
 * Generate a unique token and add it to the user session. 
 *
 * @return void
 */
function generateToken()
{
    if (
        !isset($_SESSION['token'])
        || !isset($_SESSION['tokenExpire'])
        || $_SESSION['tokenExpire'] < time()
    ) {
        $_SESSION['token'] = md5(uniqid(mt_rand(), true));
        $_SESSION['tokenExpire'] = time() + 60 * 15;
    }
}

/**
 * Redirect to the given URL.
 *
 * @param string $url
 * @return void
 */
function redirectTo(string $url): void
{
    // var_dump('REDIRECT ' . $url);
    header('Location: ' . $url);
    exit;
}


function getArrayAsHTMLList(array $array, string $ulClass = '', string $liClass = ''): string
{
    // $values = '';
    // foreach($array as $value){
    //     $values .= "<li>{$value}</li>";
    // }

    $ulClass = $ulClass ? ' class="' . $ulClass . '"' : '';
    $liClass = $liClass ? ' class="' . $liClass . '"' : '';

    return '<ul' . $ulClass . '>'
        . implode(array_map(fn ($v) => '<li' . $liClass . '>' . $v . '</li>', $array))
        . '</ul>';
}



/**
 * Get HTML to display errors available in user SESSION
 *
 * @param array $errorsList - Available errors list
 * @return string HTMl to display errors
 */
function getHtmlErrors(array $errorsList): string
{
    if (!empty($_SESSION['errorsList'])) {
        $errors = $_SESSION['errorsList'];
        unset($_SESSION['errorsList']);

        return getArrayAsHTMLList(
            array_map(fn ($e) => $errorsList[$e], $errors),
            'notif-error'
        );
    }
    return '';
}

/**
 * Get HTML to display messages available in user SESSION
 *
 * @param array $messagesList - Available Messages list
 * @return string HTML to display messages
 */
function getHtmlMessages(array $messagesList): string
{
    if (isset($_SESSION['msg'])) {
        $m = $_SESSION['msg'];
        unset($_SESSION['msg']);
        return '<p class="notif-success">' . $messagesList[$m] . '</p>';
    }
    return '';
}


/**
 * Check fo referer
 *
 * @return boolean Is the current referer valid ?
 */
function isRefererOk(): bool
{
    global $globalUrl;
    return isset($_SERVER['HTTP_REFERER'])
        && str_contains($_SERVER['HTTP_REFERER'], $globalUrl);
}


/**
 * Check for CSRF token
 *
 * @param array|null $data Input data
 * @return boolean Is there a valid toekn in user session ?
 */
function isTokenOk(?array $data = null): bool
{
    if (!is_array($data)) $data = $_REQUEST;

    return isset($_SESSION['token'])
        && isset($data['token'])
        && $_SESSION['token'] === $data['token'];
}

/**
 * Verify HTTP referer and token. Redirect with error message.
 *
 * @return void
 */
function preventCSRF(string $redirectUrl = 'add.php'): void
{
    if (!isRefererOk()) {
        addError('referer');
        redirectTo($redirectUrl);
    }

    if (!isTokenOk()) {
        addError('csrf');
        redirectTo($redirectUrl);
    }
}


/**
 * Verify HTTP referer and token for API calls
 *
 * @param array $inputData
 * @return void
 */
function preventCSRFAPI(array $inputData): void
{
    if (!isRefererOk()) triggerError('referer');

    if (!isTokenOk($inputData)) triggerError('csrf');
}


/**
 * Print an error in json format and stop script.
 *
 * @param string $error Error code from errors array available in _congig.php
 * @return void
 */
function triggerError(string $error): void
{
    global $errors;

    echo json_encode([
        'isOk' => false,
        'errorMessage' => $errors[$error]
    ]);

    exit;
}


/**
 * Add a new error message to display on next page. 
 *
 * @param string $errorMsg - Error message to display
 * @return void
 */
function addError(string $errorMsg): void
{
    if (!isset($_SESSION['errorsList'])) {
        $_SESSION['errorsList'] = [];
    }
    $_SESSION['errorsList'][] = $errorMsg;
}


/**
 * Add a new message to display on next page. 
 *
 * @param string $message - Message to display
 * @return void
 */
function addMessage(string $message): void
{
    $_SESSION['msg'] = $message;
}



/**
 * Get transactions of the month
 *
 * @param [type] $callObjet
 * @return void
 */
function getTransaction($callObjet)
{

    $query = $callObjet->prepare("SELECT name, amount, category_name, icon_class, DATE_FORMAT(date_transaction, '%d-%m-%Y') AS date_
    FROM `transaction`
    JOIN category USING (id_category)
    WHERE DATE_FORMAT(date_transaction, '%Y-%m') = DATE_FORMAT (CURDATE(), '%Y-%m')
    ORDER BY date_ desc;");
    $query->execute();

    // $result = $query->fetchAll();

    while ($transaction = $query->fetch()) {
        //  var_dump($transaction);

        echo '<tr>
                        <td width="50" class="ps-3">
                        <i class="bi bi-'. $transaction['icon_class'].' fs-3"></i>
                        
                            </td>
                            <td>
                                <time datetime="2023-07-10" class="d-block fst-italic fw-light">' . $transaction["date_"] . '</time>
                                ' . $transaction['name'] . '
                            </td>
                            <td class="text-end">
                                <span class="rounded-pill text-nowrap bg-warning-subtle px-2">
                                    ' . $transaction["amount"] . '
                                </span>
                            </td>
                            <td class="text-end text-nowrap">
                                <a href="#" class="btn btn-outline-primary btn-sm rounded-circle">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <a href="#" class="btn btn-outline-danger btn-sm rounded-circle">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                            </tr>';
    }
}

/**
 * Get sum of transaction of the current month
 *
 * @param [type] $callObjet
 * @return void
 */
function getSumofMonth ($callObjet) {

    $query = $callObjet->prepare("SELECT SUM(amount) sum_
    FROM `transaction`
    WHERE DATE_FORMAT(date_transaction, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m');");
    $query->execute();

    while ($transaction = $query->fetch()) {
        echo '<p class="card-title pricing-card-title text-center fs-1">'.$transaction['sum_'].'</p>';
    }
}


/**
 * Check for transaction fata format
 *
 * @param array $productData An array containing product data
 * @return boolean Is there errors in product data ?
 */
function checkTransactionInfo(array $transactionData): bool
{
    if (!isset($transactionData['name']) || strlen($transactionData['name']) === 0) {
        addError('transaction_name');
    }

    if (strlen($transactionData['name']) > 50) {
        addError('transaction_name_size');
    }

    if (!isset($transactionData['date'])) {
        addError('transaction_date');
    }

    if (!isset($transactionData['amount']) || !is_numeric($transactionData['amount'])) {
        addError('transaction_amount');
    }

    return empty($_SESSION['errorsList']);
}
