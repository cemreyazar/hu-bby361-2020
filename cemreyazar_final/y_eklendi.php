<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");

    /* Ekleme işlemi sorgusu */
    $YAdi = mysqli_real_escape_string($baglanti, $_POST['YAdi']);
    $YSoyadi = mysqli_real_escape_string($baglanti, $_POST['YSoyadi']);
    $YUrl = mysqli_real_escape_string($baglanti, $_POST['YUrl']);
    $sorgu = "INSERT INTO yazar (YAdi, YSoyadi, YUrl)
            VALUES ('$YAdi', '$YSoyadi', '$YUrl')";

    if (mysqli_query($baglanti, $sorgu)) {
        $islemSonuc = "Yeni kayıt başarıyla oluşturuldu.";
        
    } else {
        $islemSonuc = "Hata: " . $sorgu . "<br>" . mysqli_error($baglanti);
    }


    mysqli_close($baglanti);

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Yazar Eklendi</title>
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
            width: 40%;
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
        <h2>Yazar Ekle</h2>
        <h2><?php echo $islemSonuc; ?></h2>
        <p><a href="y_ekle.php">Yazar Ekle</a></p>
        <p><a href="y_giris.php">Yazar tablosuna dön</a></p>
</div>
</body>
</html>

