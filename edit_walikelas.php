<?php include "header.php"; ?>

<?php
$sqlEdit = mysqli_query($konek, "SELECT * FROM walikelas WHERE kelas='$_GET[kls]'");
$e=mysqli_fetch_array($sqlEdit);
?>

<h3>Edit data Kelas dan Wali Kelas</h3>
<form method="POST" action="">
	<table>
		<tr>
			<td>Kelas</td>
			<td><input type="text" name="kelas" value="<?php echo $e['kelas']; ?>" maxlength="40" readonly /></td>
		</tr>
		<tr>
			<td>Pilih Guru / Wali Kelas</td>
			<td>
				<select name="guru">
					<?php
					$sqlGuru=mysqli_query($konek, "SELECT * FROM guru ORDER BY idguru ASC");
					while($g=mysqli_fetch_array($sqlGuru)){
						if($g['idguru'] == $e['idguru']){
							$selected = "selected";
						}else{
							$selected = "";
						}
						
						echo "<option value='$g[idguru]' $selected>$g[namaguru]</option>";
					}
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Update" /></td>
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
		//update data
		$update = mysqli_query($konek, "UPDATE walikelas SET idguru='$guru' WHERE kelas='$kelas'");
		
		if(!$update){
			echo "Update data gagal!!!";
		}else{
			header('location:tampil_walikelas.php');
		}
	}
}
?>

<?php include "footer.php"; ?>