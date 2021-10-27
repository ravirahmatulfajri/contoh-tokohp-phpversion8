<?php
$sql = mysqli_query($connect,"select nama_produk from produk where id_produk='$_GET[id]'");
$j   = mysqli_fetch_array($sql);

if (isset($_GET['id'])){
		echo "$j[nama_produk]";
}
else{
      $sql2 = mysqli_query($connect,"select meta_deskripsi from modul where id_modul='43'");
      $j2   = mysqli_fetch_array($sql2);
		  echo "$j2[meta_deskripsi]";
}
?>
