<?php

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
    WHERE DATE_FORMAT(date_transaction, '%Y-%m') = DATE_FORMAT (CURDATE(), '%Y-%m');");
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

function getSumofMonth ($callObjet) {

    $query = $callObjet->prepare("SELECT SUM(amount) sum_
    FROM `transaction`
    WHERE DATE_FORMAT(date_transaction, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m');");
    $query->execute();

    while ($transaction = $query->fetch()) {
        echo '<p class="card-title pricing-card-title text-center fs-1">'.$transaction['sum_'].'</p>';
    }
}
