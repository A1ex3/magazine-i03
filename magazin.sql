-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Окт 30 2022 г., 12:40
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
-- Структура таблицы `kateg`
--

CREATE TABLE `kateg` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kateg`
--

INSERT INTO `kateg` (`ID`, `NAME`) VALUES
(1, 'Техника'),
(2, 'Мебель'),
(3, 'Игрушки');

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

-- --------------------------------------------------------

--
-- Структура таблицы `tovary`
--

CREATE TABLE `tovary` (
  `ID` int UNSIGNED NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(2000) NOT NULL,
  `PRICE` float NOT NULL,
  `COUNT` int NOT NULL,
  `ID_CAT` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tovary`
--

INSERT INTO `tovary` (`ID`, `TITLE`, `DESCRIPTION`, `PRICE`, `COUNT`, `ID_CAT`) VALUES
(1, 'Телевизор', 'LG 60', 20000, 4, 1),
(2, 'Акула', 'Мягкая игрушка', 40000, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int UNSIGNED NOT NULL,
  `LOGIN` char(32) NOT NULL,
  `PASSW` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TOKEN` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EXPIRED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `LOGIN`, `PASSW`, `TOKEN`, `EXPIRED`) VALUES
(92, '123', '123', '45cc86452c7ac3f1e28c108167928437', '2022-11-01 12:27:42'),
(93, '1234', '123', '1183b0c15a41ced9b3877e9040adad37', '2022-10-29 13:20:24'),
(94, '123456', '123', 'd3e89bd521ff881cf80c1a82f1f875b2', '2022-10-29 13:56:31'),
(95, '1234566', '123', 'c025842604d1d1576db331d44c0d61ad', '2022-10-29 13:58:38'),
(96, '4234324', '123', '654a05bd6056788cb6de404ba4c4ee84', '2022-10-29 14:00:50'),
(97, '423432455', '123', '710b28090c2d467ff6f55a10e4a1ec09', '2022-10-29 14:01:16'),
(98, '5345', '123', '88266c13b91b88bbb68c463e3a91466e', '2022-10-29 14:01:51'),
(99, '43423', '4', '000661a02404a9512652e9561104c810', '2022-10-29 14:02:15'),
(100, '3123213', '23', 'b2d4aa0247aff755f7551de8cc7856c8', '2022-10-29 14:15:47'),
(101, 'pumba228', '123', '6ec56f20a564dc1efbde6c20f6add61c', '2022-10-29 15:53:10'),
(102, '3123123', '123', 'ee62a6ad9185a4e45b6374d1984275db', '2022-10-29 16:08:25'),
(103, '12342342', '1234', 'f200c50e2987248e57c83896fc45f9ec', '2022-10-29 16:37:53'),
(104, '123123', '123', 'bfc2020a02a28a8549c6a6d4ce78e638', '2022-10-30 03:32:31'),
(105, '1233213', '123', 'a75d82fca86503ad089186a50aa77d18', '2022-11-01 06:44:27'),
(106, '312312312', '333', 'fda2dc4262914ba56334da7031e04317', '2022-11-01 11:18:07'),
(107, '432423', '123', '609ab401cfc65ea7053deb3f07d08429', '2022-11-01 11:19:21'),
(108, '12332133', '123', 'bcc01737907c08705acb3a0cae5ea1d9', '2022-11-01 11:19:49'),
(109, '3213123', '123', '69d70ffa10e149c78d286dff3fbc9312', '2022-11-01 11:20:33'),
(110, '1232131231231', '23', 'df10671fbb141e72c6dceb75414a5257', '2022-11-01 11:20:39'),
(111, '3213123333', '123', '0522622d258ec651c0c49b91eaaff0d2', '2022-11-01 11:20:57'),
(112, '324234234234234', '123', '6212d8474315772bc84b995d9bf28532', '2022-11-01 11:21:07'),
(113, '123321321312', '3123123', 'e6a21e23a062b94ddd1762d89256f5dc', '2022-11-01 11:52:28'),
(114, '3123123123123', '123', '37f4b806764549050ccabab818af52ef', '2022-11-01 11:53:02'),
(115, '132', '123', '8be9ea8a01b15bbaa55263f47f20a79f', '2022-11-01 11:54:07'),
(116, '312312321', '123', '4feac8dd24a0c802ee36d8aa8368430c', '2022-11-01 12:31:43');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `kateg`
--
ALTER TABLE `kateg`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD KEY `korzina_ibfk_1` (`ID_USER`),
  ADD KEY `ID_TOVARY` (`ID_TOVARA`);

--
-- Индексы таблицы `tovary`
--
ALTER TABLE `tovary`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CAT` (`ID_CAT`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `kateg`
--
ALTER TABLE `kateg`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tovary`
--
ALTER TABLE `tovary`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD CONSTRAINT `korzina_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `korzina_ibfk_2` FOREIGN KEY (`ID_TOVARA`) REFERENCES `tovary` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `tovary`
--
ALTER TABLE `tovary`
  ADD CONSTRAINT `tovary_ibfk_1` FOREIGN KEY (`ID_CAT`) REFERENCES `kateg` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
