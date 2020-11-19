-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2020 at 01:28 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barkeeper`
--

-- --------------------------------------------------------

--
-- Table structure for table `cocktails`
--

CREATE TABLE `cocktails` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `preparation` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `alcoholic` tinyint(1) NOT NULL DEFAULT 1,
  `released` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cocktails`
--

INSERT INTO `cocktails` (`id`, `title`, `description`, `preparation`, `image`, `alcoholic`, `released`, `created_at`, `updated_at`) VALUES
(1, 'Pina Colada', 'Der cremige Cocktail Klassiker', '', 'pina_colada.jpg', 1, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21'),
(2, 'Margarita', 'Der bekannte Shortdrink', '', 'margarita.jpg', 1, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21'),
(3, 'Mojito', 'Für unsere Rumliebhaber', '', 'mojito.jpg', 1, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21'),
(4, 'Tequila Sunrise', 'Der fruchtige Cocktail Klassiker', '', 'tequila_sunrise.jpg', 1, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21'),
(5, 'Sex on the beach', 'Unser süßer Sommer Cocktail ', '', 'sex_on_the_beach.jpg', 1, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21'),
(6, 'Ginger Basil Smash', 'Unser gesunder alkoholfreier Cocktail', '', 'ginger_basil_smash.jpg', 0, 1, '2020-11-16 20:26:21', '2020-11-16 20:26:21');

-- --------------------------------------------------------

--
-- Table structure for table `cocktail_ingredients`
--

CREATE TABLE `cocktail_ingredients` (
  `id` int(11) NOT NULL,
  `cocktail_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cocktail_ingredients`
--

INSERT INTO `cocktail_ingredients` (`id`, `cocktail_id`, `ingredient_id`, `amount`, `required`) VALUES
(1, 1, 1, '6 cl', 1),
(2, 1, 2, '10 cl', 1),
(3, 1, 3, '4 cl', 1),
(4, 1, 4, '2 cl', 1),
(5, 1, 5, '1', 1),
(6, 1, 27, '3 - 4', 1),
(7, 3, 11, '5 cl', 1),
(8, 3, 12, '2 TL', 1),
(9, 3, 13, '125 ml', 1),
(10, 3, 9, '3 - 4', 1),
(11, 3, 10, '1', 1),
(12, 3, 10, '2 Stiele', 1),
(13, 2, 6, '8 cl', 1),
(14, 2, 7, '4 cl', 1),
(15, 2, 8, '4 cl', 1),
(16, 2, 9, '3 - 4', 1),
(17, 2, 10, '1', 1),
(18, 2, 5, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `title`) VALUES
(1, 'weißer Rum'),
(2, 'Ananassaft'),
(3, 'Kokosnusscreme'),
(4, 'Schlagsahne'),
(5, 'Ananasscheibe'),
(6, 'weißer Tequila'),
(7, 'Orangenlikör'),
(8, 'Limettensaft'),
(9, 'Crushed Ice'),
(10, 'Limette'),
(11, 'Rum'),
(12, 'weißer Rohrzucker'),
(13, 'Sodawasser'),
(14, 'Minze'),
(15, 'Tequila Gold'),
(16, 'Grenadine'),
(17, 'Zitronensaft'),
(18, 'Orangensaft'),
(19, 'Orangenscheiben'),
(20, 'Wodka'),
(21, 'Pfirsichlikör'),
(22, 'Cranberrynektar'),
(23, 'Zuckersirup'),
(24, 'Grapefruitsaft'),
(25, 'Ingwerlimonade'),
(26, 'Basilikum'),
(27, 'Eiswürfel');

-- --------------------------------------------------------

--
-- Table structure for table `tipps`
--

CREATE TABLE `tipps` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipps`
--

INSERT INTO `tipps` (`id`, `title`, `content`, `likes`, `dislikes`) VALUES
(1, 'Tipp 1', '            <p>Zum Cocktails mixen eignet sich natürlich am Besten ein sogenannter Cocktail Shaker.\r\n                Den findest du in jedem Haushaltswarengeschäft oder auf Amazon, Ebay etc. Aber diesen richtig zu benutzen ist gar nicht so einfach,\r\n                deswegen haben wir hier ein kleines Tutorial für dich herausgesucht:</p>\r\n            <iframe width=\"373\" height=\"210\" src=\"https://www.youtube.com/embed/AUAJE4UrZbE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>\r\n            <p>Und solltest du noch einen Shaker gebrauchen, haben wir auch schon einen passenden für dich gefunden:</p>\r\n            <p><a href=\"https://www.barstuff.de/barzubehoer-cocktail-sets/bar-aid-set-classic-home.html\">Dein Cocktail Shaker</a></p>', 14, 0),
(2, 'Tipp 2', '            <p>Cocktails sollten nicht warm serviert werden, deswegen schau darauf, dass auch dein Cocktail Glas schön kühl ist.\r\n                Stelle es entweder ein paar Minuten vorher in den Kühlschrank oder gib schon zu Beginn Eis hinein.</p>', 12, 0),
(3, 'Tipp 3', '            <p>Man sagt nicht umsonst das Auge trinkt mit, deshalb solltest du auch auf das Äußere deines Cocktails achten.\r\n                Das geht ganz leicht, in dem du entweder eine Frucht schön aufschneidest und an den Glasrand steckst, oder in\r\n                dem du etwas \"Grünzeug\" wie Minze auf den Cocktail legst</p>', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$12$rN3OIEmrCLUUfCDP9N5Jkew6ZxjOJghm/8Z7TXZ30S3OKTI.1ywLS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cocktails`
--
ALTER TABLE `cocktails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cocktail_ingredients`
--
ALTER TABLE `cocktail_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cocktail_id` (`cocktail_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipps`
--
ALTER TABLE `tipps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cocktails`
--
ALTER TABLE `cocktails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cocktail_ingredients`
--
ALTER TABLE `cocktail_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tipps`
--
ALTER TABLE `tipps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cocktail_ingredients`
--
ALTER TABLE `cocktail_ingredients`
  ADD CONSTRAINT `cocktail_ingredients_ibfk_1` FOREIGN KEY (`cocktail_id`) REFERENCES `cocktails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cocktail_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
