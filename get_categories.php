<?php
require_once 'db.php';

$sql = "SELECT id, code, name
        FROM course_category
        WHERE is_active = 1
        ORDER BY sort ASC, id ASC";
$stmt = $pdo->query($sql);
$list = $stmt->fetchAll();

echo json_encode(array(
    'status' => 'success',
    'data' => $list
));