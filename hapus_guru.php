<?php
session_start();
if(isset($_SESSION['login'])){
	include "koneksi.php";
	$hapus = mysqli_query($konek, "DELETE FROM guru WHERE idguru='$_GET[id]'");
	
	if($hapus){
		header('location:tampil_guru.php');
	}else{
		echo "Hapus data gagal, data guru digunakan di tabel wali kelas<br>
			<a href='tampil_guru.php'><<< Kembali</a>";
	}
}else{
	echo "Anda tidak memiliki akses ke halaman ini!!!";
}
?>