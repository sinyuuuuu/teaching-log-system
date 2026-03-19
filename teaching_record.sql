-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2026-03-19 10:09:55
-- 伺服器版本： 10.4.27-MariaDB
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `teaching_record`
--

-- --------------------------------------------------------

--
-- 資料表結構 `course_category`
--

CREATE TABLE `course_category` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_category`
--

INSERT INTO `course_category` (`id`, `code`, `name`, `sort`, `is_active`) VALUES
(1, 'scratch_b', 'Scratch 實戰班', 1, 1),
(2, 'scratch_a', 'Scratch 菁英班', 2, 1),
(3, 'python_b', 'Python 程式開發班', 3, 1),
(4, 'python_a', 'Python 程式進階班', 4, 1),
(5, 'js_b', 'JavaScript 程式開發班', 5, 1),
(6, 'html', 'HTML5 網頁程式開發班', 6, 1),
(7, 'database', '網路與資料庫', 7, 1),
(8, 'algorithm', '演算法研究', 8, 1),
(9, 'ai', 'AI 人工智慧', 9, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `course_question`
--

CREATE TABLE `course_question` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `sort` int(11) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_question`
--

INSERT INTO `course_question` (`id`, `unit_id`, `question`, `sort`, `is_active`) VALUES
(1, 1, '序列、初始化及迴圈的概念', 1, 1),
(2, 1, '區分迴圈中重複無限次及重複(條件)次的差別', 2, 1),
(3, 1, '如何做出動態logo', 3, 1),
(4, 1, '叩叮移動的功能', 4, 1),
(5, 2, '利用分身做出不斷掉落的水果', 1, 1),
(6, 2, '變數、重複直到的概念', 2, 1),
(7, 2, '利用隨機取數的概念水果隨機切換造型', 3, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `course_unit`
--

CREATE TABLE `course_unit` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort` int(11) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_unit`
--

INSERT INTO `course_unit` (`id`, `category_id`, `code`, `title`, `description`, `sort`, `is_active`) VALUES
(1, 1, 'sc_b_l1', 'L1_擊落冰雹', '本週課程主題為「擊落冰雹」，學習重點：序列、初始化及迴圈的概念', 1, 1),
(2, 1, 'sc_b_l2', 'L2_對稱不對稱', '本週課程主題為「對稱不對稱」，學習重點：分身變數、重複直到的概念', 2, 1),
(3, 1, 'sc_b_l3', 'L3_防盜樓梯', '本週課程主題為「防盜樓梯」，學習重點：利用定位板控制叩叮移動', 1, 1),
(4, 1, 'sc_b_l4', 'L4_浪浪過街', '本週課程主題為「浪浪過街」，學習重點：利用廣播訊息讓貓咪角色輪流出現', 1, 1),
(5, 1, 'sc_b_l5', 'L5_大魚吃小魚', '本週課程主題為「大魚吃小魚」，學習重點：利用函式把主程式縮減', 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `performance_option`
--

CREATE TABLE `performance_option` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `template` text DEFAULT NULL,
  `sort` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `performance_option`
--

INSERT INTO `performance_option` (`id`, `type_id`, `code`, `label`, `template`, `sort`) VALUES
(1, 1, 'good', '充分理解', '經過多次實作後，已能穩定掌握本單元觀念，並能應用於專案中。', 1),
(2, 1, 'ok', '大致理解', '對核心觀念已有基本理解，在協助下可完成實作。', 2),
(3, 1, 'need', '需要加強', '對觀念仍不穩定，需加強練習與複習。', 3),
(4, 2, 'high', '非常專注', '課堂中表現專注，能跟上節奏並完成任務。', 1),
(5, 2, 'mid', '普通', '大致能跟上進度，偶爾需提醒。', 2),
(6, 2, 'low', '容易分心', '課堂中較容易分心，需要多次提醒。', 3),
(7, 3, 'done', '完成主要功能', '專案已完成主要功能，並可順利執行。', 1),
(8, 3, 'done_extra', '完成課後練習', '除完成主要功能外，也完成課後挑戰。', 2),
(9, 3, 'partial', '部分完成', '已完成部分功能，尚需補足細節。', 3),
(10, 3, 'undone', '未完成', '本次尚未完成專案，需後續補做。', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `performance_type`
--

CREATE TABLE `performance_type` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `performance_type`
--

INSERT INTO `performance_type` (`id`, `code`, `name`) VALUES
(1, 'understanding', '理解程度'),
(2, 'focus', '專注度'),
(3, 'progress', '完成度');

-- --------------------------------------------------------

--
-- 資料表結構 `special_flag`
--

CREATE TABLE `special_flag` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `template` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `special_flag`
--

INSERT INTO `special_flag` (`id`, `code`, `label`, `template`) VALUES
(1, 'flag_talk', '易聊天', '上課時偶爾與同學聊天，需提醒專注。'),
(2, 'flag_rush', '急躁', '操作時較急躁，容易忽略細節。'),
(3, 'flag_slow', '理解較慢', '理解需要較多時間，適合搭配示範。'),
(4, 'flag_absent', '缺課', '本單元因缺課，需補強學習內容。');

-- --------------------------------------------------------

--
-- 資料表結構 `student_record`
--

CREATE TABLE `student_record` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `course_unit_id` int(11) DEFAULT NULL,
  `understanding_id` int(11) DEFAULT NULL,
  `focus_id` int(11) DEFAULT NULL,
  `progress_id` int(11) DEFAULT NULL,
  `extra_note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `student_record`
--

INSERT INTO `student_record` (`id`, `student_name`, `course_unit_id`, `understanding_id`, `focus_id`, `progress_id`, `extra_note`, `created_at`) VALUES
(1, '謝沛翔', 1, 1, 4, 7, '今日回家挑戰：製作購物總額計算', '2026-03-19 16:14:55');

-- --------------------------------------------------------

--
-- 資料表結構 `student_record_flag`
--

CREATE TABLE `student_record_flag` (
  `id` int(11) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `flag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `student_record_flag`
--

INSERT INTO `student_record_flag` (`id`, `record_id`, `flag_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `student_record_question`
--

CREATE TABLE `student_record_question` (
  `id` int(11) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `student_record_question`
--

INSERT INTO `student_record_question` (`id`, `record_id`, `question_id`) VALUES
(1, 1, 1),
(2, 1, 4);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- 資料表索引 `course_question`
--
ALTER TABLE `course_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- 資料表索引 `course_unit`
--
ALTER TABLE `course_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- 資料表索引 `performance_option`
--
ALTER TABLE `performance_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- 資料表索引 `performance_type`
--
ALTER TABLE `performance_type`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `special_flag`
--
ALTER TABLE `special_flag`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `student_record`
--
ALTER TABLE `student_record`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `student_record_flag`
--
ALTER TABLE `student_record_flag`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `student_record_question`
--
ALTER TABLE `student_record_question`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_category`
--
ALTER TABLE `course_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_question`
--
ALTER TABLE `course_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_unit`
--
ALTER TABLE `course_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `performance_option`
--
ALTER TABLE `performance_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `performance_type`
--
ALTER TABLE `performance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `special_flag`
--
ALTER TABLE `special_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `student_record`
--
ALTER TABLE `student_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `student_record_flag`
--
ALTER TABLE `student_record_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `student_record_question`
--
ALTER TABLE `student_record_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `course_question`
--
ALTER TABLE `course_question`
  ADD CONSTRAINT `course_question_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `course_unit` (`id`);

--
-- 資料表的限制式 `course_unit`
--
ALTER TABLE `course_unit`
  ADD CONSTRAINT `course_unit_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`);

--
-- 資料表的限制式 `performance_option`
--
ALTER TABLE `performance_option`
  ADD CONSTRAINT `performance_option_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `performance_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
