<?php
session_start();
if(!isset($_SESSION['login'])){
	header('location:login.php');
}

include "koneksi.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>Aplikasi Pembayaran SPP</title>
</head>
<body>
<h3>Aplikasi Pembayaran SPP</h3>
<hr/>
<a href="tampil_admin.php">Data Admin</a> |
<a href="tampil_guru.php">Data Guru</a> |
<a href="tampil_walikelas.php">Data Wali Kelas</a> |
<a href="tampil_siswa.php">Data Siswa</a> |
<a href="transaksi.php">Transaksi</a> |
<a href="laporan.php">Laporan</a> |
<a href="logout.php">Logout</a>
<hr/>