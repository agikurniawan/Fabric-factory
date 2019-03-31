-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2019 pada 17.03
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kain`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan`
--

CREATE TABLE `bahan` (
  `id` int(11) NOT NULL,
  `bahan` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bahan`
--

INSERT INTO `bahan` (`id`, `bahan`) VALUES
(1, 'Bahan Baku'),
(2, 'Bahan Jadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_barang`
--

CREATE TABLE `data_barang` (
  `id` int(11) NOT NULL,
  `bahan_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `sisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_barang`
--

INSERT INTO `data_barang` (`id`, `bahan_id`, `name`, `stock`, `status`, `sisa`) VALUES
(1, 1, 'Cotton Fabric', 50, 'Ready', 60),
(2, 1, 'Linen Fabric', 30, 'Ready', 50),
(4, 1, 'Jersey', 44, 'Ready', 12),
(5, 2, 'Linear', 44, 'Ready', 22),
(6, 2, 'Tunik', 50, 'Ready', 33),
(7, 2, 'Batik', 12, 'Ready', 33);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_id`
--

CREATE TABLE `role_id` (
  `id` int(11) NOT NULL,
  `role` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_id`
--

INSERT INTO `role_id` (`id`, `role`) VALUES
(1, 'gudang'),
(2, 'kasir'),
(3, 'pembuat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `email`, `image`, `role_id`, `is_active`, `date_created`) VALUES
(3, 'asep', 'Gudang', '$2y$10$pcCRpXFRZBlp9qB9vgniUOmjVGxwhdyieiXOM9hJp0KT9EJbo4.OG', 'agikurniawan17@gmail.com', 'default.jpg', 1, 1, 1553326772),
(4, 'Usep Tea', 'Kasir', '$2y$10$6VsQgUmbtHZM6jYaVVoxWeyeDirJhBK4Y8xrVBU7TQq5vEPzQo2Fq', 'kasir17@gmail.com', 'default.jpg', 2, 1, 1553336887),
(5, 'Tea Unik', 'Pembuat', '$2y$10$HDdbL93JIwUBcG3mWf7GI.qdxDkE4FyWpbAEWet12Q1IUas0cx8L2', 'Pembuat17@gmail.com', 'default.jpg', 3, 1, 1553407470);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'gudang'),
(2, 'kasir'),
(3, 'pembuat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'gudang', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Pesanan', 'kasir', 'fas fa-fw fa-shopping-basket', 1),
(3, 1, 'Persediaan', 'gudang/persediaan', 'fas fa-fw fa-boxes', 1),
(4, 3, 'Pembuatan Kain', 'pembuat', 'fas fa-fw fa-industry', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_id`
--
ALTER TABLE `role_id`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_barang`
--
ALTER TABLE `data_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `role_id`
--
ALTER TABLE `role_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
