-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 14 jan. 2026 à 15:48
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_presence`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

DROP TABLE IF EXISTS `annonces`;
CREATE TABLE IF NOT EXISTS `annonces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datepublication` date NOT NULL,
  `enseignant_id` bigint UNSIGNED DEFAULT NULL,
  `filiere_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `niveau` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `annonces_enseignant_id_foreign` (`enseignant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departements_nom_unique` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Departement Industriel', '2025-12-29 21:22:30', '2025-12-29 21:22:30'),
(2, 'Departement Informatique', '2026-01-14 02:02:03', '2026-01-14 02:02:03');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateupload` date NOT NULL,
  `enseignant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_enseignant_id_foreign` (`enseignant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
CREATE TABLE IF NOT EXISTS `enseignants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `specialite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departement_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enseignants_user_id_foreign` (`user_id`),
  KEY `enseignants_departement_id_foreign` (`departement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `user_id`, `specialite`, `departement_id`, `created_at`, `updated_at`) VALUES
(100, 100, 'Enseignant', 1, '2026-01-14 02:02:03', '2026-01-14 12:51:29'),
(101, 101, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(102, 102, 'Enseignant', 1, '2026-01-14 02:02:03', '2026-01-14 10:40:19'),
(103, 103, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(104, 104, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(105, 105, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(106, 106, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(107, 107, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(108, 108, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(110, 110, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(111, 111, 'Enseignant', 1, '2026-01-14 02:02:03', '2026-01-14 10:40:39'),
(112, 112, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(113, 113, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(114, 114, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(115, 115, 'Enseignant', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `apogee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filiere` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semestre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annee_universitaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2025-2026',
  `user_id` bigint UNSIGNED NOT NULL,
  `filiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etudiants_apogee_unique` (`apogee`),
  KEY `etudiants_user_id_foreign` (`user_id`),
  KEY `etudiants_filiere_id_foreign` (`filiere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `apogee`, `filiere`, `semestre`, `annee_universitaire`, `user_id`, `filiere_id`, `created_at`, `updated_at`) VALUES
(100, 'AP1000', 'CP1', 'S1', '2025-2026', 116, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(101, 'AP1001', 'CP2', 'S3', '2025-2026', 117, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(102, 'AP1002', 'GIIA', 'S5', '2025-2026', 118, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(103, 'AP1003', 'GPMA', 'S1', '2025-2026', 119, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(104, 'AP1004', 'INDUS', 'S3', '2025-2026', 120, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(105, 'AP1005', 'GATE', 'S5', '2025-2026', 121, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(106, 'AP1006', 'GMSI', 'S1', '2025-2026', 122, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(107, 'AP1007', 'GTR', 'S3', '2025-2026', 123, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(108, 'AP1008', 'CP1', 'S5', '2025-2026', 124, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(109, 'AP1009', 'CP2', 'S1', '2025-2026', 125, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(110, 'AP1010', 'GIIA', 'S3', '2025-2026', 126, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(111, 'AP1011', 'GPMA', 'S5', '2025-2026', 127, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(112, 'AP1012', 'INDUS', 'S1', '2025-2026', 128, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(113, 'AP1013', 'GATE', 'S3', '2025-2026', 129, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(114, 'AP1014', 'GMSI', 'S5', '2025-2026', 130, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(115, 'AP1015', 'GTR', 'S1', '2025-2026', 131, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(116, 'AP1016', 'CP1', 'S3', '2025-2026', 132, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(117, 'AP1017', 'CP2', 'S5', '2025-2026', 133, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(118, 'AP1018', 'GIIA', 'S1', '2025-2026', 134, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(119, 'AP1019', 'GPMA', 'S3', '2025-2026', 135, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(120, 'AP1020', 'INDUS', 'S5', '2025-2026', 136, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(121, 'AP1021', 'GATE', 'S1', '2025-2026', 137, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(122, 'AP1022', 'GMSI', 'S3', '2025-2026', 138, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(123, 'AP1023', 'GTR', 'S5', '2025-2026', 139, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(124, 'AP1024', 'CP1', 'S1', '2025-2026', 140, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(125, 'AP1025', 'CP2', 'S3', '2025-2026', 141, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(126, 'AP1026', 'GIIA', 'S5', '2025-2026', 142, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(127, 'AP1027', 'GPMA', 'S1', '2025-2026', 143, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(128, 'AP1028', 'INDUS', 'S3', '2025-2026', 144, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(129, 'AP1029', 'GATE', 'S5', '2025-2026', 145, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(130, 'AP1030', 'GMSI', 'S1', '2025-2026', 146, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(131, 'AP1031', 'GTR', 'S3', '2025-2026', 147, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(132, 'AP1032', 'CP1', 'S5', '2025-2026', 148, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(133, 'AP1033', 'CP2', 'S1', '2025-2026', 149, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(134, 'AP1034', 'GIIA', 'S3', '2025-2026', 150, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(135, 'AP1035', 'GPMA', 'S5', '2025-2026', 151, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(136, 'AP1036', 'INDUS', 'S1', '2025-2026', 152, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(137, 'AP1037', 'GATE', 'S3', '2025-2026', 153, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(138, 'AP1038', 'GMSI', 'S5', '2025-2026', 154, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(139, 'AP1039', 'GTR', 'S1', '2025-2026', 155, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(140, 'AP1040', 'CP1', 'S3', '2025-2026', 156, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(141, 'AP1041', 'CP2', 'S5', '2025-2026', 157, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(142, 'AP1042', 'GIIA', 'S1', '2025-2026', 158, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(143, 'AP1043', 'GPMA', 'S3', '2025-2026', 159, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(144, 'AP1044', 'INDUS', 'S5', '2025-2026', 160, 14, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(145, 'AP1045', 'GATE', 'S1', '2025-2026', 161, 10, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(146, 'AP1046', 'GMSI', 'S3', '2025-2026', 162, 13, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(147, 'AP1047', 'GTR', 'S5', '2025-2026', 163, 15, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(148, 'AP1048', 'CP1', 'S1', '2025-2026', 164, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(149, 'AP1049', 'CP2', 'S3', '2025-2026', 165, 12, '2026-01-14 02:02:04', '2026-01-14 02:02:04');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

DROP TABLE IF EXISTS `filieres`;
CREATE TABLE IF NOT EXISTS `filieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee_universitaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departement_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filieres_departement_id_foreign` (`departement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filieres`
--

INSERT INTO `filieres` (`id`, `nom`, `semester`, `annee_universitaire`, `departement_id`, `created_at`, `updated_at`) VALUES
(10, 'GINF', 'S1', '2025-2026', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(11, 'GINDU', 'S1', '2025-2026', 1, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(12, 'GMSI', 'S1', '2025-2026', 1, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(13, 'GTR', 'S1', '2025-2026', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(14, 'GPMA', 'S1', '2025-2026', 1, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(15, 'GATE', 'S1', '2025-2026', 2, '2026-01-14 02:02:03', '2026-01-14 02:02:03');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_28_142008_etudiant', 1),
(5, '2025_12_28_192352_create_personal_access_tokens_table', 1),
(6, '2025_12_28_204027_add_prenom_and_role_to_users_table', 1),
(7, '2025_12_28_213053_fix_etudiants_table', 1),
(8, '2025_12_28_230955_departement', 2),
(9, '2025_12_28_234827_enseignant', 3),
(10, '2025_12_28_235346_filiers', 4),
(11, '2025_12_28_235744_modules', 5),
(12, '2025_12_29_000233_annonces', 6),
(13, '2025_12_29_000639_documents', 7),
(14, '2025_12_29_003206_etudiant', 8),
(15, '2025_12_29_004243_seance', 9),
(16, '2025_12_29_004710_presence', 10),
(17, '2025_12_29_225003_change_semester_type_in_filieres_table', 11),
(18, '2026_01_14_030000_add_filiere_niveau_to_annonces_table', 12),
(19, '2026_01_14_031000_add_filiere_semestre_annee_to_etudiants_table', 13),
(20, '2026_01_14_032000_fill_etudiants_filiere_semestre', 14);

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enseignant_id` bigint UNSIGNED NOT NULL,
  `filiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modules_enseignant_id_foreign` (`enseignant_id`),
  KEY `modules_filiere_id_foreign` (`filiere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `nom`, `enseignant_id`, `filiere_id`, `created_at`, `updated_at`) VALUES
(100, 'DEVELOPPEMENT BACKEND EN JS', 110, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(101, 'MARKETING ET DEVELOPPEMENT DURABLE', 102, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(102, 'ANALYSE DES DONNEES', 101, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(103, 'BASES DE DONNEES AVANCEES', 111, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(104, 'METHODES HEURISTIQUES ET META-HEURISTIQUES', 101, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(105, 'DEVELOPPEMENT WEB DYNAMIQUE', 114, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(106, 'PROGRAMMATION JAVA AVANCEE', 114, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(107, 'FRANCAIS 3', 100, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(108, 'ANGLAIS 3', 105, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(109, 'PROJETS TUTORES', 112, 10, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(110, 'Intelligence artificielle et ses applications', 108, 11, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(111, 'Statistique décisionnelle', 113, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(112, 'Production et Stockage de l\'Energie', 104, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(113, 'Maintenance 4.0', 115, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(114, 'Langues etrangeres (anglais)', 103, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(116, 'Management de projet et de l\'innovation', 106, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(117, 'Langue française', 107, 11, '2026-01-14 02:02:04', '2026-01-14 02:02:04');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 112, 'auth_token', 'd1075c487aba79a47c53c6758f0b7c76af304befc38e73878e02d20c36763fa9', '[\"*\"]', NULL, NULL, '2026-01-14 01:06:41', '2026-01-14 01:06:41'),
(2, 'App\\Models\\User', 120, 'auth_token', '06293e4e41561d2e6eed6fd9c300731b488268125015599f69ac21fc9e10e3bc', '[\"*\"]', NULL, NULL, '2026-01-14 01:07:45', '2026-01-14 01:07:45'),
(3, 'App\\Models\\User', 300, 'auth_token', '1df6d64d9415643094193df499991f9b6a4bd95920d19d0475c03de226c97397', '[\"*\"]', '2026-01-14 01:22:08', NULL, '2026-01-14 01:16:50', '2026-01-14 01:22:08'),
(4, 'App\\Models\\User', 300, 'auth_token', '71594d15509594b5b26ec2acfec1cb21a942f554fbbb6070ba5f0f2e486151ab', '[\"*\"]', '2026-01-14 01:56:51', NULL, '2026-01-14 01:29:12', '2026-01-14 01:56:51'),
(5, 'App\\Models\\User', 300, 'auth_token', '38790efa22dfc68d0a96db3c7acc9d7d97f2e6a718b19b5d0bef15b1eefc1f71', '[\"*\"]', '2026-01-14 13:43:20', NULL, '2026-01-14 10:36:29', '2026-01-14 13:43:20'),
(6, 'App\\Models\\User', 102, 'auth_token', 'f874364d7fb9e214ef7632889fee36cc807f70773bf22626a314ae7f1cb3b156', '[\"*\"]', NULL, NULL, '2026-01-14 13:50:51', '2026-01-14 13:50:51'),
(7, 'App\\Models\\User', 102, 'auth_token', 'd7d61b5a0735d2a3797bffcb291b6bbefa9888ddcc86dbbf95740534292c2917', '[\"*\"]', '2026-01-14 14:13:52', NULL, '2026-01-14 14:09:38', '2026-01-14 14:13:52'),
(8, 'App\\Models\\User', 102, 'auth_token', 'da037a9ce8bbdb139b16f3f02f4e0e1f91111c2dc7e1dab6d1270ae4e0f685ba', '[\"*\"]', '2026-01-14 14:21:22', NULL, '2026-01-14 14:17:33', '2026-01-14 14:21:22'),
(9, 'App\\Models\\User', 102, 'auth_token', '35cf378acef38f78d1251e1c533411ed7b376d3dac229ae5d4288518745969bd', '[\"*\"]', '2026-01-14 14:26:51', NULL, '2026-01-14 14:21:27', '2026-01-14 14:26:51'),
(10, 'App\\Models\\User', 112, 'auth_token', '34fcecb59fde0a7ae72aa8987ace3f74edf26b726b1c5f0552628bd258896621', '[\"*\"]', '2026-01-14 14:27:46', NULL, '2026-01-14 14:27:06', '2026-01-14 14:27:46'),
(11, 'App\\Models\\User', 108, 'auth_token', '76faf40d5b26fbb450f1aa8ca22af187d4b824d5808c32b6f5a1aa0da22e7314', '[\"*\"]', '2026-01-14 14:44:59', NULL, '2026-01-14 14:28:36', '2026-01-14 14:44:59');

-- --------------------------------------------------------

--
-- Structure de la table `presences`
--

DROP TABLE IF EXISTS `presences`;
CREATE TABLE IF NOT EXISTS `presences` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  `horaire` datetime NOT NULL,
  `etudiant_id` bigint UNSIGNED NOT NULL,
  `seance_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presences_etudiant_id_seance_id_unique` (`etudiant_id`,`seance_id`),
  KEY `presences_seance_id_foreign` (`seance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seances`
--

DROP TABLE IF EXISTS `seances`;
CREATE TABLE IF NOT EXISTS `seances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `code_qr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seances_code_qr_unique` (`code_qr`),
  KEY `seances_module_id_foreign` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('etudiant','enseignant','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `prenom`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'haloma', 'halima', 'halima@gmail.com', NULL, '$2y$12$VgMGRajjw9CNwbNs815WG.whQPKH2gwBGoeXZ1YbUDkO31rRm7TCC', 'etudiant', NULL, '2025-12-29 22:15:58', '2025-12-29 22:19:06'),
(9, 'haloma', 'halima', 'halimia@gmail.com', NULL, '$2y$12$vN13ROLkQbczGB/T.nNDkedpyG102l9gGtLRL3L9MFkwTflQ86qZ2', 'etudiant', NULL, '2025-12-29 23:28:56', '2025-12-29 23:28:56'),
(100, 'OUMASSOU', 'Mme.', 'mme..oumassou@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(101, 'JRAIFI', 'M.', 'm..jraifi@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(102, 'EL ALAOUI', 'Mme.', 'mme..elalaoui@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(103, 'EL ATRI', 'Mme', 'mme.elatri@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(104, 'KRIRAA', 'M.', 'm..kriraa@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(105, 'ECHCHADILI', 'M.', 'm..echchadili@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(106, 'EMRANI', 'Mme', 'mme.emrani@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(107, 'EL ATTARI', 'M.', 'm..elattari@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(108, 'MESLOHI', 'M.', 'm..meslohi@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(110, 'BENTAJER', 'M.', 'm..bentajer@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(111, 'EZZAHAR', 'M.', 'm..ezzahar@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(112, 'MADIAFI', 'M.', 'm..madiafi@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(113, 'ABIDI', 'M.', 'm..abidi@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(114, 'OUJAOURA', 'M.', 'm..oujaoura@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(115, 'BENHAMMOU', 'M.', 'm..benhammou@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'enseignant', NULL, '2026-01-14 02:02:03', '2026-01-14 02:02:03'),
(116, 'Nom0', 'Etudiant0', 'student0@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(117, 'Nom1', 'Etudiant1', 'student1@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(118, 'Nom2', 'Etudiant2', 'student2@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(119, 'Nom3', 'Etudiant3', 'student3@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(120, 'Nom4', 'Etudiant4', 'student4@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(121, 'Nom5', 'Etudiant5', 'student5@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(122, 'Nom6', 'Etudiant6', 'student6@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(123, 'Nom7', 'Etudiant7', 'student7@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(124, 'Nom8', 'Etudiant8', 'student8@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(125, 'Nom9', 'Etudiant9', 'student9@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(126, 'Nom10', 'Etudiant10', 'student10@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(127, 'Nom11', 'Etudiant11', 'student11@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(128, 'Nom12', 'Etudiant12', 'student12@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(129, 'Nom13', 'Etudiant13', 'student13@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(130, 'Nom14', 'Etudiant14', 'student14@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(131, 'Nom15', 'Etudiant15', 'student15@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(132, 'Nom16', 'Etudiant16', 'student16@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(133, 'Nom17', 'Etudiant17', 'student17@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(134, 'Nom18', 'Etudiant18', 'student18@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(135, 'Nom19', 'Etudiant19', 'student19@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(136, 'Nom20', 'Etudiant20', 'student20@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(137, 'Nom21', 'Etudiant21', 'student21@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(138, 'Nom22', 'Etudiant22', 'student22@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(139, 'Nom23', 'Etudiant23', 'student23@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(140, 'Nom24', 'Etudiant24', 'student24@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(141, 'Nom25', 'Etudiant25', 'student25@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(142, 'Nom26', 'Etudiant26', 'student26@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(143, 'Nom27', 'Etudiant27', 'student27@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(144, 'Nom28', 'Etudiant28', 'student28@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(145, 'Nom29', 'Etudiant29', 'student29@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(146, 'Nom30', 'Etudiant30', 'student30@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(147, 'Nom31', 'Etudiant31', 'student31@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(148, 'Nom32', 'Etudiant32', 'student32@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(149, 'Nom33', 'Etudiant33', 'student33@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(150, 'Nom34', 'Etudiant34', 'student34@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(151, 'Nom35', 'Etudiant35', 'student35@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(152, 'Nom36', 'Etudiant36', 'student36@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(153, 'Nom37', 'Etudiant37', 'student37@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(154, 'Nom38', 'Etudiant38', 'student38@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(155, 'Nom39', 'Etudiant39', 'student39@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(156, 'Nom40', 'Etudiant40', 'student40@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(157, 'Nom41', 'Etudiant41', 'student41@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(158, 'Nom42', 'Etudiant42', 'student42@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(159, 'Nom43', 'Etudiant43', 'student43@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(160, 'Nom44', 'Etudiant44', 'student44@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(161, 'Nom45', 'Etudiant45', 'student45@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(162, 'Nom46', 'Etudiant46', 'student46@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(163, 'Nom47', 'Etudiant47', 'student47@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(164, 'Nom48', 'Etudiant48', 'student48@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(165, 'Nom49', 'Etudiant49', 'student49@ensas.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'etudiant', NULL, '2026-01-14 02:02:04', '2026-01-14 02:02:04'),
(300, 'admin', '1', 'admin@uca.ac.ma', NULL, '$2y$12$x/q8954xk5zCUBJYnAhdP.mWaOHNXsnWRAomXZDcyo00zmshdmHJe', 'admin', NULL, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enseignants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_filiere_id_foreign` FOREIGN KEY (`filiere_id`) REFERENCES `filieres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD CONSTRAINT `filieres_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `modules_filiere_id_foreign` FOREIGN KEY (`filiere_id`) REFERENCES `filieres` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presences_seance_id_foreign` FOREIGN KEY (`seance_id`) REFERENCES `seances` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
