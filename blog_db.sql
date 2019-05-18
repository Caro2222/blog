-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 18 mai 2019 à 17:02
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`Id`, `FirstName`, `LastName`) VALUES
(2, 'Michel', 'trois'),
(3, 'Frank', 'Dumont'),
(4, 'Charle', 'Smith');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`Id`, `Name`) VALUES
(1, 'Sport'),
(2, 'Cuisine'),
(3, 'Cinéma'),
(4, 'Haricots'),
(5, 'Tennis de table basse');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `Id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Post_Id` smallint(5) UNSIGNED NOT NULL,
  `NickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreactionDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Post_Id` (`Post_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`Id`, `Post_Id`, `NickName`, `Comments`, `CreactionDate`) VALUES
(2, 37, 'caroline', 'commentaire', '2019-04-11 00:00:00'),
(3, 38, 'w', 'lùl', '2019-04-11 19:48:00'),
(5, 38, 'w', 'lùl', '2019-04-11 19:49:48'),
(6, 38, 'caro', 'com', '2019-04-11 19:54:36');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Authors_Id` tinyint(3) UNSIGNED DEFAULT NULL,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreactionDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Authors_Id` (`Authors_Id`),
  KEY `Authors_Id_2` (`Authors_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`Id`, `Authors_Id`, `Title`, `Content`, `CreactionDate`) VALUES
(35, 4, 'Le cinéma', 'Le cinéma est un art du spectacle. En français, il est couramment désigné comme le « septième art », d\'après l\'expression du critique Ricciotto Canudo dans les années 19201. L’art cinématographique se caractérise par le spectacle proposé au public sous la forme d’un film, c’est-à-dire d’un récit (fictionnel ou documentaire), véhiculé par un support (pellicule souple, bande magnétique, contenant numérique) qui est enregistré puis lu par un mécanisme continu ou intermittent qui crée l’illusion d’images en mouvement, ou par un enregistrement et une lecture continus de données informatiques.', '2019-04-04 10:06:07'),
(36, 3, 'Le sport', 'Le sport est un ensemble d\'exercices physiques se pratiquant sous forme de jeux individuels ou collectifs pouvant donner lieu à des compétitions. Le sport est un phénomène quasi universel dans le temps et dans l\'espace humain. La Grèce antique, la Rome antique, Byzance, l\'Occident médiéval puis moderne, mais aussi l\'Amérique précolombienne ou l\'Asie, sont tous marqués par l\'importance du sport. Certaines périodes sont surtout marquées par des interdits.', '2019-04-05 15:13:21'),
(37, 3, 'Tennis', 'Le tennis est un sport de raquette qui oppose soit deux joueurs (on parle alors de jeu en simple) soit quatre joueurs qui forment deux équipes de deux (on parle alors de jeu en double). Les joueurs utilisent une raquette cordée verticalement et horizontalement (en tamis) à une tension variant avec la puissance ou l\'effet que l\'on veut obtenir.\r\n\r\nCette raquette, dont les matériaux peuvent varier, sert à frapper une balle en caoutchouc, remplie d\'air et recouverte de feutre. Le but du jeu est de frapper la balle de telle sorte que l\'adversaire ne puisse la remettre dans les limites du terrain, soit en marquant le point en mettant l\'adversaire hors de portée de la balle, soit en l\'obligeant à commettre une faute (si sa balle ne retombe pas dans les limites du court, ou si elle ne passe pas le filet).', '2019-05-15 11:03:38'),
(38, 2, 'cinéma italien', 'Le cinéma italien, qui est le cinéma produit ou réalisé en Italie, est l\'un des principaux cinémas nationaux de l\'histoire du cinéma.\r\n\r\nL’histoire du cinéma italien a commencé quelques mois après que les frères Lumière eurent présenté au public leur appareil original, le Cinématographe, le 28 décembre 1895 à Paris : ce sont eux qui l\'introduisent en Italie au cours de l\'année 1896. À la fin de l\'après-guerre, le cinéma italien était l\'un des cinémas nationaux les plus influents et reconnus au niveau mondial, avec des mouvements très forts comme celui du néoréalisme.\r\n\r\nLe cinéma italien se déploie dans de nombreux sous-genres, dont le fameux western spaghetti ou le giallo. Souvent méprisé par la critique, le cinéma de genre italien a pourtant donné de véritables œuvres d\'art et inspiré le reste du cinéma mondial.\r\n\r\nD\'un point de vue technique, le cinéma italien se caractérise par la généralisation dès l\'après-guerre de la post-synchronisation, technique de doublage consistant à réenregistrer en studio a posteriori les dialogues d\'un film. Ceci facilitera l\'emploi de grandes vedettes étrangères dans les films italiens, en faisant substituer par des acteurs italiens la voix d\'acteurs s\'étant exprimés dans des langues différentes lors du tournage.\r\n\r\nDe très nombreuses coproductions franco-italiennes font que le cinéma italien croise souvent le chemin du cinéma français. Dans les années 2000 et 2010, c\'est toujours un cinéma très actif et primé.', '2019-05-15 11:01:32');

-- --------------------------------------------------------

--
-- Structure de la table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `Post_Id` smallint(5) UNSIGNED NOT NULL,
  `Categories_Id` tinyint(3) UNSIGNED NOT NULL,
  KEY `Post_Id` (`Post_Id`),
  KEY `Categories_Id` (`Categories_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `post_categories`
--

INSERT INTO `post_categories` (`Post_Id`, `Categories_Id`) VALUES
(35, 3),
(35, 2),
(38, 3),
(37, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `Contraint` FOREIGN KEY (`Post_Id`) REFERENCES `post` (`Id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `AuthorsContraint` FOREIGN KEY (`Authors_Id`) REFERENCES `authors` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `PC_category_constraint` FOREIGN KEY (`Categories_Id`) REFERENCES `categories` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PC_post_constraint` FOREIGN KEY (`Post_Id`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
