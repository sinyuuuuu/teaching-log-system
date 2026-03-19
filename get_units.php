<?php
require_once 'db.php';

$category_id = isset($_GET['category_id']) ? intval($_GET['category_id']) : 0;

if ($category_id <= 0) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => 'category_id 不可為空'
    ));
    exit;
}

$sql = "SELECT id, code, title, description
        FROM course_unit
        WHERE category_id = :category_id
        AND is_active = 1
        ORDER BY sort ASC, id ASC";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(':category_id' => $category_id));
$list = $stmt->fetchAll();

echo json_encode(array(
    'status' => 'success',
    'data' => $list
));