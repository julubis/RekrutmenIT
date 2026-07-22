-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rekrutmen
CREATE DATABASE IF NOT EXISTS `rekrutmen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rekrutmen`;

-- Dumping structure for table rekrutmen.pasien
CREATE TABLE IF NOT EXISTS `pasien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rekrutmen.pasien: ~4 rows (approximately)
INSERT INTO `pasien` (`id`, `nama`, `tgl_lahir`, `jenis_kelamin`, `alamat`) VALUES
	(5153, 'Bp. Setyo prabowo', '1964-12-07', 'L', 'Jln Laksmana No.01, Jakarta'),
	(5268, 'Ny. Haryanti', '1989-10-26', 'P', 'Jln Deli, Koja, Jakarta Utara'),
	(5358, 'Bp. Samsuri', '1980-11-22', 'L', 'Jln Raya Bekasi No.32, Bekasi'),
	(5456, 'Ny. Egi Pasaribu', '1976-05-02', 'P', 'Jln Majapahit No.22, Jakarta');

-- Dumping structure for table rekrutmen.pendaftaran
CREATE TABLE IF NOT EXISTS `pendaftaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nrm` int NOT NULL,
  `poli_id` int NOT NULL,
  `tgl_pendaftaran` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `nrm` (`nrm`),
  KEY `poli_id` (`poli_id`),
  CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`nrm`) REFERENCES `pasien` (`id`),
  CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`poli_id`) REFERENCES `poliklinik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rekrutmen.pendaftaran: ~5 rows (approximately)
INSERT INTO `pendaftaran` (`id`, `nrm`, `poli_id`, `tgl_pendaftaran`) VALUES
	(6, 5358, 1, '2026-05-03 08:03:00'),
	(7, 5456, 2, '2026-05-03 07:56:00'),
	(8, 5153, 3, '2026-05-01 08:47:00'),
	(9, 5268, 3, '2026-05-01 08:40:00'),
	(10, 5358, 1, '2026-05-06 08:03:00');

-- Dumping structure for table rekrutmen.poliklinik
CREATE TABLE IF NOT EXISTS `poliklinik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rekrutmen.poliklinik: ~3 rows (approximately)
INSERT INTO `poliklinik` (`id`, `kode`, `nama`) VALUES
	(1, 'POL001', 'Poliklinik Mata'),
	(2, 'POL002', 'Poliklinik Penyakit Dalam'),
	(3, 'POL003', 'Poliklinik Jantung');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
