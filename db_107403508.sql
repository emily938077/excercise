-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.3    Database: db_107403508
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_seat`
--

DROP TABLE IF EXISTS `tb_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_seat` (
  `seat_id` char(5) NOT NULL,
  PRIMARY KEY (`seat_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seat`
--

LOCK TABLES `tb_seat` WRITE;
/*!40000 ALTER TABLE `tb_seat` DISABLE KEYS */;
INSERT INTO `tb_seat` VALUES ('10A'),('10B'),('10C'),('10D'),('1A'),('1B'),('1C'),('1D'),('2A'),('2B'),('2C'),('2D'),('3A'),('3B'),('3C'),('3D'),('4A'),('4B'),('4C'),('4D'),('5A'),('5B'),('5C'),('5D'),('6A'),('6B'),('6C'),('6D'),('7A'),('7B'),('7C'),('7D'),('8A'),('8B'),('8C'),('8D'),('9A'),('9B'),('9C'),('9D');
/*!40000 ALTER TABLE `tb_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_station`
--

DROP TABLE IF EXISTS `tb_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_station` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) NOT NULL,
  `location_marker` int(11) NOT NULL,
  `time_marker` int(11) NOT NULL,
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `station_id_UNIQUE` (`station_id`),
  UNIQUE KEY `station_locationmarker_UNIQUE` (`location_marker`),
  UNIQUE KEY `station_time_marker_UNIQUE` (`time_marker`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_station`
--

LOCK TABLES `tb_station` WRITE;
/*!40000 ALTER TABLE `tb_station` DISABLE KEYS */;
INSERT INTO `tb_station` VALUES (1,'台北',1,0),(2,'桃園',3,20),(3,'新竹',4,30),(4,'台中',8,60),(5,'高雄',15,120);
/*!40000 ALTER TABLE `tb_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_station_has_tb_train`
--

DROP TABLE IF EXISTS `tb_station_has_tb_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_station_has_tb_train` (
  `tb_station_station_id` int(11) NOT NULL,
  `tb_train_train_id` int(11) NOT NULL,
  `tb_train_departure_station` int(11) NOT NULL,
  PRIMARY KEY (`tb_station_station_id`,`tb_train_train_id`,`tb_train_departure_station`),
  KEY `fk_tb_station_has_tb_train_tb_train1_idx` (`tb_train_train_id`,`tb_train_departure_station`),
  KEY `fk_tb_station_has_tb_train_tb_station1_idx` (`tb_station_station_id`),
  CONSTRAINT `fk_tb_station_has_tb_train_tb_station1` FOREIGN KEY (`tb_station_station_id`) REFERENCES `tb_station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_station_has_tb_train_tb_train1` FOREIGN KEY (`tb_train_train_id`, `tb_train_departure_station`) REFERENCES `tb_train` (`train_id`, `departure_station`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_station_has_tb_train`
--

LOCK TABLES `tb_station_has_tb_train` WRITE;
/*!40000 ALTER TABLE `tb_station_has_tb_train` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_station_has_tb_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ticket`
--

DROP TABLE IF EXISTS `tb_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `train_date` date NOT NULL,
  `train_id` int(11) NOT NULL,
  `departure_station` int(11) NOT NULL,
  `arrival_station` int(11) NOT NULL,
  `seat_id` char(5) NOT NULL,
  `price` int(11) NOT NULL,
  `book_time` datetime NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`,`user_id`,`seat_id`,`train_id`),
  UNIQUE KEY `ticket_id_UNIQUE` (`ticket_id`),
  KEY `ticket_user_id_idx` (`user_id`),
  KEY `ticket_train_id_idx` (`train_id`),
  KEY `ticket_seat_id_idx` (`seat_id`),
  CONSTRAINT `ticket_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `tb_seat` (`seat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_train_id` FOREIGN KEY (`train_id`) REFERENCES `tb_train` (`train_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ticket`
--

LOCK TABLES `tb_ticket` WRITE;
/*!40000 ALTER TABLE `tb_ticket` DISABLE KEYS */;
INSERT INTO `tb_ticket` VALUES (1,1,'2020-06-10',1,1,2,'1D',200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(2,1,'2020-06-10',1,2,5,'3B',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(3,2,'2020-06-10',2,2,5,'2A',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(4,2,'2020-06-12',2,3,4,'2A',400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(5,3,'2020-06-13',3,1,5,'3D',1400,'2020-06-12 20:30:00','2020-06-13 07:35:00'),(6,4,'2020-06-13',3,2,3,'4B',100,'2020-06-12 14:30:00','2020-06-12 17:35:00'),(7,5,'2020-06-15',4,5,2,'1A',1200,'2020-06-15 10:22:00',NULL),(8,6,'2020-06-15',4,5,1,'2A',1400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(9,7,'2020-06-16',5,4,2,'5A',500,'2020-06-12 10:31:00',NULL),(10,7,'2020-06-16',5,4,2,'5B',500,'2020-06-11 10:31:00',NULL),(11,7,'2020-06-16',5,4,2,'5C',500,'2020-06-11 10:31:00','2020-06-11 11:35:00'),(12,8,'2020-06-16',6,3,2,'6C',500,'2020-06-16 10:30:00','2020-06-16 10:36:00'),(13,5,'2020-06-27',3,2,5,'6B',1200,'2020-06-26 22:49:44','2020-06-26 22:54:39'),(14,5,'2020-06-17',3,2,5,'3C',1200,'2020-06-26 22:50:15',NULL);
/*!40000 ALTER TABLE `tb_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_train`
--

DROP TABLE IF EXISTS `tb_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `departure_station` int(11) NOT NULL,
  `offdate` date DEFAULT NULL,
  `ondate` date NOT NULL,
  PRIMARY KEY (`train_id`,`departure_station`),
  KEY `train_departurestation_station_idx` (`departure_station`),
  CONSTRAINT `train_departurestation_station` FOREIGN KEY (`departure_station`) REFERENCES `tb_station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_train`
--

LOCK TABLES `tb_train` WRITE;
/*!40000 ALTER TABLE `tb_train` DISABLE KEYS */;
INSERT INTO `tb_train` VALUES (1,NULL,'07:00:00',1,'2020-07-15','2020-01-01'),(1,'07:20:00','07:22:00',2,'2020-07-15','2020-01-01'),(1,'07:32:00','07:34:00',3,'2020-07-15','2020-01-01'),(1,'08:04:00','08:06:00',4,'2020-07-15','2020-01-01'),(1,'09:06:00',NULL,5,'2020-07-15','2020-01-01'),(2,NULL,'10:00:00',1,'2020-07-15','2020-01-01'),(2,'10:20:00','10:22:00',2,'2020-07-15','2020-01-01'),(2,'10:32:00','10:34:00',3,'2020-07-15','2020-01-01'),(2,'11:04:00',NULL,4,'2020-07-15','2020-01-01'),(3,NULL,'13:00:00',1,NULL,'2020-02-01'),(3,'13:20:00','13:22:00',2,NULL,'2020-02-01'),(3,'13:32:00','13:34:00',3,NULL,'2020-02-01'),(3,'14:04:00','14:06:00',4,NULL,'2020-02-01'),(3,'15:06:00',NULL,5,NULL,'2020-02-01'),(4,'10:06:00',NULL,1,NULL,'2020-02-01'),(4,'09:44:00','09:46:00',2,NULL,'2020-02-01'),(4,'09:32:00','09:34:00',3,NULL,'2020-02-01'),(4,'09:00:00','09:02:00',4,NULL,'2020-02-01'),(4,NULL,'08:00:00',5,NULL,'2020-02-01'),(5,'13:04:00',NULL,1,NULL,'2020-02-01'),(5,'12:42:00','12:44:00',2,NULL,'2020-02-01'),(5,'12:30:00','12:32:00',3,NULL,'2020-02-01'),(5,NULL,'12:00:00',4,NULL,'2020-02-01'),(6,'19:06:00',NULL,1,NULL,'2020-01-01'),(6,'18:44:00','18:46:00',2,NULL,'2020-01-01'),(6,'18:32:00','18:34:00',3,NULL,'2020-01-01'),(6,'18:00:00','18:02:00',4,NULL,'2020-01-01'),(6,NULL,'17:00:00',5,NULL,'2020-01-01'),(7,NULL,'09:00:00',1,NULL,'2020-09-15'),(7,'11:00:00',NULL,5,NULL,'2020-09-15'),(8,NULL,'09:00:00',1,NULL,'2020-09-15'),(8,'11:00:00',NULL,5,NULL,'2020-09-15');
/*!40000 ALTER TABLE `tb_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(200) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `salt` char(64) NOT NULL,
  `registertime` date NOT NULL,
  `isdelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  UNIQUE KEY `user_salt_UNIQUE` (`salt`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'Marvel_Steve@gmail.com','Steve','Rogers','1918-07-04','63652315D22919A8EC76F58F982EC08A6244474F8082B8E75A1271B3C63948E9','2019-06-06',NULL),(2,'Marvel_Tony@gmail.com','Tony','Stark','1970-05-29','AA52032EAB8CC92F7B77CCE828940F95C2369F18DDF1C6B3A80A8A6195D137FB','2019-06-07',NULL),(3,'Marvel_Thor@gmail.com','Thor','God','1911-01-01','3C567E0EA40F26755BB221C96AB02CC726DE673E85016EC1D949D14E5B16B223','2019-06-08',NULL),(4,'Marvel_Peter@gmail.com','Peter','Parker','2000-08-10','95B79B147E492681F98C749E3AC329C1A975D3F4000FF25D0643D8D55A4E4E2B','2019-06-09',NULL),(5,'Marvel_David @gmail.com','David','Banner','1980-11-22','EB7F11AE33003238D3FF14094E3BC569F077B8F39DF472423FD339CE22B5F050','2019-06-10',NULL),(6,'Marvel_Natasha@gmail.com','Natasha','Romanoff','1984-11-22','5F79D14FB8A43CA9350E781EA1067B14B197D36671182C4C15E9EDBD921791DD','2019-06-11',NULL),(7,'Marvel_Wanda@gmail.com','Wanda','Maximoff','1980-08-02','9C681B6D73E80D3C1F10E06BDEB48914ABE207ADA83405DC14485B6AD060C021','2019-06-12',NULL),(8,'Marvel_Carol@gmail.com','Carol','Danvers','1980-08-01','6C40F0CC5D46DCE7D1A0E1D118E0750A7874087FC7199DDA34D171131002DCA9','2019-06-13',NULL),(9,'Marvel_Stephen@gmail.com','Stephen','Strange','1930-07-01','039FB5567A6B559BE9999BF854BEF1699A14CB912AF431CCF90D9941900D8788','2019-06-14',NULL),(10,'Marvel_Clint@gmail.com','Clint','Barton','1971-01-07','ABC1523C0333408EFF2B8CCF4248A0B2175723EBC65C8D05940B9D434B7A39A2','2019-06-15',NULL),(11,'aa@gmail.com','a','a','2000-09-09','sc','2020-06-26',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userCredential`
--

DROP TABLE IF EXISTS `tb_userCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_userCredential` (
  `userCredential` int(11) NOT NULL AUTO_INCREMENT,
  `credential_user_id` int(11) NOT NULL,
  `hashedpwd` char(225) NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`userCredential`,`credential_user_id`),
  UNIQUE KEY `userCredential_UNIQUE` (`userCredential`),
  UNIQUE KEY `user_id_UNIQUE` (`credential_user_id`),
  UNIQUE KEY `userCredentialpwd_UNIQUE` (`hashedpwd`),
  CONSTRAINT `userCredential_user_id` FOREIGN KEY (`credential_user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userCredential`
--

LOCK TABLES `tb_userCredential` WRITE;
/*!40000 ALTER TABLE `tb_userCredential` DISABLE KEYS */;
INSERT INTO `tb_userCredential` VALUES (1,1,'pfNFnTx50OjhU','2019-06-06'),(2,2,'brpgOmotwsnkA','2019-06-07'),(3,3,'brCHXrfmx/hRs','2019-06-08'),(4,4,'broklWTNGanYM','2019-06-09'),(5,5,'brrQ/CUvMgDMI','2019-06-10'),(6,6,'brCAXrfmx/hRs','2019-06-11'),(7,7,'bretXExZ676DI','2019-06-12'),(8,8,'brhAsn.S9pHfM','2019-06-13'),(9,9,'brv2uIUQT8QN2','2019-06-14'),(10,10,'brtnGNHRCIzXY','2019-06-15'),(11,11,'se','2020-06-26');
/*!40000 ALTER TABLE `tb_userCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_107403508'
--

--
-- Dumping routines for database 'db_107403508'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_BookTicket`(
	in in_user_id int,
    in in_train_id int,
    in in_departure_station int,
    in in_arrival_station int,
    in in_train_date date,
    out num_row int(100)
    )
BEGIN
	declare in_seat_id char(5);
    declare price int;
    declare depmarker int;
    declare arrmarker int;
    declare tr_on_date date;
    declare tr_off_date date;
    declare diffday int;
    
    -- on_date off_date
	select ondate into tr_on_date from tb_train where train_id = in_train_id and departure_station = in_departure_station;
    select offdate into tr_off_date from tb_train where train_id = in_train_id and departure_station = in_departure_station;
	-- seat
    select seat_id into in_seat_id from tb_seat order by rand() limit 1;   -- 先隨機產生座位
    while ( in_seat_id in (select seat_id from tb_ticket where train_id = in_train_id and train_date = in_train_date))do  -- 假如前面產生的座位重複了
	 	select seat_id into in_seat_id from tb_seat order by rand() limit 1;  -- 再做一次
     end while;
    -- price
    select location_marker into depmarker from tb_station where station_id = in_departure_station;
    select location_marker into arrmarker from tb_station where station_id = in_arrival_station;
    set price = abs(arrmarker-depmarker) *100;
	if( in_train_date > tr_on_date and in_train_date < date_add(now(),interval 14 day) 	-- 火車日期在火車有開的時間內、定的票是14天內的
		and ((in_train_date < tr_off_date) or (tr_off_date is null)) and in_train_date >= curdate() )then			-- 不能訂過去的票		
		if exists (select user_id from tb_user where user_id = in_user_id) 
			and (select departure_station from tb_train where train_id = in_train_id and departure_station = in_departure_station) -- 判斷火車有沒有通過那站
            and (select departure_station from tb_train where train_id = in_train_id and departure_station = in_arrival_station)then
			if exists (select train_id from tb_train where train_id = in_train_id)then
				insert into tb_ticket (ticket_id, user_id, train_date, train_id, departure_station, arrival_station,	
					seat_id, price, book_time, pay_time)
				values(null, in_user_id, in_train_date, in_train_id, in_departure_station, in_arrival_station, 
					in_seat_id, price, now(), null);
				select max(ticket_id) into num_row from tb_ticket where user_id = in_user_id; -- 找出剛剛產生的那個ticket_id 當作num_row
				select ticket_id, user_id, train_id, departure_station, arrival_station,	
					seat_id, book_time, train_date from tb_ticket where ticket_id = num_row;
			else set num_row = 0;
			end if;
		else set num_row = 0;
		end if;
	else set num_row = 0;
	end if;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
	in in_user_id int(10), 
    out affected_row_num int(100)
    )
BEGIN
	declare u_id int;
	if exists(select user_id from tb_user where user_id = in_user_id and isdelete != 1) then
		if exists(select user_id from tb_ticket where user_id = in_user_id) then
			SET affected_row_num = 0;
		else 
			update tb_user set user_email = user_id, firstname = user_id, lastname = user_id, dob = curdate(), salt = user_id ,isdelete = 1
				where user_id = in_user_id;  -- 將user變成無效值
            select user_id into u_id from tb_user where user_id = in_user_id;
            SET affected_row_num = u_id;
		end if;
	else SET affected_row_num = 0;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_bookticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_Delete_bookticket`(
	in in_user_id int,
    in in_ticket_id int,
    out affected_row_num int(100)
    )
BEGIN
	if exists (select user_id from tb_ticket where user_id = in_user_id and in_ticket_id = ticket_id 
		and paytime is null)then		-- 確認那張ticket是那個user的且還沒付錢
        delete from tb_ticket where ticket_id = in_ticket_id;   -- 刪除ticket
        set affected_row_num = in_ticket_id;
	else
		set affected_row_num = 0;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_GetBookTicketByUser`(
	in in_user_id int(10),
    out num_row int(100)
    )
BEGIN
	
	if exists (select user_id from tb_ticket where user_id = in_user_id)then  -- 確認user有ticket
		select ticket_id, user_id as userID, train_id, seat_id, book_time from tb_ticket
			where user_id =in_user_id and  pay_time is null and train_date >= curdate() -- 選出要的東西 確認那是user的且是還沒付錢的票且是今天或是未來的票
            and date_add(book_time,interval 3 day) >now() ;  							-- 且在在訂票後的三天內
		
        select count(ticket_id) from tb_ticket where user_id = in_user_id and pay_time is null 
			and train_date >= curdate() and date_add(book_time,interval 3 day) >now()
			into num_row;
	else set num_row = 0;	
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_GetStation`(
	out num_row int
)
BEGIN
	SELECT station_id, station_name FROM tb_station;
    select count(station_id) from tb_station into num_row;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PayTicket(join table)` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_PayTicket(join table)`(
	in in_user_id int ,
    in in_ticket_id int,
    out affected_row_num int
    )
BEGIN
	declare canpayday datetime;
    declare lastpaytime datetime;
    declare departuredatetime datetime;
    declare departtime time;
    declare dep_sta int;
    declare tr_id int;
    declare tr_date date;
    declare arrivaldate date;
	declare departuredate date;
    
    select date_add(book_time,interval 3 day) into canpayday from tb_ticket		-- 訂完三天內要付錢
		where ticket_id = in_ticket_id; -- booktime + 3 day 
    
    set lastpaytime = date_add(now(),interval 30 minute); -- now + 30 min 用來和出發時間做比較
    
    select departure_station into dep_sta from tb_ticket where ticket_id = in_ticket_id;
    select train_id into tr_id from tb_ticket where ticket_id = in_ticket_id;
    select train_date into tr_date from tb_ticket where ticket_id = in_ticket_id;
    
    select departure_time into departtime from tb_train 
		where departure_station = dep_sta and train_id = tr_id;  -- 找出出發時間
    
    set departuredatetime =concat (tr_date," ",departtime);               
	select train_date into departuredate from tb_ticket where ticket_id = in_ticket_id;
	select train_date into arrivaldate from tb_ticket where ticket_id = in_ticket_id;
                    
	if exists (select ticket_id from tb_ticket where (now() < canpayday) and (ticket_id = in_ticket_id)
		and (pay_time is null) and (user_id = in_user_id))then   -- 確認輸入的ticket_id 要在book_time的3天內 也要確認還沒付款
	 	if (departuredatetime > lastpaytime)then   -- 確認現在在出發時間30分鐘以前
	 		update tb_ticket set pay_time = now() where ticket_id = in_ticket_id;	-- 更新pay_time ->已付款
			select ticket_id, user_id, new_table.train_id,new_table.departure_station,arrival_station,seat_id,
			  	book_time,departure_time,
	 		 	new_table.arrival_time as arrival_time,price,pay_time 
	 		 	from(select ti.train_id,ticket_id,user_id,price,book_time,
	 		 		pay_time,seat_id,ti.departure_station,arrival_station,arrival_time from tb_ticket ti
	 		 		left join tb_train tr on ti.train_id = tr.train_id 
	 		 		and ti.arrival_station = tr.departure_station) new_table   -- 用一個暫時table來取arr_time 
	 		 	left join tb_train tr on new_table.train_id = tr.train_id 
	 		 	and new_table.departure_station = tr.departure_station
	 		 	where ticket_id = in_ticket_id;
	 		set affected_row_num = found_rows();
            
		else set affected_row_num = 0; 
		end if;
	else set affected_row_num = 0;  	 
	end if; 
    if exists (select ticket_id from tb_ticket where (now() >= canpayday or departuredatetime < lastpaytime) and (ticket_id = in_ticket_id) )then
	 	delete from tb_ticket where ticket_id = in_ticket_id;
	 end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QueryTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_QueryTicket`(
	in in_departure_time time,
    in in_departure_station int,
    in in_arrival_station int,
    in in_train_date date,
    out num_row int(100) )
BEGIN
	declare price int;
    declare depmarker int;
    declare arrmarker int;
    declare isseat int;
    select location_marker into depmarker from tb_station where station_id = in_departure_station;
    select location_marker into arrmarker from tb_station where station_id = in_arrival_station;
    set price = abs(arrmarker-depmarker) *100;
	
    if( in_train_date < date_add(curdate(),interval 14 day) and in_train_date >= curdate())then	-- 判斷要訂的時間是否在14天內
    if( in_departure_station < in_arrival_station )then  -- 南下的車
		select tb_dep.train_id as train_id, tb_dep.departure_station as departure_station, 
			tb_arr.departure_station as arrival_station,
			tb_dep.departure_time as departure_time, tb_arr.arrival_time as arrival_time, price 
		from (select train_id, departure_station, arrival_time , ondate, offdate
			from tb_train where departure_station = in_arrival_station) tb_arr -- 取出目的地的時間 把它變成一個表
            inner join tb_train tb_dep on tb_arr.train_id = tb_dep.train_id
		where tb_dep.departure_station = in_departure_station and tb_arr.departure_station = in_arrival_station 
			and (tb_dep.departure_time > in_departure_time) and (tb_arr.arrival_time > in_departure_time)    -- 出發時間跟抵達時間都要大於要出發的時間
            and (tb_dep.departure_time < tb_arr.arrival_time )												 -- 抵達時間要大於出發時間
            and (40 > (select count(seat_id) from tb_ticket where train_date = curdate() 					 -- 看看位子還有沒有
					and train_id = tb_dep.train_id))
			and (in_departure_station < in_arrival_station) and tb_arr.ondate < curdate() 					 -- 出發站<抵達站 (南下) 判斷是否為合法的train
			and (tb_arr.offdate > curdate() or tb_arr.offdate is null)
            and tb_dep.ondate < curdate() and (tb_dep.offdate > curdate() or tb_dep.offdate is null);
		set num_row = found_rows();  -- 上面選了幾行
	else -- 北上的車
		select tb_dep.train_id as train_id, tb_dep.departure_station as departure_station, 
			tb_arr.departure_station as arrival_station,
			tb_dep.departure_time as departure_time, tb_arr.arrival_time as arrival_time, price 
		from (select train_id, departure_station, arrival_time , ondate, offdate
			from tb_train where departure_station = in_arrival_station) tb_arr 
            inner join tb_train tb_dep on tb_arr.train_id = tb_dep.train_id
		where tb_dep.departure_station = in_departure_station and tb_arr.departure_station = in_arrival_station 
			and (tb_dep.departure_time > in_departure_time) and (tb_arr.arrival_time > in_departure_time)
            and (tb_dep.departure_time < tb_arr.arrival_time )
            and (40 > (select count(seat_id) from tb_ticket where train_date = curdate() 
					and train_id = tb_dep.train_id)) and (in_departure_station > in_arrival_station)
			and (in_departure_station > in_arrival_station) and tb_arr.ondate < curdate() 
			and (tb_arr.offdate > curdate() or tb_arr.offdate is null)
            and tb_dep.ondate < curdate() and (tb_dep.offdate > curdate() or tb_dep.offdate is null);
		set num_row = found_rows();
	end if;
	else set num_row = 0;
    end if;
    
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
	in in_email varchar(255),
    in in_firstname varchar(100),
    in in_lastname varchar(100),
    in in_Dob date,
    in in_salt char(64),
    in in_hashedPwd char(225),
    out row_num int(100)
    )
BEGIN
	declare u_id int;
    if exists (select user_email from tb_user where user_email = in_email)then
		-- email already exits, exit sp.
        set row_num = 0;
        
	else
		insert into tb_user (user_id, user_email, firstname, lastname, Dob, salt, registertime, isdelete)
		values(
			null, -- user_id
			in_email,
			in_firstname,
			in_lastname,
			in_Dob,
			in_salt,
			CURDATE(),
            0
			);
	select user_id into u_id from tb_user where user_email=in_email; -- 剛剛創的user_id
    insert into tb_userCredential (userCredential, credential_user_id, hashedpwd, createtime)
    values(
		null, -- userCredential_id
        u_id, -- credential_user_id
        in_hashedPwd,
        CURDATE() -- get now time
	);  
	set row_num = u_id;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ResetNewPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_ResetNewPassword`(
	in in_userID int(10), 
    in in_hashedPwd char(255),
    in in_salt char(64),
    out affected_row_num int(100) 
	)
BEGIN
	 if exists (select user_id from tb_user where user_id = in_userID and isdelete !=1)then
		update tb_user set salt= in_salt where user_id = in_userID;  -- 改在user的salt
		if exists (select credential_user_id from tb_userCredential where credential_user_id = in_userID)then
			update tb_userCredential set hashedpwd = in_hashedPwd where credential_user_id = in_userID;	-- 改在userCredential的hashedpwd
            set affected_row_num = in_userID;
		end if;
	else set affected_row_num = 0;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TrainManagement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_TrainManagement`(
	in in_train_id int(20),	
    in in_off_date date,
    in in_departure_time time,
	in in_departure_station varchar(100),
	in in_arrival_station varchar(100),
	in in_on_date date,
    out affected_row_num int(100)
    )
BEGIN
	declare deptimemarker int;
    declare arrtimemarker int;
    declare thour int;
    declare tmin int;
    declare depdatetime datetime;
    declare arrdatetime datetime;
    declare arrhourtime datetime;
    declare arr_hour int;
    declare arr_min int;
    declare t_id int;
    declare arr_time time;
    if (in_off_date > (select date_add(curdate(), interval 14 day)) )then			-- 判斷修該班次的日期是否再14天以後
	update tb_train set offdate = in_off_date where train_id = in_train_id;		-- 設定off_date
    -- 找出arrival_time
    select time_marker into deptimemarker from tb_station where station_id = in_departure_station;   
    select time_marker into arrtimemarker from tb_station where station_id = in_arrival_station;  
     set thour = abs(deptimemarker-arrtimemarker) / 60;
     set tmin = abs(deptimemarker-arrtimemarker) % 60;
     set depdatetime = concat("2020-06-26 ", in_departure_time);
     select date_add(depdatetime, interval thour hour) into arrhourtime;
	 select date_add(arrhourtime, interval tmin minute) into arrdatetime;
     select extract(hour from arrdatetime) into arr_hour;
	 select extract(minute from arrdatetime) into arr_min;
     set arr_time = concat(arr_hour,":",arr_min);
     select date_format(arrdatetime,'%k:%i:%s') into arr_time;
     -- 新增新的train
     insert into tb_train (train_id, arrival_time, departure_time, departure_station, offdate, ondate)
	 	values( null, null, in_departure_time, in_departure_station, null, in_on_date);
     select max(train_id) into t_id from tb_train ;   
     insert into tb_train (train_id, arrival_time, departure_time, departure_station, offdate, ondate)
	 	values( t_id, arr_time, null, in_arrival_station, null, in_on_date);
	
     select max(train_id) into t_id from tb_train ;
        
	 select tb_arr.train_id, tb_dep.departure_time, tb_arr.arrival_time, tb_dep.departure_station, arrival_station,offdate as off_date, ondate as on_date
        from (select train_id, arrival_time ,departure_station as arrival_station from tb_train where train_id = t_id) tb_arr -- 取出目的地的時間 把它變成一個表
		inner join tb_train tb_dep on tb_arr.train_id = tb_dep.train_id
		where tb_arr.arrival_time = arr_time and tb_dep.departure_time = in_departure_time;
     set affected_row_num = t_id;   
     else set affected_row_num = 0;
     end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403508`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
	in in_email varchar(200),
    in in_hashedPwd char(255),
    out row_num int(100)
    )
BEGIN
	declare u_id int;
    declare cu_id int;
	if exists(select user_id from tb_user where user_email = in_email and isdelete != 1) then
		select user_id into u_id from tb_user where user_email=in_email;
		if exists(select credential_user_id from tb_userCredential where hashedpwd = in_hashedPwd) then
			select credential_user_id into cu_id from tb_userCredential where hashedpwd = in_hashedPwd;
            -- 如果email對到的id跟hashedpwd對到的id一樣就顯示user_id 不一樣的話就顯示0
			select if (u_id = cu_id, u_id, 0) into row_num; 
		else set row_num = 0;
			end if;
	else set row_num = 0;  -- email不再tb_user裡面或是已被刪除
	end if;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26 22:59:55
