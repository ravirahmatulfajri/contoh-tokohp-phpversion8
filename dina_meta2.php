<?php
      $sql2 = mysqli_query($connect,"select meta_keyword from modul where id_modul='43'");
      $j2   = mysqli_fetch_array($sql2);
		  echo "$j2[meta_keyword]";
?>
