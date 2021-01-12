-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Oca 2021, 17:28:58
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
  `KBasimYili` year(4) NOT NULL COMMENT 'Kitabın basım yılı',
  `KBasimYeri` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın basım yeri',
  `KSayfaSayisi` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın sayfa sayısı',
  `KDil` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın dili',
  `YayineviKayitNo` int(11) NOT NULL COMMENT 'Yayınevi kayıt numarası bilgisi',
  `YKayitNo` int(11) NOT NULL COMMENT 'Yazar kayıt numarası',
  `KAciklama` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`KkayitNo`, `KKayitTarihi`, `ISBN`, `KAdi`, `KBasimYili`, `KBasimYeri`, `KSayfaSayisi`, `KDil`, `YayineviKayitNo`, `YKayitNo`, `KAciklama`) VALUES
(1, '2020-11-02 21:30:58', '9786055272296', 'MOMO', 2013, 'İstanbul', '303 s.', 'TR', 1, 1, 'Fantastik Kurgu'),
(2, '2020-11-02 21:52:53', '9789750739057', 'Şeker Portakalı', 2018, 'İstanbul', '527 s.', 'TR', 2, 2, 'Otobiyografik Kurgu'),
(3, '2020-11-02 21:57:05', '9786055127824', 'Küçük Prens', 2015, 'İstanbul', '79 s.', 'TR', 3, 3, 'Masal, Fabl'),
(4, '2020-11-02 22:00:39', '9786059604741', 'Çizgili Pijamalı Çocuk', 2017, 'İstanbul', '198 s.', 'TR', 4, 4, 'Tarihi Kurgu, Fabl'),
(5, '2020-11-02 22:04:34', '9789750815546', 'Pal Sokağı Çocukları', 2013, 'İstanbul', '235 s.', 'TR', 5, 5, 'Roman'),
(6, '2020-11-02 22:12:31', '9789750812989', 'Harry Potter ve Ölüm Yadigarları', 2014, 'İstanbul', '690 s.', 'TR', 6, 6, 'Fantastik Kurgu'),
(7, '2020-11-02 22:15:00', '9789750816475', 'Dede Korkut', 2019, 'İstanbul', '302 s.', 'TR', 7, 7, 'Epik Şiir'),
(8, '2020-11-02 22:16:54', '9786051418971', 'Masal Masal İçinde', 2015, 'İstanbul', '157 s.', 'TR', 8, 8, 'Öykü kitabı'),
(9, '2020-11-02 22:19:46', '9786050922912', 'Sakız Sardunya', 2015, 'İstanbul', '151 s.', 'TR', 9, 9, 'Öykü kitabı'),
(10, '2020-11-02 22:23:42', '9789756093139', 'Şu hortumlu dünyada fil yalnız bir hayvandır', 2015, 'İstanbul', '161 s.', 'TR', 10, 10, 'Öğretici kitap');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `liste`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `liste` (
`KAdi` varchar(50)
,`AdSoyad` varchar(101)
,`YayineviAdi` varchar(50)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayinevi`
--

CREATE TABLE `yayinevi` (
  `YayineviKayitNo` int(11) NOT NULL COMMENT 'Yayınevi bilgisinin ana anahtarı',
  `YayineviAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevi adı',
  `YayineviKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `YayineviURL` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitabın yayınevi bilgileri';

--
-- Tablo döküm verisi `yayinevi`
--

INSERT INTO `yayinevi` (`YayineviKayitNo`, `YayineviAdi`, `YayineviKayitTarihi`, `YayineviURL`) VALUES
(1, 'Kabalcı Yayınları', '2021-01-04 20:24:29', 'https://www.meltemkabalcikitabevi.com.tr/kabalci-yayinevi'),
(2, 'Can Yayınları', '2021-01-04 20:24:29', 'https://canyayinlari.com/'),
(3, 'Mitos Boyut', '2021-01-04 20:24:29', 'https://www.mitosboyut.com.tr/'),
(4, 'Tudem', '2021-01-04 20:24:29', 'https://www.tudem.com/'),
(5, 'Yapı Kredi Yayınları', '2021-01-04 20:24:29', 'https://www.yapikrediyayinlari.com.tr/'),
(6, 'Yapı Kredi Yayınları', '2021-01-04 20:24:29', 'https://www.yapikrediyayinlari.com.tr/'),
(7, 'Yapı Kredi', '2021-01-04 20:24:29', 'https://www.yapikrediyayinlari.com.tr/'),
(8, 'Everest Yayınları', '2021-01-04 20:24:29', 'https://www.everestyayinlari.com/'),
(9, 'Doğan Egmont Yayıncılık', '2021-01-04 20:24:29', 'https://doganegmont.com.tr/giris'),
(10, 'Elma Yayınevi', '2021-01-04 20:24:29', 'https://www.elmayayinevi.com/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `YKayitNo` int(11) NOT NULL COMMENT 'Kitap yazar bilgisinin ana anahtarı',
  `YAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `YSoyadi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `YUrl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `YKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitap yazar bilgileri';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`YKayitNo`, `YAdi`, `YSoyadi`, `YUrl`, `YKayitTarihi`) VALUES
(1, 'Michael ', 'Ende', 'https://tr.wikipedia.org/wiki/Michael_Ende', '2021-01-04 20:22:28'),
(2, 'Jose Mauro de', 'Vasconcelos', 'https://canyayinlari.com/kisidetay/yazarlar/11949/jos-mauro-de-vasconcelos/', '2021-01-04 20:22:28'),
(3, 'Antoine de', 'Saint Exupery', 'https://tr.wikipedia.org/wiki/Antoine_de_Saint-Exup%C3%A9ry', '2021-01-04 20:22:28'),
(4, 'John', 'Boyne', 'https://en.wikipedia.org/wiki/John_Boyne', '2021-01-04 20:22:28'),
(5, 'Ferenc', 'Molnar', 'https://tr.wikipedia.org/wiki/Ferenc_Moln%C3%A1r', '2021-01-04 20:22:28'),
(6, 'J. K.', 'Rowling', 'https://tr.wikipedia.org/wiki/J._K._Rowling', '2021-01-04 20:22:28'),
(7, 'Adnan', 'Binyazar', 'https://tr.wikipedia.org/wiki/Adnan_Binyazar', '2021-01-04 20:22:28'),
(8, 'Ahmet', 'Ümit', 'https://tr.wikipedia.org/wiki/Ahmet_%C3%9Cmit', '2021-01-04 20:22:28'),
(9, 'Elif', 'Şafak', 'https://tr.wikipedia.org/wiki/Elif_%C5%9Eafak', '2021-01-04 20:22:28'),
(10, 'Ahmet Şerif', 'İzgören', 'https://tr.wikipedia.org/wiki/Ahmet_%C5%9Eerif_%C4%B0zg%C3%B6ren', '2021-01-04 20:22:28');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `yeni_liste`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `yeni_liste` (
`Kitap_Adı` varchar(50)
,`ISBN` varchar(13)
,`Kitabın_Dili` varchar(50)
,`Basım_Yılı` year(4)
,`Ad_Soyad` varchar(101)
,`YUrl` varchar(100)
,`yayineviAdi` varchar(50)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `liste`
--
DROP TABLE IF EXISTS `liste`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste`  AS  select `k`.`KAdi` AS `KAdi`,concat(`r`.`YAdi`,' ',`r`.`YSoyadi`) AS `AdSoyad`,`y`.`YayineviAdi` AS `YayineviAdi` from ((`kitap` `k` join `yayinevi` `y`) join `yazar` `r`) where `k`.`YayineviKayitNo` = `y`.`YayineviKayitNo` and `k`.`YKayitNo` = `r`.`YKayitNo` ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `yeni_liste`
--
DROP TABLE IF EXISTS `yeni_liste`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yeni_liste`  AS  select `k`.`KAdi` AS `Kitap_Adı`,`k`.`ISBN` AS `ISBN`,`k`.`KDil` AS `Kitabın_Dili`,`k`.`KBasimYili` AS `Basım_Yılı`,concat(`r`.`YAdi`,' ',`r`.`YSoyadi`) AS `Ad_Soyad`,`r`.`YUrl` AS `YUrl`,`y`.`YayineviAdi` AS `yayineviAdi` from ((`kitap` `k` join `yazar` `r`) join `yayinevi` `y`) where `k`.`YayineviKayitNo` = `y`.`YayineviKayitNo` and `k`.`YKayitNo` = `r`.`YKayitNo` ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`KkayitNo`);

--
-- Tablo için indeksler `yayinevi`
--
ALTER TABLE `yayinevi`
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
  MODIFY `KkayitNo` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Kitap tablosunun ana anahtarı', AUTO_INCREMENT=77;

--
-- Tablo için AUTO_INCREMENT değeri `yayinevi`
--
ALTER TABLE `yayinevi`
  MODIFY `YayineviKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yayınevi bilgisinin ana anahtarı', AUTO_INCREMENT=44;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `YKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Kitap yazar bilgisinin ana anahtarı', AUTO_INCREMENT=40;
--
-- Veritabanı: `katalog`
--
CREATE DATABASE IF NOT EXISTS `katalog` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `katalog`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kitapNo` int(11) NOT NULL,
  `kitapKayit` timestamp NOT NULL DEFAULT current_timestamp(),
  `yazarNo` smallint(6) NOT NULL,
  `kitapTurNo` tinyint(4) NOT NULL,
  `kitapAd` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `kitapISBN` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `kitapYil` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaptur`
--

CREATE TABLE `kitaptur` (
  `kitapTurNo` tinyint(4) NOT NULL,
  `kitapTurAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kitapTurDetay` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitap tür bilgisi';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazarNo` smallint(6) NOT NULL,
  `yazarAd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `yazarSoyad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `yazarURL` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazar bilgisi';

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`kitapNo`),
  ADD UNIQUE KEY `kitapISBN` (`kitapISBN`);

--
-- Tablo için indeksler `kitaptur`
--
ALTER TABLE `kitaptur`
  ADD PRIMARY KEY (`kitapTurNo`),
  ADD UNIQUE KEY `kitapTurAdi` (`kitapTurAdi`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazarNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kitapNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kitaptur`
--
ALTER TABLE `kitaptur`
  MODIFY `kitapTurNo` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazarNo` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- Veritabanı: `mesaj`
--
CREATE DATABASE IF NOT EXISTS `mesaj` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `mesaj`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesajNo` int(11) NOT NULL,
  `mesajTarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `adSoyad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mesajicerik` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`mesajNo`, `mesajTarih`, `adSoyad`, `mesajicerik`) VALUES
(1, '2020-12-12 16:25:34', 'Cemre YAZAR', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(2, '2020-12-12 16:25:34', 'Özge YAZAR', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.'),
(45, '2020-12-14 16:13:06', 'orhan pamuk', 'yeni kitaplar'),
(58, '2020-12-14 16:34:59', 'vc', 'fc'),
(59, '2020-12-14 17:05:49', 'sda', 'sad');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesajNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesajNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- Veritabanı: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Tablo döküm verisi `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cemreyazar_01\",\"table\":\"kitap\"},{\"db\":\"cemreyazar_01\",\"table\":\"yazar\"},{\"db\":\"cemreyazar_01\",\"table\":\"yayinevi\"},{\"db\":\"mesaj\",\"table\":\"mesajlar\"},{\"db\":\"katalog\",\"table\":\"kitaptur\"},{\"db\":\"cemreyazar_01\",\"table\":\"yeni_liste\"},{\"db\":\"cemreyazar_01\",\"table\":\"liste\"},{\"db\":\"katalog\",\"table\":\"kitap\"},{\"db\":\"katalog\",\"table\":\"yazar\"},{\"db\":\"cemreyazar_01\",\"table\":\"yeniliste\"}]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Tablo döküm verisi `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-01-12 16:25:42', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"tr\"}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Tablo için indeksler `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Tablo için indeksler `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Tablo için indeksler `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Tablo için indeksler `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Tablo için indeksler `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Tablo için indeksler `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Tablo için indeksler `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Tablo için indeksler `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Tablo için indeksler `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Tablo için indeksler `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Tablo için indeksler `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Tablo için indeksler `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Veritabanı: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
