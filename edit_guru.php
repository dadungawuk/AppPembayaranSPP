<?php include "header.php"; ?>

<?php
$sqlEdit=mysqli_query($konek, "SELECT * FROM guru WHERE idguru='$_GET[id]'");
$e=mysqli_fetch_array($sqlEdit);
?>
<h3>Edit Data Guru</h3>
<form method="post" action="">
	<input type="hidden" name="idguru" value="<?php echo $e['idguru']; ?>" />
	<table>
		<tr>
			<td>Nama Guru</td>
			<td><input type="text" name="namaguru" value="<?php echo $e['namaguru']; ?>" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Update" /></td>
		</tr>
	</table>
</form>

<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
	//variabel dari elemen form
	$id		= $_POST['idguru'];
	$nama 	= $_POST['namaguru'];
	
	if($nama==''){
		echo "Form belum lengkap!!!";
	}else{
		//proses edit data guru
		$edit = mysqli_query($konek, "UPDATE guru SET namaguru='$nama' WHERE idguru='$id'");
		
		if(!$edit){
			echo "Edit data gagal!!";
		}else{
			header('location:tampil_guru.php');
		}
	}
}
?>

<?php include "footer.php"; ?>