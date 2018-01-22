<?php include "header.php"; ?>

<?php
$sqlEdit = mysqli_query($konek, "SELECT * FROM siswa WHERE idsiswa='$_GET[id]'");
$e=mysqli_fetch_array($sqlEdit);
?>

<h3>Edit Data Siswa</h3>
<form method="post" action="">
	<input type="hidden" name='idsiswa' value="<?php echo $e['idsiswa']; ?>" />
	<table>
		<tr>
			<td>NIS</td>
			<td><input type="text" name="nis" value="<?php echo $e['nis']; ?>" maxlength="10"></td>
		</tr>
		<tr>
			<td>Nama Siswa</td>
			<td><input type="text" name="namasiswa" value="<?php echo $e['namasiswa']; ?>" maxlength="40"></td>
		</tr>
		<tr>
			<td>Kelas</td>
			<td>
				<select name="kelas">
					<?php
					$sqlKelas = mysqli_query($konek, "select * from walikelas order by kelas ASC");
					while($k=mysqli_fetch_array($sqlKelas)){

						if($k['kelas'] == $e['kelas']){
							$selected = "selected";
						}else{
							$selected ="";
						}

						?>
						<option value="<?php echo $k['kelas']; ?>" <?php echo $selected; ?>><?php echo $k['kelas']; ?></option>
						<?php
					}
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td>Tahun Ajaran</td>
			<td><input type="text" name="tahunajaran" value="<?php echo $e['tahunajaran']; ?>" readonly /></td>
		</tr>
		<tr>
			<td>Biaya SPP</td>
			<td><input type="text" name="biaya" value="<?php echo $e['biaya']; ?>" readonly /></td>
		</tr>
		<tr>
			<td>Jatuh Tempo Pertama</td>
			<td><input type="text" name="jatuhtempo" value="2017-07-10" readonly /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Update" /></td>
		</tr>
	</table>
</form>

<!-- proses edit data -->
<?php
if($_SERVER['REQUEST_METHOD']=='POST'){

	//variabel untuk menampung inputan dari form
	$id 	= $_POST['idsiswa'];
	$nis 	= $_POST['nis'];
	$nama 	= $_POST['namasiswa'];
	$kelas 	= $_POST['kelas'];
	$tahun 	= $_POST['tahunajaran'];
	$biaya 	= $_POST['biaya'];

	if($nis=='' || $nama =='' || $kelas==''){
		echo "Form Belum lengkap....";
	}else{
		$update = mysqli_query($konek, "UPDATE siswa SET nis='$nis',
											namasiswa='$nama',
											kelas='$kelas',
											tahunajaran='$tahun',
											biaya='$biaya'
										WHERE idsiswa='$id'");

		if(!$update){
			echo "Update data gagal...";

		}else{
			header('location:tampil_siswa.php');
		}
	}
}
?>

<?php include "footer.php" ?>