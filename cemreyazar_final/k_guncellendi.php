<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");

    // Güncelleme işlemi sorgusu
    $KkayitNo = mysqli_real_escape_string($baglanti, $_POST['KkayitNo']);
    $ISBN = mysqli_real_escape_string($baglanti, $_POST['ISBN']);
    $KAdi = mysqli_real_escape_string($baglanti, $_POST['KAdi']);
    $KBasimYili = mysqli_real_escape_string($baglanti, $_POST['KBasimYili']);
    $KBasimYeri = mysqli_real_escape_string($baglanti, $_POST['KBasimYeri']);
    $KSayfaSayisi = mysqli_real_escape_string($baglanti, $_POST['KSayfaSayisi']);
    $KDil = mysqli_real_escape_string($baglanti, $_POST['KDil']);
    $KAciklama = mysqli_real_escape_string($baglanti, $_POST['KAciklama']);
    $YKayitNo = mysqli_real_escape_string($baglanti, $_POST['YKayitNo']);
    $YayineviKayitNo = mysqli_real_escape_string($baglanti, $_POST['YayineviKayitNo']);
    $sorgu = "UPDATE kitap SET ISBN = '$ISBN', KAdi = '$KAdi',  KBasimYili = '$KBasimYili', KBasimYeri = '$KBasimYeri', KSayfaSayisi = '$KSayfaSayisi', KDil = '$KDil', KAciklama = '$KAciklama', YKayitNo = '$YKayitNo', YayineviKayitNo = '$YayineviKayitNo' WHERE KkayitNo = $KkayitNo";

    if (mysqli_query($baglanti, $sorgu)) {
        $islemSonuc = "Kayıt başarıyla güncellendi";
    } else {
        $islemSonuc = "Kayıt güncellenirken bir hata oluştu: " . mysqli_error($baglanti);
    }

    mysqli_close($baglanti);

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kitap Güncellendi</title>
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
        
        #cmr{
            margin: auto;
        }
        
        .container p{
            
            font-size: 20px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            border: 1px solid black;
            border-width: 20%;
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
        <h1>Kitap Güncelle</h1>
        <h2><?php echo $islemSonuc; ?></h2>
        <p><a href="k_giris.php">Kitap tablosuna dön.</a></p>
</div>    
</body>
</html>
 
            
        