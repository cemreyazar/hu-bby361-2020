<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    
    $guncellenecek = mysqli_real_escape_string($baglanti, $_GET["KkayitNo"]);
    $sorgu = mysqli_query($baglanti, "SELECT * FROM kitap WHERE KkayitNo = $guncellenecek");
    $satir = mysqli_fetch_assoc($sorgu);
    $sorgu2 = mysqli_query($baglanti, "SELECT *, CONCAT(YAdi, ' ', YSoyadi) AS AdSoyad FROM yazar");
    $satir2 = mysqli_fetch_assoc($sorgu2);
    $sorgu3 = mysqli_query($baglanti, "SELECT * FROM yayinevi");
    $satir3 = mysqli_fetch_assoc($sorgu3);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Kitap Güncelle</title>
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
            text-align: center;
            margin: auto;
            margin-top: 20px;
            background-color: azure;
            border-radius: 10px;
            width: 40%;
            padding-bottom: 10px;
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
        <h2>Kitap Güncelle</h2>
        <form action="k_guncellendi.php" method="post">
            Kitap Adı: <input type="text" value="<?php echo $satir["KAdi"] ;?>" name="KAdi"><br><br>
            ISBN: <input type="text" value="<?php echo $satir["ISBN"] ;?>" name="ISBN"><br><br>
            Basım Yılı: <input type="text" value="<?php echo $satir["KBasimYili"] ;?>" name="KBasimYili"><br><br>
            Basım Yeri: <input type="text" value="<?php echo $satir["KBasimYeri"] ;?>" name="KBasimYeri"><br><br>
            Sayfa Sayısı: <input type="text" value="<?php echo $satir["KSayfaSayisi"] ;?>" name="KSayfaSayisi"><br><br>
            Dil: <input type="text" value="<?php echo $satir["KDil"] ;?>" name="KDil"><br><br>
            Kitap Açıklaması: <input type="text" value="<?php echo $satir["KAciklama"] ;?>" name="KAciklama"><br><br>
        
            Yazar Adı: <select name="YKayitNo" id="YKayitNo">
            <?php while($satir2 = mysqli_fetch_assoc($sorgu2)){ ?>
            <option value="<?php echo $satir2['YKayitNo']; ?>"><?php echo $satir2['AdSoyad']; ?></option>
            <?php } ?>
            </select> <br><br>
            
            Yayınevi Adı: <select name="YayineviKayitNo" id="YayineviKayitNo">
            <?php while($satir3 = mysqli_fetch_assoc($sorgu3)){ ?>
            <option value="<?php echo $satir3['YayineviKayitNo']; ?>"><?php echo $satir3['YayineviAdi']; ?></option>
            <?php } ?>
            </select> <br><br>
            <input type="hidden" value="<?php echo $satir["KkayitNo"] ;?>" name="KkayitNo">
            <input type="submit" value="Güncelle">
        </form>
</div>
</body>
</html>