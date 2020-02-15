<?php
// DB接続関数（PDO）
function connectToDb()
{
    $dbn = 'mysql:dbname=gsacfd05_10;charset=utf8;port=3306;host=localhost';
    $user = 'root';
    $pwd = '';
    try {
        // return $pdo = new PDO($dbn, $user, $pwd);
        return new PDO($dbn, $user, $pwd);
    } catch (PDOException $e) {
        exit('dbError:' . $e->getMessage());
    }
}

// SQL処理エラー
function showSqlErrorMsg($stmt)
{
    $error = $stmt->errorInfo();
    echo json_encode($error[2]);
    http_response_code(500);
    exit();
}
