<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");

    // Güncelleme işlemi sorgusu
    $YayineviKayitNo = mysqli_real_escape_string($baglanti, $_POST['YayineviKayitNo']);
    $YayineviAdi = mysqli_real_escape_string($baglanti, $_POST['YayineviAdi']);
    $YayineviURL = mysqli_real_escape_string($baglanti, $_POST['YayineviURL']);
    $sorgu = "UPDATE yayinevi SET YayineviAdi = '$YayineviAdi', YayineviURL = '$YayineviURL' WHERE YayineviKayitNo = $YayineviKayitNo";

    if (mysqli_query($baglanti, $sorgu)) {
        $islemSonuc = "Kayıt başarıyla güncellendi";
    } else {
        $islemSonuc = "Kayıt güncellenirken bir hata oluştu: " . mysqli_error($baglanti);
    }

    mysqli_close($baglanti);

?>
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Yayınevi Güncellendi</title>
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
            width: 45%;
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
        <h1>Yayınevi Güncelle</h1>
        <h2><?php echo $islemSonuc; ?></h2>
        <p><a href="yayinevi_giris.php">Yayınevi tablosuna dön</a></p>
    </div>
</body>
</html>
