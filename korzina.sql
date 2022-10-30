-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Окт 30 2022 г., 12:35
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `magazin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `korzina`
--

CREATE TABLE `korzina` (
  `ID_USER` int UNSIGNED DEFAULT NULL,
  `ID_TOVARA` int UNSIGNED DEFAULT NULL,
  `COUNT` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `korzina`
--

INSERT INTO `korzina` (`ID_USER`, `ID_TOVARA`, `COUNT`) VALUES
(105, 1, 2),
(105, 1, 5),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(115, 1, 1),
(92, 1, 123),
(92, 1, 123),
(92, 1, 1),
(92, 2, 1),
(116, 1, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD KEY `korzina_ibfk_1` (`ID_USER`),
  ADD KEY `ID_TOVARY` (`ID_TOVARA`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD CONSTRAINT `korzina_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `korzina_ibfk_2` FOREIGN KEY (`ID_TOVARA`) REFERENCES `tovary` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
