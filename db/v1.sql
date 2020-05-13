-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 192.168.79.3    Database: e-commerce
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detailSeller`
--

DROP TABLE IF EXISTS `detailSeller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detailSeller` (
  `idDetailSeller` int(11) NOT NULL AUTO_INCREMENT,
  `idSeller` int(11) DEFAULT NULL,
  `deksripsiSeller` varchar(500) DEFAULT NULL,
  `idBank` int(11) DEFAULT NULL,
  `norek` varchar(45) DEFAULT NULL,
  `kredit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDetailSeller`),
  KEY `f` (`idSeller`),
  KEY `fk_detailSeller_2_idx` (`idBank`),
  CONSTRAINT `fk_detailSeller_1` FOREIGN KEY (`idSeller`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detailSeller_2` FOREIGN KEY (`idBank`) REFERENCES `kodeBank` (`idBank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailSeller`
--

LOCK TABLES `detailSeller` WRITE;
/*!40000 ALTER TABLE `detailSeller` DISABLE KEYS */;
/*!40000 ALTER TABLE `detailSeller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotoProduk`
--

DROP TABLE IF EXISTS `fotoProduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotoProduk` (
  `idFoto` int(11) NOT NULL AUTO_INCREMENT,
  `idProduk` int(11) DEFAULT NULL,
  `dirFoto` varchar(450) DEFAULT NULL,
  `altFoto` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idFoto`),
  KEY `s` (`idProduk`),
  CONSTRAINT `fk_fotoProduk_1` FOREIGN KEY (`idProduk`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotoProduk`
--

LOCK TABLES `fotoProduk` WRITE;
/*!40000 ALTER TABLE `fotoProduk` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotoProduk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL AUTO_INCREMENT,
  `namaKategori` varchar(450) DEFAULT NULL,
  `iconKategori` varchar(450) DEFAULT NULL,
  `deskripsiKategori` varchar(450) DEFAULT NULL,
  `dateCreated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idkategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kodeBank`
--

DROP TABLE IF EXISTS `kodeBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kodeBank` (
  `idBank` int(11) NOT NULL,
  `kodeBank` varchar(10) DEFAULT NULL,
  `namaBank` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kodeBank`
--

LOCK TABLES `kodeBank` WRITE;
/*!40000 ALTER TABLE `kodeBank` DISABLE KEYS */;
/*!40000 ALTER TABLE `kodeBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `idPembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `idTransaksi` int(11) DEFAULT NULL,
  `norekPengirim` varchar(45) DEFAULT NULL,
  `nominal` varchar(45) DEFAULT NULL,
  `tanggalBayar` varchar(450) DEFAULT NULL,
  `buktiPembayaran` varchar(450) DEFAULT NULL,
  `notes` varchar(450) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPembayaran`),
  KEY `w` (`idTransaksi`),
  CONSTRAINT `fk_pembayaran_1` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi` (`idTransaksi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengiriman`
--

DROP TABLE IF EXISTS `pengiriman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengiriman` (
  `idPengiriman` int(11) NOT NULL AUTO_INCREMENT,
  `noResi` varchar(45) DEFAULT NULL,
  `ongkir` varchar(45) DEFAULT NULL,
  `asal` varchar(450) DEFAULT NULL,
  `tujuan` varchar(450) DEFAULT NULL,
  `kurirEkspedisi` varchar(450) DEFAULT NULL,
  `notes` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idPengiriman`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengiriman`
--

LOCK TABLES `pengiriman` WRITE;
/*!40000 ALTER TABLE `pengiriman` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengiriman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `idOwner` int(11) NOT NULL,
  `harga` varchar(450) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `berat` varchar(450) DEFAULT NULL,
  `dimensi` varchar(450) DEFAULT NULL,
  `deskripsi` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `ref` (`idOwner`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`idOwner`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rateReview`
--

DROP TABLE IF EXISTS `rateReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rateReview` (
  `idRateReview` int(11) NOT NULL AUTO_INCREMENT,
  `idCustomer` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `rate` varchar(5) DEFAULT NULL,
  `review` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idRateReview`),
  KEY `r` (`idCustomer`),
  KEY `v` (`idProduct`),
  CONSTRAINT `fk_rateReview_1` FOREIGN KEY (`idCustomer`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rateReview_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rateReview`
--

LOCK TABLES `rateReview` WRITE;
/*!40000 ALTER TABLE `rateReview` DISABLE KEYS */;
/*!40000 ALTER TABLE `rateReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokenAktifasi`
--

DROP TABLE IF EXISTS `tokenAktifasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokenAktifasi` (
  `idToken` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(450) DEFAULT NULL,
  `email` varchar(450) DEFAULT NULL,
  `dateCreated` varchar(45) DEFAULT NULL,
  `dateExpired` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idToken`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokenAktifasi`
--

LOCK TABLES `tokenAktifasi` WRITE;
/*!40000 ALTER TABLE `tokenAktifasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokenAktifasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trKategori`
--

DROP TABLE IF EXISTS `trKategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trKategori` (
  `idTr` int(11) NOT NULL AUTO_INCREMENT,
  `idKategori` int(11) DEFAULT NULL,
  `idProduk` int(11) DEFAULT NULL,
  `dateCreated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTr`),
  KEY `a` (`idKategori`),
  KEY `b` (`idProduk`),
  CONSTRAINT `fk_trKategori_1` FOREIGN KEY (`idProduk`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trKategori_2` FOREIGN KEY (`idKategori`) REFERENCES `kategori` (`idkategori`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trKategori`
--

LOCK TABLES `trKategori` WRITE;
/*!40000 ALTER TABLE `trKategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `trKategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `idTransaksi` int(11) NOT NULL AUTO_INCREMENT,
  `idCustomer` int(11) DEFAULT NULL,
  `idSeller` int(11) DEFAULT NULL,
  `idProduk` int(11) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL,
  `nominal` varchar(45) DEFAULT NULL,
  `dateCreated` varchar(45) DEFAULT NULL,
  `dateExpired` varchar(45) DEFAULT NULL,
  `idPengiriman` int(11) DEFAULT NULL,
  `status` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idTransaksi`),
  KEY `y` (`idCustomer`),
  KEY `m` (`idSeller`),
  KEY `g` (`idProduk`),
  CONSTRAINT `fk_transaksi_1` FOREIGN KEY (`idCustomer`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaksi_2` FOREIGN KEY (`idSeller`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaksi_3` FOREIGN KEY (`idProduk`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `photoProfile` varchar(45) DEFAULT NULL,
  `notelp` varchar(45) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `dateRegister` varchar(450) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `a` (`idRole`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`idRole`) REFERENCES `userRole` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userRole`
--

DROP TABLE IF EXISTS `userRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRole` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  `roleDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRole`
--

LOCK TABLES `userRole` WRITE;
/*!40000 ALTER TABLE `userRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal`
--

DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawal` (
  `idWithdrawal` int(11) NOT NULL AUTO_INCREMENT,
  `idSeller` int(11) DEFAULT NULL,
  `nominal` varchar(60) DEFAULT NULL,
  `dateCreated` varchar(450) DEFAULT NULL,
  `dateApproved` varchar(450) DEFAULT NULL,
  `notes` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idWithdrawal`),
  KEY `index2` (`idSeller`),
  CONSTRAINT `fk_withdrawal_1` FOREIGN KEY (`idSeller`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal`
--

LOCK TABLES `withdrawal` WRITE;
/*!40000 ALTER TABLE `withdrawal` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-13 16:15:48
