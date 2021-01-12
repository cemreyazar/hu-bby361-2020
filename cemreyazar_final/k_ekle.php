<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    $sorgu = mysqli_query($baglanti, "SELECT *, CONCAT(YAdi, ' ', YSoyadi) AS AdSoyad FROM yazar");
    $sorgu2 = mysqli_query($baglanti, "SELECT *, YayineviAdi FROM yayinevi");
   
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kitap Ekle</title>
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
<h2>Kitap Ekle</h2>
<form action="k_eklendi.php" method="post">
    Kitap Adı: <input type="text" name="KAdi"><br><br>
    ISBN:  <input type="text" name="ISBN"><br><br>
    Basım Yılı: <input type="text" name="KBasimYili"><br><br>
    Basım Yeri: <input type="text" name="KBasimYeri"><br><br>
    Sayfa Sayısı: <input type="text" name="KSayfaSayisi"><br><br>
    Dili: <input type="text" name="KDil"><br><br>
    Yazar Adı: <select name="YKayitNo">
        <?php while($satir = mysqli_fetch_assoc($sorgu)){ ?>
        <option value="<?php echo $satir['YKayitNo']; ?>"><?php echo $satir['AdSoyad']; ?></option>
        <?php } ?>
    </select> <br><br>
    
     Yayinevi Adı: <select name="YayineviKayitNo" id="YayineviKayitNo">
    <?php while($satir2 = mysqli_fetch_assoc($sorgu2)){ ?>
    <option value="<?php echo $satir2['YayineviKayitNo']; ?>"><?php echo $satir2['YayineviAdi']; ?></option>
    <?php } ?>
    </select> <br><br>
     Kitap Açıklaması: <input type="text" name="KAciklama"><br><br>
   
    <input type="submit" value="Ekle"><br><br><br><br>
    
</form>
</div>
</body>
</html>
