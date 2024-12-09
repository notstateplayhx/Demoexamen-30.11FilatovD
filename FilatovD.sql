-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 08 2024 г., 11:57
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FilatovD`
--

-- --------------------------------------------------------

--
-- Структура таблицы `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `study_form` varchar(255) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `issue_date` date NOT NULL,
  `document_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `first_name`, `last_name`, `middle_name`, `study_form`, `order_number`, `order_date`, `issue_date`, `document_number`) VALUES
(1, 2, 'Николай', 'Аксенов', 'Николаевич', 'Очная', '77-у', '2022-08-17', '2022-09-01', 3477),
(2, 3, 'Мария', 'Мышкина', 'Игоревна', 'Заочная', '77-у', '2022-08-04', '2022-09-01', 3478),
(3, 4, 'Игорь', 'Новиков', 'Евгеньевич', 'Очно-заочная', '77-у', '2022-08-12', '2022-09-01', 3479),
(4, 6, 'Дарья', 'Стаканова', 'Владимировна', 'Очная', '77-у', '2022-07-27', '2022-09-01', 3480);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `code`, `name`) VALUES
(1, 'user', 'Пользователь'),
(2, 'admin', 'Преподаватель');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `role_id`, `username`, `password`, `first_name`, `last_name`, `middle_name`) VALUES
(1, 2, 'teacher', '5f4dcc3b5aa765d61d8327deb882cf99', 'Анжелика', 'Капранова', 'Владимировна'),
(2, 1, 'nickolay213', '7c6a180b36896a0a8c02787eeafb0e4c', 'Николай', 'Аксенов', 'Николаевич'),
(3, 1, 'mariaDBreference986', '6cb75f652a9b52798eb6cf2201057c73', 'Мария', 'Мышкина', 'Игоревна'),
(4, 1, 'sobol228', '819b0643d6b89dc9b579fdfc9094f28e', 'Игорь', 'Новиков', 'Евгеньевич'),
(5, 1, 'noBiletUser12', '305e4f55ce823e111a46a9d500bcb86c', 'Имя', 'Фамилия', 'Отчество'),
(6, 1, 'krutoyChel15', '34cc93ece0ba9e3f6f235d4af979b16c', 'Дарья', 'Стаканова', 'Владимировна');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_number` (`document_number`),
  ADD KEY `student_id` (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
