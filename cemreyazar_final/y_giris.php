<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    $sorgu = mysqli_query($baglanti, "SELECT * FROM yazar");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Yazar Listesi</title>
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
            width: 85%;
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
        <h2>Yazar Listesi</h2>
        <p><a href="y_ekle.php">Yazar ekle</a></p>
        <?php
            echo("<table id=cmr border=1 width=80%>");
                echo("<tr>");
                    echo("<td><b>Yazar Kayıt No</b></td>");
                    echo("<td><b>Yazar Kayıt Tarihi</b></td>");
                    echo("<td><b>Yazar Adı</b></td>");
                    echo("<td><b>Yazar Soyadı</b></td>");
                    echo("<td><b>Yazar Url</b></td>");
                    echo("<td><b>Kayıt Güncelle</b></td>");
                    echo("<td><b>Kayıt Sil</b></td>");
                echo("</tr>");
            /* Sorgu sonuçlarının yazdırılması */
            while($satir = mysqli_fetch_assoc($sorgu)){
                echo("<tr>");
                echo("<td>".$satir["YKayitNo"]."</td>"); 
                echo("<td>".$satir["YKayitTarihi"]."</td>"); 
                echo("<td>".$satir["YAdi"]."</td>");
                echo("<td>".$satir["YSoyadi"]."</td>");
                echo("<td>".$satir["YUrl"]."</td>");
                echo("<td><b><a href='y_guncelle.php?YKayitNo=".$satir["YKayitNo"]."'>Kayıt Güncelle </a></td>");
                echo("<td><b><a href='y_sil.php?YKayitNo=".$satir["YKayitNo"]."'>Kayıt Sil </a></td>");
                echo("</tr>");
            }
            echo("</table>");
        ?>
        </div>
    </body>
</html>