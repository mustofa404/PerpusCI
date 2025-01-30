-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_ciperpus306
CREATE DATABASE IF NOT EXISTS `db_ciperpus306` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_ciperpus306`;


-- Dumping structure for table db_ciperpus306.buku
CREATE TABLE IF NOT EXISTS `buku` (
  `id_buku` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_buku` varchar(10) NOT NULL,
  `id_judul` int(10) unsigned NOT NULL,
  `is_ada` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id_buku`),
  UNIQUE KEY `uq_kode_buku` (`kode_buku`),
  KEY `fk_buku_judul` (`id_judul`),
  CONSTRAINT `fk_buku_judul` FOREIGN KEY (`id_judul`) REFERENCES `judul` (`id_judul`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_ciperpus306.buku: ~43 rows (approximately)
DELETE FROM `buku`;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` (`id_buku`, `kode_buku`, `id_judul`, `is_ada`) VALUES
	(1, 'MRPM-01', 49, 'y'),
	(2, 'BWSK-01', 50, 'y'),
	(3, 'BWSK-02', 50, 'y'),
	(4, 'AMSN-01', 51, 'y'),
	(5, 'BONE-01', 89, 'y'),
	(6, 'CARR-01', 88, 'y'),
	(7, 'ANNAII-01', 87, 'y'),
	(8, 'ANNAI-01', 86, 'y'),
	(9, 'JACKAL-01', 85, 'y'),
	(10, 'GODF-01', 84, 'y'),
	(11, 'ALCHE-01', 83, 'y'),
	(12, 'HEMING-01', 82, 'y'),
	(13, 'EDEN-01', 81, 'y'),
	(14, 'PEM-01', 80, 'y'),
	(15, 'KOPI-01', 79, 'y'),
	(16, 'RABI-01', 78, 'y'),
	(17, 'INTI-01', 77, 'y'),
	(18, 'MEGABI-01', 76, 'y'),
	(19, 'MANBI-01', 75, 'y'),
	(20, 'CESBI-01', 74, 'y'),
	(21, 'KAMBI-01', 73, 'y'),
	(22, 'FUMBI-01', 72, 'y'),
	(23, 'POCMAT-01', 70, 'y'),
	(24, 'JENFIS-01', 69, 'y'),
	(25, 'OLIMFIS-01', 68, 'y'),
	(26, 'CCPF-01', 67, 'y'),
	(27, 'PRAKFIS-01', 66, 'y'),
	(28, 'SMARFIS-01', 65, 'y'),
	(29, 'SMAT-01', 64, 'y'),
	(30, 'JAWMAT-01', 63, 'y'),
	(31, 'JAGMAT-01', 62, 'y'),
	(32, 'CCMAT-01', 60, 'y'),
	(33, 'MEGAMAT-01', 59, 'y'),
	(34, 'EXC-01', 54, 'y'),
	(35, 'ZEXC-01', 55, 'y'),
	(36, 'POWEXC-01', 56, 'y'),
	(37, 'SERUMAT-01', 57, 'y'),
	(38, 'SUPMAT-01', 58, 'y'),
	(39, 'SERNUX-01', 52, 'y'),
	(40, 'WORD-01', 53, 'y'),
	(41, 'FRACI-01', 47, 'y'),
	(42, 'FRACI-02', 47, 'y'),
	(43, 'MUSH-01', 90, 'y');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.denda
CREATE TABLE IF NOT EXISTS `denda` (
  `id_pinjam` int(10) unsigned NOT NULL,
  `jumlah` int(10) unsigned NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `is_dibayar` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_pinjam`),
  CONSTRAINT `fk_denda_peminjaman` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_ciperpus306.denda: ~0 rows (approximately)
DELETE FROM `denda`;
/*!40000 ALTER TABLE `denda` DISABLE KEYS */;
INSERT INTO `denda` (`id_pinjam`, `jumlah`, `tanggal_pembayaran`, `is_dibayar`) VALUES
	(1, 88000, '2016-07-05', 'y');
/*!40000 ALTER TABLE `denda` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.judul
CREATE TABLE IF NOT EXISTS `judul` (
  `id_judul` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` varchar(15) NOT NULL DEFAULT '0',
  `judul_buku` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_judul`),
  UNIQUE KEY `uq_isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_ciperpus306.judul: ~41 rows (approximately)
DELETE FROM `judul`;
/*!40000 ALTER TABLE `judul` DISABLE KEYS */;
INSERT INTO `judul` (`id_judul`, `isbn`, `judul_buku`, `penulis`, `penerbit`, `cover`) VALUES
	(47, '9789791758666', 'Membangun Web Berbasis PHP dengan Framework Codeigniter', 'Awan Pribadi Basuki', 'Lokomedia', '20160704064527.jpg'),
	(49, '9791758603', 'Membongkar Rahasia Para Master PHP', 'Lukmanul Hakim', 'Lokomedia', '20160704064456.jpg'),
	(50, '9789791758673', 'Bikin Website Super Keren dengan PHP dan JQquery', 'Lukmanul Hakim', 'Lokomedia', '20160704064424.jpg'),
	(51, '9792905626', 'Ayo Memblok Situs Negatif', 'Onno W Purbo', 'Andi Publisher', '20160704064347.jpg'),
	(52, '9789792902969', 'Workshop Onno: Panduan Mudah Merakit Menginstall Server Linux', 'Onno W Purbo', 'Andi Publisher', '20160704064247.jpg'),
	(53, '9786020260006', 'Word 2013 Panduan Karya Tulis Ilmiah', 'Kristian Agung Prasetyo', 'Elex Media Komputindo', '20160704064224.jpg'),
	(54, '9786020261430', 'Step by Step Excel 2013 Tanpa Guru', 'Arista Prasetyo Adi', 'Elex Media Komputindo', '20160704064205.jpg'),
	(55, '9792947205', 'From Zero to Advance Macro Excel 2013', 'Wahana Komputer', 'Andi Publisher', '20160704064145.jpg'),
	(56, '9786020261799', '125+ PowerTips untuk Excel 2007, 2010 & 2013', 'Christopher Lee', 'Elex Media Komputindo', '20160704064122.jpg'),
	(57, '9789793833057', 'Belajar Seru Matematika SMP Kelas XII, VIII, IX', 'Adi Prasetia, S.Si', 'Pustaka Edukasia', '20160704064106.jpg'),
	(58, '9786023080212', 'Rumus Super Matematika SMP/MTs Kelas 7, 8, 9 Resep Manjur Lulus Ujian', 'Tim Dian Cipta', 'Prima Ufuk', '20160704064005.jpg'),
	(59, '9786021609712', 'Fresh Update Mega Bank Soal Matematika SMP Kelas 1, 2, 3', 'Tim Guru Eduka', 'CMedia', '20160704063941.jpg'),
	(60, '9797752402', 'Cara Cepat & Mudah Taklukkan Matematika SMP', 'M. Alvianto S.Si', 'Indonesia Tera', '20160704063920.jpg'),
	(62, '9789792942163', 'Jago Matematika SMP Kelas 7, 8, 9', 'TMBooks', 'Andi Publisher', '20160704063717.jpg'),
	(63, '9789790830950', 'Jawara (Jadi Siswa Juara) Matematika Kelas 7, 8, 9 SMP', 'Purie Anggita, S.Si', 'Tangga Pustaka', '20160704063645.jpg'),
	(64, '9789790830936', 'Smartdiary: Matematika SMP Kelas 7, 8, 9', 'Wijaya Kurnia Santoso', 'Tangga Pustaka', '20160704063623.jpg'),
	(65, '9789797752392', 'Mini Smart Book Fisika SMP Kelas VII, VIII & IX', 'Hendri Hartanto', 'Indonesia Tera', '20160704063553.jpg'),
	(66, '9786021137208', 'Buku Praktikum Fisika SMP/Mts Kelas 7, 8, 9', 'Diyono Harun', 'Laskar Aksara', '20160704063530.jpg'),
	(67, '9789792942718', 'Cara Cespleng Pintar Fisika SMP Kelas 7, 8, 9', 'Agus Kamaludin', 'Andi Publisher', '20160704063501.jpg'),
	(68, '9786021380222', 'Sukses Olimpiade Fisika SMP', 'Rini Khamilatul Ula, S.Pd., M.Si.', 'Dunia Cerdas', '20160704063432.jpg'),
	(69, '9786022515142', 'Super Jenius Fisika SMP Kelas VII, VIII, IX', 'Sienta Sasika Novel', 'Grasindo', '20160704063402.jpg'),
	(70, '9786021609088', 'Pocket Book: Matematika & Fisika SMP Kelas 1, 2 & 3', 'Tim Math Sains Eduka', 'CMedia', '20160704063339.jpg'),
	(72, '9786021609729', 'Fresh Update Mega Bank Soal Bahasa Indonesia SMP Kelas 1, 2 & 3', 'Tim Guru Eduka', 'CMedia', '20160704063217.jpg'),
	(73, '9786023040100', 'Kamus Detail Bahasa Indonesia Untuk SMP/MTs Kelas 1, 2 dan 3', 'Siti Nur\'aisyah, A.md', 'Kunci Aksara', '20160704063141.jpg'),
	(74, '9789792942637', 'Cara Cespleng Pintar Bahasa Indonesia SMP Kelas 7, 8, 9', 'Agus Kamaludin, Niken Umiyati', 'Andi Publisher', '20160704063112.jpg'),
	(75, '9786022416159', 'Mandiri Bahasa Indonesia untuk SMP/MTs VII', 'Tim Bahasa', 'Erlangga', '20160704063025.jpg'),
	(76, '9786028596657', 'Mega Bank Soal Bahasa Indonesia SMP Kelas 1, 2 & 3', 'Tim Guru Eduka', 'CMedia', '20160704062854.jpg'),
	(77, '9789797751685', 'Intisari Lengkap Bahasa Indonesia Untuk SD, SMP, SMA dan Umum', 'Moh. Kusnadi Wasrie', 'Indonesia Tera', '20160704062829.jpg'),
	(78, '9789797751272', 'Rangkuman Bahasa Indonesia Lengkap untuk SD, SMP dan SMA', 'Acep Yonny', 'Indonesia Tera', '20160704062749.jpg'),
	(79, '9786028811613', 'Filosofi Kopi: A Cofee Table Book', 'Dewi Dee Lestari', 'Bentang Pustaka', '20160704062723.jpg'),
	(80, '9789793062921', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '20160704062700.jpg'),
	(81, '9789791227025', 'Edensor', 'Andrea Hirata', 'Bentang Pustaka', '20160704062614.jpg'),
	(82, '9789791684354', 'The Oldman and The Sea', 'Ernest Hemingway', 'Narasi', '20160704062427.jpg'),
	(83, '9789792298406', 'The Alchemist', 'Paulo Coelho', 'Gramedia Pustaka Utama', '20160704062357.jpg'),
	(84, '9789792286342', 'The Godfather', 'Mario Puzo', 'Gramedia Pustaka Utama', '20160704062328.jpg'),
	(85, '9789790243569', 'The Day of The Jackal', 'Frederick Forsyth', 'Serambi', '20160704062306.jpg'),
	(86, '9789799100603', 'Anna Karenina I', 'Leo Tolstoi', 'Kepustakaan Populer Gramedia', '20160704062236.jpg'),
	(87, '9789799100665', 'Anna Karenina II', 'Leo Tolstoi', 'Kepustakaan Populer Gramedia', '20160704062207.jpg'),
	(88, '9789792299519', 'Carrie', 'Stephen King', 'Gramedia Pustaka Utama', '20160704062040.jpg'),
	(89, '9789796864379', 'Bag Of Bones', 'Stephen King', 'Gramedia Pustaka Utama', '20160704061649.jpg'),
	(90, '9789792288131', 'Musashi', 'Eiji Yoshikawa', 'Gramedia Pustaka Utama', '20160704061536.jpg');
/*!40000 ALTER TABLE `judul` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table db_ciperpus306.kelas: ~6 rows (approximately)
DELETE FROM `kelas`;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
	(17, '7 - A'),
	(18, '7 - B'),
	(19, '8 - A'),
	(20, '8 - B'),
	(21, '9 - A'),
	(22, '9 - B');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id_pinjam` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_pinjam` date NOT NULL,
  `id_siswa` int(10) unsigned NOT NULL,
  `id_buku` int(10) unsigned NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `is_kembali` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_pinjam`),
  KEY `fk_peminjaman_siswa` (`id_siswa`),
  KEY `fk_peminjaman_buku` (`id_buku`),
  CONSTRAINT `fk_peminjaman_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_peminjaman_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_ciperpus306.peminjaman: ~4 rows (approximately)
DELETE FROM `peminjaman`;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` (`id_pinjam`, `tanggal_pinjam`, `id_siswa`, `id_buku`, `tanggal_kembali`, `is_kembali`) VALUES
	(1, '2016-04-01', 57, 1, '2016-07-05', 'y'),
	(2, '2016-07-01', 147, 37, '2016-07-05', 'y'),
	(3, '2016-06-29', 63, 8, '2016-07-05', 'y'),
	(4, '2016-06-29', 63, 7, '2016-07-05', 'y');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id_siswa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(4) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `id_kelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_siswa`),
  UNIQUE KEY `uq_nisn` (`nis`),
  KEY `fk_siswa_kelas` (`id_kelas`),
  CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

-- Dumping data for table db_ciperpus306.siswa: ~125 rows (approximately)
DELETE FROM `siswa`;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`id_siswa`, `nis`, `nama_siswa`, `jenis_kelamin`, `id_kelas`) VALUES
	(57, '1001', 'Abimanyu Kurniadi', 'L', 17),
	(58, '1002', 'Achmad Abrori Prawiro Kusumo', 'L', 18),
	(59, '1003', 'Achmad Noval Sukmana', 'L', 19),
	(60, '1004', 'Achmad Zulfikar', 'L', 20),
	(61, '1005', 'Ani Tri Andani', 'P', 21),
	(62, '1006', 'Anis Dwi Winarsih', 'P', 22),
	(63, '1007', 'Anisa Dwi Wandani', 'P', 17),
	(64, '1008', 'Apriana Wike Nur Mahariyanti', 'P', 18),
	(65, '1009', 'Danang Febriyanto', 'L', 19),
	(66, '1010', 'Deffy Maharani', 'P', 20),
	(67, '1011', 'Devi Novitasari', 'P', 21),
	(68, '1012', 'Ela Kurniawati', 'P', 22),
	(69, '1013', 'Ellys Nofita Sary', 'P', 17),
	(70, '1014', 'Erik Firmansyah', 'L', 18),
	(71, '1015', 'Fahmi Alfaris Hidayatullah', 'L', 19),
	(72, '1016', 'Halimah', 'P', 20),
	(73, '1017', 'Haris Wibowo', 'L', 21),
	(74, '1018', 'Hendra Pristi Wahyono', 'L', 22),
	(75, '1019', 'Lailatul Fitriyah', 'P', 17),
	(76, '1020', 'Laili Septian Zufri Yahya', 'L', 18),
	(77, '1021', 'Leni Yuliati', 'P', 19),
	(78, '1022', 'Ade Minggus Hukom', 'L', 20),
	(79, '1023', 'Adinda Derry Variegati', 'P', 21),
	(80, '1024', 'Adiningsih Kartika Sari', 'P', 22),
	(81, '1025', 'Arfila Fitrianti', 'P', 17),
	(82, '1026', 'Arini Sulistyaningati', 'P', 18),
	(83, '1027', 'Arisma Binti Awaliyah', 'P', 19),
	(84, '1028', 'Ayu Isrotin', 'P', 20),
	(85, '1029', 'Ayu Novitasari', 'P', 21),
	(86, '1030', 'Dewi Karmila', 'P', 22),
	(87, '1031', 'Dewi Lestari', 'P', 17),
	(88, '1032', 'Dhimas Agung Pratama', 'L', 18),
	(89, '1033', 'Dhoni Grahadi Nugroho', 'L', 19),
	(90, '1034', 'Fahmi Nur Azis', 'L', 20),
	(91, '1035', 'Fajar Riska Perdana', 'L', 21),
	(92, '1036', 'Fajar Rivi Jannati', 'P', 22),
	(93, '1037', 'Hendrik Usdiantoro', 'L', 17),
	(94, '1038', 'Heri Purwito', 'L', 18),
	(95, '1039', 'Husnia Novia Yuhaida', 'P', 19),
	(96, '1040', 'M. Bagus Tamyiz', 'L', 20),
	(97, '1041', 'Leo Agus Hartono', 'L', 21),
	(98, '1042', 'Liliana Niken Sukandar', 'P', 22),
	(99, '1043', 'Linda Yuliana', 'P', 17),
	(100, '1044', 'Afan Assegaf Wardansyah', 'L', 18),
	(101, '1045', 'Agus Dwi Darmawan', 'L', 19),
	(102, '1046', 'Ahmad Hamdun', 'L', 20),
	(103, '1047', 'Aziza Nur Afifa', 'P', 21),
	(104, '1048', 'Bagas Farizi', 'L', 22),
	(105, '1049', 'Bagus Sentoso', 'L', 17),
	(106, '1050', 'Diah Febril Latifiyanti', 'P', 18),
	(107, '1051', 'Dian Tri Cahyono', 'L', 19),
	(108, '1052', 'Diane Andrita Sukma', 'P', 20),
	(109, '1053', 'Fajar Setiadi', 'L', 21),
	(110, '1054', 'Farih Yahya', 'L', 22),
	(111, '1055', 'Fathchur Roji', 'L', 17),
	(112, '1056', 'Fathurrohmah Maulidah', 'P', 18),
	(113, '1057', 'Ika Nur Fatimah', 'P', 19),
	(114, '1058', 'Ika Sri Wahyuningsih', 'P', 20),
	(115, '1059', 'Imam Mustaqim', 'L', 21),
	(116, '1060', 'Mahendra Dedy Pratama', 'L', 22),
	(117, '1061', 'Maksum Akbar', 'L', 17),
	(118, '1062', 'Ma\'Mum Slamet', 'L', 18),
	(119, '1063', 'Manzilatul Habibah', 'P', 19),
	(120, '1064', 'Ahmad Mega Jaya', 'L', 20),
	(121, '1065', 'Ainun Musrifah', 'P', 21),
	(122, '1066', 'Alex Sandria', 'P', 22),
	(123, '1067', 'Bakhtiar Adi Nugroho', 'L', 17),
	(124, '1068', 'Bambang Eko Proyono', 'L', 18),
	(125, '1069', 'Bening Dwiati Sistyowinarsih', 'P', 19),
	(126, '1070', 'Dimas Esa Dewa', 'L', 20),
	(127, '1071', 'Dimas Septian Ega Putra', 'L', 21),
	(128, '1072', 'Dinda Prety Murina', 'P', 22),
	(129, '1073', 'Fatola Rudianza', 'L', 17),
	(130, '1074', 'Febri Dhity Setiawan', 'L', 18),
	(131, '1075', 'Fendi Pradianto', 'L', 19),
	(132, '1076', 'Imelda Narolita Pratiwi', 'P', 20),
	(133, '1077', 'Indah Nursita', 'P', 21),
	(134, '1078', 'Indartiningsih', 'P', 22),
	(135, '1079', 'Indri Rahmawati', 'P', 17),
	(136, '1080', 'Inna Asyari Rozalina', 'P', 18),
	(137, '1081', 'Maria Qulfasia', 'P', 19),
	(138, '1082', 'Maria Ulfa', 'P', 20),
	(139, '1083', 'Masruli', 'L', 21),
	(140, '1084', 'Maulidha Santi Hasanah', 'P', 22),
	(141, '1085', 'Alvin Yuliatris Magda', 'P', 17),
	(142, '1086', 'Amalia Dewi Aqmarina', 'P', 18),
	(143, '1087', 'Amalia Istiqomah', 'P', 19),
	(144, '1088', 'Andi Kurniawan', 'L', 20),
	(145, '1089', 'Betri Arista Oviana', 'P', 21),
	(146, '1090', 'Brianraka Sony Mei Sega', 'L', 22),
	(147, '1091', 'Budianto', 'L', 17),
	(148, '1092', 'Dody Nurcaharjo', 'L', 18),
	(149, '1093', 'Dwi Bagus Aprianto', 'L', 19),
	(150, '1094', 'Dwi Octavia Damaiyanti', 'P', 20),
	(151, '1095', 'Fikria Hanik', 'P', 21),
	(152, '1096', 'Fitria Andalus Handayani', 'P', 22),
	(153, '1097', 'Fitria Nurhasanah', 'P', 17),
	(154, '1098', 'Fitrianing Wahyu Nur Syahadah', 'P', 18),
	(155, '1099', 'Irwinsyah Azizul Hakim', 'L', 19),
	(156, '1100', 'Jeffri Eko Rosadi', 'L', 20),
	(157, '1101', 'Jimmy Rahmat Darajat', 'L', 21),
	(158, '1102', 'Mega Anjarwati', 'P', 22),
	(159, '1103', 'Meilinda Ratna Dwi Pratiwi', 'P', 17),
	(160, '1104', 'Melisa Nurcayasmi', 'P', 18),
	(161, '1105', 'Andik Siswanto', 'L', 19),
	(162, '1106', 'Andri Purnomo', 'L', 20),
	(163, '1107', 'Angga Prasetya', 'L', 21),
	(164, '1108', 'Anggra Prasetya Budi', 'L', 22),
	(165, '1109', 'Carina Febriana', 'P', 17),
	(166, '1110', 'Christi Mayasari', 'P', 18),
	(167, '1111', 'Cynthia Novita', 'P', 19),
	(168, '1112', 'Dadang Cahyo Nugroho', 'L', 20),
	(169, '1113', 'Dwi Siska Anggraeni', 'P', 21),
	(170, '1114', 'Eka Shinta Ayu Firdani', 'L', 22),
	(171, '1115', 'Eka Susanti', 'P', 17),
	(172, '1116', 'Ekky Riastiandy', 'L', 18),
	(173, '1117', 'Galang Rizki Bachtiar', 'L', 19),
	(174, '1118', 'Galuh Ayu Dyah Prameswari', 'P', 20),
	(175, '1119', 'Gresha Iga Kuswayan Almyanto', 'L', 21),
	(176, '1120', 'Khusnul Nur Aisyah', 'P', 22),
	(177, '1121', 'Kiky Floresta Bunga Kirana', 'P', 17),
	(178, '1122', 'Komariyah Rukhana Putri', 'P', 18),
	(179, '1123', 'Mevina Marsella Lausani', 'P', 19),
	(180, '1124', 'Mirzafajrin Zaidi Abdat', 'P', 20),
	(181, '1125', 'Moch. Samsul Arif', 'L', 21);
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;


-- Dumping structure for table db_ciperpus306.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('operator','admin') NOT NULL DEFAULT 'operator',
  `is_blokir` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `uq_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_ciperpus306.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`, `is_blokir`) VALUES
	(1, 'administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'n'),
	(2, 'awan pribadi', 'awan', 'e19cb7c038c2159012047e8b276bb6a2', 'operator', 'n');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
