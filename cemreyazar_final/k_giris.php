<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    $sorgu = mysqli_query($baglanti, 
    "SELECT K.KkayitNo, K.KKayitTarihi, K.ISBN, K.KAdi, K.KBasimYili, K.KBasimYeri, K.KSayfaSayisi, K.KDil, K.KAciklama, CONCAT(R.YAdi,' ', R.YSoyadi) AS KitapYazar, Y.YayineviAdi FROM kitap K, yazar R, yayinevi Y
    WHERE K.YayineviKayitNo = Y.YayineviKayitNo AND K.YKayitNo = R.YKayitNo ");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kitap Listesi</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
    
    <style>
        body{
            background-image:url(mavi.jpg);
            background-size: cover;
            text-align: center;
            font-family:sans-serif;
            
        }
        
        .container{
            margin: auto;
            margin-top: 20px;
            background-color: rgba(255,255,255,0.5);
            border-radius: 10px;
            padding-bottom: 10px;
            
        }
        
        h2{
            color: #0C154A;
        }
        
        #cmr{
            margin: auto;
            width: 98%;
        }
        
        .container p{
            
            font-size: 20px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            border: 1px solid black;
            width: 10%;
            border-radius: 10px;
            background-color: azure;
        }
        
        #bir{
            margin: auto;
            width: 40%;
            color: #0C154A;
            background-color: rgba(255,255,255,0.5);
            border-radius: 10px;
            font-size: 25px;
        }
        
        .btn{
            background-color: azure;  
        }
        
    </style>

    <body>
        
    <div id="bir"> 
      <h1 class="cover-heading">Çocuk Kütüphanesi</h1>
    </div>
 

  <div id="iki">
    
    <a href="k_giris.php" class="btn btn-lg btn-secondary">Kitap Listesi</a>
    <a href="y_giris.php" class="btn btn-lg btn-secondary">Yazar Listesi</a>
    <a href="yayinevi_giris.php" class="btn btn-lg btn-secondary">Yayınevi Listesi</a>
    
  

  
</div>
        <div class="container">
        <h2>Kitap Listesi</h2>
        <p><a href="k_ekle.php">Kitap Ekle</a></p>
        <?php
            echo("<table id=cmr border=1 width=80% >");
                echo("<tr>");
                echo("<td><b>Kitap Kayıt No</b></td>"); 
                echo("<td><b>Kitap Kayıt Tarihi</b></td>");
                echo("<td><b>ISBN</b></td>");
                echo("<td><b>Kitap Adı</b></td>");
                echo("<td><b>Kitap Basım Yılı</b></td>");
                echo("<td><b>Kitap Basım Yeri</b></td>");
                echo("<td><b>Kitap Sayfa Sayısı</b></td>");
                echo("<td><b>Kitap Dili</b></td>");
                echo("<td><b>Kitap Açıklaması</b></td>");
                echo("<td><b>Yazar </b></td>");
                echo("<td><b>Yayınevi </b></td>");
                echo("<td><b>Güncelle</b></td>");
                echo("<td><b>Sil</b></td>");
                echo("</tr>");
            /* Sorgu sonuçlarının yazdırılması */
            while($satir = mysqli_fetch_assoc($sorgu)){
                echo("<tr>");
                echo("<td>".$satir["KkayitNo"]."</td>");               
                echo("<td>".$satir["KKayitTarihi"]."</td>");
                echo("<td>".$satir["ISBN"]."</td>");
                echo("<td>".$satir["KAdi"]."</td>");
                echo("<td>".$satir["KBasimYili"]."</td>");  
                echo("<td>".$satir["KBasimYeri"]."</td>");
                echo("<td>".$satir["KSayfaSayisi"]."</td>");
                echo("<td>".$satir["KDil"]."</td>");
                echo("<td>".$satir["KAciklama"]."</td>");
                echo("<td>".$satir["KitapYazar"]."</td>");
                echo("<td>".$satir["YayineviAdi"]."</td>");  
                echo("<td><b><a href='k_guncelle.php?KkayitNo=".$satir["KkayitNo"]."'>Kayıt Güncelle</a></td>");
                echo("<td><b><a href='k_sil.php?KkayitNo=".$satir["KkayitNo"]."'>Kayıt Sil</a></td>");
                echo("</tr>");
            }
            echo("</table>");
        ?>
    
        </div>
    </body>
</html>