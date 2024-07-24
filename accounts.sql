-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 juil. 2024 à 13:18
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `accounts`
--
CREATE DATABASE IF NOT EXISTS `accounts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `accounts`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon_class` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `category_name`, `icon_class`) VALUES
(1, 'Habitation', 'house-door'),
(2, 'Travail', 'person-workspace'),
(3, 'Cadeau', 'gift'),
(4, 'Numérique', 'wifi'),
(5, 'Alimentation', 'egg-fried'),
(6, 'Voyage', 'train-front'),
(7, 'Loisir', 'emoji-smile'),
(8, 'Voiture', 'car-front'),
(9, 'Santé', 'bandaid');

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date_transaction` date NOT NULL,
  `id_category` int DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `name`, `amount`, `date_transaction`, `id_category`) VALUES
(1, 'Bar', '-21.00', '2023-01-21', 7),
(2, 'Loyer de janvier 2023', '-432.00', '2023-01-10', 1),
(3, 'RDV médecin', '-25.00', '2023-01-23', 9),
(4, 'Facture électricité', '-62.00', '2023-01-24', 1),
(5, 'Facture eau', '-152.00', '2023-01-24', 1),
(6, 'Essence voiture', '-58.00', '2023-01-30', 8),
(7, 'Course Biocoop', '-35.00', '2023-02-01', 5),
(8, 'Abonnement Sosh mobile', '-12.00', '2023-02-01', 4),
(9, 'Salle de sport', '-69.00', '2023-02-05', 7),
(10, 'Bar', '-32.00', '2023-02-06', 7),
(11, 'Reboursement sécurité sociale', '20.00', '2023-02-10', 9),
(12, 'Course Carrefour', '-60.00', '2023-02-15', 5),
(13, 'Virement salaire février 2023', '1326.00', '2023-02-15', 2),
(14, 'Essence voiture', '-59.00', '2023-02-16', 8),
(15, 'Loyer de février 2023', '-438.00', '2023-02-10', 1),
(16, 'Bar', '-41.00', '2023-02-22', 7),
(17, 'RDV ophtalmo', '-35.00', '2023-02-23', 9),
(18, 'Facture électricité', '-62.00', '2023-02-23', 1),
(19, 'Course Carrefour ', '-40.00', '2023-03-01', 5),
(20, 'Abonnement Sosh mobile', '-12.00', '2023-03-03', 4),
(21, 'Essence voiture', '-61.00', '2023-03-05', 8),
(22, 'Bar', '-20.00', '2023-03-10', 7),
(23, 'Reboursement sécurité sociale', '28.00', '2023-03-13', 9),
(24, 'Course Biocoop', '-25.00', '2023-03-15', 5),
(25, 'Virement salaire mars 2023', '1326.00', '2023-03-17', 2),
(26, 'Essence voiture', '-62.00', '2023-03-22', 8),
(27, 'Billets de train Paris', '-72.00', '2023-03-23', 6),
(28, 'Loyer de mars 2023', '-432.00', '2023-03-10', 1),
(29, 'RDV dentiste', '-60.00', '2023-03-26', 9),
(30, 'Bar', '-30.00', '2023-03-26', 7),
(31, 'Facture électricité', '-62.00', '2023-03-26', 1),
(32, 'Course Carrefour ', '-71.00', '2023-03-29', 5),
(33, 'Remise de chèque 1136528 Mamie', '120.00', '2023-03-30', 3),
(34, 'Abonnement Sosh mobile', '-12.00', '2023-04-03', 4),
(35, 'Essence voiture', '-64.00', '2023-04-08', 8),
(36, 'Bar', '-10.00', '2023-04-11', 7),
(37, 'Course Biocoop', '-57.00', '2023-04-12', 5),
(38, 'Reboursement sécurité sociale', '48.00', '2023-04-13', 9),
(39, 'Virement salaire avril 2023', '1326.00', '2023-04-17', 2),
(40, 'Remise de chèque 1136529 Maman', '80.00', '2023-04-20', 3),
(41, 'Loyer de avril 2023', '-432.00', '2023-04-10', 1),
(42, 'Essence voiture', '-66.00', '2023-04-25', 8),
(43, 'RDV médecin', '-25.00', '2023-04-26', 9),
(44, 'Course Carrefour ', '-61.00', '2023-04-26', 5),
(45, 'Facture électricité', '-62.00', '2023-04-26', 1),
(46, 'Facture eau', '-152.00', '2023-04-26', 1),
(47, 'Bar', '-17.00', '2023-04-27', 7),
(48, 'Assurance habitation', '-230.00', '2023-04-30', 1),
(49, 'Abonnement Sosh mobile', '-12.00', '2023-05-04', 4),
(50, 'Salle de sport', '-69.00', '2023-05-08', 7),
(51, 'Course Carrefour', '-64.00', '2023-05-10', 5),
(52, 'Essence voiture', '-67.00', '2023-05-12', 8),
(53, 'Restaurant Libanais', '-30.00', '2023-05-13', 7),
(54, 'Bar', '-15.00', '2023-05-13', 7),
(55, 'Abonnement Netflix', '-9.00', '2023-05-13', 4),
(56, 'Reboursement sécurité sociale', '20.00', '2023-05-14', 9),
(57, 'Virement salaire mai 2023', '1326.00', '2023-05-18', 2),
(58, 'Loyer de mai 2023', '-432.00', '2023-05-1.', 1),
(59, 'Course Biocoop', '-68.00', '2023-05-24', 5),
(60, 'Facture électricité', '-64.00', '2023-05-26', 1),
(61, 'RDV médecin', '-25.00', '2023-05-27', 9),
(62, 'Essence voiture', '-69.00', '2023-05-29', 8),
(63, 'Bar', '-32.00', '2023-05-29', 7),
(64, 'Abonnement Sosh mobile', '-12.00', '2023-06-03', 4),
(65, 'Course Biocoop', '-72.00', '2023-06-07', 5),
(66, 'McDo', '-12.00', '2023-06-12', 7),
(67, 'Abonnement Netflix', '-9.00', '2023-06-12', 4),
(68, 'Reboursement sécurité sociale', '20.00', '2023-06-14', 9),
(69, 'Bar', '-41.00', '2023-06-14', 7),
(70, 'Essence voiture', '-70.00', '2023-06-15', 8),
(71, 'Virement salaire juin 2023', '1326.00', '2023-06-17', 2),
(72, 'Course Carrefour ', '-75.00', '2023-06-21', 5),
(73, 'BGK', '-18.00', '2023-06-23', 7),
(74, 'Loyer de juin 2023', '-502.00', '2023-06-10', 1),
(75, 'Facture électricité', '-64.00', '2023-06-26', 1),
(76, 'RDV médecin', '-25.00', '2023-06-27', 9),
(77, 'Bar', '-20.00', '2023-06-30', 7),
(78, 'Essence voiture', '-72.00', '2023-07-02', 8),
(79, 'Abonnement Sosh mobile', '-12.00', '2023-07-04', 4),
(80, 'Course Carrefour', '-79.00', '2023-07-05', 5),
(81, 'Restaurant Italien', '-24.00', '2023-07-08', 7),
(82, 'KFC', '-16.00', '2023-07-13', 7),
(83, 'Abonnement Netflix', '-9.00', '2023-07-13', 4),
(84, 'Reboursement sécurité sociale', '20.00', '2023-07-15', 9),
(85, 'Bar', '-32.00', '2023-07-16', 7),
(86, 'Virement salaire juillet 2023', '1326.00', '2023-07-18', 2),
(87, 'Essence voiture', '-74.00', '2023-07-19', 8),
(88, 'Course Carrefour', '-83.00', '2023-07-19', 5),
(89, 'McDo', '-11.00', '2023-07-23', 7),
(90, 'Loyer de juillet 2023', '-432.00', '2023-07-10', 1),
(91, 'Facture électricité', '-64.00', '2023-07-26', 1),
(92, 'Facture eau', '-152.00', '2023-07-26', 1),
(93, 'RDV kiné', '-35.00', '2023-07-28', 9),
(94, 'Assurance voiture', '-352.00', '2023-07-30', 8),
(95, 'Bar', '-30.00', '2023-08-01', 7),
(96, 'Billets de train Lyon', '-145.00', '2023-08-01', 6),
(97, 'Course Biocoop', '-25.00', '2023-08-02', 5),
(98, 'Abonnement Sosh mobile', '-12.00', '2023-08-03', 4),
(99, 'Essence voiture', '-75.00', '2023-08-05', 8),
(100, 'Salle de sport', '-69.00', '2023-08-07', 7),
(101, 'Abonnement Netflix', '-9.00', '2023-08-12', 4),
(102, 'Reboursement sécurité sociale', '28.00', '2023-08-15', 9),
(103, 'Course Carrefour', '-71.00', '2023-08-16', 5),
(105, 'Virement salaire août 2023', '1630.00', '2023-08-17', 2),
(106, 'Essence voiture', '-77.00', '2023-08-22', 8),
(107, 'KFC', '-16.00', '2023-08-23', 7),
(108, 'Loyer de août 2023', '-438.00', '2023-08-10', 1),
(109, 'Facture électricité', '-72.00', '2023-08-26', 1),
(110, 'RDV médecin', '-25.00', '2023-08-28', 9),
(111, 'BGK', '-18.00', '2023-08-30', 7),
(112, 'Course Carrefour', '-57.00', '2023-08-30', 5),
(113, 'Bar', '-17.00', '2023-09-02', 7),
(114, 'Abonnement Sosh mobile', '-15.00', '2023-09-03', 4),
(115, 'Essence voiture', '-78.00', '2023-09-08', 8),
(116, 'Abonnement Netflix', '-9.00', '2023-09-12', 4),
(117, 'Course Biocoop', '-61.00', '2023-09-13', 5),
(118, 'Reboursement sécurité sociale', '20.00', '2023-09-15', 9),
(119, 'Virement salaire septembre 2023', '1326.00', '2023-09-17', 2),
(120, 'Bar', '-15.00', '2023-09-18', 7),
(121, 'Loyer de septembre 2023', '-432.00', '2023-09-10', 1),
(122, 'Essence voiture', '-80.00', '2023-09-25', 8),
(123, 'Facture électricité', '-72.00', '2023-09-26', 1),
(124, 'Course Carrefour', '-25.00', '2023-09-27', 5),
(125, 'RDV médecin', '-25.00', '2023-09-28', 9),
(126, 'Bar', '-30.00', '2023-10-04', 7),
(127, 'Abonnement Sosh mobile', '-15.00', '2023-10-04', 4),
(128, 'Course Biocoop', '-71.00', '2023-10-11', 5),
(129, 'Essence voiture', '-82.00', '2023-10-12', 8),
(130, 'Restaurant Chinois', '-14.00', '2023-10-13', 7),
(131, 'Abonnement Netflix', '-9.00', '2023-10-13', 4),
(132, 'Reboursement sécurité sociale', '20.00', '2023-10-16', 9),
(133, 'Virement salaire octobre 2023', '1326.00', '2023-10-16', 2),
(134, 'Bar', '-10.00', '2023-10-20', 7),
(135, 'Loyer de octobre 2023', '-432.00', '2023-10-10', 1),
(136, 'Facture électricité', '-78.00', '2023-10-24', 1),
(137, 'Facture eau', '-152.00', '2023-10-24', 1),
(138, 'Course Carrefour', '-57.00', '2023-10-25', 5),
(139, 'RDV médecin', '-25.00', '2023-10-29', 9),
(140, 'Essence voiture', '-83.00', '2023-10-29', 8),
(141, 'Abonnement Sosh mobile', '-15.00', '2023-11-01', 4),
(142, 'Salle de sport', '-69.00', '2023-11-05', 7),
(143, 'Bar', '-17.00', '2023-11-05', 7),
(144, 'Course Biocoop', '-61.00', '2023-11-08', 5),
(145, 'McDo', '-12.00', '2023-11-10', 7),
(146, 'Abonnement Netflix', '-9.00', '2023-11-10', 4),
(147, 'Essence voiture', '-85.00', '2023-11-15', 8),
(148, 'Virement salaire novembre 2023', '1326.00', '2023-11-15', 2),
(149, 'Reboursement sécurité sociale', '20.00', '2023-11-16', 9),
(150, 'Bar', '-15.00', '2023-11-21', 7),
(151, 'Loyer de novembre 2023', '-432.00', '2023-11-10', 1),
(152, 'Course Carrefour', '-25.00', '2023-11-22', NULL),
(153, 'Facture électricité', '-78.00', '2023-11-24', 1),
(154, 'BGK', '-18.00', '2023-11-28', 7),
(155, 'RDV médecin', '-25.00', '2023-11-29', NULL),
(156, 'Essence voiture', '-86.00', '2023-12-02', 8),
(157, 'Abonnement Sosh mobile', '-15.00', '2023-12-02', 4),
(158, 'Course Biocoop', '-71.00', '2023-12-06', 5),
(159, 'Bar', '-32.00', '2023-12-07', 7),
(160, 'Billets de train Paris', '-72.00', '2023-12-10', 6),
(161, 'KFC', '-16.00', '2023-12-11', NULL),
(162, 'Abonnement Netflix', '-13.00', '2023-12-11', 4),
(163, 'Virement salaire décembre 2023', '1326.00', '2023-12-16', 2),
(164, 'Reboursement sécurité sociale', '20.00', '2023-12-17', 9),
(165, 'Essence voiture', '-88.00', '2023-12-19', 8),
(166, 'Course Carrefour', '-57.00', '2023-12-20', 5),
(167, 'Loyer de décembre 2023', '-438.00', '2023-1210', NULL),
(168, 'Bar', '-30.00', '2023-12-23', 7),
(169, 'Facture électricité', '-80.00', '2023-12-24', 1),
(170, 'RDV dentiste', '-60.00', '2023-12-30', 9),
(171, 'Abonnement Sosh mobile', '-15.00', '2024-01-01', 4),
(172, 'Course Carrefour', '-61.00', '2024-01-03', 5),
(173, 'Essence voiture', '-90.00', '2024-01-05', NULL),
(174, 'Bar', '-10.00', '2024-01-08', 7),
(175, 'Abonnement Netflix', '-13.00', '2024-01-10', 4),
(176, 'Virement salaire janvier 2024', '1326.00', '2024-01-15', 2),
(177, 'Reboursement sécurité sociale', '48.00', '2024-01-17', NULL),
(178, 'Course Biocoop', '-57.00', '2024-01-17', 5),
(179, 'Remise de chèque 1136530 Papa', '600.00', '2024-01-18', 3),
(180, 'Loyer de janvier 2024', '-432.00', '2024-01-10', NULL),
(181, 'Essence voiture', '-91.00', '2024-01-22', 8),
(182, 'Bar', '-17.00', '2024-01-24', 7),
(183, 'Facture électricité', '-81.00', '2024-01-24', 1),
(184, 'Facture eau', '-152.00', '2024-01-24', 1),
(185, 'RDV dentiste', '-60.00', '2024-01-30', NULL),
(186, 'Course Carrefour', '-61.00', '2024-01-31', 5),
(187, 'Abonnement Sosh mobile', '-15.00', '2024-02-01', 4),
(188, 'Salle de sport', '-69.00', '2024-02-05', 7),
(189, 'Essence voiture', '-93.00', '2024-02-08', NULL),
(190, 'Bar', '-15.00', '2024-02-09', 7),
(191, 'Abonnement Netflix', '-13.00', '2024-02-10', 4),
(192, 'Course Biocoop', '-137.00', '2024-02-14', 5),
(193, 'Virement salaire février 2024', '1326.00', '2024-02-15', 2),
(194, 'Reboursement sécurité sociale', '48.00', '2024-02-17', 9),
(195, 'Billets de train Lille', '-89.00', '2024-02-17', NULL),
(196, 'Loyer de février 2024', '-432.00', '2024-02-10', 1),
(197, 'Facture électricité', '-83.00', '2024-02-23', 1),
(199, 'Bar', '-32.00', '2024-02-25', NULL),
(201, 'Course Carrefour', '-141.00', '2024-02-28', NULL),
(203, 'Abonnement Sosh mobile', '-15.00', '2024-03-02', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
