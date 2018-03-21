-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 21 2018 г., 02:01
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `biblio`
--
CREATE DATABASE IF NOT EXISTS `biblio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `biblio`;

-- --------------------------------------------------------

--
-- Структура таблицы `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- ССЫЛКИ ТАБЛИЦЫ `autor`:
--

--
-- Дамп данных таблицы `autor`
--

INSERT INTO `autor` (`id`, `name`) VALUES
(1, 'Dostoevsky'),
(2, 'Strugatsky'),
(3, 'Ivanov'),
(4, 'Petrov'),
(5, 'Sidorova'),
(6, 'Frolenkov'),
(7, 'Nassar');

-- --------------------------------------------------------

--
-- Структура таблицы `autors_books`
--

DROP TABLE IF EXISTS `autors_books`;
CREATE TABLE `autors_books` (
  `id` tinyint(4) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- ССЫЛКИ ТАБЛИЦЫ `autors_books`:
--   `autor_id`
--       `autor` -> `id`
--   `book_id`
--       `books` -> `id`
--

--
-- Дамп данных таблицы `autors_books`
--

INSERT INTO `autors_books` (`id`, `autor_id`, `book_id`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 3, 2),
(8, 4, 2),
(9, 7, 2),
(10, 3, 3),
(11, 4, 3),
(12, 5, 3),
(13, 6, 3),
(14, 7, 3),
(15, 5, 6),
(16, 6, 6),
(17, 7, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ССЫЛКИ ТАБЛИЦЫ `books`:
--

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`) VALUES
(1, 'Dr House'),
(2, 'Issak Newton'),
(3, 'Dr Freeman'),
(4, 'Idiot'),
(5, 'Hard to be a god'),
(6, 'The book');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `autors_books`
--
ALTER TABLE `autors_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_id_FK` (`autor_id`),
  ADD KEY `book_id_FK` (`book_id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `autors_books`
--
ALTER TABLE `autors_books`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `autors_books`
--
ALTER TABLE `autors_books`
  ADD CONSTRAINT `autor_id_FK` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_id_FK` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
