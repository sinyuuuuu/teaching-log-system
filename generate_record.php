<?php
require_once 'db.php';

$input = json_decode(file_get_contents('php://input'), true);

$student_name = isset($input['student_name']) ? trim($input['student_name']) : '';
$course_unit_id = isset($input['course_unit_id']) ? intval($input['course_unit_id']) : 0;
$understanding_id = isset($input['understanding_id']) ? intval($input['understanding_id']) : 0;
$focus_id = isset($input['focus_id']) ? intval($input['focus_id']) : 0;
$progress_id = isset($input['progress_id']) ? intval($input['progress_id']) : 0;
$question_ids = isset($input['question_ids']) && is_array($input['question_ids']) ? $input['question_ids'] : array();
$flag_ids = isset($input['flag_ids']) && is_array($input['flag_ids']) ? $input['flag_ids'] : array();
$extra_note = isset($input['extra_note']) ? trim($input['extra_note']) : '';

if ($student_name === '') {
    echo json_encode(array(
        'status' => 'fail',
        'message' => '請輸入學生姓名'
    ));
    exit;
}

if ($course_unit_id <= 0) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => '請選擇課程單元'
    ));
    exit;
}

function getOptionTemplate($pdo, $id) {
    if ($id <= 0) {
        return '';
    }

    $sql = "SELECT template FROM performance_option WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':id' => $id));
    $row = $stmt->fetch();

    return $row ? $row['template'] : '';
}

$sql_unit = "SELECT title, description FROM course_unit WHERE id = :id";
$stmt_unit = $pdo->prepare($sql_unit);
$stmt_unit->execute(array(':id' => $course_unit_id));
$unit = $stmt_unit->fetch();

if (!$unit) {
    echo json_encode(array(
        'status' => 'fail',
        'message' => '找不到課程單元'
    ));
    exit;
}

$understanding_text = getOptionTemplate($pdo, $understanding_id);
$focus_text = getOptionTemplate($pdo, $focus_id);
$progress_text = getOptionTemplate($pdo, $progress_id);

$questions_text = '';
if (!empty($question_ids)) {
    $question_ids = array_map('intval', $question_ids);
    $question_ids = array_filter($question_ids);

    if (!empty($question_ids)) {
        $in = implode(',', $question_ids);
        $sql_questions = "SELECT question FROM course_question WHERE id IN ($in) ORDER BY sort ASC, id ASC";
        $stmt_questions = $pdo->query($sql_questions);
        $question_rows = $stmt_questions->fetchAll();

        $question_arr = array();
        foreach ($question_rows as $row) {
            $question_arr[] = $row['question'];
        }

        if (!empty($question_arr)) {
            $questions_text = '可以正確且清楚回答：' . implode('、', $question_arr) . '。';
        }
    }
}

$flags_text = '';
if (!empty($flag_ids)) {
    $flag_ids = array_map('intval', $flag_ids);
    $flag_ids = array_filter($flag_ids);

    if (!empty($flag_ids)) {
        $in = implode(',', $flag_ids);
        $sql_flags = "SELECT template FROM special_flag WHERE id IN ($in) ORDER BY id ASC";
        $stmt_flags = $pdo->query($sql_flags);
        $flag_rows = $stmt_flags->fetchAll();

        $flag_arr = array();
        foreach ($flag_rows as $row) {
            $flag_arr[] = $row['template'];
        }

        $flags_text = implode('', $flag_arr);
    }
}

$result = '';
$result .= '學生 ' . $student_name . ' ，' . "\n";
$result .= '本週表現：' . "\n";

if ($understanding_text !== '') {
    $result .= $understanding_text . "\n";
}
if ($focus_text !== '') {
    $result .= $focus_text . "\n";
}
if ($progress_text !== '') {
    $result .= $progress_text . "\n";
}

$result .= '完成專案【' . $unit['title'] . '】';
if ($questions_text !== '') {
    $result .= '，' . $questions_text;
}
$result .= "\n";

if ($unit['description'] !== '') {
    $result .= $unit['description'] . "\n";
}

if ($flags_text !== '') {
    $result .= $flags_text . "\n";
}

if ($extra_note !== '') {
    $result .= $extra_note . "\n";
}

echo json_encode(array(
    'status' => 'success',
    'text' => trim($result)
));