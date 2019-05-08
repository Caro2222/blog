-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 08 Avril 2019 à 11:20
-- Version du serveur :  5.7.25-0ubuntu0.16.04.2
-- Version de PHP :  7.0.33-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Blog_DB`
--

-- --------------------------------------------------------

--
-- Structure de la table `Authors`
--

CREATE TABLE `Authors` (
  `Id` tinyint(3) UNSIGNED NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Authors`
--

INSERT INTO `Authors` (`Id`, `FirstName`, `LastName`) VALUES
(2, 'Michel', 'trois'),
(3, 'Frank', 'Dumont'),
(4, 'Charle', 'Smith');

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `Id` tinyint(3) UNSIGNED NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Categories`
--

INSERT INTO `Categories` (`Id`, `Name`) VALUES
(1, 'Sport'),
(2, 'Cuisine'),
(3, 'Cinéma'),
(4, 'Haricots'),
(5, 'Tennis de table basse');

-- --------------------------------------------------------

--
-- Structure de la table `Comments`
--

CREATE TABLE `Comments` (
  `Id` int(3) UNSIGNED NOT NULL,
  `Post_Id` smallint(5) UNSIGNED NOT NULL,
  `NickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Post`
--

CREATE TABLE `Post` (
  `Id` smallint(3) UNSIGNED NOT NULL,
  `Authors_Id` tinyint(3) UNSIGNED DEFAULT NULL,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Post`
--

INSERT INTO `Post` (`Id`, `Authors_Id`, `Title`, `Content`, `CreactionDate`) VALUES
(35, 4, 'Le cinéma', 'Le cinéma est un art du spectacle. En français, il est couramment désigné comme le « septième art », d\'après l\'expression du critique Ricciotto Canudo dans les années 19201. L’art cinématographique se caractérise par le spectacle proposé au public sous la forme d’un film, c’est-à-dire d’un récit (fictionnel ou documentaire), véhiculé par un support (pellicule souple, bande magnétique, contenant numérique) qui est enregistré puis lu par un mécanisme continu ou intermittent qui crée l’illusion d’images en mouvement, ou par un enregistrement et une lecture continus de données informatiques.', '2019-04-04 10:06:07'),
(36, 3, 'Le sport', 'Le sport est un ensemble d\'exercices physiques se pratiquant sous forme de jeux individuels ou collectifs pouvant donner lieu à des compétitions. Le sport est un phénomène quasi universel dans le temps et dans l\'espace humain. La Grèce antique, la Rome antique, Byzance, l\'Occident médiéval puis moderne, mais aussi l\'Amérique précolombienne ou l\'Asie, sont tous marqués par l\'importance du sport. Certaines périodes sont surtout marquées par des interdits.', '2019-04-05 15:13:21'),
(37, 2, 'è_uiuyiighfjhgf', 'uoiuyouyoltulngfj,,,,,,,,,,,,,,,,,,h', '2019-04-05 15:35:32');

-- --------------------------------------------------------

--
-- Structure de la table `Post_Categories`
--

CREATE TABLE `Post_Categories` (
  `Post_Id` smallint(5) UNSIGNED NOT NULL,
  `Categories_Id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Post_Categories`
--

INSERT INTO `Post_Categories` (`Post_Id`, `Categories_Id`) VALUES
(35, 3),
(35, 2),
(37, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Authors`
--
ALTER TABLE `Authors`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Post_Id` (`Post_Id`);

--
-- Index pour la table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Authors_Id` (`Authors_Id`),
  ADD KEY `Authors_Id_2` (`Authors_Id`);

--
-- Index pour la table `Post_Categories`
--
ALTER TABLE `Post_Categories`
  ADD KEY `Post_Id` (`Post_Id`),
  ADD KEY `Categories_Id` (`Categories_Id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Authors`
--
ALTER TABLE `Authors`
  MODIFY `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `Id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Post`
--
ALTER TABLE `Post`
  MODIFY `Id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `Contraint` FOREIGN KEY (`Post_Id`) REFERENCES `Post` (`Id`);

--
-- Contraintes pour la table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `AuthorsContraint` FOREIGN KEY (`Authors_Id`) REFERENCES `Authors` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `Post_Categories`
--
ALTER TABLE `Post_Categories`
  ADD CONSTRAINT `PC_category_constraint` FOREIGN KEY (`Categories_Id`) REFERENCES `Categories` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PC_post_constraint` FOREIGN KEY (`Post_Id`) REFERENCES `Post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
