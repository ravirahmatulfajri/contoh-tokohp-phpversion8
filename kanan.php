	   <div class="shopping_cart">
        <div class="cart_title">Keranjang belanja</div>
        <div class="cart_details">
           <?php require_once "item.php";?>
        </div>    
        <div class="cart_icon"><img src="images/shoppingcart.png" alt="" title="" width="48" border="0" height="48">
        </div>        
      </div>	

      <div class="title_box">Customer Service</div>  
      <div class="border_box">

      <?php 
      //ym
      $ym=mysqli_query($connect,"select * from mod_ym order by id desc");
      while($t=mysqli_fetch_array($ym)){
        echo "<br /><p>&bull; $t[nama] 
              <a href='ymsgr:sendIM?$t[username]'>
              <img src='http://opi.yahoo.com/online?u=$t[username]&amp;m=g&amp;t=1' border='0' height='16' width='64'></a>
              </p><br />";
      }
      ?>
      </div>  	 
	 
	  <div class="title_box">Statistik User</div>  
     <div class="border_box">
<?php
  // Statistik user
  $ip      = $_SERVER['REMOTE_ADDR']; // Mendapatkan IP komputer user
  $tanggal = date("Ymd"); // Mendapatkan tanggal sekarang
  $waktu   = time(); // 

  // Mencek berdasarkan IPnya, apakah user sudah pernah mengakses hari ini 
  $s = mysqli_query($connect,"SELECT * FROM statistik WHERE ip='$ip' AND tanggal='$tanggal'");
  // Kalau belum ada, simpan data user tersebut ke database
  if(mysqli_num_rows($s) == 0){
    mysqli_query($connect,"INSERT INTO statistik(ip, tanggal, hits, online) VALUES('$ip','$tanggal','1','$waktu')");
  } 
  else{
    mysqli_query($connect,"UPDATE statistik SET hits=hits+1, online='$waktu' WHERE ip='$ip' AND tanggal='$tanggal'");
  }

  $pengunjung       = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM statistik WHERE tanggal='$tanggal' GROUP BY ip"));
  $totalpengunjung  = mysqli_result(mysqli_query($connect,"SELECT COUNT(hits) FROM statistik"), 0); 
  $hits             = mysqli_fetch_assoc(mysqli_query($connect,"SELECT SUM(hits) as hitstoday FROM statistik WHERE tanggal='$tanggal' GROUP BY tanggal")); 
  $totalhits        = mysqli_result(mysqli_query($connect,"SELECT SUM(hits) FROM statistik"), 0); 
  $tothitsgbr       = mysqli_result(mysqli_query($connect,"SELECT SUM(hits) FROM statistik"), 0); 
  $bataswaktu       = time() - 300;
  $pengunjungonline = mysqli_num_rows(mysqli_query($connect,"SELECT * FROM statistik WHERE online > '$bataswaktu'"));

  $path = "counter/";
  $ext = ".png";

  $tothitsgbr = sprintf("%06d", $tothitsgbr);
  for ( $i = 0; $i <= 9; $i++ ){
	   $tothitsgbr = str_replace($i, "<img src='$path$i$ext' alt='$i'>", $tothitsgbr);
  }

  echo "<br /><p align='left'>
      <img src='counter/hariini.png'> Pengunjung hari ini : $pengunjung <br />
      <img src='counter/total.png'> Total pengunjung    : $totalpengunjung <br /><br />
      <img src='counter/hariini.png'> Hits hari ini    : $hits[hitstoday] <br />
      <img src='counter/total.png'> Total Hits       : $totalhits <br /><br />
      <img src='counter/online.png'> Pengunjung Online: $pengunjungonline<br /><br /></p>
      <p align='center'>$tothitsgbr </p><br />";
?>


	 </div> 	     
     
     <div class="banner_adds">

<?php
$banner=mysqli_query($connect,"SELECT * FROM banner ORDER BY id_banner DESC LIMIT 4");
while($b=mysqli_fetch_array($banner)){
  echo "<p align='center'><a href='$b[url]'' target='_blank' title='$b[judul]'><img src='foto_banner/$b[gambar]' border=0></a></p>";
}

?>
     </div>        
