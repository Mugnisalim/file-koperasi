-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Bulan Mei 2019 pada 21.38
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text,
  `create_on` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `company`
--

INSERT INTO `company` (`id`, `name`, `address`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(3, 'Indonesian Art and Culture Institute of Bandung', 'Jl. Buah Batu No.212, Cijagra, Kec. Lengkong, Kota Bandung, Jawa Barat 40265', 2019, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `no_trans` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `pokok` decimal(20,2) NOT NULL DEFAULT '0.00',
  `wajib` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sukarela` decimal(20,2) NOT NULL DEFAULT '0.00',
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `deposit`
--

INSERT INTO `deposit` (`id`, `memberid`, `no_trans`, `date`, `pokok`, `wajib`, `sukarela`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(21, 7, 'SN000001', '2019-05-08', '1222.00', '15000.00', '2000000.00', '2019-05-18 02:36:26', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `position` varchar(100) DEFAULT NULL,
  `address` text,
  `hp` varchar(20) DEFAULT '',
  `birthplace` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `gender`, `position`, `address`, `hp`, `birthplace`, `birthdate`, `photo`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(4, 'Superadmin', 'Setiadimugnisalim@gmail.com', 'Laki-laki', 'Supervisor', 'bandnf', '089765665654', 'bandung', '1986-04-15', NULL, '2015-09-02 00:51:55', 1, '2019-05-18 02:31:06', 8),
(8, 'Admin', 'mugnizz18@gmail.com', 'Laki-laki', 'Manager', 'ghj', '089646384025', 'bandung', '1988-09-01', NULL, '2017-01-24 00:08:55', 8, '2019-05-18 02:32:31', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `installment`
--

CREATE TABLE `installment` (
  `id` int(11) NOT NULL,
  `loanid` int(11) NOT NULL,
  `no_trans` varchar(20) NOT NULL,
  `transaction` int(2) NOT NULL DEFAULT '1' COMMENT 'angsuran ke ....',
  `date` date NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `installment`
--

INSERT INTO `installment` (`id`, `loanid`, `no_trans`, `transaction`, `date`, `amount`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(18, 10, 'AN000001', 1, '2019-05-08', '335833.33', '2019-05-18 02:37:07', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `no_loan` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bunga` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'persen dlm bulan (0.83/bulan)',
  `lama_angsuran` int(4) NOT NULL DEFAULT '1' COMMENT 'dalam bulan',
  `perbulan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `flag` enum('Tahun','Bulan') NOT NULL DEFAULT 'Bulan',
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '1=Lunas,0=Belum Lunas',
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `loan`
--

INSERT INTO `loan` (`id`, `memberid`, `no_loan`, `date`, `amount`, `bunga`, `lama_angsuran`, `perbulan`, `flag`, `status`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(10, 7, 'PN000001', '2019-05-10', '1000000.00', '0.25', 3, '335833.33', 'Bulan', '0', '2019-05-18 02:36:52', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `no_member` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `birthplace` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `relationship` enum('Sendiri','Menikah') NOT NULL DEFAULT 'Sendiri',
  `partner` varchar(150) DEFAULT NULL COMMENT 'nama suami/istri',
  `heir` varchar(150) DEFAULT NULL COMMENT 'ahli waris',
  `address` text COMMENT 'sesuai ktp',
  `current_address` text,
  `phone` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `companyid` int(11) DEFAULT '1',
  `join_date` date DEFAULT NULL COMMENT 'join date dgn perusahaan',
  `position` varchar(100) DEFAULT NULL,
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id`, `no_member`, `name`, `gender`, `birthplace`, `birthdate`, `relationship`, `partner`, `heir`, `address`, `current_address`, `phone`, `hp`, `companyid`, `join_date`, `position`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(7, '190001', 'eva', 'Perempuan', 'bandung', '2000-06-01', 'Menikah', '', '', '', '', '', '', 3, NULL, '', '2019-05-18 02:36:07', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member_deposit`
--

CREATE TABLE `member_deposit` (
  `id` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `date` date NOT NULL COMMENT 'tanggal efektif',
  `pokok` decimal(20,2) NOT NULL DEFAULT '0.00',
  `wajib` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sukarela` decimal(20,2) NOT NULL DEFAULT '0.00',
  `create_on` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member_deposit`
--

INSERT INTO `member_deposit` (`id`, `memberid`, `date`, `pokok`, `wajib`, `sukarela`, `create_on`, `create_by`, `update_on`, `update_by`) VALUES
(9, 7, '2019-05-01', '1222.00', '15000.00', '2000000.00', '2019-05-18 02:36:07', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(1) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `description`) VALUES
(1, 'Superadmin'),
(2, 'Admin'),
(3, 'User'),
(4, 'Anggota');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `roleid` int(1) NOT NULL,
  `employeeid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `roleid`, `employeeid`, `username`, `password`) VALUES
(8, 1, 4, 'superadmin', 'fjl8rAOL/yAgq1zhJDKMJDJteKttXAEbh+erp9Tko3RVhC+bLcRshULxxcz4ha6TgjPAaiHtBcPUcdzIY0qZPQ=='),
(13, 2, 8, 'admin', 'w9j4ITcJV/UV4ZPfjVuCdp4h79pRl54RMwLtrnua7TZrP2h09oRsZqTr6GwPuIRgLZ3C1H9+Ppl49iUjI1fqnA==');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberid` (`memberid`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loanid` (`loanid`);

--
-- Indeks untuk tabel `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberid` (`memberid`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyid` (`companyid`);

--
-- Indeks untuk tabel `member_deposit`
--
ALTER TABLE `member_deposit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberid` (`memberid`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleid` (`roleid`),
  ADD KEY `employeeid` (`employeeid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `installment`
--
ALTER TABLE `installment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `member_deposit`
--
ALTER TABLE `member_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `installment`
--
ALTER TABLE `installment`
  ADD CONSTRAINT `installment_ibfk_1` FOREIGN KEY (`loanid`) REFERENCES `loan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `member_deposit`
--
ALTER TABLE `member_deposit`
  ADD CONSTRAINT `member_deposit_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
