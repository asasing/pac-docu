-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2018 at 03:37 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pac`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'manager1', 'manager1@mail.com', 'asdas', NULL, NULL, NULL),
(2, 'admin', 'admin@gmail.com', '$2y$10$L/Jgr/TofVbY7oGM53TCTuShtkYt5YMyODJ3Tz7tJ0xAYClXIR4CK', 't9xVOEcYl58kOBjqgWdb2Cn7HQsbYtk4HPbmC1WatQUC4TiJGymbubDIOKel', '2018-01-04 10:54:37', '2018-01-04 10:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` int(11) NOT NULL,
  `notification_title` text NOT NULL,
  `notification_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `client` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `num_guest` int(11) DEFAULT NULL,
  `payment` float NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `status` enum('pending.paid','cancelled','done','pending.unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending.unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `client`, `package_id`, `num_guest`, `payment`, `schedule_id`, `status`, `created_at`, `updated_at`) VALUES
(14, 43, 63, 1, 2500, 45, 'cancelled', '2018-01-09 15:00:31', '2018-01-09 16:28:49'),
(15, 43, 62, 1, 6000, 42, 'cancelled', '2018-01-09 15:49:47', '2018-01-09 15:49:47'),
(16, 43, 66, 4, 12800, 46, 'cancelled', '2018-01-09 16:07:54', '2018-01-09 16:30:14'),
(17, 43, 66, 1, 3200, 46, 'cancelled', '2018-01-09 16:08:27', '2018-01-09 16:29:24'),
(18, 43, 66, 5, 16000, 46, 'cancelled', '2018-01-09 16:08:40', '2018-01-09 16:29:39'),
(19, 43, 66, 5, 16000, 46, 'pending.unpaid', '2018-01-09 16:38:35', '2018-01-09 16:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

CREATE TABLE `crews` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `profile_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` enum('manager','','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manager'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 2),
(8, '2017_12_01_111435_packages', 3),
(9, '2017_12_06_151044_bookings_table', 4),
(10, '2017_12_09_090912_create_comments_table', 5),
(11, '2017_12_09_091429_create_managers_table', 6),
(12, '2017_12_21_112533_create_images_table', 7),
(13, '2017_12_21_180613_package_inclusions_table', 8),
(14, '2017_12_21_194447_create_package_videos_table', 9),
(15, '2017_12_30_184749_add_deleteattable', 10),
(16, '2017_12_31_031721_usermessagestable', 11),
(17, '2018_01_04_175452_create_admins_table', 11),
(18, '2018_01_04_175453_create_admin_password_resets_table', 11),
(19, '2018_01_04_195154_create_adventurers_table', 12),
(20, '2018_01_04_195155_create_adventurer_password_resets_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `difficulty` enum('easy','medium','hard','hardcore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itinerary` text COLLATE utf8mb4_unicode_ci,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adventure_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adventurer_limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `location`, `longitude`, `latitude`, `difficulty`, `price`, `description`, `thumb_img`, `itinerary`, `duration`, `adventure_type`, `adventurer_limit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(57, 'Osmena Peak Trekking', 'Dalaguete, Osmena Peak, Cebu', 2342.512, 213.12, 'easy', 3333, 'This will be fun as fuck u guys', 'bg_1514654042.jpg', '', '', '', 0, '2017-12-25 06:10:20', '2017-12-30 10:59:54', '2017-12-30 10:59:54'),
(59, 'qwewqe', 'qwewqe', 123.9174, 10.3671, 'medium', 123123, 'qweqwewq', 'falls_1514657679.jpg', '', '', '', 0, '2017-12-30 10:14:39', '2017-12-30 15:11:38', '2017-12-30 15:11:38'),
(62, 'Oslob Whale Shark Watching', 'Oslob, Cebu', 123.41592630000002, 9.563039500000002, 'easy', 6000, '<p>Get up close with the world&rsquo;s largest fish the whale sharks, the gentle giants in Oslob Cebu Philippines. Swimming with a whale shark is a unique wildlife interaction that will last forever. Whale shark watching is one of the most popular Cebu tour package we offer along with Sumilon island day tour package that maximize your time enjoying Oslob&rsquo;s top tourist spots.</p>', 'Whale-Shark-flipped-1500x1000_1514664496.jpg', '', '12 hours', 'Whale Watching', 12, '2017-12-30 11:17:39', '2017-12-30 14:57:19', NULL),
(63, 'Kawasan Falls Day Tour', 'Badian, 6031 Cebu', 123.37420539999994, 9.8021336, 'easy', 2500, '<p>Kawasan Falls in Badian, Cebu<br />\nkawasan falls Cebu is a peaceful natural place where you can enjoy many waterfalls of natural spring water located near the southern tip of Cebu Philippines..<br />\nA gentle hush of rushing ice cool water.. All this and more in Badian&rsquo;s Kawasan Falls!</p>', 'IMG_3688-1_1514670322.jpg', '<ul>\n	<li>5:00 AM &ndash; Pick up Hotel</li>\n	<li>8:00 AM &ndash; Arrival in Oslob /&nbsp;Light Breakfast</li>\n	<li>8:30 AM &ndash; Whale Shark Watching / Snorkeling</li>\n	<li>9:30 AM &ndash; Cool Down at Tumalog Falls</li>\n	<li>11:00 AM &ndash; Set Lunch</li>\n	<li>12:00 PM &ndash; Departure to Kawasan Falls</li>\n	<li>2:00 PM &ndash; Swimming at Kawasan Falls</li>\n	<li>4:00 PM &ndash; Depart back to hotel</li>\n	<li>7:00 PM &ndash; Estimated arrival in Hotel</li>\n</ul>', '12 hours', 'Falls Day Tour', 1, '2017-12-30 13:45:22', '2017-12-30 14:22:50', NULL),
(66, 'Pescador Island Hopping Tour', 'Tanon Strait, Moalboal, Philippines', 123.34352939999997, 9.923113100000002, 'easy', 3200, '<p>Moalboal is the most popular tourist destination in Cebu south due to its amazing marine life and pristine&nbsp;white sand beaches. One of the town&nbsp;main attraction is Pescador Island, which is considered a world-class dive site due&nbsp;to protected corals and marine species.</p>\r\n\r\n<p>Our Pescador island hopping tour will let you swim and see beautiful corals, sea fans, a frog fish, and a school of jacks. This trip also includes swim with the turtles and sardines run near Panagsama beach.</p>', '8099212_orig_1515018083.jpg', '<p>05:00AM &ndash; Pick up hotel&nbsp;(breakfast on the way preferably take out)<br />\n07:30AM &ndash; Estimated arrival in Moalboal<br />\n08:00AM &ndash; Depart for Pescador Island<br />\n11:30AM &ndash; End of the tour, lunch at own expense or relax at the beach<br />\n12:30PM &ndash; Departure back to city<br />\n03:00PM &ndash; Arrival in the Hotel</p>', '10 hours', 'Island Hopping', 8, '2018-01-03 13:59:44', '2018-01-03 14:21:23', NULL),
(67, 'Mactan Water Sports Activities', 'Mactan, Cebu', 124.01848375797272, 10.302236667616272, 'easy', 2300, '<p>Experience one day five ocean activities in Mactan Cebu. Experience an an exhilarating view from the top of Mactan Cebu and surrounding islands from a height of 150-300 feet while enjoying parasailing!</p>', '1_1515476007.jpg', NULL, '12 hours', 'Parasailing', 6, '2018-01-08 21:33:27', '2018-01-08 21:33:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_content`
--

CREATE TABLE `package_content` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_content`
--

INSERT INTO `package_content` (`id`, `package_id`, `title`, `content`) VALUES
(5, 57, 'Age', 'This Adventure is for ages 12-65'),
(6, 58, 'Age', 'This Adventure is for ages 12-65 hehe');

-- --------------------------------------------------------

--
-- Table structure for table `package_images`
--

CREATE TABLE `package_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `imagename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_images`
--

INSERT INTO `package_images` (`id`, `package_id`, `imagename`, `created_at`, `updated_at`) VALUES
(20, 58, '17155597_579126658959965_2379386275546084839_n_1514477768.jpg', '2017-12-28 08:16:08', '2017-12-28 08:16:08'),
(21, 58, 'alegria_cebu-001_1514477768.jpg', '2017-12-28 08:16:08', '2017-12-28 08:16:08'),
(22, 58, 'Canyoneering1_1514477768.jpg', '2017-12-28 08:16:08', '2017-12-28 08:16:08'),
(23, 58, 'Canyoneering-featured-image_1514477768.jpg', '2017-12-28 08:16:08', '2017-12-28 08:16:08'),
(24, 58, 'news3---canyoneering-1_ting_1514477768.jpg', '2017-12-28 08:16:08', '2017-12-28 08:16:08'),
(25, 57, 'bg_1514655474.jpg', '2017-12-30 09:37:54', '2017-12-30 09:37:54'),
(26, 57, 'can_1514655474.jpg', '2017-12-30 09:37:54', '2017-12-30 09:37:54'),
(27, 57, 'falls_1514655474.jpg', '2017-12-30 09:37:54', '2017-12-30 09:37:54'),
(78, 62, '2_1514664829.jpg', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(79, 62, 'lamave_1514664829.jpg', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(80, 62, 'maxresdefault_1514664829.jpg', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(81, 62, 'oslob_whaleshark_watching_1514664829.jpg', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(82, 62, 'oslob-whale-shark-watching_1514664829.jpg', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(83, 62, 'whale-shark-watching-in-oslob-package_1514664829.png', '2017-12-30 12:13:49', '2017-12-30 12:13:49'),
(84, 66, '73880_og_1_1515017274.jpeg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(85, 66, '8099212_orig_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(86, 66, 'G0514808_0008_GOPR7148_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(87, 66, 'img_9032_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(88, 66, 'pescador, moalboal_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(89, 66, 'pescador_island_moalboal_cebu1_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(90, 66, 'Pescador-Island-in-Moalboal-Cebu-Featured_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(91, 66, 'pescador-island-moalboal-cebu_1515017274.jpg', '2018-01-03 14:07:54', '2018-01-03 14:07:54'),
(92, 66, 'Pescador-island-moalboal-cebu-14_1515017274.JPG', '2018-01-03 14:07:54', '2018-01-03 14:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `package_inclusions`
--

CREATE TABLE `package_inclusions` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `included_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_inclusions`
--

INSERT INTO `package_inclusions` (`id`, `package_id`, `included_item`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 57, 'Lunch', '2017-12-25 06:10:20', '2017-12-25 06:10:20', NULL),
(22, 58, 'Lunch', '2017-12-25 06:15:52', '2017-12-25 06:15:52', NULL),
(23, 58, 'Dinner', '2017-12-25 06:15:52', '2017-12-25 06:15:52', NULL),
(24, 58, 'Transportation', '2017-12-25 06:15:52', '2017-12-25 06:15:52', NULL),
(25, 58, 'Equipments', '2017-12-25 06:15:52', '2017-12-25 06:15:52', NULL),
(54, 57, 'w1', '2017-12-30 11:00:41', '2017-12-30 11:00:41', NULL),
(55, 57, 'd2', '2017-12-30 11:00:48', '2017-12-30 11:00:48', NULL),
(63, 62, 'One Day Tour (see Tour Duration above based on pick up location)', '2017-12-30 12:11:21', '2017-12-30 12:11:21', NULL),
(64, 62, 'Local facilitator and Guide', '2017-12-30 12:11:33', '2017-12-30 12:11:33', NULL),
(65, 62, 'Light breakfast upon arrival in Oslob', '2017-12-30 12:11:39', '2017-12-30 12:11:39', NULL),
(66, 62, 'Lunch with one round of drinks (Soft drinks or bottled mineral water)', '2017-12-30 12:11:47', '2017-12-30 12:11:47', NULL),
(67, 63, 'Private Tour (14 hours Duration)', '2017-12-30 13:46:42', '2017-12-30 13:46:42', NULL),
(68, 63, 'Local Facilitator and Guide', '2017-12-30 13:46:50', '2017-12-30 13:46:50', NULL),
(69, 63, 'Native Light Breakfast', '2017-12-30 13:46:56', '2017-12-30 13:46:56', NULL),
(70, 63, 'Lunch with one round of drinks (Soft drinks or bottled mineral water)', '2017-12-30 13:47:06', '2017-12-30 13:47:06', NULL),
(71, 63, 'Entrance and watching fees', '2017-12-30 13:47:07', '2017-12-30 13:47:07', NULL),
(72, 66, 'Private air-conditioned car transportation (good for 10 hours / 14 hours if Kawasan falls, excess is subject for additional fee per hour)', '2018-01-03 14:00:57', '2018-01-03 14:00:57', NULL),
(73, 66, 'Pick up and drop off in hotel in Cebu City or Mactan', '2018-01-03 14:00:58', '2018-01-03 14:00:58', NULL),
(74, 66, 'Private Boat for Pescador island sightseeing (3-4hours duration)', '2018-01-03 14:01:03', '2018-01-03 14:01:03', NULL),
(75, 66, 'Life vest and snorkel', '2018-01-03 14:01:07', '2018-01-03 14:01:07', NULL),
(76, 66, 'Boatman crew as guide in island sightseeing', '2018-01-03 14:01:11', '2018-01-03 14:01:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_reviews`
--

CREATE TABLE `package_reviews` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package_videos`
--

CREATE TABLE `package_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumbimg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_videos`
--

INSERT INTO `package_videos` (`id`, `package_id`, `video_link`, `video_thumbimg`, `created_at`, `updated_at`) VALUES
(1, 57, 'https://vimeo.com/247746169', 'v1.webp', NULL, NULL),
(2, 58, 'https://vimeo.com/248067419', 'AnkaZhuvleva_1514472375.jpg', '2017-12-28 06:46:15', '2017-12-28 06:46:15'),
(3, 57, 'https://vimeo.com/239929490', '516141dbbfed58.98017247_1514472389.jpg', '2017-12-28 06:46:29', '2017-12-28 06:46:29'),
(4, 57, 'https://vimeo.com/210459179', 'jill_by_koyorin-dalp45p_1514472401.jpg', '2017-12-28 06:46:41', '2017-12-28 06:46:41'),
(7, 66, 'https://vimeo.com/80854163', 'G0514808_0008_GOPR7148_1515017832.jpg', '2018-01-03 14:17:12', '2018-01-03 14:17:12'),
(8, 66, 'https://vimeo.com/67989427', 'img_9032_1515017932.jpg', '2018-01-03 14:18:53', '2018-01-03 14:18:53'),
(9, 62, 'https://vimeo.com/162099287', 'maxresdefault_1515375405.jpg', '2018-01-07 17:36:46', '2018-01-07 17:36:46'),
(10, 62, 'https://vimeo.com/140682328', 'oslob_whaleshark_watching_1515375901.jpg', '2018-01-07 17:45:02', '2018-01-07 17:45:02'),
(11, 62, 'https://www.youtube.com/watch?v=YX96V3epKN0', 'lamave_1515375999.jpg', '2018-01-07 17:46:39', '2018-01-07 17:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `package_id`, `date`, `created_at`, `updated_at`) VALUES
(17, 58, '2017-12-29', '2017-12-25 06:15:52', '2017-12-25 06:15:52'),
(42, 62, '2018-01-29', '2017-12-30 11:20:12', '2017-12-30 11:20:12'),
(44, 63, '2018-01-03', '2017-12-30 13:47:18', '2017-12-30 13:47:18'),
(45, 63, '2018-01-02', '2017-12-30 13:58:10', '2017-12-30 13:58:10'),
(46, 66, '2018-01-10', '2018-01-03 14:01:19', '2018-01-03 14:01:19'),
(47, 66, '2018-01-12', '2018-01-03 14:01:21', '2018-01-03 14:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--

CREATE TABLE `superadmin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` enum('superadmin','','','') NOT NULL DEFAULT 'superadmin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userabout` text COLLATE utf8mb4_unicode_ci,
  `latagawpoints` float NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usertype` enum('client','','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `birthdate`, `gender`, `address`, `phone`, `userabout`, `latagawpoints`, `avatar`, `usertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'Mang Sabongay', 'paclatagaw@gmail.com', '$2y$10$7v52ZNWeKzYx.Xq.hfHuJ..ZqnkZ2xMwNDVHRWKgD.CWWIIQLxfpq', 'Month', 'male', NULL, NULL, NULL, 0, NULL, 'client', 'ULx0tRk5BZtQtxXmcAFUNciekNnNmvNLYVOMzQGG7LGD2Z2s5Wu2h5kzaGkA', '2017-12-09 05:34:12', '2017-12-22 11:14:51'),
(36, '11 22', 'eew@gmail.com', '$2y$10$R3FW1/6cPGCGAdS.i5Sydu0Y3M185oQ9ofVBPm10SfZkOmDI7B5qG', '', NULL, NULL, NULL, NULL, 0, NULL, 'client', 'LTQgRnZJqtP2r0CgOiZlhpCFZsTuRihtwh62DvGjF2S2LrQdNCw9fI0WV92V', '2018-01-09 11:52:15', '2018-01-09 11:52:15'),
(37, 'we we', 'eew2@gmail.com', '$2y$10$wK3OennlwlydNp5oho6bYeFotyTDLKzHycS6F0CfAJkgdGknVLMDO', '', NULL, NULL, NULL, NULL, 0, NULL, 'client', 'FOIVoqVi3YV7DhpyKvek53NP1A86ZGCINOhWRgLqb1nsQjZs7yoCKOZqzUuH', '2018-01-09 11:57:34', '2018-01-09 11:57:34'),
(38, 'qweqe qweq', '2231@maiil.com', '$2y$10$HGwJc3ULh/mSiwLllwQ9Au/6Lp3gtApvBexFxP0.dwj6QGCIhHWfi', 'February 17 2009', NULL, NULL, NULL, NULL, 0, NULL, 'client', 'VGVCVRokjrYasiyErYE4bSQxfhKzeDvdZvk3beAasXJbFyMNcFdLyR76Y8YV', '2018-01-09 12:00:25', '2018-01-09 12:00:25'),
(39, 'ad qweqwe', '22312@maiil.com', '$2y$10$qgQDxOeLtACGZAoMJbOMueU2wbnLx5afgCuBJmTFPsD7iXrldEJ62', 'March 17 2009', NULL, NULL, NULL, NULL, 0, NULL, 'client', '9VbHrFUzLb14oATn6hSUYf7nfUxjCs0LPtaikR4ZAFvRhuiDltM1iP5JoS24', '2018-01-09 12:02:41', '2018-01-09 12:02:41'),
(40, 'qwewqe qweqwe', '223132@maiil.com', '$2y$10$MJtaE2hLW4OBMS62FgK5nuzxkHkv4jrxsFZMPWFKAD1scn8RaCwTW', 'February 16 2011', NULL, NULL, NULL, NULL, 0, NULL, 'client', 'czSZt3Msh8kpINOONzRHgPyxcMcjMcIYpv5cv78KFzVxqvJll1Zvp9lZXIaY', '2018-01-09 12:03:07', '2018-01-09 12:03:07'),
(41, 'qweqwe qwewqe', 'eqwewqe@mail.com', '$2y$10$Rn3TewHTAslHi8QB3ASUgODc7aRHwwTgd0LUYGxBLSEHWba15Q0ZG', 'January 17 1982', NULL, NULL, NULL, NULL, 0, NULL, 'client', 'UJ7yfpt5tLmEHXWOiA0EmYfFYf9lX5ybeXzLc4xEtG4UI7QK90rDGxzz1UVD', '2018-01-09 12:24:40', '2018-01-09 12:24:40'),
(43, 'wqewqe qwewqeq', 'test@test.com', '$2y$10$SYDRoJoTXqh5mQmPzwdPQuIPX/PGqQ26RksCPwGLKVP7Gd08U8I52', 'February 18 1990', NULL, NULL, NULL, NULL, 0, NULL, 'client', NULL, '2018-01-09 14:16:52', '2018-01-09 14:16:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crews`
--
ALTER TABLE `crews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_content`
--
ALTER TABLE `package_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_images`
--
ALTER TABLE `package_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_inclusions`
--
ALTER TABLE `package_inclusions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_reviews`
--
ALTER TABLE `package_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_videos`
--
ALTER TABLE `package_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `crews`
--
ALTER TABLE `crews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `package_content`
--
ALTER TABLE `package_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `package_images`
--
ALTER TABLE `package_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `package_inclusions`
--
ALTER TABLE `package_inclusions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `package_reviews`
--
ALTER TABLE `package_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package_videos`
--
ALTER TABLE `package_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `superadmin`
--
ALTER TABLE `superadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
