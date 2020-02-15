<?php
// var_dump($_POST);
// var_dump($_GET);
// exit();

// 関数ファイル読み込み
// include("functions.php");

// 必須入力のチェック（create.phpと似ている！）
if (
    !isset($_POST['company']) || $_POST['company'] == '' ||
    !isset($_POST['name']) || $_POST['name'] == '' ||
    !isset($_POST['tel']) || $_POST['tel'] == '' ||
    !isset($_POST['email']) || $_POST['email'] == '' ||
    !isset($_POST['deadline']) || $_POST['deadline'] == '' ||
    !isset($_POST['comment']) || $_POST['comment'] == '' ||
    !isset($_GET['id']) || $_GET['id'] == ''
    // idのチェックを追加
) {
    echo json_encode(['error' => 'param error']);
    http_response_code(500);
    exit();
}

// 送信データの受取
$company = $_POST['commpany'];
$name = $_POST['name'];
$tel = $_POST['tel'];
$email = $_POST['email'];
$deadline = $_POST['deadline'];
$comment = $_POST['comment'];
$id = $_GET["id"];
// idはGETメソッド

// //DB接続
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



// データ更新SQL作成→実行
// $sql = "UPDATE tamagotchigame_table SET feeling=:feeling,food=:food,updated_at=sysdate() WHERE id=:id";
$sql = "UPDATE user_table SET company=:company,name=:name,tel=:tel,email=:email,deadline=:deadline,comment=:comment,updated=sysdate() WHERE id=:id";



$stmt = $pdo->prepare($sql);
$stmt->bindValue(':company', $company, PDO::PARAM_STR);
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':tel', $tel, PDO::PARAM_STR);
$stmt->bindValue(':emial', $email, PDO::PARAM_STR);
$stmt->bindValue(':deadline', $deadline, PDO::PARAM_STR);
$stmt->bindValue(':comment', $coment, PDO::PARAM_STR);
$stmt->bindValue(":id", $id, PDO::PARAM_INT);
$status = $stmt->execute();

// データ更新処理後
if ($status == false) {
    //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
    showSqlErrorMsg($stmt);
} else {
    // JSON形式にして出力
    echo json_encode(["msg" => "Update successfull"]);
    exit();
}
