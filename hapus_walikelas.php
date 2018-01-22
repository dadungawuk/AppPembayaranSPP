<?php
session_start();
if(isset($_SESSION['login'])){
	include "koneksi.php";
	$hapus=mysqli_query($konek, "DELETE FROM walikelas WHERE kelas='$_GET[kls]'");
	
	if(!$hapus){
		echo "Hapus data gagal, atau data sedang digunakan di tabel lain...<br/>
		<a href='tampil_walikelas.php'>Kembali</a>";	
	}else{
		header('location:tampil_walikelas.php');
	}
}
?>