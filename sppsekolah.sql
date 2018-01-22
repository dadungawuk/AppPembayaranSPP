/*
Navicat MySQL Data Transfer

Source Server         : LATIHAN
Source Server Version : 100128
Source Host           : localhost:3306
Source Database       : sppsekolah

Target Server Type    : MYSQL
Target Server Version : 100128
File Encoding         : 65001

Date: 2018-01-22 22:55:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `idadmin` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `namalengkap` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', 'Hari Aspriyono');
INSERT INTO `admin` VALUES ('2', 'admin1', 'admin1', 'Agus Susanto');
INSERT INTO `admin` VALUES ('3', 'user', 'user', 'Hari Aspriyono');

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru` (
  `idguru` int(5) NOT NULL AUTO_INCREMENT,
  `namaguru` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idguru`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES ('1', 'BASUKI');
INSERT INTO `guru` VALUES ('2', 'RAHMAT');
INSERT INTO `guru` VALUES ('3', 'EMILIA');
INSERT INTO `guru` VALUES ('4', 'RATNA');
INSERT INTO `guru` VALUES ('5', 'JUWITA');
INSERT INTO `guru` VALUES ('6', 'RONI');
INSERT INTO `guru` VALUES ('7', 'AS\'AD');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `idsiswa` int(10) NOT NULL AUTO_INCREMENT,
  `nis` varchar(10) DEFAULT NULL,
  `namasiswa` varchar(40) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `tahunajaran` varchar(10) DEFAULT NULL,
  `biaya` int(20) DEFAULT NULL,
  PRIMARY KEY (`idsiswa`),
  KEY `fk_kelas` (`kelas`),
  CONSTRAINT `fk_kelas` FOREIGN KEY (`kelas`) REFERENCES `walikelas` (`kelas`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES ('8', '2017100001', 'Eka Suryani S', 'VIIA', '2017/2018', '250000');
INSERT INTO `siswa` VALUES ('9', '2017100002', 'BAMBANG GENTOLET', 'VIIA', '2017/2018', '250000');
INSERT INTO `siswa` VALUES ('10', '2017100003', 'HANGGARA', 'VIIA', '2017/2018', '250000');
INSERT INTO `siswa` VALUES ('11', '2017100004', 'AHMAD', 'VIIA', '2017/2018', '250000');

-- ----------------------------
-- Table structure for spp
-- ----------------------------
DROP TABLE IF EXISTS `spp`;
CREATE TABLE `spp` (
  `idspp` int(100) NOT NULL AUTO_INCREMENT,
  `idsiswa` int(10) DEFAULT NULL,
  `jatuhtempo` date DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `nobayar` varchar(10) DEFAULT NULL,
  `tglbayar` date DEFAULT NULL,
  `jumlah` int(20) DEFAULT NULL,
  `ket` varchar(20) DEFAULT NULL,
  `idadmin` int(5) DEFAULT NULL,
  PRIMARY KEY (`idspp`),
  KEY `fk_admin` (`idadmin`),
  KEY `fk_siswa` (`idsiswa`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`idadmin`) ON UPDATE CASCADE,
  CONSTRAINT `fk_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of spp
-- ----------------------------
INSERT INTO `spp` VALUES ('1', '8', '2017-07-10', 'Juli 2017', '1712230003', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('2', '8', '2017-08-10', 'Agustus 2017', '1712230001', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('3', '8', '2017-09-10', 'September 2017', '1712230004', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('4', '8', '2017-10-10', 'Oktober 2017', '1712230009', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('5', '8', '2017-11-10', 'November 2017', '1712230010', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('6', '8', '2017-12-10', 'Desember 2017', '1712230013', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('7', '8', '2018-01-10', 'Januari 2018', '1801210001', '2018-01-21', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('8', '8', '2018-02-10', 'Februari 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('9', '8', '2018-03-10', 'Maret 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('10', '8', '2018-04-10', 'April 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('11', '8', '2018-05-10', 'Mei 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('12', '8', '2018-06-10', 'Juni 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('13', '9', '2017-07-10', 'Juli 2017', '1712230005', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('14', '9', '2017-08-10', 'Agustus 2017', '1712230006', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('15', '9', '2017-09-10', 'September 2017', '1712230007', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('16', '9', '2017-10-10', 'Oktober 2017', '1712230008', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('17', '9', '2017-11-10', 'November 2017', '1712230011', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('18', '9', '2017-12-10', 'Desember 2017', '1712230012', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('19', '9', '2018-01-10', 'Januari 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('20', '9', '2018-02-10', 'Februari 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('21', '9', '2018-03-10', 'Maret 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('22', '9', '2018-04-10', 'April 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('23', '9', '2018-05-10', 'Mei 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('24', '9', '2018-06-10', 'Juni 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('25', '10', '2017-07-10', 'Juli 2017', '1712230014', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('26', '10', '2017-08-10', 'Agustus 2017', '1712230015', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('27', '10', '2017-09-10', 'September 2017', '1712230016', '2017-12-23', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('28', '10', '2017-10-10', 'Oktober 2017', '1801210003', '2018-01-21', '250000', 'Lunas', '1');
INSERT INTO `spp` VALUES ('29', '10', '2017-11-10', 'November 2017', '1801210004', '2018-01-21', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('30', '10', '2017-12-10', 'Desember 2017', '1801210005', '2018-01-21', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('31', '10', '2018-01-10', 'Januari 2018', '1801210006', '2018-01-21', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('32', '10', '2018-02-10', 'Februari 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('33', '10', '2018-03-10', 'Maret 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('34', '10', '2018-04-10', 'April 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('35', '10', '2018-05-10', 'Mei 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('36', '10', '2018-06-10', 'Juni 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('37', '11', '2017-07-10', 'Juli 2017', '1712290001', '2017-12-29', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('38', '11', '2017-08-10', 'Agustus 2017', '1712290002', '2017-12-29', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('39', '11', '2017-09-10', 'September 2017', '1712290003', '2017-12-29', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('40', '11', '2017-10-10', 'Oktober 2017', '1712290004', '2017-12-29', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('41', '11', '2017-11-10', 'November 2017', '1712290005', '2017-12-29', '250000', 'LUNAS', '3');
INSERT INTO `spp` VALUES ('42', '11', '2017-12-10', 'Desember 2017', '1712290006', '2017-12-29', '250000', 'LUNAS', '3');
INSERT INTO `spp` VALUES ('43', '11', '2018-01-10', 'Januari 2018', '1712300001', '2017-12-30', '250000', 'LUNAS', '1');
INSERT INTO `spp` VALUES ('44', '11', '2018-02-10', 'Februari 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('45', '11', '2018-03-10', 'Maret 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('46', '11', '2018-04-10', 'April 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('47', '11', '2018-05-10', 'Mei 2018', null, null, '250000', null, null);
INSERT INTO `spp` VALUES ('48', '11', '2018-06-10', 'Juni 2018', null, null, '250000', null, null);

-- ----------------------------
-- Table structure for walikelas
-- ----------------------------
DROP TABLE IF EXISTS `walikelas`;
CREATE TABLE `walikelas` (
  `kelas` varchar(10) NOT NULL,
  `idguru` int(5) DEFAULT NULL,
  PRIMARY KEY (`kelas`),
  KEY `fk_guru` (`idguru`),
  CONSTRAINT `fk_guru` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of walikelas
-- ----------------------------
INSERT INTO `walikelas` VALUES ('VIIA', '1');
INSERT INTO `walikelas` VALUES ('IXB', '2');
INSERT INTO `walikelas` VALUES ('VIIB', '2');
INSERT INTO `walikelas` VALUES ('VIIIA', '3');
INSERT INTO `walikelas` VALUES ('IXA', '4');
INSERT INTO `walikelas` VALUES ('VIIC', '4');
INSERT INTO `walikelas` VALUES ('VIIIB', '5');
INSERT INTO `walikelas` VALUES ('VIIIC', '6');
