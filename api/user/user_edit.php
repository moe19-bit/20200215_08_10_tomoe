<?php
// var_dump($_GET);
// exit();
// 関数ファイル読み込み
// include('functions.php');

// 送信データの受取
$id = $_GET["id"];

//DB接続
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

// データ表示SQL作成
$sql = 'SELECT * FROM user_table WHERE id=:id';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(":id", $id, PDO::PARAM_INT);
$status = $stmt->execute();


// データ出力
if ($status == false) {
    showSqlErrorMsg($stmt);
} else {
    // データをJSON形式にして出力
    // fetch()でSQL実行結果を1件取得できる
    echo json_encode($stmt->fetch());
    exit();
}
