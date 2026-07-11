-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 11, 2026 alle 14:17
-- Versione del server: 8.0.42
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hamburgeria`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `allergens`
--

CREATE TABLE `allergens` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `allergens`
--

INSERT INTO `allergens` (`id`, `name`, `description`) VALUES
(1, 'Glutine', 'Cereali contenenti glutine'),
(2, 'Latte', 'Latte e derivati'),
(3, 'Uova', 'Uova e prodotti a base di uova'),
(4, 'Soia', 'Soia e derivati'),
(5, 'Senape', 'Senape e derivati'),
(6, 'Sesamo', 'Semi di sesamo'),
(7, 'Frutta a Guscio', 'Mandorle, nocciole, noci ecc'),
(8, 'Arachidi', 'Arachidi e derivati');

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Burger Classici', 'burger-classici', 'I grandi classici della tradizione americana', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(2, 'Special Burger', 'special-burger', 'Ricette gourmet e stagionali', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(3, 'Vegetariani', 'vegetariani', 'Burger senza carne', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(4, 'Vegani', 'vegani', 'Proposte 100% vegetali', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(5, 'Gluten Free', 'gluten-free', 'Burger senza glutine', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(6, 'Menù Completi', 'menu-completi', 'Burger + patatine + bibita', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(7, 'Limited Edition', 'limited-edition', 'Edizioni limitate e speciali', 1, '2026-02-11 08:40:37', '2026-02-11 08:40:37'),
(11, 'nome 99', 'cat-99', NULL, 0, NULL, NULL),
(12, 'nome 99', 'cat-99', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `dietary_preferences`
--

CREATE TABLE `dietary_preferences` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `dietary_preferences`
--

INSERT INTO `dietary_preferences` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Vegetariano', 'vegetariano', 'Non contiene carne o pesce'),
(2, 'Vegano', 'vegano', 'Non contiene ingredienti di origine animale'),
(3, 'Gluten Free', 'gluten-free', 'Senza glutine'),
(4, 'Lactose Free', 'lactose-free', 'Senza lattosio'),
(5, 'Halal', 'halal', 'Carne certificata Halal'),
(6, 'Keto', 'keto', 'Basso contenuto di carboidrati'),
(7, 'High Protein', 'high-protein', 'Alto contenuto proteico');

-- --------------------------------------------------------

--
-- Struttura della tabella `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `description`, `is_active`) VALUES
(1, 'Pane Brioche', 'Pane morbido con burro e uova', 1),
(2, 'Pane Senza Glutine', 'Pane certificato gluten free', 1),
(3, 'Hamburger Manzo 150gr', 'Carne bovina 100% italiana', 1),
(4, 'Hamburger Manzo 250gr', 'Carne bovina 100% italiana', 1),
(5, 'Burger Vegetale', 'Burger a base di proteine vegetali', 1),
(6, 'Cheddar', 'Formaggio cheddar fuso', 1),
(7, 'Bacon', 'Pancetta croccante', 1),
(8, 'Insalata', 'Lattuga fresca', 1),
(9, 'Pomodoro', 'Pomodoro fresco a fette', 1),
(10, 'Cipolla', 'Cipolla fresca', 1),
(11, 'Cipolla Caramellata', 'Cipolla stufata con zucchero di canna', 1),
(12, 'Salsa BBQ', 'Salsa barbecue affumicata', 1),
(13, 'Maionese', 'Maionese classica', 1),
(14, 'Ketchup', 'Salsa ketchup', 1),
(15, 'Senape', 'Senape delicata', 1),
(16, 'Jalapeños', 'Peperoncini piccanti messicani', 1),
(17, 'Uovo', 'Uovo fresco alla piastra', 1),
(18, 'Avocado', 'Fette di avocado fresco', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ingredient_allergen`
--

CREATE TABLE `ingredient_allergen` (
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `allergen_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `ingredient_allergen`
--

INSERT INTO `ingredient_allergen` (`ingredient_id`, `allergen_id`) VALUES
(1, 1),
(1, 3),
(5, 4),
(6, 2),
(15, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `log_data`
--

CREATE TABLE `log_data` (
  `created_at` timestamp NULL DEFAULT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `log_data`
--

INSERT INTO `log_data` (`created_at`, `id`) VALUES
('2026-03-22 14:34:53', 0),
('2026-06-13 15:38:15', 0),
('2026-06-13 15:41:13', 0),
('2026-06-15 07:58:11', 0),
('2026-06-15 07:59:04', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
(1, 1776627040822, 'Init1776627040822'),
(2, 1776627117511, 'Init1776627117511');

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `base_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_price` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `base_price`, `sku`, `is_active`, `created_at`, `updated_at`, `sale_price`) VALUES
(1, 'Classico Italiano', 'classico-italiano', 'Hamburger tradizionale con cheddar e salsa burger', 8.90, 'BUR001', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(2, 'Doppio BBQ', 'doppio-bbq', 'Doppio hamburger con bacon croccante e salsa BBQ', 11.90, 'BUR002', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(3, 'Esplosione di Formaggi', 'esplosione-formaggi', 'Triplo formaggio filante', 10.50, 'BUR003', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(4, 'Messicano Piccante', 'messicano-piccante', 'Jalapeños e salsa piccante', 9.90, 'BUR004', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(5, 'Gourmet Tricolore', 'gourmet-tricolore', 'Mozzarella, pomodoro e rucola', 10.90, 'BUR005', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(6, 'Vegetariano Verde', 'vegetariano-verde', 'Burger vegetale con avocado', 9.50, 'BUR006', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(7, 'Vegano Mediterraneo', 'vegano-mediterraneo', 'Burger vegano con verdure grigliate', 9.90, 'BUR007', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(8, 'Amante del Bacon', 'amante-del-bacon', 'Extra bacon croccante', 11.50, 'BUR008', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(9, 'Affumicato Americano', 'affumicato-americano', 'Salsa BBQ affumicata', 10.90, 'BUR009', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(10, 'Tradizionale Americano', 'tradizionale-americano', 'Pane brioche e manzo 100%', 8.50, 'BUR010', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(11, 'Croccante di Pollo', 'croccante-di-pollo', 'Petto di pollo panato e croccante', 8.90, 'BUR011', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(12, 'Diavolo Rosso', 'diavolo-rosso', 'Piccantezza estrema', 10.90, 'BUR012', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(13, 'Keto Protein', 'keto-protein', 'Senza pane, low carb', 9.90, 'BUR013', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(14, 'Senza Glutine Speciale', 'senza-glutine-speciale', 'Pane certificato gluten free', 10.90, 'BUR014', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(15, 'Smash Halal', 'smash-halal', 'Carne certificata Halal', 9.90, 'BUR015', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(16, 'Avocado Deluxe', 'avocado-deluxe', 'Avocado fresco e cheddar premium', 11.90, 'BUR016', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(17, 'Torre Tripla', 'torre-tripla', 'Tre hamburger e triplo formaggio', 14.90, 'BUR017', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(18, 'Street BBQ', 'street-bbq', 'Stile street food affumicato', 9.90, 'BUR018', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(19, 'Fit Proteico', 'fit-proteico', 'Hamburger leggero e proteico', 9.50, 'BUR019', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(20, 'Black Edition Limitata', 'black-edition-limitata', 'Pane nero al carbone', 12.90, 'BUR020', 1, '2026-02-11 08:45:19', '2026-02-11 08:45:19', 0.00),
(21, 'Double Cheese with Chili', 'double-cheese-with-chili', 'Hamburger piccante con formaggio', 13.20, 'BUR21', 1, NULL, NULL, 0.00),
(22, 'aaaa', 'ddd', 'adada', 1.00, NULL, 1, NULL, NULL, 0.00),
(23, 'vvv b da canc123', 'myprod', 'desc', 13.20, NULL, 1, NULL, NULL, 0.00),
(24, 'vvv b da canc123', 'myprod', 'desc', 13.20, NULL, 1, NULL, NULL, 0.00),
(25, 'vvv b da canc123', 'myprod', 'desc', 13.20, NULL, 1, NULL, NULL, 0.00),
(26, 'vvv b da canc123', 'myprod', 'desc', 13.20, NULL, 1, NULL, NULL, 0.00);

--
-- Trigger `products`
--
DELIMITER $$
CREATE TRIGGER `before_insert_prodotti` BEFORE INSERT ON `products` FOR EACH ROW begin
	insert into log_data (created_at,id) values(now(),new.id);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `product_category`
--

CREATE TABLE `product_category` (
  `product_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 3),
(7, 1),
(7, 4),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(14, 5),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(20, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `product_dietary_preference`
--

CREATE TABLE `product_dietary_preference` (
  `product_id` bigint UNSIGNED NOT NULL,
  `dietary_preference_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `product_dietary_preference`
--

INSERT INTO `product_dietary_preference` (`product_id`, `dietary_preference_id`) VALUES
(6, 1),
(7, 1),
(7, 2),
(13, 6),
(14, 3),
(15, 5),
(19, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `alt_text`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'images/burgers/classico-italiano.jpg', 'Classico Italiano', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(2, 2, 'images/burgers/doppio-bbq.jpg', 'Doppio BBQ', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(3, 3, 'images/burgers/esplosione-formaggi.jpg', 'Esplosione di Formaggi', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(4, 4, 'images/burgers/messicano-piccante.jpg', 'Messicano Piccante', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(5, 5, 'images/burgers/gourmet-tricolore.jpg', 'Gourmet Tricolore', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(6, 6, 'images/burgers/vegetariano-verde.jpg', 'Vegetariano Verde', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(7, 7, 'images/burgers/vegano-mediterraneo.jpg', 'Vegano Mediterraneo', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(8, 8, 'images/burgers/amante-del-bacon.jpg', 'Amante del Bacon', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(9, 9, 'images/burgers/affumicato-americano.jpg', 'Affumicato Americano', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(10, 10, 'images/burgers/tradizionale-americano.jpg', 'Tradizionale Americano', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(11, 11, 'images/burgers/croccante-di-pollo.jpg', 'Croccante di Pollo', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(12, 12, 'images/burgers/diavolo-rosso.jpg', 'Diavolo Rosso', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(13, 13, 'images/burgers/keto-protein.jpg', 'Keto Protein', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(14, 14, 'images/burgers/senza-glutine-speciale.jpg', 'Senza Glutine Speciale', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(15, 15, 'images/burgers/smash-halal.jpg', 'Smash Halal', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(16, 16, 'images/burgers/avocado-deluxe.jpg', 'Avocado Deluxe', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(17, 17, 'images/burgers/torre-tripla.jpg', 'Torre Tripla', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(18, 18, 'images/burgers/street-bbq.jpg', 'Street BBQ', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(19, 19, 'images/burgers/fit-proteico.jpg', 'Fit Proteico', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12'),
(20, 20, 'images/burgers/black-edition-limitata.jpg', 'Black Edition Limitata', 1, '2026-02-11 08:59:12', '2026-02-11 08:59:12');

-- --------------------------------------------------------

--
-- Struttura della tabella `product_ingredient`
--

CREATE TABLE `product_ingredient` (
  `product_id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `is_optional` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `product_ingredient`
--

INSERT INTO `product_ingredient` (`product_id`, `ingredient_id`, `is_optional`) VALUES
(1, 1, 0),
(1, 3, 0),
(1, 6, 0),
(1, 8, 0),
(1, 9, 0),
(2, 1, 0),
(2, 3, 0),
(2, 6, 0),
(2, 8, 0),
(2, 9, 0),
(3, 1, 0),
(3, 3, 0),
(3, 6, 0),
(3, 8, 0),
(3, 9, 0),
(4, 1, 0),
(4, 3, 0),
(4, 6, 0),
(4, 8, 0),
(4, 9, 0),
(4, 12, 0),
(4, 16, 0),
(5, 1, 0),
(5, 3, 0),
(5, 6, 0),
(5, 8, 0),
(5, 9, 0),
(6, 1, 0),
(6, 5, 0),
(6, 8, 0),
(6, 9, 0),
(6, 18, 0),
(7, 5, 0),
(7, 8, 0),
(7, 9, 0),
(8, 1, 0),
(8, 3, 0),
(8, 6, 0),
(8, 7, 0),
(8, 8, 0),
(8, 9, 0),
(9, 1, 0),
(9, 3, 0),
(9, 6, 0),
(9, 8, 0),
(9, 9, 0),
(10, 1, 0),
(10, 3, 0),
(10, 6, 0),
(10, 8, 0),
(10, 9, 0),
(11, 1, 0),
(11, 3, 0),
(11, 6, 0),
(11, 8, 0),
(11, 9, 0),
(12, 1, 0),
(12, 3, 0),
(12, 6, 0),
(12, 8, 0),
(12, 9, 0),
(13, 1, 0),
(13, 3, 0),
(13, 6, 0),
(13, 8, 0),
(13, 9, 0),
(14, 2, 0),
(14, 3, 0),
(14, 6, 0),
(14, 8, 0),
(14, 9, 0),
(15, 1, 0),
(15, 3, 0),
(15, 6, 0),
(15, 8, 0),
(15, 9, 0),
(16, 1, 0),
(16, 3, 0),
(16, 6, 0),
(16, 8, 0),
(16, 9, 0),
(17, 1, 0),
(17, 3, 0),
(17, 6, 0),
(17, 8, 0),
(17, 9, 0),
(18, 1, 0),
(18, 3, 0),
(18, 6, 0),
(18, 8, 0),
(18, 9, 0),
(19, 1, 0),
(19, 3, 0),
(19, 6, 0),
(19, 8, 0),
(19, 9, 0),
(20, 1, 0),
(20, 3, 0),
(20, 6, 0),
(20, 8, 0),
(20, 9, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `product_variant`
--

CREATE TABLE `product_variant` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `weight_grams` int DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `sku`, `price`, `weight_grams`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'BUR001-150', 8.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(2, 2, 'BUR002-150', 11.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(3, 3, 'BUR003-150', 10.50, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(4, 4, 'BUR004-150', 9.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(5, 5, 'BUR005-150', 10.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(6, 8, 'BUR008-150', 11.50, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(7, 9, 'BUR009-150', 10.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(8, 10, 'BUR010-150', 8.50, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(9, 11, 'BUR011-150', 8.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(10, 12, 'BUR012-150', 10.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(11, 13, 'BUR013-150', 9.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(12, 14, 'BUR014-150', 10.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(13, 15, 'BUR015-150', 9.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(14, 16, 'BUR016-150', 11.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(15, 18, 'BUR018-150', 9.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(16, 19, 'BUR019-150', 9.50, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(17, 20, 'BUR020-150', 12.90, 150, 1, 1, '2026-02-11 08:46:06', '2026-02-11 08:46:06'),
(32, 1, 'BUR001-250', 11.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(33, 2, 'BUR002-250', 14.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(34, 3, 'BUR003-250', 13.50, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(35, 4, 'BUR004-250', 12.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(36, 5, 'BUR005-250', 13.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(37, 8, 'BUR008-250', 14.50, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(38, 9, 'BUR009-250', 13.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(39, 10, 'BUR010-250', 11.50, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(40, 11, 'BUR011-250', 11.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(41, 12, 'BUR012-250', 13.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(42, 13, 'BUR013-250', 12.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(43, 14, 'BUR014-250', 13.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(44, 15, 'BUR015-250', 12.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(45, 16, 'BUR016-250', 14.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(46, 18, 'BUR018-250', 12.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(47, 19, 'BUR019-250', 12.50, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(48, 20, 'BUR020-250', 15.90, 250, 0, 1, '2026-02-11 08:46:09', '2026-02-11 08:46:09'),
(63, 6, 'BUR006-150', 9.50, 150, 1, 1, '2026-02-11 08:46:14', '2026-02-11 08:46:14'),
(64, 7, 'BUR007-150', 9.90, 150, 1, 1, '2026-02-11 08:46:14', '2026-02-11 08:46:14'),
(66, 17, 'BUR017-350', 16.90, 350, 1, 1, '2026-02-11 08:46:19', '2026-02-11 08:46:19');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `refresh_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2a$12$OrlLfbDmP0V4XSHuXWq4Ru/D026D00r2uQLs0x3hyySQVo6O4vqQq', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE3ODE5Njg2NTYsImV4cCI6MTc4MjU3MzQ1Nn0.5eTPmbFaDtJOgTs7J2kFR6meDo0UtFjppQkoqX1_S9w', '2026-06-20 14:55:04', '2026-06-30 08:07:11');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `v_check_gluten_free_errors`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `v_check_gluten_free_errors` (
`id` bigint unsigned
,`ingredienti_con_glutine` text
,`name` varchar(150)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `v_check_vegan_errors`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `v_check_vegan_errors` (
`allergeni_animali_trovati` text
,`id` bigint unsigned
,`name` varchar(150)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `v_products_full_allergens`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `v_products_full_allergens` (
`allergeni` text
,`id` bigint unsigned
,`name` varchar(150)
);

-- --------------------------------------------------------

--
-- Struttura per vista `v_check_gluten_free_errors`
--
DROP TABLE IF EXISTS `v_check_gluten_free_errors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_check_gluten_free_errors`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `name`, group_concat(distinct `i`.`name` separator ',') AS `ingredienti_con_glutine` FROM ((((`products` `p` join `product_dietary_preference` `pdp` on((`p`.`id` = `pdp`.`product_id`))) join `product_ingredient` `pi` on((`p`.`id` = `pi`.`product_id`))) join `ingredient_allergen` `ia` on((`pi`.`ingredient_id` = `ia`.`ingredient_id`))) join `ingredients` `i` on((`pi`.`ingredient_id` = `i`.`id`))) WHERE ((`pdp`.`dietary_preference_id` = 3) AND (`ia`.`allergen_id` = 1)) GROUP BY `p`.`id` ;

-- --------------------------------------------------------

--
-- Struttura per vista `v_check_vegan_errors`
--
DROP TABLE IF EXISTS `v_check_vegan_errors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_check_vegan_errors`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `name`, group_concat(distinct `a`.`name` separator ',') AS `allergeni_animali_trovati` FROM ((((`products` `p` join `product_dietary_preference` `pdp` on((`p`.`id` = `pdp`.`product_id`))) join `product_ingredient` `pi` on((`p`.`id` = `pi`.`product_id`))) join `ingredient_allergen` `ia` on((`pi`.`ingredient_id` = `ia`.`ingredient_id`))) join `allergens` `a` on((`ia`.`allergen_id` = `a`.`id`))) WHERE ((`pdp`.`dietary_preference_id` = 2) AND (`ia`.`allergen_id` in (2,3))) GROUP BY `p`.`id` ;

-- --------------------------------------------------------

--
-- Struttura per vista `v_products_full_allergens`
--
DROP TABLE IF EXISTS `v_products_full_allergens`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_products_full_allergens`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `name`, group_concat(distinct `a`.`name` order by `a`.`name` ASC separator ', ') AS `allergeni` FROM (((`products` `p` left join `product_ingredient` `pi` on((`p`.`id` = `pi`.`product_id`))) left join `ingredient_allergen` `ia` on((`pi`.`ingredient_id` = `ia`.`ingredient_id`))) left join `allergens` `a` on((`ia`.`allergen_id` = `a`.`id`))) GROUP BY `p`.`id` ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `allergens`
--
ALTER TABLE `allergens`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dietary_preferences`
--
ALTER TABLE `dietary_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ingredient_allergen`
--
ALTER TABLE `ingredient_allergen`
  ADD PRIMARY KEY (`ingredient_id`,`allergen_id`),
  ADD KEY `idx_ia_allergen` (`allergen_id`,`ingredient_id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `IDX_0374879a971928bc3f57eed0a5` (`product_id`),
  ADD KEY `IDX_2df1f83329c00e6eadde0493e1` (`category_id`);

--
-- Indici per le tabelle `product_dietary_preference`
--
ALTER TABLE `product_dietary_preference`
  ADD PRIMARY KEY (`product_id`,`dietary_preference_id`),
  ADD KEY `IDX_043d1a8d8e3233b578b4a63403` (`product_id`),
  ADD KEY `IDX_274785229ffda89b13a7bc0955` (`dietary_preference_id`);

--
-- Indici per le tabelle `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_images_product` (`product_id`);

--
-- Indici per le tabelle `product_ingredient`
--
ALTER TABLE `product_ingredient`
  ADD PRIMARY KEY (`product_id`,`ingredient_id`),
  ADD KEY `FK_3f9b3e7181dc8cd771e6d513b7b` (`ingredient_id`);

--
-- Indici per le tabelle `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `idx_variants_product` (`product_id`),
  ADD KEY `idx_variants_price` (`price`),
  ADD KEY `idx_variants_active` (`is_active`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `allergens`
--
ALTER TABLE `allergens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `dietary_preferences`
--
ALTER TABLE `dietary_preferences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ingredient_allergen`
--
ALTER TABLE `ingredient_allergen`
  ADD CONSTRAINT `ingredient_allergen_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingredient_allergen_ibfk_2` FOREIGN KEY (`allergen_id`) REFERENCES `allergens` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `FK_0374879a971928bc3f57eed0a59` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2df1f83329c00e6eadde0493e16` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Limiti per la tabella `product_dietary_preference`
--
ALTER TABLE `product_dietary_preference`
  ADD CONSTRAINT `FK_043d1a8d8e3233b578b4a634034` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_274785229ffda89b13a7bc0955c` FOREIGN KEY (`dietary_preference_id`) REFERENCES `dietary_preferences` (`id`);

--
-- Limiti per la tabella `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_image_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `product_ingredient`
--
ALTER TABLE `product_ingredient`
  ADD CONSTRAINT `FK_3f9b3e7181dc8cd771e6d513b7b` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `FK_a7a4b2de441d2ab00df5b0d4cdd` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limiti per la tabella `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `fk_variant_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
