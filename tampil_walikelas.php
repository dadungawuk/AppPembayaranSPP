<?php include "header.php"; ?>

<h3>Data Kelas dan Wali Kelas</h3>
<a href="tambah_walikelas.php">Tambah Data</a>
<table border="1">
	<tr>
		<th>No.</th>
		<th>Nama Kelas</th>
		<th>Nama Wali Kelas</th>
		<th>Aksi</th>
	</tr>
	<?php
	$sql = mysqli_query($konek, "SELECT walikelas.kelas,guru.namaguru
								FROM walikelas
								INNER JOIN guru ON walikelas.idguru=guru.idguru
								ORDER BY walikelas.kelas ASC");
	$no=1;
	while($d=mysqli_fetch_array($sql)){
		echo "<tr>
			<td>$no</td>
			<td>$d[kelas]</td>
			<td>$d[namaguru]</td>
			<td>
				<a href='edit_walikelas.php?kls=$d[kelas]'>Edit</a> / 
				<a href='hapus_walikelas.php?kls=$d[kelas]'>Hapus</a>
			</td>
		</tr>";
		$no++;
	}
	?>
</table>

<?php include "footer.php"; ?>