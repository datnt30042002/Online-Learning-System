-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: f8db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ask`
--

DROP TABLE IF EXISTS `ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ask` (
  `AskID` int NOT NULL,
  `AskDetail` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Dicuss_DicussID` int NOT NULL,
  PRIMARY KEY (`AskID`),
  KEY `fk_Ask_Dicuss1_idx` (`Dicuss_DicussID`),
  CONSTRAINT `fk_Ask_Dicuss1` FOREIGN KEY (`Dicuss_DicussID`) REFERENCES `dicuss` (`DicussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ask`
--

LOCK TABLES `ask` WRITE;
/*!40000 ALTER TABLE `ask` DISABLE KEYS */;
/*!40000 ALTER TABLE `ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `BlogID` int NOT NULL AUTO_INCREMENT,
  `BlogTitle` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BlogImage` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BlogDetail` longtext,
  `PostDate` datetime DEFAULT NULL,
  `User_UserID` int NOT NULL,
  `BlogStatus` int DEFAULT NULL,
  `TimeToRead` int DEFAULT NULL,
  `BlogTopic_BlogTopicID` int NOT NULL,
  `BlogTag_BlogTagID` int NOT NULL,
  PRIMARY KEY (`BlogID`),
  KEY `fk_Blog_User1_idx` (`User_UserID`),
  KEY `fk_Blog_BlogTopic1_idx` (`BlogTopic_BlogTopicID`),
  KEY `fk_Blog_BlogTag1_idx` (`BlogTag_BlogTagID`),
  CONSTRAINT `fk_Blog_BlogTag1` FOREIGN KEY (`BlogTag_BlogTagID`) REFERENCES `blogtag` (`BlogTagID`),
  CONSTRAINT `fk_Blog_BlogTopic1` FOREIGN KEY (`BlogTopic_BlogTopicID`) REFERENCES `blogtopic` (`BlogTopicID`),
  CONSTRAINT `fk_Blog_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'CSS Selector','bloggingblog-concepts-ideas-white-worktable-260nw-1029506242.jpg','Coal is a valuable hard, black material extracted from mines. Wood that has been buried for a long time becomes coal due to a chemical change. Earthquakes cause vast forest areas to sink underground and contribute to such changes as a result of tremendous heat and pressure. Coal mines can be found in our country at  Dhanbad, Jharia, Giridih, Chaibasa, and other locations','2023-06-10 00:00:00',25,1,10,3,3),(2,'Tổng quan GIT','blog-post-image-guide.jpg','Coal is a valuable hard, black material extracted from mines. Wood that has been buried for a long time becomes coal due to a chemical change. Earthquakes cause vast forest areas to sink underground and contribute to such changes as a result of tremendous heat and pressure. Coal mines can be found in our country at  Dhanbad, Jharia, Giridih, Chaibasa, and other locations','2023-05-19 00:00:00',26,1,8,4,4),(3,'Theme cho VSCode','blogging-blog-word-coder-coding-260nw-520314613.jpg','Coal is a valuable hard, black material extracted from mines. Wood that has been buried for a long time becomes coal due to a chemical change. Earthquakes cause vast forest areas to sink underground and contribute to such changes as a result of tremendous heat and pressure. Coal mines can be found in our country at  Dhanbad, Jharia, Giridih, Chaibasa, and other locations','2023-03-10 00:00:00',25,1,9,4,7),(4,'Sinh viên tới CEO F8','images.jpg','Coal is a valuable hard, black material extracted from mines. Wood that has been buried for a long time becomes coal due to a chemical change. Earthquakes cause vast forest areas to sink underground and contribute to such changes as a result of tremendous heat and pressure. Coal mines can be found in our country at  Dhanbad, Jharia, Giridih, Chaibasa, and other locations','2023-05-18 00:00:00',26,1,11,4,4),(5,'Trick for BE','blogging-blog-word-coder-coding-260nw-520314613.jpg','Coal is a valuable hard, black material extracted from mines. Wood that has been buried for a long time becomes coal due to a chemical change. Earthquakes cause vast forest areas to sink underground and contribute to such changes as a result of tremendous heat and pressure. Coal mines can be found in our country at  Dhanbad, Jharia, Giridih, Chaibasa, and other locations','2022-10-12 00:00:00',25,1,10,2,6),(6,'Học viên Funix lạc đường tới F8','64448752c63c4.jpg','Mình đã tham gia khóa học lập trình 6 tháng ở funix và cũng có nhiều lý do khác dẫn đến quá hạn quá học và cũng đã hoàn thành 4 môn hiện đang cố nodejs để xong. Thực sự là ngoài hứa hẹn và tự bơi thì không có gì để bàn nhiều. Thậm chí để học xong chứng chỉ bên đó với người vừa đi làm vừa nonIT còn rất bất khả thi. Ban đầu mình cũng nghĩ tự học là tốt nhưng chính bản thân đi xin việc dơ chứng chỉ bên đó NTD nói không yên tâm với chất lượng. Cũng may là lạc sang f8 mà mình đã thuận lợi qua 4 chứng chỉ kia của funix. Tuy nhiên vì thời gian học ngắn nên chưa học kỹ hết các video bên F8. Bản thân mình thấy f8 dạy khá dễ hiểu và hiểu trước thì mới làm được. Đồng thời cộng đồng F8 chắc lạc không ít con đẻ của Funix.','2023-04-13 00:00:00',26,1,5,1,2),(7,'Deploy Spring Boot cùng SQL Server lên Azure','63f0e2755a6c0.jpg','Microsoft Azure là nền tảng tính toán đám mây được xây dựng bởi Microsoft dành cho xây dựng, kiểm thử, triển khai và quản lý các ứng dụng và dịch vụ thông qua mạng lưới trung tâm dữ liệu được quản lý bởi Microsoft. Nó cung cấp các phần mềm, nền tảng, và hệ thống cơ sở hạ tầng như các dịch vụ hỗ trợ nhiều ngôn ngữ lập trình, framework, công cụ khác nhau.','2023-04-14 00:00:00',25,1,6,2,6),(8,'So sánh JavaScript với những đối thủ khác','6305ca717d756.jpg','JavaScript và C C được compile (biên dịch) trước. Còn JavaScript được interpret (thông dịch) và đôi khi được biên dịch trong thời gian chạy bằng just-in-time (JIT) compiler. C là static typing. Còn JavaScript là dynamic typing. C yêu cầu lập trình viên phải cấp phát và lấy lại các khối bộ nhớ. JavaScript xử lý điều này tự động. Code C phải được biên dịch lại khi chuyển sang một bộ xử lý khác. JavaScript thì không cần thiết. C được thiết kế để hoạt động trực tiếp với bộ nhớ của máy tính thông qua các con trỏ. JavaScript thì không. C thường được sử dụng cho các ứng dụng nhúng vào máy tính và các ứng dụng đòi hỏi hiệu suất cao như hệ điều hành. Còn JavaScript chỉ được nhúng vào các trang web, nhưng nó đã tìm thấy vai trò mới trong các ứng dụng phía máy chủ được phát triển bởi Node.js. C cung cấp khả năng kiểm soát rõ ràng các luồng, trong khi JavaScript khuyến khích người dùng sắp xếp nhiều task bằng cách chia các tác vụ thành các hàm không đồng bộ và được gọi khi dữ liệu đã sẵn sàng.','2023-04-15 00:00:00',25,1,7,1,2),(9,'[Part 2] C#(.NET) - Tương tác với file Excel','6157e3742c6ba.jpg','Chào mọi người, trong một lần làm việc và được yêu cầu làm một tính năng X và sử dụng thư viện Microsoft.Office.Interop.Excel để thực hiện tương tác với file excel. Dưới đây là cách mình áp dụng thư viện Interop Excel vào để giảm tải thao tác trên phần mềm.','2023-04-16 00:00:00',26,1,8,2,7),(10,'Các nguồn tài nguyên hữu ích cho 1 front-end developer','613a1f36eed00.jpg','Visual studio code: là 1 trình soạn thảo code được nhiều người sử dụng nhất hiện nay với khả năng code được nhiều ngôn ngữ và rất nhiều extension hổ trợ cho việc code','2023-04-17 00:00:00',26,1,9,3,7),(11,'test2','613a1f36eed00.jpg','test','2023-04-17 00:00:00',25,0,1,1,2),(12,'test','613a1f36eed00.jpg','test','2023-04-17 00:00:00',26,3,1,1,2),(15,'thử nhé','backGround2.jpg','<p><strong>Thử th&ocirc;i&nbsp;</strong></p>\r\n<p><strong><img src=\"blog/backGround1.jpg\" alt=\"\" width=\"404\" height=\"212\" /></strong></p>\r\n<p><strong>Hay lắm</strong></p>\r\n<p><strong><img src=\"blog/backGround2.jpg\" alt=\"\" width=\"412\" height=\"206\" /></strong></p>','2023-07-22 01:06:53',25,0,2,4,2),(16,'Hãy giúp tôi khắc phục cách code ','backGround2.jpg','<p><em>H&atilde;y gi&uacute;p t&ocirc;i l&agrave;m b&agrave;i tập nh&eacute;.</em></p>\r\n<p><em><img src=\"blog/backGround2.jpg\" alt=\"\" width=\"376\" height=\"188\" /></em></p>\r\n<p><em>H&atilde;y&nbsp;</em><em>H&atilde;y gi&uacute;p t&ocirc;i l&agrave;m b&agrave;i tập nh&eacute;.</em></p>\r\n<p><em><img src=\"blog/backGround1.jpg\" alt=\"\" width=\"380\" height=\"199\" /></em></p>','2023-07-22 01:10:02',25,1,2,1,2);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogcomment`
--

DROP TABLE IF EXISTS `blogcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogcomment` (
  `BlogCommentID` int NOT NULL AUTO_INCREMENT,
  `BlogID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `origin_comment_id` int DEFAULT NULL,
  `reply_to_user` int DEFAULT NULL,
  `content` longtext,
  `publish` datetime DEFAULT NULL,
  PRIMARY KEY (`BlogCommentID`),
  KEY `fk_BlogComment_Blog1_idx` (`BlogID`),
  KEY `fk_BlogComment_User1_idx` (`UserID`),
  KEY `fk_BlogComment_User2_idx` (`reply_to_user`),
  CONSTRAINT `fk_BlogComment_Blog1` FOREIGN KEY (`BlogID`) REFERENCES `blog` (`BlogID`),
  CONSTRAINT `fk_BlogComment_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `fk_BlogComment_User2` FOREIGN KEY (`reply_to_user`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogcomment`
--

LOCK TABLES `blogcomment` WRITE;
/*!40000 ALTER TABLE `blogcomment` DISABLE KEYS */;
INSERT INTO `blogcomment` VALUES (11,1,32,1,11,32,'aaaa','2023-06-25 00:00:00'),(12,1,23,2,11,32,'aaaaa','2023-06-25 00:00:00'),(16,1,23,1,16,23,'ok hello','2023-06-25 00:00:00'),(17,1,23,2,16,23,'woew','2023-06-25 00:00:00'),(18,1,23,1,18,23,'hello guys','2023-06-25 00:00:00'),(19,1,23,1,19,23,'hello babe','2023-06-26 00:00:00'),(22,1,23,1,22,23,'helloo gúy','2023-06-26 00:00:00'),(23,1,32,2,22,23,'welcome to F8 ','2023-06-26 00:00:00'),(24,1,32,2,22,23,'HEHE','2023-06-26 00:00:00'),(25,1,23,1,25,23,'Hellodat tien','2023-06-26 00:00:00'),(29,1,23,1,29,23,'hi','2023-06-26 00:00:00'),(30,1,23,2,29,23,'da','2023-06-26 00:00:00'),(32,1,23,1,32,23,'helllo broo','2023-06-27 10:16:24'),(33,1,23,1,33,23,'welcome to ll','2023-06-27 13:43:39'),(34,1,23,1,34,23,'welcome to llIII','2023-06-27 13:44:07'),(38,1,23,1,38,23,'<p><strong>dadadad</strong></p>','2023-06-30 09:12:55'),(39,1,23,1,39,23,'<p><em>da <img src=\"blog/623d4b2d95cec.png\" alt=\"\" width=\"180\" height=\"180\" /></em></p>','2023-06-30 09:38:02'),(44,1,23,1,44,23,'<p><span style=\"text-decoration: underline;\"><strong>Hello</strong></span></p>','2023-06-30 18:45:00'),(59,1,23,2,58,23,'ok','2023-06-30 00:00:00'),(60,1,23,2,58,23,'oke men','2023-06-30 00:00:00'),(61,1,23,2,39,23,'oke bro','2023-06-30 19:38:30'),(68,1,23,1,68,23,'<p>Heloo Men&nbsp;</p>\r\n<p><img src=\"blog/f8-icon.7ad2b161d5e80c87e516.png\" alt=\"\" width=\"123\" height=\"124\" /></p>','2023-06-30 20:00:56'),(69,1,23,2,68,23,'wow đẹp quá','2023-06-30 20:01:09'),(70,1,23,1,70,23,'<p>Hello</p>','2023-06-30 22:26:58'),(71,1,23,1,71,23,'<p><strong>Hellooo</strong></p>\r\n<p><strong><img src=\"blog/f8-icon.7ad2b161d5e80c87e516.png\" alt=\"\" width=\"89\" height=\"89\" /></strong></p>','2023-06-30 22:27:27'),(73,1,23,1,73,23,'<p>dấ</p>','2023-06-30 23:03:00'),(74,1,23,1,74,23,'<p><strong>đ&aacute;</strong></p>\r\n<p><strong><img src=\"blog/623d4b2d95cec.png\" alt=\"\" width=\"180\" height=\"180\" /></strong></p>\r\n<p><strong><img src=\"blog/318373525_886269375875027_5512792420077401664_n.jpg\" alt=\"\" width=\"283\" height=\"237\" /></strong></p>','2023-06-30 23:04:01'),(75,1,23,2,11,32,'ok mpo','2023-07-01 00:16:46'),(78,2,23,2,73,23,'<p><strong>đ&aacute;</strong></p>','2023-07-01 01:17:28'),(79,2,23,2,73,23,'<p>oke</p>','2023-07-01 01:20:38'),(80,2,23,2,73,23,'<p>oke men</p>','2023-07-01 01:21:05'),(81,2,1,2,73,23,'<p>oke b</p>','2023-07-01 01:21:39'),(82,1,1,2,74,23,'<p>?</p>','2023-07-01 01:56:25'),(83,4,1,1,83,1,'<p><strong>đ&atilde; ty</strong></p>\r\n<p><strong><img src=\"blog/623d4b2d95cec.png\" alt=\"\" width=\"180\" height=\"180\" /></strong></p>','2023-07-01 02:13:22'),(84,3,23,1,84,23,'<p><span style=\"text-decoration: underline;\">EHello</span></p>','2023-07-01 23:25:17'),(85,4,23,2,83,1,'<p><strong>Hello men</strong></p>\r\n<p><strong><img src=\"blog/minimalist-clothing-shop-logo-design-online-shop-store_486176-880.png\" alt=\"\" width=\"261\" height=\"261\" /></strong></p>','2023-07-10 13:34:18'),(86,4,23,1,86,23,'<p><em><strong>c&aacute; t&ocirc;m cua thịt&nbsp;</strong></em></p>\r\n<p><em><strong><img src=\"blog/minimalist-clothing-shop-logo-design-online-shop-store_486176-880.png\" alt=\"\" width=\"122\" height=\"122\" /></strong></em></p>','2023-07-10 14:30:50'),(87,4,23,2,86,23,'<p><span style=\"text-decoration: underline;\"><em>chuẩn b&agrave;i r&ograve;i</em></span></p>','2023-07-10 14:37:40'),(88,2,30,1,88,30,'<p><strong>Hello</strong></p>','2023-07-10 14:44:57'),(89,4,30,2,86,23,'<p>Oke bro</p>','2023-07-10 15:29:00'),(90,4,23,1,90,23,'<p><strong>Helll</strong></p>','2023-07-11 11:33:21'),(91,4,1,2,90,23,'<p>Helllp</p>','2023-07-11 11:33:46'),(92,4,23,2,83,23,'<p><strong>hay lam</strong></p>\r\n<p><strong><img src=\"blog/Chụp web_14-7-2023_12115_localhost.jpeg\" alt=\"\" width=\"397\" height=\"202\" /></strong></p>','2023-07-14 00:00:00'),(93,2,23,2,88,30,'<p><span style=\"text-decoration: underline;\">hay the</span></p>','2023-07-14 16:46:04'),(94,2,23,1,94,23,'<p><em>welcome to f8&nbsp;</em></p>\r\n<p><em><img src=\"blog/Chụp web_14-7-2023_122037_github.com.jpeg\" alt=\"\" width=\"138\" height=\"70\" /></em></p>','2023-07-14 16:46:36'),(95,1,23,1,95,23,'<p><strong>ok&nbsp;</strong></p>','2023-07-21 11:11:25'),(96,3,23,1,96,23,'<p><strong>HEllooo</strong></p>','2023-07-21 12:45:59'),(97,3,23,1,97,23,'<p><strong>H&atilde;y mua h&agrave;ng đi nh&eacute;</strong></p>\r\n<p><strong><img src=\"blog/avatar2.jpg\" alt=\"\" width=\"172\" height=\"152\" /></strong></p>','2023-07-21 17:00:45'),(98,3,23,2,97,23,'<p>hay <img src=\"blog/ano.jpg\" alt=\"\" width=\"163\" height=\"163\" /></p>','2023-07-21 17:01:34'),(99,6,23,1,99,23,'<p><strong>Hello c&aacute;c bạn đ&atilde; gi&uacute;p m&igrave;nh</strong> &nbsp;?</p>','2023-07-22 10:27:01'),(100,6,23,1,100,23,'<p><strong>Xin ch&agrave;o&nbsp;</strong></p>\r\n<p><strong><img src=\"blog/backGround2.jpg\" alt=\"\" width=\"286\" height=\"143\" /></strong></p>','2023-07-22 10:27:33'),(101,6,1,2,100,23,'<p><em>xin ch&agrave;o bạn.</em></p>','2023-07-22 10:28:02');
/*!40000 ALTER TABLE `blogcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogtag`
--

DROP TABLE IF EXISTS `blogtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogtag` (
  `BlogTagID` int NOT NULL AUTO_INCREMENT,
  `BlogTagName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BlogTagID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtag`
--

LOCK TABLES `blogtag` WRITE;
/*!40000 ALTER TABLE `blogtag` DISABLE KEYS */;
INSERT INTO `blogtag` VALUES (1,'Front-end'),(2,'Javascript'),(3,'HTML CSS'),(4,'Other'),(5,'UI'),(6,'Backend'),(7,'VSCode');
/*!40000 ALTER TABLE `blogtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogtopic`
--

DROP TABLE IF EXISTS `blogtopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogtopic` (
  `BlogTopicID` int NOT NULL AUTO_INCREMENT,
  `BlogTopicName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BlogTopicID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtopic`
--

LOCK TABLES `blogtopic` WRITE;
/*!40000 ALTER TABLE `blogtopic` DISABLE KEYS */;
INSERT INTO `blogtopic` VALUES (1,'Front-end / Mobile App'),(2,'Back-end / DevOps'),(3,'UI / UX / Design'),(4,'Others');
/*!40000 ALTER TABLE `blogtopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CategoryImage` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Status` int DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Front  end','frontend.jpg','Lập trình viên Front-end là người xây dựng ra giao diện websites. Trong phần này F8 sẽ chia sẻ cho bạn lộ trình để trở thành lập trình viên Front-end nhé.',1),(2,'Back end','backend.jpg','Trái với Front-end thì lập trình viên Back-end là người làm việc với dữ liệu, công việc thường nặng tính logic hơn. Chúng ta sẽ cùng tìm hiểu thêm về lộ trình học Back-end nhé.',1),(3,'Basic','intro.jpg','d132s13d2as13d',0),(13,'test12312sáasa','','123456651221',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Image` varchar(9000) DEFAULT NULL,
  `CourseInfo` varchar(300) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `User_UserID` int NOT NULL,
  `Category_CategoryID` int NOT NULL,
  `FeeStatus` int DEFAULT NULL,
  `VideoIntro` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `fk_Course_User1_idx` (`User_UserID`),
  KEY `fk_Course_Category1_idx` (`Category_CategoryID`),
  CONSTRAINT `fk_Course_Category1` FOREIGN KEY (`Category_CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `fk_Course_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Kiến Thức Nhập Môn IT ','assets/images/course/KienThucNhapMonIT.jpg','Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên xem các videos tại khóa này trước nhé.','Để theo ngành IT - Phần mềm cần rèn luyện những kỹ năng nào? Bạn đã có sẵn tố chất phù hợp với ngành chưa? Cùng thăm quan các công ty IT và tìm hiểu về văn hóa, tác phong làm việc của ngành này nhé các bạn.',1,3,2,0,'assets/video/VideoIntro.mp4'),(2,'HTML CSS Pro','assets/images/course/htmlCssPro.jpg','Từ cơ bản tới chuyên sâu, thực hành 8 dự án, hàng trăm bài tập, trang hỏi đáp riêng, cấp chứng chỉ sau khóa học và mua một lần học mãi mãi.','Để học web Front-end chúng ta luôn bắt đầu với ngôn ngữ HTML và CSS, đây là 2 ngôn ngữ có mặt trong mọi website trên internet. Trong khóa học này F8 sẽ chia sẻ từ những kiến thức cơ bản nhất. Sau khóa học này bạn sẽ tự làm được 2 giao diện websites là The Band và Shopee.',1,2,1,1299000,'assets/video/VideoIntro.mp4'),(3,'Node & ExpressJS','assets/images/course/NodeJs.jpg','Học Back-end với Node & ExpressJS framework, hiểu các khái niệm khi làm Back-end và xây dựng RESTful API cho trang web.','Một ứng dụng Back-end hiện đại có thể rất phức tạp, việc sử dụng code thuần (tự tay code từ đầu) không phải là một lựa chọn tốt. Vì vậy các Libraries và Frameworks ra đời nhằm đơn giản hóa, tiết kiệm thời gian và tiền bạc để nhanh chóng tạo ra được sản phẩm cuối cùng.',1,1,3,2350000,'assets/video/VideoIntro.mp4'),(4,'Coder Life Style','assets/images/course/coderLife.jpg','Từ cơ bản tới chuyên sâu, thực hành 8 dự án, hàng trăm bài tập, trang hỏi đáp riêng, cấp chứng chỉ sau khóa học và mua một lần học mãi mãi.','Để theo ngành IT - Phần mềm cần rèn luyện những kỹ năng nào? Bạn đã có sẵn tố chất phù hợp với ngành chưa? Cùng thăm quan các công ty IT và tìm hiểu về văn hóa, tác phong làm việc của ngành này nhé các bạn.',1,3,1,0,'assets/video/VideoIntro.mp4'),(5,'Lập trình JavaScript','assets/images/course/javaS.jpg','Từ cơ bản tới chuyên sâu, thực hành 8 dự án, hàng trăm bài tập, trang hỏi đáp riêng, cấp chứng chỉ sau khóa học và mua một lần học mãi mãi.','Để theo ngành IT - Phần mềm cần rèn luyện những kỹ năng nào? Bạn đã có sẵn tố chất phù hợp với ngành chưa? Cùng thăm quan các công ty IT và tìm hiểu về văn hóa, tác phong làm việc của ngành này nhé các bạn.',1,2,3,0,'assets/video/VideoIntro.mp4'),(11,'JavaScript cơ bản cực kỳ','assets/images/course/javaSCoBan.jpg','Từ cơ bản tới chuyên sâu, thực hành 8 dự án, hàng trăm bài tập, trang hỏi đáp riêng, cấp chứng chỉ sau khóa học và mua một lần học mãi mãi.','Để theo ngành IT - Phần mềm cần rèn luyện những kỹ năng nào? Bạn đã có sẵn tố chất phù hợp với ngành chưa? Cùng thăm quan các công ty IT và tìm hiểu về văn hóa, tác phong làm việc của ngành này nhé các bạn.',1,3,1,0,'assets/video/VideoIntro.mp4');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseenroll`
--

DROP TABLE IF EXISTS `courseenroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseenroll` (
  `CourseEnrollID` int NOT NULL,
  `Status` int DEFAULT NULL,
  `LessonCurrent` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EnrollDate` date DEFAULT NULL,
  `User_UserID` int NOT NULL,
  `Course_CourseID` int NOT NULL,
  PRIMARY KEY (`CourseEnrollID`),
  KEY `fk_courseenroll_user1_idx` (`User_UserID`),
  KEY `fk_courseenroll_course1_idx` (`Course_CourseID`),
  CONSTRAINT `fk_courseenroll_course1` FOREIGN KEY (`Course_CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `fk_courseenroll_user1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseenroll`
--

LOCK TABLES `courseenroll` WRITE;
/*!40000 ALTER TABLE `courseenroll` DISABLE KEYS */;
INSERT INTO `courseenroll` VALUES (1,1,'Kiến Thức Nhập Môn IT ','2023-06-06',36,1),(2,1,'HTML CSS Pro','2023-08-06',36,2),(3,1,'Node & ExpressJS','2023-07-06',36,3);
/*!40000 ALTER TABLE `courseenroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dicuss`
--

DROP TABLE IF EXISTS `dicuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dicuss` (
  `DicussID` int NOT NULL,
  `LessonDetail_LessonDetailID` int NOT NULL,
  PRIMARY KEY (`DicussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dicuss`
--

LOCK TABLES `dicuss` WRITE;
/*!40000 ALTER TABLE `dicuss` DISABLE KEYS */;
INSERT INTO `dicuss` VALUES (1,1);
/*!40000 ALTER TABLE `dicuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `LessonID` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Course_CourseID` int NOT NULL,
  PRIMARY KEY (`LessonID`),
  KEY `fk_Lesson_Course1_idx` (`Course_CourseID`),
  CONSTRAINT `fk_Lesson_Course1` FOREIGN KEY (`Course_CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'Khái niệm kỹ thuật cần biết ',1),(2,'Môi trường, con người IT',1),(3,'Phương pháp, định hướng',1),(4,'Hoàn thành khóa học',1),(5,'Bắt đầu',2),(6,'Làm quen với HTML ',2),(7,'Các thẻ tiêu đề ',2),(8,'Thẻ đoạn văn ',3),(9,'Chữ đậm, chữ nghiêng',3);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessondetail`
--

DROP TABLE IF EXISTS `lessondetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessondetail` (
  `LessonDetailID` int NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Video` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Lesson_LessonID` int NOT NULL,
  `Dicuss_DicussID` int NOT NULL,
  PRIMARY KEY (`LessonDetailID`),
  KEY `fk_LessonDetail_Lesson1_idx` (`Lesson_LessonID`),
  KEY `fk_LessonDetail_Dicuss1_idx` (`Dicuss_DicussID`),
  CONSTRAINT `fk_LessonDetail_Dicuss1` FOREIGN KEY (`Dicuss_DicussID`) REFERENCES `dicuss` (`DicussID`),
  CONSTRAINT `fk_LessonDetail_Lesson1` FOREIGN KEY (`Lesson_LessonID`) REFERENCES `lesson` (`LessonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessondetail`
--

LOCK TABLES `lessondetail` WRITE;
/*!40000 ALTER TABLE `lessondetail` DISABLE KEYS */;
INSERT INTO `lessondetail` VALUES (1,'Mô hình Client - Server là gì?','assets/video/ClientServer.mp4','Mô hình Client - Server là gì?','00:00:14',1,1),(2,'Domain là gì? Tên miền là gì?','assets/video/Domain.mp4','Domain là gì? Tên miền là gì?','00:07:24',1,1),(3,'Học IT cần tố chất gì? Góc nhìn khác từ chuyên gia định hướng giáo dục','assets/video/ITTochat.mp4','Học IT cần tố chất gì? Góc nhìn khác từ chuyên gia định hướng giáo dục','00:00:14',2,1),(4,'Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì?','assets/video/SVTT.mp4','Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì?','00:00:14',2,1),(5,'Trải nghiệm thực tế sau 2 tháng làm việc tại doanh nghiệp của học viên F8?','assets/video/TraiNghiep.mp4','Trải nghiệm thực tế sau 2 tháng làm việc tại doanh nghiệp của học viên F8?','00:00:14',2,1),(6,'Phương pháp học lập trình của Admin F8?','assets/video/ClientServer.mp4','Phương pháp học lập trình của Admin F8?','00:00:14',3,1),(7,'Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?','assets/video/Domain.mp4','Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?','00:00:14',3,1),(8,'8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!','assets/video/SVTT.mp4','8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!','00:00:14',3,1),(9,'Tại sao nên học trên website này hơn là học trên Youtube?','assets/video/ITTochat.mp4','Tại sao nên học trên website này hơn là học trên Youtube?','00:00:14',3,1),(10,'Ứng tuyển xin việc làm','assets/video/ClientServer.mp4','Các bạn hãy làm theo đúng trình tự mà F8 hướng dẫn các bạn dưới đây nhé.','00:04:52',4,1),(11,'Chào mừng',NULL,NULL,NULL,5,1),(12,'Nội dung khóa học',NULL,NULL,NULL,5,1),(13,'Kinh nghiệm học hiệu quả ',NULL,NULL,NULL,5,1),(14,'Giới thiệu tổng quan',NULL,NULL,NULL,6,1),(15,'Ngôn ngữ trùn duyệt',NULL,NULL,NULL,6,1),(16,'Khai báo DOCTYPE',NULL,NULL,NULL,6,1),(17,'Thẻ tiêu đề h1',NULL,NULL,NULL,7,1),(18,'Thẻ tiêu đề h2',NULL,NULL,NULL,7,1),(19,'Thẻ tiêu đề h3',NULL,NULL,NULL,7,1),(20,'Thẻ tiêu đề a',NULL,NULL,NULL,7,1);
/*!40000 ALTER TABLE `lessondetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecomment`
--

DROP TABLE IF EXISTS `likecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecomment` (
  `User_UserID` int NOT NULL,
  `BlogComment_BlogCommentID` int NOT NULL,
  KEY `fk_LikeComment_User1_idx` (`User_UserID`),
  KEY `fk_LikeComment_BlogComment1_idx` (`BlogComment_BlogCommentID`),
  CONSTRAINT `fk_LikeComment_BlogComment1` FOREIGN KEY (`BlogComment_BlogCommentID`) REFERENCES `blogcomment` (`BlogCommentID`),
  CONSTRAINT `fk_LikeComment_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecomment`
--

LOCK TABLES `likecomment` WRITE;
/*!40000 ALTER TABLE `likecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `ReplyID` int NOT NULL,
  `ReplyDetail` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Ask_AskID` int NOT NULL,
  PRIMARY KEY (`ReplyID`),
  KEY `fk_Reply_Ask1_idx` (`Ask_AskID`),
  CONSTRAINT `fk_Reply_Ask1` FOREIGN KEY (`Ask_AskID`) REFERENCES `ask` (`AskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saveblog`
--

DROP TABLE IF EXISTS `saveblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saveblog` (
  `User_UserID` int NOT NULL,
  `Blog_BlogID` int NOT NULL,
  `save_day` datetime DEFAULT NULL,
  KEY `fk_SaveBlog_User1_idx` (`User_UserID`),
  KEY `fk_SaveBlog_Blog1_idx` (`Blog_BlogID`),
  CONSTRAINT `fk_SaveBlog_Blog1` FOREIGN KEY (`Blog_BlogID`) REFERENCES `blog` (`BlogID`),
  CONSTRAINT `fk_SaveBlog_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saveblog`
--

LOCK TABLES `saveblog` WRITE;
/*!40000 ALTER TABLE `saveblog` DISABLE KEYS */;
INSERT INTO `saveblog` VALUES (1,1,'2023-06-25 00:00:00'),(32,1,'2023-06-26 00:00:00'),(32,3,'2023-06-26 00:00:00'),(32,2,'2023-06-26 00:00:00'),(1,2,'2023-06-26 00:00:00'),(30,1,'2023-07-10 15:07:39'),(30,6,'2023-07-10 15:07:45'),(30,4,'2023-07-10 15:32:42'),(30,3,'2023-07-10 15:39:23'),(1,5,'2023-07-14 16:44:06'),(70,1,'2023-07-19 22:26:41'),(23,1,'2023-07-21 23:00:57'),(23,2,'2023-07-21 23:00:59'),(23,3,'2023-07-21 23:01:00'),(23,5,'2023-07-21 23:01:03'),(23,7,'2023-07-21 23:03:58');
/*!40000 ALTER TABLE `saveblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savelike`
--

DROP TABLE IF EXISTS `savelike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savelike` (
  `Blog_BlogID` int NOT NULL,
  `User_UserID` int NOT NULL,
  KEY `fk_SaveLike_Blog1_idx` (`Blog_BlogID`),
  KEY `fk_SaveLike_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_SaveLike_Blog1` FOREIGN KEY (`Blog_BlogID`) REFERENCES `blog` (`BlogID`),
  CONSTRAINT `fk_SaveLike_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savelike`
--

LOCK TABLES `savelike` WRITE;
/*!40000 ALTER TABLE `savelike` DISABLE KEYS */;
INSERT INTO `savelike` VALUES (1,30),(2,23),(1,26),(1,1),(1,23),(4,23),(3,23),(5,23),(16,23);
/*!40000 ALTER TABLE `savelike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Facebook` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Github` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Password` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Image` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Address` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GmailID` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FacebookID` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GithubID` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `UserRole_RoleID` int NOT NULL,
  `CodeVerify` varchar(15) DEFAULT NULL,
  `Bio` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BackgroundImage` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `fk_User_UserRole1_idx` (`UserRole_RoleID`),
  CONSTRAINT `fk_User_UserRole1` FOREIGN KEY (`UserRole_RoleID`) REFERENCES `userrole` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'datnthe163935@fpt.edu.vn',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759','','nguyen tien dat','https://lh3.googleusercontent.com/a/AAcHTtcHcDfRFdO-bVLlRPHZZXUXhw5Y0buWdvOHTHF-=s96-c',NULL,NULL,'102306450618911922490',NULL,NULL,1,1,NULL,NULL,NULL),(2,'hientk160222@fpt.edu.vn',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759','','tran khanh hien','https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg?fbclid=IwAR0ELpNfLNqpekS3lSXMcALh3pr-zFHgtdxpCNrm48O89KA3aSyQRaNKErg',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL),(3,'kienbvhe161471@fpt.edu.vn',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759',NULL,'bui van kien','https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg?fbclid=IwAR0ELpNfLNqpekS3lSXMcALh3pr-zFHgtdxpCNrm48O89KA3aSyQRaNKErg',NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,NULL),(4,'duongnqhe171601@fpt.edu.vn',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759',NULL,'nguyen quy duong','https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg?fbclid=IwAR0ELpNfLNqpekS3lSXMcALh3pr-zFHgtdxpCNrm48O89KA3aSyQRaNKErg',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL),(23,'tiendat320@gmail.com',NULL,NULL,'E10ADC3949BA59ABBE56E057F20F883E',NULL,'Nguyen Tien Dat','assets/images/userProfile/avatar1.jpg',NULL,NULL,'107695717564484456736',NULL,NULL,1,2,'5530','','assets/images/background/avatar1.jpg'),(24,NULL,NULL,NULL,'D41D8CD98F00B204E9800998ECF8427E','0915288966','tien dat','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL),(25,'td@gmail.com',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759',NULL,'van tien','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,NULL),(26,'td2@gmail.com',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759',NULL,'kien trung ','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,4,'178',NULL,NULL),(28,NULL,NULL,NULL,'D41D8CD98F00B204E9800998ECF8427E','0865474685','tien dat','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL),(30,NULL,NULL,'dat12312','E10ADC3949BA59ABBE56E057F20F883E',NULL,'dat12312','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png','2023-06-11',NULL,NULL,NULL,'134717300',1,2,NULL,NULL,NULL),(32,'nguyentien18011978@gmail.com',NULL,NULL,'E10ADC3949BA59ABBE56E057F20F883E',NULL,'Nguyen Tien ','https://lh3.googleusercontent.com/a/AAcHTteIrBlkw8BjuIBNHGix_XJAzmaV3s5CrMdeahRO=s96-c',NULL,NULL,'110259517086804332400',NULL,NULL,1,2,'8768',NULL,NULL),(33,NULL,NULL,NULL,'D41D8CD98F00B204E9800998ECF8427E','0982766369','Dương Bùi','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL),(34,NULL,NULL,NULL,'D41D8CD98F00B204E9800998ECF8427E','0912656836','thay','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL),(36,'td3@gmail.com',NULL,NULL,'E10ADC3949BA59ABBE56E057F20F883E',NULL,'td3','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,0,2,'1831',NULL,NULL),(54,NULL,NULL,NULL,'D41D8CD98F00B204E9800998ECF8427E','0961498125','văn kiên test phone','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL),(70,'td4@gmail.com',NULL,NULL,'E10ADC3949BA59ABBE56E057F20F883E',NULL,'td4','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,'7512',NULL,NULL),(72,'kbui0212@gmail.com',NULL,NULL,'E10ADC3949BA59ABBE56E057F20F883E',NULL,'van kien','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,'3415',NULL,NULL),(110,'dat276536@gmail.com',NULL,NULL,'FCEA920F7412B5DA7BE0CF42B8C93759',NULL,'dat','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',NULL,NULL,NULL,NULL,NULL,1,2,'7446',NULL,NULL),(111,'tiendat288966@gmail.com','tiendat288966@gmail.com',NULL,'D41D8CD98F00B204E9800998ECF8427E',NULL,'Đạt Nguyễn','https://lh3.googleusercontent.com/a/AAcHTtfJ3VCVbQ0XYr1_dl43kTHJkMhzUhcH7lrLbnIVmVRq=s96-c','2023-07-21',NULL,'113982039723370497255','109476868830128',NULL,1,2,NULL,NULL,NULL),(112,NULL,NULL,'BVKien','D41D8CD98F00B204E9800998ECF8427E',NULL,'BVKien','https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png','2023-07-21',NULL,NULL,NULL,'108357953',1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin'),(2,'Customer'),(3,'Sales'),(4,'Expert'),(5,'Marketing');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 20:00:27
