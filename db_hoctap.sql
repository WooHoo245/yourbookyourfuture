-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2019 at 05:23 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hoctap`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(16, 17, '2019-12-12', 180000, 'COD', 'no no', '2019-12-12 09:40:06', '2019-12-12 09:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(19, 16, 2, 1, 180000, '2019-12-12 09:40:06', '2019-12-12 09:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(17, 'Nguyễn Quốc Huy', 'nam', 'huy10986@gmail.com', 'ktx khu a, khu phố 6, p. Linh Trung, Thủ Đức, TP.HCM', '1238389087', 'no no', '2019-12-12 09:40:06', '2019-12-12 09:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'The Pragmatic Programmer', 5, 'Là một cuốn sách dạy lập trình cơ bản được đúc kết từ kinh nghiệm nhiều năm của các chuyên gia lập trình. Chính vì vậy, các kiến thức trong sách đều rất thực tế, không nặng nề về lý thuyết mà chủ yếu tập trung vào những kinh nghiệm, các vấn đề gặp phải trong công việc hàng ngày.\r\n\r\nThe Pragmatic Programmer bao quát mọi vấn đề lập trình nói chung mà không nêu ra vấn đề riêng của từng ngôn ngữ lập trình nào cả. Các kiến thức trong sách được trình bày theo từng đề mục trong chuỗi các chuyên đề. Bên cạnh đó, sách còn đưa ra các ví dụ rõ ràng cho mỗi vấn đề. Điều này rất thân thiện với người đọc, giúp người đọc dễ hiểu và dễ nhớ hơn.', 100000, 0, 'Coding.jpg', 'cuốn', 1, '2019-12-11 03:00:16', '2019-12-11 22:11:00'),
(2, 'The Clean Coder\n', 5, 'Chỉ với 200 trang những The Clean Coder: A Code of Conduct for Professional Programmers được coi như sách gối đầu giường của các bạn lập trình viên. Đúng như tên gọi, sách làm rõ và xoay quanh vấn đề về các dòng code. Một điều giúp sách được ưa chuộng chính là việc có rất nhiều lời khuyên thực tế của các chuyên gia về quy trình làm sản phẩm, viết code...', 150000, 0, 'coder.jpg', 'cuốn', 0, '2019-12-13 03:00:16', '2019-12-13 04:00:23'),
(3, 'Kỹ thuật lập trình C', 5, 'Sách do Phạm Văn Ất cùng nhiều tác giả biên soạn. Đây là một giáo trình bằng tiếng Việt được khá nhiều các lập trình viên tìm đọc. Như tựa đề, sách chủ yếu xoay quanh các vấn đề về ngôn ngữ lập trình C. Người đọc có thể tìm thấy được các thông tin từ căn bản đến nâng cao của ngôn ngữ lập trình C.', 200000, 180000, 'lap_trinh_c.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(4, 'Cracking the Coding Interview', 5, 'Bạn đang mông lung với những câu hỏi xoay quanh ngành học lập trình nói chung? Cracking the Coding Interview được viết ra như chỉ để dành cho bạn. Sách là sự tổng hợp của 189 câu hỏi và các giải pháp về lập trình. Ngoài ra, câu hỏi còn có rất nhiều những thông tin bạn cần nắm rõ khi chuẩn bị bước vào một buổi phỏng vấn lập trình.', 160000, 0, 'cracking.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(5, 'Soft Skills', 5, 'Để trở thành những nhà lập trình viên giỏi tài ba thì bên cạnh chuyên môn thành thạo bạn còn cần trang bị cho mình những kỹ năng mềm khác. Và Soft Skills dẽ giúp bạn đạt được sự cân bằng giữa chuyên môn và các kỹ năng cần có của một nhà lập trình viên chuyên nghiệp.', 200000, 180000, 'skill.jpeg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(6, 'C# Yellow Book', 5, 'Sách được biển soạn bởi Rob Miles. Đây là cuốn sách được sinh ra để dành cho các bạn mới bắt đầu làm quen với lập trình. Tất nhiên, nếu lựa chọn ngôn ngữ C# để bắt đầu thì đừng nên bỏ qua C# Yellow Book nhé.', 160000, 150000, 'yellow.png', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(7, 'Tự Học Đồ Họa PTS CS6', 3, 'Adobe Photoshop CS6 là ứng dụng chỉnh sửa ảnh thu hút được sự chú ý đặc biệt từ phía cộng đồng người dùng nhờ bổ sung một số tính năng mới so với những phiên bản trước như Photoshop CS5… , nếu như trước kia muốn di chuyển một đối tượng từ vị trí này đến vị trí khác rất khó, sẽ mất rất nhiều thời gian để tìm cách lấp đầy khoảng trống còn lại nhưng nay chỉ trong vài giây bạn có ngay phần nền phù hợp điền vào thay thế, các thiếu sót thông thường của ống kính như là biến dạng barrel và pincushion, làm mờ nét ảnh và quang sai màu, chỉ cần canh thước thẳng hàng là bạn đã có thể điều chỉnh chính xác.', 250000, 0, 'cs6.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(8, 'Thực Hành Microsoft Office 2016', 3, 'Microsoft Office là bộ ứng dụng văn phòng phổ biến nhất hiện nay, và phiên bản gần đây nhất được ra mắt vào năm 2013. Trong phiên bản năm 2016, một lần nữa lại thu hút sự quan tâm của nhiều người dùng. Đây là một trong những quyển sách hay về công nghệ thông tin quan trọng nhất và cần thiết nhất đối với độc giả. Nội dung sách bao gồm 13 chương và đính kèm CD Bài tập, được trình bày bằng nội dung bài tập thực hành thực tiễn từng bước thông qua hình minh họa và các thủ thuật giúp bạn tự học, tự thực hành một cách nhanh chóng chuyên nghiệp.', 200000, 50000, 'office.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(9, 'Lập Trình Microsoft Access', 3, 'Quyển sách hay về công nghệ thông tin này giới thiệu về phần mềm quản trị cơ sở dữ liệu Microsoft Access – một phần mềm với tính năng nổi trội là tiện ích, dễ sử dụng. Tuy nhiên Microsoft Access cũng chỉ dừng lại ở mức độ “Office”; nó chỉ phù hợp cho việc thiết kế các chương trình quản lý ứng dụng ở mức độ vừa phải và tính bảo mật không khắt khe lắm.', 200000, 80000, '7_07lu-30.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(10, 'Tự Học Tin Học', 3, 'Trong thời đại công nghệ thông tin phát triển, cuốn sách Tự Học Tin Học ra đời như một điều hiển nhiên mà cần thiết. Cuốn sách được đi từ tổng quan đến từng phần chi tiết, chương đầu tiên mang tính chất giới thiệu về hệ điều hành Windows XP, bắt đầu từ chương 2, 3, 4 cuốn sách đi sâu từng phần trong từng chương, đề cập những vấn đề cơ bản và cách sử dụng các phần mềm Microsoft Word, Microsoft Excel, Microsoft Powerpoint…', 100000, 0, 'tutin.png', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(11, 'Học Nhanh Word 2003 & 2007', 3, 'Học Nhanh Word 2003 & 2007 Dành Cho Mọi Người giúp bạn củng cố kiến thức cơ bản, cập nhật các tính năng mới, trang bị các kỹ năng về ứng dụng WinWord cho người sử dụng máy tính, trình bày về MS Office Wors 2003 với những tính năng cơ bản và tiện dụng, bên cạnh đó cũng giới thiệu về MS Office Word 2007 hiện đại.', 100000, 0, 'excel.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(12, 'Design Layout Volume 1', 3, 'Sách Thiết kế, Tạo mẫu & Dàn trang được chia thành 8 phần, bao gồm trên 200 đề mục. Hầu hết 200 đề mục đều có các mẫu thiết kế minh họa trước và sau khi hiệu chỉnh theo những gợi ý đưa ra để người đọc dễ dàng so sánh. Nội dung sách được trình bày ngắn gọn, súc tích cùng với chú giải cho những thuật ngữ sử dụng trong các đề mục nên rất dễ hiểu ngay cả với những designer không chuyên.', 150000, 120000, 'hj_grande.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(13, 'Thông Điệp Của Nước', 2, 'Sách hay về khoa học của Masaru Emoto sẽ thay đổi một cách sâu sắc thế giới quan của bạn. Ông phát hiện ra rằng nước từ những dòng suối trong sạch và nước được tiếp xúc với những ngôn từ đáng yêu hiển thị những hình mẫu rực rỡ, phức tạp và dạng bông tuyết đầy sắc màu. Ngược lại, nước ô nhiễm, hay nước tiếp xúc với những suy nghĩ tiêu cực, hình thành những hình mẫu thiếu hoàn chỉnh, bất đối xứng có màu sắc mờ tối.', 100000, 0, 'nuoc.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(14, 'Bí Mật Trí Nhớ Siêu Phàm', 2, 'Trong quyển sách hay về khoa học trí nhớ này, Eran Katz khẳng định rằng trí nhớ của bạn tốt hơn bạn tưởng rất nhiều. Và bạn đã rất sai lầm khi nghĩ rằng trí nhớ của mình không hoàn hảo và mất niềm tin vào nó. Bạn có biết chúng ta chỉ sử dụng 10% khả năng nhớ của bộ não trong suốt cuộc đời, chính vì thế bộ não còn bộ nhớ rất khổng lồ mà chúng ta đã lãng phí.', 150000, 0, 'img872_1_3.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(15, 'Những Nhà Khám Phá', 2, 'Những nhà khám phá là một tập khảo luận đồ sộ và bao quát về cách thức nhân loại đã khám phá thế giới. Bằng những kết hợp những mảnh tư liệu lớn trong kho tàng lịch sử tri thức thành những cấu trúc trật tự và lô gích, Boorstin đã cho chúng ta thấy hiểu biết của chúng ta về sự phát triển của vũ trụ trong gần hai thiên niên kỷ qua, từ Ptolemy qua Copernicus và Newton tới Einstein.', 150000, 0, 'khampha.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(16, 'Các Thế Giới Song Song', 2, 'Với quyển sách này, Michio Kaku sẽ dẫn dắt chúng ta đến với chuyến du hành qua các vũ trụ để chiêm ngưỡng vẻ đẹp kỳ vĩ của vũ trụ kể từ vụ nổ lớn, vượt qua những hố đen, lỗ sâu, bước vào các thế giới lượng tử từ muôn màu kỳ lạ nằm ngay trước mũi chúng ta, vốn dĩ tồn tại song song trên một màng bên ngoài không – thời gian bốn chiều.', 160000, 0, 'songsong.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(17, 'Tâm Lý Học Lâm Sàng', 1, 'Sách giới thiệu về phương pháp lâm sàng tiếp cận trực tiếp với đối tượng tìm hiểu nhằm giải tỏa các rối loạn trong tâm lý như buồn bã, lo lắng… Lý thuyết và thực hành được minh họa qua các trường hợp lâm sàng cụ thể, đặc biệt là ở Việt Nam.', 160000, 150000, 'tamlyhoclamsang.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(18, 'Đòn Tâm Lý Thuyết Phục', 1, 'Bạn có bao giờ thắc mắc tại sao các cửa hàng thường tổ chức chương trình tiếp thị khuyến mãi, bán hàng với số lượng hạn chế… không? Hay tại sao lời nói của một số người lại có trọng lượng thuyết phục hơn những người khác?\r\n\r\n', 180000, 150000, 'dontamly.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(19, 'Tâm Lý Học Thành Công', 1, 'Cuốn sách này sẽ giúp bạn nhận ra được yếu tố quan trọng nhất mang lại sự thành công trong công việc và cuộc sống không phải là trí tuệ hay năng lực mà chính là cách bạn tư duy về mục tiêu cần đạt được. Tư duy cởi mở về sự phát triển chính là mấu chốt ở đây.\r\n\r\n', 159000, 0, 'mindset.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(20, 'Tư Duy Nhanh Và Chậm', 1, 'Đã bao giờ bạn hối hận về những quyết định của bản thân và muốn thay đổi hành vi? Đây là một cuốn sách dành cho bạn.Cuốn sách giới thiệu về hai hệ thống tư duy trong nhận thức của chúng ta, “hệ thống tư duy nghĩ nhanh”, tự động và “hệ thống nghĩ chậm”, ít được sử dụng. Theo kết quả nghiên cứu, chúng ta thường quyết định nhanh chứ không phải cơ chế nghĩ chậm.', 80000, 70000, 'nhanhcham.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(21, 'Trí Tuệ Xúc Cảm', 1, 'Đây là một cuốn sách được giới thiệu trong nhiều khoá học về leadership hay Quản Trị tại Mỹ. Qua những ví dụ sinh động, tác giả Daniel Goleman giới thiệu 5 kỹ năng quan trọng để bạn có thể thông minh hơn về trí tuệ cảm xúc, và nêu lên trí tuệ xúc cảm ảnh hưởng như thế nào trong công việc, các mối quan hệ và sức khoẻ sinh lý của chúng ta.', 250000, 0, 'tuexuc.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(22, 'Dám Bị Ghét', 1, 'Cuốn sách được đánh giá hay và khá thực tế, giúp bạn hiểu hơn về những điểm chính trong quan điểm triết học của Alfred Adler. Cuốn sách giúp chúng ta can đảm tin vào những quyết định quan trọng của bản thân để trở nên hạnh phúc và thành công hơn.', 100000, 80000, 'bighet.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(23, 'Bách Khoa Khủng Long Toàn Tập', 4, 'Đây là cuốn sách không thể thiếu dành cho những người yêu khủng long – một tài liệu hướng dẫn nhận diện 355 loài khủng long và động vật cùng thời, do chuyên gia chấp bút, và được minh họa theo kiến thức khoa học mới nhất.\r\n\r\nPhần giới thiệu tổng quan giải thích quá trình biến đổi về địa lí của Trái Đất và sự phát triển của động, thực vật trên thế giới, đặc biệt tập trung vào Thời đại Khủng long, cách đây 245 triệu năm. Phần này còn giải thích cách phân loại khủng long và trình bày quá trình phát triển của chúng từ những động vật ăn thịt nhỏ nhất có kích thước bằng con cáo đến những con khủng long to lớn nhất với khối lượng khổng lồ và nhiều loại vũ khí phức tạp trên cơ thể.', 200000, 150000, 'khunglong.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(24, 'Hachiko - Chú chó đợi chờ', 4, 'Không cần bàn cãi về mức độ nổi tiếng của câu chuyện này. Tác phẩm kể lại một câu chuyện có thật về chú chó Hachiko được một giáo sư nông nghiệp ở Tokyo là ngài Eisaburo Ueno nhận nuôi. Hachiko đặc biệt quấn quít với chủ. Nó có một thói quen là chạy ra ga Shibuya mỗi buổi chiều để chờ giáo sư Ueno xuống tàu, sau đó họ sẽ trở về nhà cùng nhà. Ngay cả sau khi chủ nhân đột ngột qua đời, con vật trung thành vẫn kiên tâm chờ đợi mỗi ngày, và không ai hay cái gì có thể ép nó làm khác đi.', 150000, 100000, 'dogwait.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(25, 'Cuộc đời của Pi', 4, 'Không tình cảm nặng nề như Hachiko, cuộc đời của Pi đề cập đến những vấn đề tôn giáo, lòng tin, sức mạnh con người và trên hết là mối quan hệ kì lạ của cậu bé Pi và con hổ Richard Parker.', 120000, 80000, 'pi.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(26, 'Bob - Chú mèo đường phố', 4, 'Câu chuyện về chú mèo hoang Bob và người chủ vô gia cư Jame đã lấy đi nước mắt của không ít người. Đây là câu chuyện có thật về bộ đôi đã khuấy động đường phố London những năm 2007- 2009. Bob được tìm thấy trong tình trạng xác xơ, tùy tụy ở gác xép dãy nhà trọ của mình. Jame là người vô gia cư, có quá khứ bất hảo, anh hiện hành nghề hát rong ở ga tàu điện London.', 100000, 70000, 'bob.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(27, 'Nanh trắng ', 4, 'Nanh trắng là một trong những tiểu thuyết thành công nhất của Jack London khảo sát mối quan hệ phức tạp giữa tự nhiên và con người. Tác phẩm là một câu chuyện về cuộc hành trình của một con chó sói lai chó nhà tên là Nanh Trắng, sống trong vùng Yukon của Canada trong thời kỳ đổ xô đi tìm vàng Klondike cuối thế kỷ 19.', 350000, 330000, 'nanhtrang.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(28, 'Lời Chia Tay Đẹp Nhất Thế Gian', 6, 'Lời chia tay đẹp nhất thế gian – cuốn sách biểu thượng về tình cảm gia đình, kiệt tác lay động trái tim của biết bao thế hệ người Hàn Quốc trong suốt 22 năm qua.', 100000, 70000, 'loi-chia-tay-dep-nhat-the-gian.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(29, 'Mẹ Điên', 6, 'Bạn chỉ mất nửa tiếng để đọc Mẹ điên nhưng sẽ được học bài học làm người sâu sắc mà ai cũng phải luôn ghi nhớ: tình cảm thiêng liêng nhất của con người là tình mẫu tử. Cậu bé Thụ muốn mang giấy gọi vào đại học khoe với mẹ nhưng mẹ cậu chẳng còn trên cõi đời để hưởng niềm hạnh phúc ngọt ngào ấy!\r\n\r\n', 50000, 0, 'me_dien_2.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(30, 'Dịch vụ cho thuê sách', 6, 'Dịch vụ tuyệt vời. Lo chi về giá chỉ từ 10.000 đồng cho 1 tuần.', 10000, 0, 'muonsach.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(31, 'Nếu Chỉ Còn Một Ngày Để Sống', 7, 'Nếu Chỉ Còn Một Ngày Để Sống – nguyên tác Everything, Everything – là một trong những tác phẩm văn học nước ngoài bán chạy bình chọn trên tạp chí New York Times. Quyển sách cũng đã được chuyển thể thành phim điện ảnh, gây bão phòng vé trên toàn thế giới từ đó quyển sách càng được nhiều độc giả đón đọc.', 120000, 100000, 'desong.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(32, 'Colorful – Mori Eto', 7, 'Colorful men theo những bất an bình thường mà ai cũng có thể gặp phải trong cuộc sống, nhưng một số người lại thấy chúng quá dị thường, quá kinh khủng, dẫn đến khổ tâm dằn vặt và rồi không thể vượt được qua. Để giải phóng những bình thường ấy, Colorful trình chiếu một giải pháp đặc biệt khác thường. Cuộc đời có muôn vàn nghiệm đúng, người ta tùy ý sống theo cách mình thích, nhưng một khi đã rút lui khỏi nó, thì chẳng còn nghiệm nào cho ta lựa chọn cả.', 180000, 100000, 'colorful.jpg', 'cuốn', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Bố Con Cá Gai – Cho Chang – In', 7, 'Bố Con Cá Gai đã để lại một câu chuyện mãi được yêu thương trong lòng độc giả Hàn Quốc, và chắc chắn câu chuyện cảm động này sẽ nằm tron trái tim bạn đọc rất lâu nữa. Đây là câu chuyện về một em nhỏ đã phải chiến đấu chống lại bệnh tật từ lúc lên ba, nhưng hãy khoan buồn vì em, hay quá lo lắng. Vi em chịu tiêm rất giỏi, em không khóc, ngoài những lúc mệt quá ngủ thiếp đi, em còn bận đỏ bừng mặt nghĩ tới bạn Eun Mi kẹp-tóc-hoa, bận xếp hình tàu cướp biển, bận lật giở cuốn truyện Bảy viên ngọc rồng…', 150000, 0, 'cagai.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(34, 'Dữ Liệu Lớn', 2, 'Dữ Liệu Lớn là một trong những lĩnh vực khoa học đang nổi lên này có thể chuyển vô số hiện tượng – từ giá vé máy bay đến các văn bản của hàng triệu cuốn sách – thành dạng có thể tìm kiếm được, và sử dụng sức mạnh tính toán ngày càng tăng của chúng ta để khám phá những điều chúng ta chưa bao giờ có thể nhìn thấy trước. “Dữ liệu lớn” đề cập đến khả năng đang phát triển của chúng ta để nắm giữ các bộ sưu tập lớn thông tin, phân tích, và rút ra những kết luận đôi khi sâu sắc đáng ngạc nhiên.', 200000, 180000, 'du-lieu-lon.jpg', 'cuốn', 0, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(35, 'Lịch Sử Tự Nhiên – Nhiều tác giả', 2, 'Cuốn sách hay về khoa học này là cánh cửa nhìn vào sự đa dạng đáng kinh ngạc và lịch sử tự nhiên của thế giới quanh ta. Ngược dòng thời gian về 4,6 tỉ năm trước, khi Trái đất hình thành, là một chặng đường dài. Với hơn 5.000 hình minh họa và dữ liệu bổ ích về khoáng vật, đá, hóa thạch và sinh giới trên Trái đất – bao gồm vi sinh vật, nấm và động, thực vật – Lịch sử tự nhiên mở ra cánh cửa khám phá thế giới tự nhiên chứa đựng vô vàn những điều kì thú trên hành tinh của chúng ta. Đây là công trình biên soạn của tập thể các chuyên gia về thiên nhiên hoang dã, với sự cố vấn của Viện Smithsonian danh tiếng.', 200000, 0, 'tunhien.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23'),
(36, 'Động Vật Thời Tiền Sử ', 4, 'Tủ sách thế giới động vật gồm có 12 cuốn là những hình ảnh sống động, chân thực cung cấp cho bạn vô vàn những thông tin bổ ích và thú vị. Với bộ sách này, bạn sẽ được biết đến thế giới tự nhiên vô cùng đa dạng và độc đáo, từ các loài động vật khổng lồ như khủng long, gấu, cá voi xanh...cho tới những sinh vật bé nhỏ như: mối, rận "sát thủ", ong, muỗi... Bạn cũng sẽ được chu du từ những cánh rừng bạt ngàn, hoang dã nơi những con lợn lòi, những con nai sừng tấm hay chồn Mác - tét... sinh sống cho tới thế giới đại dương bao la có những con cá mập phàm ăn, những con chú cá heo đáng yêu và vô vàn các sinh vật phong phú khác. Đặc biệt, bạn có thể ngược dòng thời gian quay trở lại hàng triệu năm trước để quan sát nhiều loài khủng long khác nhau hay tìm thấy không ít điều thú vị ngay trong chính các con vật nuôi ở gia đình mình.', 200000, 150000, 'dong_vat_thoi_tien_su.jpg', 'cuốn', 1, '2019-12-11 17:19:00', '2019-12-13 04:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sách Tâm lý', 'Là một bộ môn nghiên cứu về thế giới nội tâm của con người, tâm lý học đưa ra những gợi ý giúp chúng ta giải quyết nhiều vấn đề khác nhau trong cuộc sống. Gần đây, ngày càng có nhiều doanh nghiệp đưa các phương pháp được dựa trên nền tảng kiến thức về tâm lý học vào kỹ năng quản lý của mình.', '', '2019-12-11 17:00:00', '2019-12-11 17:00:00'),
(2, 'Sách Khoa học', 'Khoa học là chặng đường con người chinh phục tự nhiên, vũ trụ để lý giải những hiện tượng, những sự vật xung quanh chúng ta. Đối với những ai yêu mến và có sự tò mò không ngừng về khoa học thì những quyển sách hay về khoa học sau đây là dành cho bạn, những đầu sách này hiện đang nhận được sự yêu thích của các độc giả khắp nơi trên thế giới.', '', '2019-12-12 02:16:15', '2016-12-13 01:38:35'),
(3, 'Sách Đồ họa - Tin học', 'Công nghệ thông tin hiện đang phát triển chóng mặt và đang được giảng dạy rộng rãi trong khắp các trường đại học, cao đẳng. Những quyển sách hay về công nghệ thông tin sau vừa có thể sử dụng làm tài liệu kết hợp chương trình giảng dạy vừa có thể sử dụng tham khảo cho những ai muốn tìm hiểu về tin học văn phòng.', '', '2019-12-07 00:33:33', '2019-12-10 07:25:27'),
(4, 'Sách Động vật', 'Sách viết về động vật được xem là 1 trong những nguồn cung cấp tri thức bậc nhất. Mặc dù internet ngày nay rất phát triển và có vô số thông tin. Thế nhưng lạm dụng quá nhiều vào internet sẽ gây ảnh hưởng đến sức khoẻ không lường.', '', '2019-12-06 03:29:19', '2019-12-08 02:22:22'),
(5, 'Sách Lập Trình', 'Lập trình là chỉ chung cho rất nhiều lĩnh vực trong ngành công nghệ thông tin. Lập trình được cho là khô khan và khó nắm bắt những cũng là ngành hiện đang rất phát triển tại Việt Nam và trên thế giới. Sau đây là tập hợp những quyển sách hay về lập trình rất được ưa chuộng hiện nay để các bạn quan tâm tham khảo.', '', '2019-12-10 04:00:00', '2019-12-13 04:00:23'),
(6, 'Dịch vụ mượn sách', 'Bạn có thể mượn sách online hoặc là mượn sách vật lý bằng cách cung cấp địa chỉ và thanh toán chuyển khoản trước cho Admin.', '', '2019-12-11 17:19:00', NULL),
(7, 'DV order sách nước ngoài', 'Bạn không có thẻ Visa hay MasterCard. Bạn không biết làm sao mua được quyển sách yêu thích ở ngoài nước? Đừng lo YBYF sẽ giúp bạn được như ý bằng cách liên hệ Admin bên trang "Liên hệ".', '', '2019-12-05 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Huy Huy', '1756100034@hcmussh.edu.vn', '$2y$10$YAoKRkVa71b4rfps8FCNb.SZE/a6151J/vha73LsMS1rzccC3ldGi', '25288390', 'HCMC', 'D3V2GdnfhHRVCqhszkSHbMq6khKTJXCkbacx8sOF2ULEqPpiBWiVBvUakUcs', '2019-12-12 15:18:01', '2019-12-12 15:18:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
