<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    $guncellenecek = mysqli_real_escape_string($baglanti, $_GET["YKayitNo"]);
    $sorgu = mysqli_query($baglanti, "SELECT * FROM yazar WHERE YKayitNo = $guncellenecek");
    $satir = mysqli_fetch_assoc($sorgu)
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Yazar Güncelle</title>
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
            padding-bottom: 20px;
            background-color: azure;
            border-radius: 10px;
            width: 40%;
        }
        
        .container p{
            
            font-size: 20px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            border: 1px solid black;
            width: 10%;
            border-radius: 10px;
        }

        #bir{
            margin: auto;
            width: 40%;
            background-color:azure;
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
        <h2>Yazar Güncelle</h2>
        <form action="y_guncellendi.php" method="post">
            Yazar Adı: <input type="text" value="<?php echo $satir["YAdi"] ;?>" name="YAdi"><br><br>
            Yazar Soyadı: <input type="text" value="<?php echo $satir["YSoyadi"] ;?>" name="YSoyadi"><br><br>
            Yazar Url: <input type="text" value="<?php echo $satir["YUrl"] ;?>" name="YUrl"><br><br>
            <br>
            <input type="hidden" value="<?php echo $satir["YKayitNo"] ;?>" name="YKayitNo">
            <input type="submit" value="Güncelle">
        </form>
        </div>
    </body>
</html>