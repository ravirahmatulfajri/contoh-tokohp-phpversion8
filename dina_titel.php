<?php
if (isset($_GET['id'])){
    $sql = mysqli_query($connect,"select nama_produk from produk where id_produk='$_GET[id]'");
    $j   = mysqli_fetch_array($sql);
    if ($j) {
        echo "$j[nama_produk]";
    } 
    else{
      $sql2 = mysqli_query($connect,"select nama_toko from modul where id_modul='43'");
      $j2   = mysqli_fetch_array($sql2);
		  echo "$j2[nama_toko]";
		}
}
else{
      $sql3 = mysqli_query($connect,"select nama_toko from modul where id_modul='43'");
      $j3   = mysqli_fetch_array($sql3);
		  echo "$j3[nama_toko]";
}
?>
