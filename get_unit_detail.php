<?php
require_once 'db.php';

$unit_id = isset($_GET['unit_id']) ? intval($_GET['unit_id']) : 0;

if ($unit_id <= 0) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => 'unit_id 不可為空'
    ));
    exit;
}

$sql_unit = "SELECT id, code, title, description
             FROM course_unit
             WHERE id = :unit_id
             AND is_active = 1";
$stmt_unit = $pdo->prepare($sql_unit);
$stmt_unit->execute(array(':unit_id' => $unit_id));
$unit = $stmt_unit->fetch();

if (!$unit) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => '找不到課程單元'
    ));
    exit;
}

$sql_questions = "SELECT id, question
                  FROM course_question
                  WHERE unit_id = :unit_id
                  AND is_active = 1
                  ORDER BY sort ASC, id ASC";
$stmt_questions = $pdo->prepare($sql_questions);
$stmt_questions->execute(array(':unit_id' => $unit_id));
$questions = $stmt_questions->fetchAll();

echo json_encode(array(
    'status' => 'success',
    'unit' => $unit,
    'questions' => $questions
));