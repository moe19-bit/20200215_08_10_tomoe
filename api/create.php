<?php
// var_dump($_POST);
// exit();
// 関数ファイルの読み込み
// include("functions.php");

// 必須項目のチェック
// 入力チェック(（company,name,tel,email,deadlineが必須)未入力の場合は弾く，commentのみ任意) 
if (
  !isset($_POST['company']) || $_POST['company'] == '' ||
  !isset($_POST['name']) || $_POST['name'] == '' ||
  !isset($_POST['tel']) || $_POST['tel'] == '' ||
  !isset($_POST['email']) || $_POST['email'] == '' ||
  !isset($_POST['deadline']) || $_POST['deadline'] == '' ||
  // !isset($_POST['radio']) || $_POST['radio'] == '' ||
  !isset($_POST['comment']) || $_POST['comment'] == ''

  // 送られてきた$_POSTにtaskはちゃんと入ってますか？$_POST['task']==''まさかtaskは空じゃないですよね？という意味
) {
  echo json_encode(['error' => 'param error']);
  http_response_code(500); // ←js側にエラーを表示する処理 exit();
}


// 受け取ったデータ（$_POSTの中身）を変数に格納
$company = $_POST['company'];
$name = $_POST['name'];
$tel = $_POST['tel'];
$email = $_POST['email'];
$deadline = $_POST['deadline'];
// $radio = $_POST['radio'];
$comment = $_POST['comment'];

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

// データ登録SQL作成
// $sql = 'INSERT INTO todo_table(id, task, deadline, comment, created_at, updated)
//   VALUES(NULL, :task, :deadline, :comment, sysdate(), sysdate())';
$sql = 'INSERT INTO tome_table(id, company, name, tel,email, deadline, comment, created_at, updated)
  VALUES(NULL,:company, :name,:tel,:email, :deadline,:comment,sysdate(), sysdate())';

// SQL実行
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':company', $company, PDO::PARAM_STR);
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':tel', $tel, PDO::PARAM_STR);
$stmt->bindValue(':email', $email, PDO::PARAM_STR);
$stmt->bindValue(':deadline', $deadline, PDO::PARAM_STR);
// $stmt->bindValue(':radio', $radio, PDO::PARAM_STR);
$stmt->bindValue(':comment', $comment, PDO::PARAM_STR);
$status = $stmt->execute();


//データ登録処理後
if ($status == false) {
  //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
  $error = $stmt->errorInfo();
  echo json_encode($error[2]);
  http_response_code(500);
  exit();
} else {
  echo json_encode('done!');
  exit();
}
