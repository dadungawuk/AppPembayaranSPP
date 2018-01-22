<?php 
session_start();
if(isset($_SESSION['login'])){
	include "koneksi.php";
	if($_GET['act']=='bayar'){

		$idspp 	= $_GET['id'];
		$nis	= $_GET['nis'];

		//membuat nomor pembayaran
		$today = date("ymd");
		$query = mysqli_query($konek, "SELECT max(nobayar) AS last FROM spp WHERE nobayar LIKE '$today%'");
		$data = mysqli_fetch_array($query);
		$lastNoBayar	= $data['last'];
		$lastNoUrut		= substr($lastNoBayar, 6, 4);
		$nextNoUrut		= $lastNoUrut + 1;
		$nextNoBayar	= $today.sprintf('%04s', $nextNoUrut);

		//tanggal Bayar
		$tglBayar 	= date('Y-m-d');

		//id admin
		$admin = $_SESSION['id'];

		mysqli_query($konek, "UPDATE spp SET nobayar='$nextNoBayar',
											tglbayar='$tglBayar',
											ket='LUNAS',
											idadmin='$admin'
									WHERE idspp='$idspp'");

		header('location:transaksi.php?nis='.$nis);
	}
}
?>