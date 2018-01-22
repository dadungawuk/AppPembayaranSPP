<?php
session_start();
if(isset($_SESSION['login'])){
	include "koneksi.php";
	$hapus = mysqli_query($konek, "DELETE FROM siswa WHERE idsiswa='$_GET[id]'");
	
	if($hapus){
		header('location:tampil_siswa.php');
	}else{
		echo "Hapus data gagal...,
			<a href='tampil_siswa.php'><<< Kembali</a>";
	}
}else{
	echo "Anda tidak memiliki akses ke halaman ini!!!";
}
?>