<?php include "header.php"; ?>

<h3>Tambah data Kelas dan Wali Kelas</h3>
<form method="POST" action="">
	<table>
		<tr>
			<td>Kelas</td>
			<td><input type="text" name="kelas" maxlength="40" /></td>
		</tr>
		<tr>
			<td>Pilih Guru / Wali Kelas</td>
			<td>
				<select name="guru">
					<option value="" selected>- Pilih Guru -</option>
					<?php
					$sqlGuru=mysqli_query($konek, "SELECT * FROM guru ORDER BY idguru ASC");
					while($g=mysqli_fetch_array($sqlGuru)){
						echo "<option value='$g[idguru]'>$g[namaguru]</option>";
					}
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Simpan" /></td>
		</tr>
	</table>	
</form>

<!-- untuk memproses form -->
<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
	$kelas = $_POST['kelas'];
	$guru = $_POST['guru'];
	
	if($kelas=='' || $guru==''){
		echo "Form belum lengkap!!!";		
	}else{
		//simpan data
		$simpan = mysqli_query($konek, "INSERT INTO walikelas(kelas,idguru)
						VALUES ('$kelas','$guru')");
		
		if(!$simpan){
			echo "Simpan data gagal!!!";
		}else{
			header('location:tampil_walikelas.php');
		}
	}
}
?>

<?php include "footer.php"; ?>