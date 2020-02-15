<?php
// var_dump($_GET);
// exit();
// 関数ファイル読み込み
// include("functions.php");

// GETデータ取得
$id = $_GET["id"];

// DB接続
// $pdo = connectToDb();

// // DBの設定
$dbn = 'mysql:dbname=gsacfd05_10;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

// // DBに接続する処理
try {
    $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
    echo json_encode("db error: {$e->getMessage()}");
    http_response_code(500);
    exit();
}


// 削除SQL作成
$sql = "DELETE FROM user_table WHERE id=:id";

$stmt = $pdo->prepare($sql);
$stmt->bindValue(":id", $id, PDO::PARAM_INT);
$status = $stmt->execute();



// データ削除処理後
if ($status == false) {
    showSqlErrorMsg($stmt);
} else {
    // JSON形式にして出力
    echo json_encode(["msg" => "Delete successfull"]);
    exit();
}
