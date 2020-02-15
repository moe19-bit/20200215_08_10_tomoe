-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2020 年 2 月 14 日 16:17
-- サーバのバージョン： 10.4.11-MariaDB
-- PHP のバージョン: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacfd05_10`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `client_list`
--

CREATE TABLE `client_list` (
  `id` int(8) NOT NULL,
  `client` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `postal_code` int(8) NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `tamagotchigame_table`
--

CREATE TABLE `tamagotchigame_table` (
  `id` int(12) NOT NULL,
  `feeling` tinyint(5) NOT NULL,
  `food` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `tamagotchigame_table`
--

INSERT INTO `tamagotchigame_table` (`id`, `feeling`, `food`, `created_at`, `updated_at`) VALUES
(1, 14, 14, '2020-02-09 03:38:07', '2020-02-09 03:38:07'),
(4, 14, 14, '2020-02-09 03:38:07', '2020-02-09 03:38:07');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `task` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `task`, `deadline`, `comment`, `created_at`, `updated_at`) VALUES
(3, 'あああ', '2020-02-05', '12345', '2020-02-05 02:01:41', '2020-02-05 02:01:41'),
(4, 'いいいい', '2020-02-06', '7894', '2020-02-05 23:53:33', '2020-02-05 23:53:33'),
(5, 'ううう', '2020-02-08', '123456789', '2020-02-08 14:54:50', '2020-02-08 14:54:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `tome_table`
--

CREATE TABLE `tome_table` (
  `id` int(12) NOT NULL,
  `company` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `tome_table`
--

INSERT INTO `tome_table` (`id`, `company`, `name`, `tel`, `email`, `deadline`, `comment`, `created_at`, `updated`) VALUES
(17, 'とう（株）', 'とう', '090-1234-5678', 'info@', '2020-02-14', 'OK\r\n', '2020-02-07 00:00:00', '2020-02-07 00:00:00'),
(18, 'とう（株）', 'tou', '090-1234-5678', 'info@', '2020-02-22', 'OK', '2020-02-28 00:00:00', '2020-02-28 00:00:00'),
(19, 'DEF商事', '小川', '070', 'info', '2020-02-01', 'NG', '2020-02-13 19:36:22', '2020-02-13 19:36:22'),
(20, 'DEF商事', '小川', '070', 'info', '2020-02-28', 'NG', '2020-02-06 23:36:02', '2020-02-13 22:50:49'),
(21, 'ABC商事', '佐藤', '070', 'info', '2020-02-01', 'NG', '2020-02-13 02:07:36', '2020-02-13 02:07:36'),
(23, 'ヤマハ電気', '青木', '070', 'info', '2020-02-21', '有り難うございます。', '2020-02-13 19:18:58', '2020-02-13 19:18:58'),
(24, '山田建設', '山田', '093', 'info@', '2020-02-26', '感謝。', '2020-02-13 23:01:25', '2020-02-13 23:01:25');

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(12) NOT NULL,
  `login_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `login_pw` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- テーブルのインデックス `tamagotchigame_table`
--
ALTER TABLE `tamagotchigame_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `tome_table`
--
ALTER TABLE `tome_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `tamagotchigame_table`
--
ALTER TABLE `tamagotchigame_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルのAUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルのAUTO_INCREMENT `tome_table`
--
ALTER TABLE `tome_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- テーブルのAUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
