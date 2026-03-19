<?php
header('Content-Type: application/json; charset=utf-8');

$host = '127.0.0.1';
$dbname = 'teaching_record';
$username = 'root';
$password = ''; // 依你的環境調整

try {
    $pdo = new PDO(
        "mysql:host={$host};dbname={$dbname};charset=utf8",
        $username,
        $password,
        array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        )
    );
} catch (PDOException $e) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => '資料庫連線失敗：' . $e->getMessage()
    ));
    exit;
}