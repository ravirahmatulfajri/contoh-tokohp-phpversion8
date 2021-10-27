-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2011 at 02:18 PM
-- Server version: 5.1.33
-- PHP Version: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbtoko`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'redaksi@bukulokomedia.com', '08238923848', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id_banner` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  PRIMARY KEY (`id_banner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id_banner`, `judul`, `url`, `gambar`, `tgl_posting`) VALUES
(10, 'Penerbit Lokomedia', 'http://bukulokomedia.com', 'banner2.jpg', '2010-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `id_download` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  PRIMARY KEY (`id_download`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`id_download`, `judul`, `nama_file`) VALUES
(1, 'Katalog Lokomedia Desember 2010', 'katalog-12-2010.pdf'),
(2, 'Katalog Lokomedia April 2011', 'katalog-04-2011.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
  `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_hubungi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`) VALUES
(1, 'Ariawan', 'ariawan@gmail.com', 'Mohon Informasi', 'Mohon informasi mengenai buku yang diterbitkan oleh Lokomedia.', '2008-02-10'),
(4, 'lukman', 'lukman@hakim', 'Request Code', 'Tolong dunk ..', '2009-02-25'),
(6, 'Adiyaksa', 'adi@gmail.com', 'Nanya', 'ljlfdks flkdjsflk', '2009-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `kategori_seo`) VALUES
(2, 'Iphone', 'iphone'),
(3, 'Sony Ericsson', 'sony-ericsson'),
(4, 'Motorola', 'motorola'),
(5, 'LG', 'lg'),
(6, 'Blackberry', 'blackberry'),
(7, 'Samsung', 'samsung');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `id_kota` int(3) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(1, 'Jakarta', 13000),
(2, 'Bandung', 13500),
(3, 'Semarang', 10000),
(4, 'Medan', 20000),
(5, 'Aceh', 25000),
(6, 'Banjarmasin', 17500),
(7, 'Balikpapan', 18500),
(8, 'Samarinda', 19500),
(9, 'Lainnya', 10000),
(10, 'Palembang', 23000),
(11, 'Surabaya', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE IF NOT EXISTS `kustomer` (
  `id_kustomer` int(5) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL,
  PRIMARY KEY (`id_kustomer`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id_kustomer`, `password`, `nama_lengkap`, `alamat`, `email`, `telpon`, `id_kota`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Lukmanul Hakim', 'Jl. Prof. Dr. Soepomo No. 178, Tebet, Jakarta Timur 17280', 'algosigma@gmail.com', '081804396000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  `nama_toko` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `meta_keyword` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `email_pengelola` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_rekening` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_hp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=58 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `status`, `aktif`, `urutan`, `nama_toko`, `meta_deskripsi`, `meta_keyword`, `email_pengelola`, `nomor_rekening`, `nomor_hp`) VALUES
(18, 'Produk', '?module=produk', '', '', 'admin', 'Y', 5, '', '', '', '', '', ''),
(42, 'Order', '?module=order', '', '', 'admin', 'Y', 6, '', '', '', '', '', ''),
(10, 'Manajemen Modul', '?module=modul', '', '', 'admin', 'Y', 3, '', '', '', '', '', ''),
(31, 'Kategori Produk', '?module=kategori', '', '', 'admin', 'Y', 4, '', '', '', '', '', ''),
(43, 'Profil Toko Online', '?module=profil', '<strong>mobilestore.com</strong> merupakan website resmi dari Toko HP Lokomedia yang bermarkas di Jl. Arwana No.24 Minomartani Yogyakarta 55581. Dirintis pertama kali oleh Lukmanul Hakim pada tanggal 14 Maret 2008.<br />\r\n<br />\r\nProduk unggulan dari Toko HP Lokomedia adalah produk-produk serta aksesoris bertema Nokia yang merupakan merk produk handphone paling terdepan saat ini.\r\n', 'gedung.jpg', 'admin', 'Y', 2, 'mobilestore.com - toko lokomedia online', 'mobilestore.com adalah toko online dari penerbit lokomedia yang buku-buku komputer khususnya di bidang pemrograman web dan internet.', 'lokomedia, bukulokomedia, toko online, buku komputer, handphone.', 'redaksi@bukulokomedia.com', 'BCA 0312849389 a.n. Lukmanul Hakim, Mandiri 13700045678910 a.n. Lukmanul Hakim', '081804396000'),
(44, 'Hubungi Kami', '?module=hubungi', '', '', 'admin', 'Y', 9, '', '', '', '', '', ''),
(45, 'Cara Pembelian', '?module=carabeli', '<ol><li>Klik pada tombol&nbsp;<span style="font-weight: bold;">Beli</span> pada produk yang ingin Anda pesan.</li><li>Produk yang Anda pesan akan masuk ke dalam <span style="font-weight: bold;">Keranjang Belanja</span>. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom <span style="font-weight: bold;">Jumlah</span>, kemudian klik tombol <span style="font-weight: bold;">Update</span>. Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol Kali yang berada di kolom paling kanan.</li><li>Jika sudah selesai, klik tombol <span style="font-weight: bold;">Selesai Belanja</span>, maka akan tampil form untuk pengisian data kustomer/pembeli.</li><li>Setelah data pembeli selesai diisikan, klik tombol <span style="font-weight: bold;">Proses</span>, maka akan tampil data pembeli beserta produk yang dipesannya (jika diperlukan catat nomor ordersnya). Dan juga ada total pembayaran serta nomor rekening pembayaran.</li><li>Apabila telah melakukan pembayaran, maka produk/barang akan segera kami kirimkan. <br></li></ol>', 'gedung.jpg', 'admin', 'Y', 8, '', '', '', '', '', ''),
(47, 'Banner', '?module=banner', '', '', 'user', 'Y', 10, '', '', '', '', '', ''),
(48, 'Ongkos Kirim', '?module=ongkoskirim', '', '', 'user', 'Y', 7, '', '', '', '', '', ''),
(49, 'Ganti Password', '?module=password', '', '', 'user', 'Y', 1, '', '', '', '', '', ''),
(53, 'Modul YM', '?module=ym', '', '', 'user', 'Y', 12, '', '', '', '', '', ''),
(52, 'Laporan', '?module=laporan', '', '', 'user', 'Y', 11, '', '', '', '', '', ''),
(57, 'Download Katalog', '?module=download', '', '', 'user', 'Y', 13, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mod_ym`
--

CREATE TABLE IF NOT EXISTS `mod_ym` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mod_ym`
--

INSERT INTO `mod_ym` (`id`, `nama`, `username`) VALUES
(1, 'Siti Mutmainah', 'iin.suka');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL AUTO_INCREMENT,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL,
  PRIMARY KEY (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `status_order`, `tgl_order`, `jam_order`, `id_kustomer`) VALUES
(1, 'Baru', '2011-05-28', '11:52:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(1, 23, 1),
(1, 25, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=130 ;

--
-- Dumping data for table `orders_temp`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `produk_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `produk_seo`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(14, 4, 'Motorola RAZR V3m Red', 'motorola-razr-v3m-red', 'The Motorola Red RAZR V3m for Sprint combines powerful technology and chic style with social activism in a cell phone that makes a strong statement to the world.<br />\r\nFeatures: Bluetooth Wireless Technology, 1.3 Megapixel Digital Camera Takes Print-quality Stills or Video Clips, Less Than 1/2-inch Thick With Feather-touch Precision Crafted Keypad,&nbsp; Built-in Music Player With Removable, Expandable Memory Card Slot, Stunning Red Shell Is Made From Aircraft-grade Aluminum, Motorola Will Contribute A Portion Of The Red Razr Proceeds To Help Fight Aids In Africa, Watch On-demand Sprint TV or Listen To Streaming Music With Sprint Music Store.<br />\r\n', 2500000, 24, '0.50', '2009-05-25', '9motorola_razr.jpg', 28, 0),
(15, 5, 'LG Chocolate VX8550 Blue', 'lg-chocolate-vx8550-blue', 'The LG Chocolate VX8550 for Verizon Wireless - now available with a chic &quot;blue ice&quot; color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br />\r\n<br />\r\nFeatures:<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br />\r\n&nbsp;&nbsp;&nbsp; * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br />\r\n&nbsp;&nbsp;&nbsp; * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br />\r\n&nbsp;&nbsp;&nbsp; * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br />\r\n&nbsp;&nbsp;&nbsp; * Stylish Slider Design With Soft-touch External Controls<br />\r\n&nbsp;&nbsp;&nbsp; * Huge, Vibrant Color Display<br />\r\n&nbsp;&nbsp;&nbsp; * Wirelessly Stream Music To A Stereo Bluetooth Headset\r\n', 3450000, 43, '1.00', '2009-06-02', '39lg_vx8550.jpg', 16, 0),
(16, 7, 'Samsung FlipShot SCH-U900', 'samsung-flipshot-schu900', 'The Samsung U900 for Verizon Wireless is the update to the flagship Samsung A990. Features: Advanced Voice Activated Dialing Requires No Phone Pre-training, Advanced Bluetooth Wireless Technology With Streaming Stereo Music Support, Huge Color Main Display and Color External Display, Built-in Music Player Lets You Download From V CAST Music Service, One of the Best Digital Camera/Camcorders In A Mobile Phone Today, Next Generation (EV-DO) Technology Gives You Downloads At Near-Broadband Speeds, Watch On-demand TV or Listen to Music Via Verizon V CAST, Take Extra-long Video Clips With Very Good Resolution.\r\n', 4500000, 28, '0.50', '2009-06-02', '21samsung_u900.jpg', 38, 0),
(18, 3, 'Sony Ericsson W200i', 'sony-ericsson-w200i', 'The Sony Ericsson specially Phone for Walkman - now available with a chic &quot;blue ice&quot; color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br />\r\n<br />\r\nFeatures:<br />\r\n<br />\r\n    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br />\r\n    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br />\r\n    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br />\r\n    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br />\r\n    * Stylish Slider Design With Soft-touch External Controls<br />\r\n    * Huge, Vibrant Color Display<br />\r\n    * Wirelessly Stream Music To A Stereo Bluetooth Headset<br />\r\n', 1100000, 44, '0.50', '2009-09-28', '36se_w200i.jpg', 16, 20),
(17, 3, 'Sony Ericsson W880', 'sony-ericsson-w880', 'The Sony Ericsson w880 specially Phone for Walkman and Business - now available with a chic &quot;blue ice&quot; color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br />\r\n<br />\r\nFeatures:<br />\r\n<br />\r\n    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br />\r\n    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br />\r\n    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br />\r\n    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br />\r\n    * Stylish Slider Design With Soft-touch External Controls<br />\r\n    * Huge, Vibrant Color Display<br />\r\n    * Wirelessly Stream Music To A Stereo Bluetooth Headset<br />\r\n', 2800000, 35, '0.50', '2009-09-28', '97se_w880.jpg', 14, 10),
(19, 3, 'Sony Ericsson w910', 'sony-ericsson-w910', 'The Sony Ericsson w910 specially Phone for Walkman and Business - now\r\navailable with a chic &quot;blue ice&quot; color scheme - is the first Verizon\r\nWireless phone with a soft-touch keypad, external graphic equalizer,\r\nstreaming or downloadable music from VCAST, and the capability to\r\ntransfer music to and from your PC (USB cable required).<br />\r\n<br />\r\nFeatures:<br />\r\n<br />\r\n    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br />\r\n    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br />\r\n    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br />\r\n    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br />\r\n    * Stylish Slider Design With Soft-touch External Controls<br />\r\n    * Huge, Vibrant Color Display<br />\r\n    * Wirelessly Stream Music To A Stereo Bluetooth Headset\r\n', 2500000, 0, '1.00', '2009-12-25', '12se_w910.jpg', 22, 0),
(23, 6, 'Blackberry 8820', 'blackberry-8820', '<p>\r\nResearch In Motion memperkenalkan BlackBerry terbaru yang mampu sediakan akses suara dan data nirkabel melalui jaringan seluler dan Wi-Fi. Presiden dan Co-CEO RIM, Mike Lazaridis, menyebutkan perhatian chief executive Apple Inc., Steve Jobs, dan produk iPhone Apple yang telah membawa keuntungan bagi RIM.\r\n</p>\r\n<p>\r\nBlackBerry baru ini bertajuk 8820 dan merupakan smartphone blackberry pertama yang memiliki kemampuan dual mode dengan desain tipis dan full keyboard. Push email RIM juga memungkinkan pelanggan untuk mengakses surat elektronik mereka langsung ke perangkat secara realtime.\r\n</p>\r\n<p>\r\n8820 juga dilengkapi dengan navigasi satelit GPS, hiburan multimedia musik dan video. Sayangnya kemunculan RIM baru mencakup Amerika saja dengan kerja sama operator AT&amp;T. \r\n</p>\r\n', 3000000, 20, '1.00', '2011-05-27', '35blackberry-8820.jpg', 1, 10),
(24, 2, 'Iphone 3GS', 'iphone-3gs', '<p>\r\nThe iPhone 3GS is the third generation of iPhone designed and marketed by Apple Inc. It was introduced on June 8, 2009 at the WWDC 2009 which took place at the Moscone Center, San Francisco.\r\n</p>\r\n<p>\r\nIts features primarily consist of faster performance, a camera with higher resolution and video capability, voice control,[7] and support for 7.2 Mbit/s HSDPA downloading (but remains limited to 384 kbps uploading as Apple had not implemented the HSUPA protocol).[8] It was released in the U.S., Canada and six European countries on June 19, 2009,[2] in Australia and Japan on June 26, and internationally in July and August 2009.\r\n</p>\r\n<p>\r\nThe iPhone 3GS runs Apple&#39;s iOS operating system, as is used on the iPad and the iPod touch. It is primarily controlled by a user&#39;s fingertips on a multi-touch display.\r\n</p>\r\n', 4000000, 15, '1.00', '2011-05-27', '73iPhone_3GS.jpg', 1, 10),
(25, 3, 'Sony Ericsson C903', 'sony-ericsson-c903', '<p>\r\nJadilah pembidik jitu dengan kamera 5 megapiksel mengesankan dari Sony Ericsson C903 Cyber-shot&trade;. Dengan deteksi wajah, lampu kilat foto yang cerah dan teknologi khas kami, Smile Shutter&trade;, Anda tidak lagi akan meluputkan bidikan sempurna dengan telepon kamera yang gaya ini.\r\n</p>\r\n<p>\r\nGunakan aGPS untuk menemukan arah dan tandai foto Anda menurut tempat pengambilannya. Aktifkan kamera dan nikmati kemampuan layanan berbasis lokasi pada telepon Anda. Mengambil gambar di mana saja dan memberi label informasi tentang lokasi Anda.\r\n</p>\r\n', 2500000, 5, '2.00', '2011-05-28', '12se_c903.jpg', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('127.0.0.2', '2009-09-11', 1, '1252681630'),
('127.0.0.1', '2009-09-11', 17, '1252734209'),
('127.0.0.3', '2009-09-12', 8, '1252817594'),
('127.0.0.1', '2009-10-24', 8, '1256381921'),
('127.0.0.1', '2009-10-26', 108, '1256620074'),
('127.0.0.1', '2009-10-27', 52, '1256686769'),
('127.0.0.1', '2009-10-28', 124, '1256792223'),
('127.0.0.1', '2009-10-29', 9, '1256828032'),
('127.0.0.1', '2009-10-31', 3, '1257047101'),
('127.0.0.1', '2009-11-01', 85, '1257113554'),
('127.0.0.1', '2009-11-02', 11, '1257207543'),
('127.0.0.1', '2009-11-03', 165, '1257292312'),
('127.0.0.1', '2009-11-04', 59, '1257403499'),
('127.0.0.1', '2009-11-05', 10, '1257433172'),
('127.0.0.1', '2009-11-11', 13, '1258006911'),
('127.0.0.1', '2009-11-12', 10, '1258048069'),
('127.0.0.1', '2009-11-14', 14, '1258222519'),
('127.0.0.1', '2009-11-17', 2, '1258473856'),
('127.0.0.1', '2009-11-19', 16, '1258635469'),
('127.0.0.1', '2009-11-21', 4, '1258863505'),
('127.0.0.1', '2009-11-25', 3, '1259216216'),
('127.0.0.1', '2009-11-26', 1, '1259222467'),
('127.0.0.1', '2009-11-30', 11, '1259651841'),
('127.0.0.1', '2009-12-02', 9, '1259746407'),
('127.0.0.1', '2009-12-03', 17, '1259906128'),
('127.0.0.1', '2009-12-10', 69, '1260423794'),
('127.0.0.1', '2009-12-12', 26, '1260560082'),
('127.0.0.1', '2009-12-11', 5, '1260508621'),
('127.0.0.1', '2009-12-13', 8, '1260716786'),
('127.0.0.1', '2009-12-14', 9, '1260772698'),
('127.0.0.1', '2009-12-15', 9, '1260837158'),
('127.0.0.1', '2009-12-16', 7, '1260905627'),
('127.0.0.1', '2009-12-17', 48, '1261026791'),
('127.0.0.1', '2009-12-18', 11, '1261088534'),
('127.0.0.1', '2009-12-22', 3, '1261477278'),
('127.0.0.1', '2009-12-25', 2, '1261686043'),
('127.0.0.1', '2009-12-26', 29, '1261835507'),
('127.0.0.1', '2009-12-27', 7, '1261920445'),
('127.0.0.1', '2009-12-28', 3, '1261965611'),
('127.0.0.1', '2009-12-29', 21, '1262024011'),
('127.0.0.1', '2009-12-30', 24, '1262146708'),
('127.0.0.1', '2010-01-01', 12, '1262286131'),
('127.0.0.1', '2010-01-03', 38, '1262529325'),
('127.0.0.1', '2010-01-12', 89, '1263264291'),
('127.0.0.1', '2010-01-14', 54, '1263482540'),
('127.0.0.1', '2010-01-15', 57, '1263506901'),
('127.0.0.1', '2010-02-11', 30, '1265831568'),
('127.0.0.1', '2010-02-13', 2, '1266032303'),
('127.0.0.1', '2010-02-14', 3, '1266115347'),
('127.0.0.1', '2010-02-15', 15, '1266195235'),
('127.0.0.1', '2010-02-18', 1, '1266499945'),
('127.0.0.1', '2010-02-22', 5, '1266856332'),
('127.0.0.1', '2010-02-25', 46, '1267103145'),
('127.0.0.1', '2010-05-12', 10, '1273654648'),
('127.0.0.1', '2010-05-16', 195, '1274026185'),
('127.0.0.1', '2010-05-17', 2, '1274029517'),
('127.0.0.1', '2010-05-19', 1, '1274279374'),
('127.0.0.1', '2010-05-27', 16, '1274967085'),
('127.0.0.1', '2010-05-30', 4, '1275192045'),
('127.0.0.1', '2010-05-31', 13, '1275271939'),
('127.0.0.1', '2010-06-05', 1, '1275676869'),
('127.0.0.1', '2010-06-06', 2, '1275842170'),
('127.0.0.1', '2010-06-15', 3, '1276572924'),
('127.0.0.1', '2010-06-22', 206, '1277221605'),
('127.0.0.1', '2010-08-02', 17, '1280754660'),
('127.0.0.1', '2010-08-20', 7, '1282285305'),
('127.0.0.1', '2010-08-30', 21, '1283185430'),
('127.0.0.1', '2010-08-31', 53, '1283207455'),
('127.0.0.1', '2010-09-02', 133, '1283402651'),
('127.0.0.1', '2010-09-05', 35, '1283702206'),
('127.0.0.1', '2010-09-13', 10, '1284370291'),
('127.0.0.1', '2010-09-17', 12, '1284662303'),
('127.0.0.1', '2010-09-22', 2, '1285091212'),
('127.0.0.1', '2010-09-23', 47, '1285254071'),
('127.0.0.1', '2010-09-26', 32, '1285512806'),
('127.0.0.1', '2010-09-27', 51, '1285532379'),
('127.0.0.1', '2010-10-14', 10, '1287074605'),
('127.0.0.1', '2010-10-15', 6, '1287150179'),
('127.0.0.1', '2010-10-16', 2, '1287170167'),
('127.0.0.1', '2010-10-20', 145, '1287636778'),
('127.0.0.1', '2010-10-21', 177, '1287721183'),
('127.0.0.1', '2010-10-22', 63, '1287752692'),
('127.0.0.1', '2011-04-02', 7, '1301680774'),
('127.0.0.1', '2011-04-03', 8, '1301801389'),
('127.0.0.1', '2011-04-05', 16, '1301977471'),
('127.0.0.1', '2011-04-09', 44, '1302288659'),
('127.0.0.1', '2011-04-10', 129, '1302370890'),
('127.0.0.1', '2011-04-11', 34, '1302488765'),
('127.0.0.1', '2011-04-17', 8, '1302998534'),
('127.0.0.1', '2011-04-22', 5, '1303479879'),
('127.0.0.1', '2011-04-23', 36, '1303534207'),
('127.0.0.1', '2011-05-26', 144, '1306423419'),
('127.0.0.1', '2011-05-27', 59, '1306467737'),
('127.0.0.1', '2011-05-28', 57, '1306588828'),
('127.0.0.1', '2011-05-29', 8, '1306649171'),
('127.0.0.1', '2011-05-30', 18, '1306736260');
