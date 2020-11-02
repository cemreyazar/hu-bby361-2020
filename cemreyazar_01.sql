-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Kas 2020, 23:41:50
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `cemreyazar_01`
--
CREATE DATABASE IF NOT EXISTS `cemreyazar_01` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cemreyazar_01`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `KkayitNo` smallint(6) NOT NULL COMMENT 'Kitap tablosunun ana anahtarı',
  `KKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Kitabın veri tabanına kayıt tarihi',
  `ISBN` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın ISBN bilgisi ',
  `KAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın tam adı',
  `KBasimYili` date NOT NULL COMMENT 'Kitabın basım yılı',
  `KBasimYeri` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın basım yeri',
  `KFizikselOzellikleri` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın fiziksel özellikleri',
  `KDil` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın dili'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`KkayitNo`, `KKayitTarihi`, `ISBN`, `KAdi`, `KBasimYili`, `KBasimYeri`, `KFizikselOzellikleri`, `KDil`) VALUES
(1, '2020-11-02 21:30:58', '9786055272296', 'MOMO', '0000-00-00', 'İstanbul', '303 s.', 'Türkçe'),
(2, '2020-11-02 21:52:53', '9789750739057', 'Şeker Portakalı', '0000-00-00', 'İstanbul', '527 s.', 'Türkçe'),
(3, '2020-11-02 21:57:05', '9786055127824', 'Küçük Prens', '0000-00-00', 'İstanbul', '79 s.', 'Türkçe'),
(4, '2020-11-02 22:00:39', '9786059604741', 'Çizgili Pijamalı Çocuk', '0000-00-00', 'İstanbul', '198 s.', 'Türkçe'),
(5, '2020-11-02 22:04:34', '9789750815546', 'Pal Sokağı Çocukları', '0000-00-00', 'İstanbul', '235 s.', 'Türkçe'),
(6, '2020-11-02 22:12:31', '9789750812989', 'Harry Potter ve Ölüm Yadigarları', '0000-00-00', 'İstanbul', '690 s.', 'Türkçe'),
(7, '2020-11-02 22:15:00', '9789750816475', 'Dede Korkut', '0000-00-00', 'İstanbul', '302 s.', 'Türkçe'),
(8, '2020-11-02 22:16:54', '9786051418971', 'Masal Masal İçinde', '0000-00-00', 'İstanbul', '157 s.', 'Türkçe'),
(9, '2020-11-02 22:19:46', '9786050922912', 'Sakız Sardunya', '0000-00-00', 'İstanbul', '151 s.', 'Türkçe'),
(10, '2020-11-02 22:23:42', '9789756093139', 'Şu hortumlu dünyada fil yalnız bir hayvandır', '0000-00-00', 'İstanbul', '161 s.', 'Türkçe');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayınevi`
--

CREATE TABLE `yayınevi` (
  `YayineviKayitNo` int(11) NOT NULL COMMENT 'Yyaınevi bilgisinin ana anahtarı',
  `YayineviAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yyaınevi adı'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitabın yayınevi bilgileri';

--
-- Tablo döküm verisi `yayınevi`
--

INSERT INTO `yayınevi` (`YayineviKayitNo`, `YayineviAdi`) VALUES
(1, 'Kabalcı Yayınları'),
(2, 'Can Yayınları'),
(3, 'Mitos Boyut'),
(4, 'Tudem'),
(5, 'Yapı Kredi'),
(6, 'YKY'),
(7, 'Yapı Kredi'),
(8, 'Everest Yayınları'),
(9, 'Doğan Egmont Yayıncılık'),
(10, 'Elma Yayınevi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `YKayitNo` int(11) NOT NULL COMMENT 'Kitap yazar bilgisinin ana anahtarı',
  `YAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `YSoyadi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `YUrl` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitap yazar bilgileri';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`YKayitNo`, `YAdi`, `YSoyadi`, `YUrl`) VALUES
(1, 'Michael ', 'Ende', 'https://tr.wikipedia.org/wiki/Michael_Ende'),
(2, 'Jose Mauro de', 'Vasconcelos', 'https://canyayinlari.com/kisidetay/yazarlar/11949/jos-mauro-de-vasconcelos/'),
(3, 'Antoine de', 'Saint Exupery', 'https://tr.wikipedia.org/wiki/Antoine_de_Saint-Exup%C3%A9ry'),
(4, 'John', 'Boyne', 'https://en.wikipedia.org/wiki/John_Boyne'),
(5, 'Ferenc', 'Molnar', 'https://tr.wikipedia.org/wiki/Ferenc_Moln%C3%A1r'),
(6, 'J. K.', 'Rowling', 'https://tr.wikipedia.org/wiki/J._K._Rowling'),
(7, 'Adnan', 'Binyazar', 'https://tr.wikipedia.org/wiki/Adnan_Binyazar'),
(8, 'Ahmet', 'Ümit', 'https://tr.wikipedia.org/wiki/Ahmet_%C3%9Cmit'),
(9, 'Elif', 'Şafak', 'https://tr.wikipedia.org/wiki/Elif_%C5%9Eafak'),
(10, 'Ahmet Şerif', 'İzgören', 'https://tr.wikipedia.org/wiki/Ahmet_%C5%9Eerif_%C4%B0zg%C3%B6ren');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`KkayitNo`);

--
-- Tablo için indeksler `yayınevi`
--
ALTER TABLE `yayınevi`
  ADD PRIMARY KEY (`YayineviKayitNo`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`YKayitNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `KkayitNo` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Kitap tablosunun ana anahtarı', AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yayınevi`
--
ALTER TABLE `yayınevi`
  MODIFY `YayineviKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yyaınevi bilgisinin ana anahtarı', AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `YKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Kitap yazar bilgisinin ana anahtarı', AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
