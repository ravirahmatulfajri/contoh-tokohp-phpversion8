<?php
session_start();
error_reporting(0);
include "config/koneksi.php";
include "config/library.php";

$module=$_GET['module'];
$act=$_GET['act'];

if ($module=='keranjang' AND $act=='tambah'){

	$sid = session_id();

	$sql2 = mysqli_query($connect, "SELECT stok FROM produk WHERE id_produk='$_GET[id]'");
	$r=mysqli_fetch_array($sql2);
	$stok=$r['stok'];
  
  if ($stok == 0){
      echo "stok habis";
  }
  else{
	// check if the product is already
	// in cart table for this session
	$sql = mysqli_query($connect,"SELECT id_produk FROM orders_temp
			WHERE id_produk='$_GET[id]' AND id_session='$sid'");
	$ketemu=mysqli_num_rows($sql);
	if ($ketemu==0){
		// put the product in cart table
		mysqli_query($connect,"INSERT INTO orders_temp (id_produk, jumlah, id_session, tgl_order_temp, jam_order_temp, stok_temp)
				VALUES ('$_GET[id]', 1, '$sid', '$tgl_sekarang', '$jam_sekarang', '$stok')");
	} else {
		// update product quantity in cart table
		mysqli_query($connect,"UPDATE orders_temp 
		        SET jumlah = jumlah + 1
				WHERE id_session ='$sid' AND id_produk='$_GET[id]'");		
	}	
	deleteAbandonedCart();
	header('Location:keranjang-belanja.html');
  }				
}

elseif ($module=='keranjang' AND $act=='hapus'){
	mysqli_query($connect,"DELETE FROM orders_temp WHERE id_orders_temp='$_GET[id]'");
	header('Location:keranjang-belanja.html');				
}

elseif ($module=='keranjang' AND $act=='update'){
  $id       = $_POST['id'];
  $jml_data = count($id);
  $jumlah   = $_POST['jml']; // quantity
  for ($i=1; $i <= $jml_data; $i++){
	$sql2 = mysqli_query($connect,"SELECT stok_temp FROM orders_temp	WHERE id_orders_temp='".$id[$i]."'");
	while($r=mysqli_fetch_array($sql2)){
    if ($jumlah[$i] > $r['stok_temp']){
        echo "<script>window.alert('Jumlah yang dibeli melebihi stok yang ada');
        window.location=('keranjang-belanja.html')</script>";
    }
    elseif($jumlah[$i] == 0){
        echo "<script>window.alert('Anda tidak boleh menginputkan angka 0 atau mengkosongkannya!');
        window.location=('keranjang-belanja.html')</script>";
    }
    else{
      mysqli_query($connect,"UPDATE orders_temp SET jumlah = '".$jumlah[$i]."'
                                      WHERE id_orders_temp = '".$id[$i]."'");
      header('Location:keranjang-belanja.html');
    }
  }
  }
}


/*
	Delete all cart entries older than one day
*/
function deleteAbandonedCart(){
	$kemarin = date('Y-m-d', mktime(0,0,0, date('m'), date('d') - 1, date('Y')));
	mysqli_query($kemarin,"DELETE FROM orders_temp 
	        WHERE tgl_order_temp < '$kemarin'");
}
?>
