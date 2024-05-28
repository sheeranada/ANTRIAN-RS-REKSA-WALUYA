/*
 Navicat Premium Data Transfer

 Source Server         : khanza dev_mDB
 Source Server Type    : MariaDB
 Source Server Version : 100427
 Source Host           : localhost:3307
 Source Schema         : antrian

 Target Server Type    : MariaDB
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 27/05/2024 11:32:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antri_farmasi
-- ----------------------------
DROP TABLE IF EXISTS `antri_farmasi`;
CREATE TABLE `antri_farmasi`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_pasien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rawat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antri_farmasi
-- ----------------------------
INSERT INTO `antri_farmasi` VALUES ('31a2a138-1738-4c10-83d0-cfffd01d5eda', 'BAGI BAGIJONO', '2024/04/03/895760', '2024-05-26 16:31:28', '2024-05-26 16:31:28');
INSERT INTO `antri_farmasi` VALUES ('3cf5ff0c-6f31-4330-bd81-810586337200', 'TIARA NURMASARI DINARILLAH', '2024/04/01/895660', '2024-05-26 16:33:31', '2024-05-26 16:33:31');
INSERT INTO `antri_farmasi` VALUES ('4b591d37-2551-40c3-afc5-a0362c824ff2', 'KENES ANINDITHA', '2024/04/03/895688', '2024-05-26 15:27:08', '2024-05-26 15:27:08');
INSERT INTO `antri_farmasi` VALUES ('6cd2b79d-0764-4c1e-8a3d-d02fcc2f8417', 'ALMIRA LIYANA FAIHA', '2024/03/30/000090', '2024-05-26 16:32:56', '2024-05-26 16:32:56');
INSERT INTO `antri_farmasi` VALUES ('7a98a7f9-80c7-47ee-8710-d5bf58fb5048', 'SOEBAGJO', '2024/04/01/895451', '2024-05-26 15:58:17', '2024-05-26 15:58:17');
INSERT INTO `antri_farmasi` VALUES ('878624a3-04f9-40c6-b09c-ec871b0b9522', 'MUHAMMAD RAFID GHANI A', '2024/04/03/895755', '2024-05-26 16:32:03', '2024-05-26 16:32:03');
INSERT INTO `antri_farmasi` VALUES ('9c37a0ff-6f13-4345-89aa-7d63b84430b3', 'MUCHLASON', '2024/04/03/895768', '2024-05-26 15:54:17', '2024-05-26 15:54:17');
INSERT INTO `antri_farmasi` VALUES ('9e7156c8-6c71-4886-bbb9-a9d8a32b3a58', 'MIRANDA LAURO', '2024/04/02/895774', '2024-05-26 16:32:15', '2024-05-26 16:32:15');
INSERT INTO `antri_farmasi` VALUES ('f5cd2eaa-37b1-4ac5-ac70-2261cbfa032f', 'MICHAEL ADITIA', '2024/04/03/895735', '2024-05-26 16:31:49', '2024-05-26 16:31:49');

-- ----------------------------
-- Table structure for antri_loket
-- ----------------------------
DROP TABLE IF EXISTS `antri_loket`;
CREATE TABLE `antri_loket`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `loket` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antri_loket
-- ----------------------------
INSERT INTO `antri_loket` VALUES ('032fb9bc-980b-48bc-ae2d-1c4806b3a34e', 36, 3, '2024-05-25 18:10:54', '2024-05-25 18:10:54');
INSERT INTO `antri_loket` VALUES ('111ca76a-849f-4094-9ca4-9d354e5c19e4', 35, 3, '2024-05-25 18:09:58', '2024-05-25 18:09:58');
INSERT INTO `antri_loket` VALUES ('4d41becc-2110-43a6-b41e-2e8b5d93a15e', 37, 1, '2024-05-25 18:13:14', '2024-05-25 18:13:14');
INSERT INTO `antri_loket` VALUES ('68622042-56d0-4ed1-8ade-6c202468a324', 18, 3, '2024-05-25 17:55:15', '2024-05-25 17:55:15');
INSERT INTO `antri_loket` VALUES ('91d24693-5dea-43fc-93b2-97b15382448b', 34, 1, '2024-05-25 18:04:21', '2024-05-25 18:04:21');
INSERT INTO `antri_loket` VALUES ('92f4722f-ad5e-45dd-8edb-a67db304a318', 38, 4, '2024-05-25 18:14:01', '2024-05-25 18:14:01');
INSERT INTO `antri_loket` VALUES ('975970e6-4bb4-41f3-99d9-4be1aff09367', 19, 2, '2024-05-25 17:56:41', '2024-05-25 17:56:41');

-- ----------------------------
-- Table structure for antri_poli
-- ----------------------------
DROP TABLE IF EXISTS `antri_poli`;
CREATE TABLE `antri_poli`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rawat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_pasien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_dokter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `poli_nomor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antri_poli
-- ----------------------------
INSERT INTO `antri_poli` VALUES ('004a7ed6-3864-4d94-8bf4-bd160a1bc7a4', '2024/05/02/000001', 'SITI AMINAH', 'Asep Harirohman, dr.,Sp.P.D', 10, '2024-05-26 15:23:19', '2024-05-26 15:23:19');
INSERT INTO `antri_poli` VALUES ('244f764c-7377-46e8-910e-c4a53e31f53a', '2024/05/02/000002', 'RATNA DWI ASTUTI', 'Asep Harirohman, dr.,Sp.P.D', 10, '2024-05-26 15:23:52', '2024-05-26 15:23:52');
INSERT INTO `antri_poli` VALUES ('29d3ad95-e082-49d2-8065-62d2a6d601a0', '2024/05/02/000002', 'RATNA DWI ASTUTI', 'Asep Harirohman, dr.,Sp.P.D', 6, '2024-05-26 15:24:07', '2024-05-26 15:24:07');
INSERT INTO `antri_poli` VALUES ('59d495a3-fbce-4850-9466-1cbb3475e110', '2024/05/02/000002', 'RATNA DWI ASTUTI', 'Asep Harirohman, dr.,Sp.P.D', 10, '2024-05-26 15:21:26', '2024-05-26 15:21:26');
INSERT INTO `antri_poli` VALUES ('62488785-7305-43c5-b6f9-467accd93dea', '2024/05/02/000017', 'MOCHAMAD AFFANDI', 'Asep Harirohman, dr.,Sp.P.D', 10, '2024-05-26 15:21:02', '2024-05-26 15:21:02');
INSERT INTO `antri_poli` VALUES ('af9bd41e-32bf-4415-bf16-cee7e859ea2b', '2024/04/29/000005', 'SELVY EKA kisnawanti', 'Shandy Suwanto Putra,dr.,Sp. OG', 4, '2024-05-26 15:34:41', '2024-05-26 15:34:41');
INSERT INTO `antri_poli` VALUES ('d9b9e2f0-4cfd-4353-b010-2129599710db', '2024/04/29/000006', 'AMELIA SUGIANTO', 'Shandy Suwanto Putra,dr.,Sp. OG', 4, '2024-05-26 15:36:31', '2024-05-26 15:36:31');
INSERT INTO `antri_poli` VALUES ('ddff979c-4981-472c-a51c-40a53133c568', '2024/04/29/000002', 'SERLY MEISISTA', 'Shandy Suwanto Putra,dr.,Sp. OG', 4, '2024-05-26 15:34:53', '2024-05-26 15:34:53');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_05_18_094827_create_antri_poli_table', 2);
INSERT INTO `migrations` VALUES (9, '2024_05_18_103027_create_antri_loket_table', 3);
INSERT INTO `migrations` VALUES (10, '2024_05_18_143637_create_antri_farmasi_table', 4);
INSERT INTO `migrations` VALUES (12, '2014_10_12_000000_create_users_table', 5);
INSERT INTO `migrations` VALUES (13, '2019_12_14_000001_create_personal_access_tokens_table', 5);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '7a998b50f00747d14aa842ccb282696788c5d2a28217dfb6dc7ae0a52ebbe9d4', '[\"*\"]', NULL, NULL, '2024-05-18 15:39:01', '2024-05-18 15:39:01');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '5bced9b76d8efb3b125b0bd43c96f73317ab0c51e9e1e8a0d5030973a31e78a9', '[\"*\"]', NULL, NULL, '2024-05-19 11:49:24', '2024-05-19 11:49:24');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '3eeee418e87780cad0bec0ee383f582fc88baf1d5c53db7ae33490a82437b9aa', '[\"*\"]', NULL, NULL, '2024-05-19 11:49:24', '2024-05-19 11:49:24');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '78600bef159df24ae69b55d6c2d7b4f3a85fa3ed40acbf8cd4bebb656bdb457c', '[\"*\"]', NULL, NULL, '2024-05-19 11:49:39', '2024-05-19 11:49:39');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'e72513134f846439eb4e3c094943c8dddc1eba8d458a0a14a9346bd950ad11d3', '[\"*\"]', NULL, NULL, '2024-05-19 11:50:33', '2024-05-19 11:50:33');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'e7b899be5a40137be11de58f9bf6ec96ba452c8170c37511580ad3d74a036ee0', '[\"*\"]', NULL, NULL, '2024-05-19 11:55:04', '2024-05-19 11:55:04');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '1a9fb5ed95a82e5945a6ad9a6c6fac0208ecb141f54c797df26b7e48c48960d1', '[\"*\"]', NULL, NULL, '2024-05-19 11:57:15', '2024-05-19 11:57:15');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'b5284e1418fdff362024c17f9a18ff51b33cd73cd687887d65a733fd3ab558bf', '[\"*\"]', NULL, NULL, '2024-05-19 11:57:35', '2024-05-19 11:57:35');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '7aa9141a8b2b20298e02f2c57a3d60e284a65efbe72d4f7efb66a95986ec6df4', '[\"*\"]', NULL, NULL, '2024-05-19 12:01:33', '2024-05-19 12:01:33');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '9ea294b61a197800fa1399d879a2f2a77f71a4cb5ef9432caaff8b6e715cbcdd', '[\"*\"]', NULL, NULL, '2024-05-19 12:03:46', '2024-05-19 12:03:46');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'ff3f23833195e9cdd6790fdba56dc617d698401cf0d68abbb6ce7a41163de140', '[\"*\"]', NULL, NULL, '2024-05-19 12:05:15', '2024-05-19 12:05:15');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '4a2148a13ca9d96c7d26f484b756cf446dfdad962524f77bb2ce5a74fa811cd3', '[\"*\"]', NULL, NULL, '2024-05-19 12:05:24', '2024-05-19 12:05:24');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'e94d1d0cc5d3c0dba41d5a6437e0d8d216166476c3b82a84043f94714623eff5', '[\"*\"]', NULL, NULL, '2024-05-19 12:09:58', '2024-05-19 12:09:58');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '9e3504e1d987baf4e4893e3d3cbfc56b0a254441cd41a69a37fe896611c997eb', '[\"*\"]', NULL, NULL, '2024-05-20 02:05:41', '2024-05-20 02:05:41');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'a011331e4dd61724cebc44ece836463c7bf199c20d406e0b518540ffee2487e4', '[\"*\"]', NULL, NULL, '2024-05-20 03:48:31', '2024-05-20 03:48:31');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '3aaa8e734cd124e6de7385b4019f6e7601ee12aecc2c5c4d0477418eff687858', '[\"*\"]', '2024-05-20 04:02:36', NULL, '2024-05-20 04:02:35', '2024-05-20 04:02:36');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '317210acf1b3edb08ea6639ec088f1084714be481594744231c9e8e04428bebe', '[\"*\"]', '2024-05-20 04:10:52', NULL, '2024-05-20 04:10:52', '2024-05-20 04:10:52');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '256789463244e00bdd5983f3a2f70a7bc3598283c66253b779dbc8050849e866', '[\"*\"]', '2024-05-20 04:11:11', NULL, '2024-05-20 04:11:11', '2024-05-20 04:11:11');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'b86d2c9d27e325eb528b54f7db12dc16dbcdf8b40eb5f83b46cf7eda74663d84', '[\"*\"]', '2024-05-20 07:23:36', NULL, '2024-05-20 07:07:51', '2024-05-20 07:23:36');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'bbd25f10eb1def2e6b3871b8dc0241cee653ebf76593e7050fbf112962bc7668', '[\"*\"]', '2024-05-20 10:16:41', NULL, '2024-05-20 08:39:25', '2024-05-20 10:16:41');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '41c9d20234d33c1da4a771fceb9e1bec105efef1c026e0cf5693fbfa9517c7f9', '[\"*\"]', '2024-05-20 15:51:30', NULL, '2024-05-20 15:43:40', '2024-05-20 15:51:30');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '0e55e0f5ee913a33571531cbd8c607e1a26eb6b3639ea3ab673656d347fe5f7d', '[\"*\"]', '2024-05-21 01:56:09', NULL, '2024-05-21 01:55:41', '2024-05-21 01:56:09');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '68352be0ae6f2d64b10851f0431372985a9c3ba4424b99dd244b0cc57978e4d3', '[\"*\"]', '2024-05-21 07:06:47', NULL, '2024-05-21 07:05:50', '2024-05-21 07:06:47');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '5ce3bad2b247c2d2c8182f766d71624a9a8aa7dd6a751c0c6c4be246d04bf00d', '[\"*\"]', '2024-05-21 15:43:44', NULL, '2024-05-21 13:50:52', '2024-05-21 15:43:44');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '6b9bd726469e1b05ce7c97f7ad19f6d84d43613303dab8e1fd6d3f1331a1ab92', '[\"*\"]', '2024-05-21 15:30:26', NULL, '2024-05-21 15:24:30', '2024-05-21 15:30:26');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '4cdd8c998283f1994eb6e6ad659640e1850df47abd4bbd18226787f903fa7a41', '[\"*\"]', '2024-05-21 15:43:29', NULL, '2024-05-21 15:31:12', '2024-05-21 15:43:29');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'f49b6fdd4c5c627043fb9bfa4d2eca2c9fea75e65f430c1b289cadee1b2a13ec', '[\"*\"]', '2024-05-22 05:55:37', NULL, '2024-05-22 02:14:22', '2024-05-22 05:55:37');
INSERT INTO `personal_access_tokens` VALUES (53, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '17f5adfd6e38bf299388e8b5c5a14a7ae4afe12b9954ee676cbf45f239c1406e', '[\"*\"]', '2024-05-22 05:57:17', NULL, '2024-05-22 02:15:08', '2024-05-22 05:57:17');
INSERT INTO `personal_access_tokens` VALUES (54, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'cccaef7975eff17c5e81101020b27acc651f599e6a181858ea61285b76e150cd', '[\"*\"]', '2024-05-22 07:48:20', NULL, '2024-05-22 06:18:36', '2024-05-22 07:48:20');
INSERT INTO `personal_access_tokens` VALUES (55, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'fd3051315e6bc170e7c4d3813156c1d60feb649fffa221079ec2482d9c566650', '[\"*\"]', '2024-05-22 08:44:19', NULL, '2024-05-22 08:07:40', '2024-05-22 08:44:19');
INSERT INTO `personal_access_tokens` VALUES (56, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '2dc0349df44ef3068f5579c241d1eed880bd99a69bd9d7d9440afe1cee64c2c7', '[\"*\"]', '2024-05-22 18:37:10', NULL, '2024-05-22 17:00:35', '2024-05-22 18:37:10');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'e176a5488513915907acda26a226b3ce060621d7580334e007422a3a68687b7e', '[\"*\"]', '2024-05-23 05:25:05', NULL, '2024-05-23 02:06:51', '2024-05-23 05:25:05');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '43c2af160e700f181ce640567a3123a1f3def2632231a6051d7ad5108070b01f', '[\"*\"]', '2024-05-23 18:07:49', NULL, '2024-05-23 18:07:48', '2024-05-23 18:07:49');
INSERT INTO `personal_access_tokens` VALUES (59, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'bb300717329785ac29cda2bf17bbb9e5d08c74b996f871dcb0340bea05cd7280', '[\"*\"]', '2024-05-24 06:50:59', NULL, '2024-05-24 03:15:08', '2024-05-24 06:50:59');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'ad595191f4a3e79f4b287eb72c7009e3502ad10f78fb28b1a63eadc7d1b10be2', '[\"*\"]', '2024-05-24 08:04:36', NULL, '2024-05-24 08:04:35', '2024-05-24 08:04:36');
INSERT INTO `personal_access_tokens` VALUES (61, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'd02449dc87e9434b045700ecc7f2daf48a471b0a80ae21e5fdce8c6a8bd09c97', '[\"*\"]', '2024-05-24 10:52:36', NULL, '2024-05-24 10:52:35', '2024-05-24 10:52:36');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '6e650aeed71e0893de773ba168fd37cef6a090633260033f0795313dfb96cc81', '[\"*\"]', '2024-05-24 19:09:29', NULL, '2024-05-24 17:13:44', '2024-05-24 19:09:29');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'a0742039a77816ba0c6278181633a90d19be325951668dabbc29bd1d20c8b12c', '[\"*\"]', '2024-05-25 03:40:53', NULL, '2024-05-25 03:40:52', '2024-05-25 03:40:53');
INSERT INTO `personal_access_tokens` VALUES (65, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'eeff3859dc2e5f3168f902111cc2ce84c0abe5d441016392fab7eccfa2728aa5', '[\"*\"]', '2024-05-25 05:26:10', NULL, '2024-05-25 03:40:53', '2024-05-25 05:26:10');
INSERT INTO `personal_access_tokens` VALUES (66, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '592596d26708fa24c660772ccdfd03f751f9fe4b45499552bc2d1de02ccf8c70', '[\"*\"]', '2024-05-25 12:34:24', NULL, '2024-05-25 10:30:44', '2024-05-25 12:34:24');
INSERT INTO `personal_access_tokens` VALUES (67, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '53a555a1fc19b7971a6888f381c1fa3a873ae310dafb64c52746b9fd1765d9fa', '[\"*\"]', '2024-05-25 15:51:55', NULL, '2024-05-25 15:21:33', '2024-05-25 15:51:55');
INSERT INTO `personal_access_tokens` VALUES (68, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '527acc04aaa41d8b59c90d6d6aba23025463663c545ba1d94cd44bf46615139a', '[\"*\"]', '2024-05-25 17:24:33', NULL, '2024-05-25 15:27:20', '2024-05-25 17:24:33');
INSERT INTO `personal_access_tokens` VALUES (69, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '249a80a30844dd4309061378777bb163a94cc7f0fd057fbd20a2338aa1c695ec', '[\"*\"]', '2024-05-25 18:11:54', NULL, '2024-05-25 17:23:20', '2024-05-25 18:11:54');
INSERT INTO `personal_access_tokens` VALUES (70, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '35d9351385eee6b84f238b8f2f8a1a580fbee8513d8daefe2fe1be24a51907d8', '[\"*\"]', '2024-05-25 17:47:02', NULL, '2024-05-25 17:46:25', '2024-05-25 17:47:02');
INSERT INTO `personal_access_tokens` VALUES (71, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'cf275f3901610c7074cd2196246099792001fe55d4b482012e25ab4667be67de', '[\"*\"]', '2024-05-25 18:18:15', NULL, '2024-05-25 18:12:33', '2024-05-25 18:18:15');
INSERT INTO `personal_access_tokens` VALUES (72, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'aea35bcf1afa6086661fbc5fb486ec0827e3ec0a2048f95c0f62b4d3b5bc2fa5', '[\"*\"]', '2024-05-26 15:13:56', NULL, '2024-05-26 15:13:56', '2024-05-26 15:13:56');
INSERT INTO `personal_access_tokens` VALUES (73, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', '29b616c277da71b601a33a7f687d88a0310c9c43bc4f78b2254cabe42f0bb576', '[\"*\"]', '2024-05-26 15:24:21', NULL, '2024-05-26 15:18:58', '2024-05-26 15:24:21');
INSERT INTO `personal_access_tokens` VALUES (75, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'cc82e73889190068a7e3d5d34dcc920591275ec091e240af216960cd02f5a230', '[\"*\"]', '2024-05-26 16:34:05', NULL, '2024-05-26 15:40:54', '2024-05-26 16:34:05');
INSERT INTO `personal_access_tokens` VALUES (77, 'App\\Models\\User', 'ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'auth_token', 'e30844940112d8dc0ea415cf7598a4a0f8f3b9e6d81e1b5d18119722b1f4b4cd', '[\"*\"]', '2024-05-27 04:32:31', NULL, '2024-05-27 04:24:11', '2024-05-27 04:32:31');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('ab3dbb61-e0fd-41a4-a8f0-448398fbc140', 'Admin RS Reksa Waluya', 'support@rsreksawaluya.com', '2024-05-18 15:38:55', '$2y$12$ZMBnCCzSp/3HUv/KT3HhRe/ysizt72ovXZ2GNYwJH/GUgdSpVmjP2', '8cAmARznru', '2024-05-18 15:38:55', '2024-05-18 15:38:55');

SET FOREIGN_KEY_CHECKS = 1;
