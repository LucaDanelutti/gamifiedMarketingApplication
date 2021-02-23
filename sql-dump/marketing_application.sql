-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: marketing_application
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_logs` (
  `timestamp` datetime(3) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `compilation_requested` tinyint(1) NOT NULL,
  `compilation_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`timestamp`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
INSERT INTO `login_logs` VALUES ('2021-02-23 17:40:27.825',3,0,0),('2021-02-23 17:49:34.660',3,0,0),('2021-02-23 17:53:57.622',1,1,0),('2021-02-23 18:04:27.782',1,1,0),('2021-02-23 18:14:20.504',1,1,0),('2021-02-23 18:15:15.716',6,1,1),('2021-02-23 18:18:27.795',1,1,1),('2021-02-23 18:19:02.178',6,0,0),('2021-02-23 18:19:11.811',7,1,1);
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offensive_words`
--

DROP TABLE IF EXISTS `offensive_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offensive_words` (
  `word` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offensive_words`
--

LOCK TABLES `offensive_words` WRITE;
/*!40000 ALTER TABLE `offensive_words` DISABLE KEYS */;
INSERT INTO `offensive_words` VALUES ('db2'),('java'),('jee'),('jpa'),('polimi');
/*!40000 ALTER TABLE `offensive_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (27,14,'Questionnaire: Motorcycle - Review 2'),(28,14,'Questionnaire: Motorcycle - Review 1'),(29,14,'Questionnaire: Motorcycle - Review 3');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaires` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `image` mediumblob NOT NULL,
  `date` date NOT NULL,
  `isEnabled` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaires`
--

LOCK TABLES `questionnaires` WRITE;
/*!40000 ALTER TABLE `questionnaires` DISABLE KEYS */;
INSERT INTO `questionnaires` VALUES (14,'Motorcycle',_binary 'PNG\r\n\Z\n\0\0\0\rIHDR\0\0 \0\0\0£\0\0\03p\0\0\0gAMA\0\0±üa\0\0\0sRGB\0®\Î\é\0\0\0PLTEGpLn 			\Z\0GpL*##ir!  !v\r!$b	!#$&{\"$-/0$\'(\'366$%%\'*,\'()+--(0339;<BEE699þþþ¿œ¹UWV?AA:??\'[][\r	PRQKNM\n\nY\ZFII`ca*)2$0§/7€\'3ª8;fig\n\npvu ,P\Zp)\r\r-*\n*.5v}|ippq-)¥ 1f&%	D8¥.\0i\"v%~*\r\0\0\rY#\"_\" 59¡¢.ªBA~\Z\'kK! Pùúù. .kaaš«§\"~$-\r		{}}`\0\÷}zs0üüü<\\IDD®Ž³>rrk\'**	SG@=<<\\[\\œœ·NJJ\Ô\Ù\Øb+)\Ï\Ò\ÒD??		.3xttXZYr41º>?888233G.)NNM\n		M\0$&»RMlD7\ì\ë\ç	[^^\æ\é\ç^]\\[8/\Ç\Ì\ËBCBü\ã\ÙYZY\\]]MFG__^qts±ž·JKJ\æ\ì\ì\ÔBAkml#\"\"¯neûûú£A>¿|rI?AUWV UN\õª¶\ÃÆžž¶uxv\ó¹šC:4\ôÉœ\ã\ä\áhif\æs}*2978ÀŒ»!%&Éú\Ö\È**+¬Š€e]mE«­«montRN\ânaY!·t\ãXO\Ü\Ù\ÖÀNW\nÏ°¡K\æŠH¬®¬»-5\õ\ïëº8\È\Â\Â\ã¹v«­¬\çw\ö\Õ\Í\Éûù\ô\êv\Õ\Ù\×\èbUÿ\î\âd_€JL\0\0\0tRNS\0ÿÿÿÿÿÿ\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿdÿÿÿÿÿÿÿÿÿÿÿÿÿÿMÿ]ÿÿÿÿÿÿ+ÿÿ\Zÿÿÿÿ	ÿÿÿÿÿÿÿÿÿÿ\"ÿÿN3ÿÿÿÿÿÿÿHCÿÿÿÿÿÿÿÿÿÿÿÿü<VÿÿÿÿÿÿÿÿÿÿÿÿRÿÿ,ÿÿÿÿpÿþþÿDÿûÿÿþ\å|ÿ\Ó;ÿþÿ	ª«ÿR±ÿÿº\Þÿ\Æ\Åÿÿþÿ)\îr_ÿÿ\ìÿþ\âJËŒ%\ãþÿ\ð\Ûÿÿÿ¡=þþl\óÿþÿl\äÿýÿ?\âÿœ\ÐYb\Â\ÓÿÿMÿÿ\æÄ¥ÿýÿÿÿþ\æjÿ\àý·ÿ§ÿÿ\ÃÿäŸp\è\Ê\Ï\ÉÉÚ~\0\0 \0IDATx\Ú\ì\ØoL\ç\0\ð[|\÷ú?\×I.Qf\ï|>ù\ï\É\Þù»\íK]Ktl¥_Z\\WdM³J«\Éj\ðš\ÑI±¡Y\'-R>T	²DD!]H\àCF2\ÔBb	\Å,ÿV(Z±@²\íœÚ\Ñ.\"\öÇ-\ì;~\÷Œ\Ï\óŒ ÿ[¡Dl®S~­Ä>ÊH\ä<¡¯I\Îb\"\áv\'\ÄJ­\é\ãÉ¹!D¡\õ\éxd¢b¶\"Ž\Êg%}\à2«=\ã\ó4\Û-º+\Ë\ì\òŒ\Ê\Ç=\ã+B\ß\à8:6\ãv+ý~¹}Wùy\\\Å,\â©ø Yq[\ì(\Æ1cRœ¶[<¯ I\ÜN­-ù«|flšÁj\÷qŸ^\ÑýC°þ$f¢(~5c¯4*.hfù*€ü/H ©w|6\ö#Xp hø*Ì¯\"€Tz<\ðkz\ÏS¡\ñ¶Àd\ñX\á/\åe#Q\ç\Ì\Â	f\nÍŒ!\åRs\Ô+\×ü^¿\õZrÁ1}~7/-¶ŒÙ\ãµ|Wqy©>m¶\ä9xn\æþý\Çss\÷¥XXXH$\Äb.×\õ<s$œr\ë\ä\ê#\æ\öcHÜŸO\\\ÔQ$\áµ6\Ü2&J*\r<3Š¢!!=\ÜM§9þC\é=rºÕ³\ÕeJ\\:\Ó;&g\Íu\ó\Ó4\Í¢±< (WL\Òn\é\å;D7\ïL\ás³S7?»\òfcc\ã\Þ\Æzx`N\óÁE\ã\é®LFv(\ÚO}\ðQ+¢\ß\â!úýø\ì\ØØµ\ñ³:!p\î\óy\àp¹\ð^qis¿iBJ€87\Òv\Ó\ï¥L€\ÝN\ËË!\Ø/,Db±\Ô0t(ŠŒ\àX\ë\Ö\Î\òz\äŽ\Ï\î\ò9œÜù\ñkçœ¬\æi;c\\]\Z#\â&\Ý R\"\Í\ÊÓ¿£ià¢.»\ÍFRf\Â\á\r	>`5Sv. \ÄbBT%3}}}]\ñ³o \åVµ\Ób\Z«\Ý\á#{\Ï^\Ï\É2~uq\0X\í\Ý\å9{³\ÈÁ?L\îÿËªHx$ Ì\ÕB\âT HÔš(3Z\éh,¡`(H;\ÍI\"iû£^\'[\èW\nZ+e¶Á\áf8®5E1\n\ÏW\î\Ã¿œa!¹}#7û\ëj\ßÄ±mÛ4\ÃUfv\âÀfW©\Ôv L\àhÁp(6\Ü5\Ýp7Sz\ôk\Ës0Á?f@QUšu«²;i\Þ\ï\"aúhâ¿;\Ö%¢DQ¿A!ùÓS\ï\ÂT\ÐC¥g$i	\Óbš\Ñ\à\"5ž\Å\0\Þ\0¬F\Ð(\æø\È\õ\ã\ðJz6ª}\ã{¯77_¢¹5«_aúw\öz€ù\È1\é\ì\ào\n\à\ç5v3iŽý\0š°\Zþ(Q\ÜX\×U\"ã°\÷\rgZ\êVB«ÕªPŠF£©1&UÃ«¢1¬žŒB\Ðp\êÄ¢<\Ç\ÒGZ×œ\ÎäŽ\ó\Æ\Ã\'OÛFF\Ú`,\Î\Ï?¿Ôª_I&\å7^\Öü\æ\Ç@#j$D`ª­¯w\"\0l\ËD\Ò=ÆÔ»\ãM\ñ\ä@W:	(f¶Ÿ\õsL¡UÁH&\Z#F\â·Y0\0Ž.	x\ö\ór\ë\Ê&\æ\Ëm#\Ø¿Z\Èt\é§Kg\÷\õHJ\ñµ?1¥Y\Â\Â5\Ýü\ì\æ\Í[S±X:\ä9?,IH$tW&B\Ê\r\0\õ^¹\Ò¥X¬	\âû\ê4\ÒIHr2Aª\ÆJPÈ[l€&5À	\'Kû\Ö%\ä3\éühÛ<.µ=\ð\Ýü\Ã\ãÍ$\å\ÚDz$û\éGÂ¬\ëJ²e\ê¯_fC4LÀ\ïdx¯+.%Î­[¶¯9øA<¥3\éÁh€0\ê\ä\Õ&Áª	\Ça{£(n2 \Z\ÂL?8\÷\âBz$7\ß6410 \ó¬Î¶¶Âü»\Ñ\'O7{V§\ç©\ãIul|8n!Ò³¥ÒÃj\Ò `K£T\ä\ò#QL$\Ö=0zb§\é\×¯¯u\ÄûzFF§`0\êº$®µPT\"2(d#aP€\Ådi\ô\ß\é|Q!x\Ìr¹011R*\r\Ë\Ó\÷\Z\ö\ß;q¢££\\\Ñ3\Ð\'\É\õF\n2\Ò\ñ¹\åTR.­\Îg\öË­\ä\ì_gf\Ó]\ÑSÉŸ\Ø{\íW\ìžurÃ²OŠB·D\÷ºGj\òiºwžP\"Dùzn*ºX`U(F£N­V@$\öO\Å[CRø\æFú\Î\æÉ\'\ïMNŸ\Ú}\è\ä\ÉC\Ü\÷î»»wwwÿV³\éROOa P\è\Ïm\å\ò\âü£bv¹¶\ç\òø$Õ¹±\ñ±\äá·þ\Ö3\è)^\ð;ýþ\övhb}É6«t,4\÷\Ü\ë!Cu:m5\r!\Ø%\÷fúBqX1NWk\Ô\nBeTiTc#7-Q\ðA\öF>y\éE<H\ç\âdC\Ãþ\îwÞ¯«ûIÝ¥šªª^xg\Ç.\éÕ·J¥Ù®U\å\é\òh\ÛÐ£qØ²b&s\íµ\ìr#»:ü\äÏ·ZB]©\ÙR&\Þ\æû\ÆO\ãaž\õ\à\0L·\ï»s\ë\Þ>^hÚ¢v\n\Â^&#\ÐiÒª0Z\ëµÑšUX\ÃI7Y-°µ\á\Ég) P0þ\Ò#û!O\Ãwv\ìÚ±g{\ÕÎ;«Ÿ%Euuµ\ô\ß\Ô\Õ\Õuw\ï2\êû\ÞNvL\Þ;\Ñ?=\Ý\ß\ß?=º8?^|\éú\ÙÅ«wÇ¥1\à\Æ\Ü\È\ì\'¥\äQ²=OŠÁ(°\n #\à`MC\ÜE8	\Ö\áHxn\á\Üú\Z.ŒcA\Ö^­6\òlm*f\ZªFµ®FGÀ®\Ó.\ÅR\r¢(³\n\Â\í×{{\ïAnt\È>{v\ìÙ³g\÷\öêªû\ö}e$Å\êjM©n{7~WÊ©ý\'$€\é\é\ò\â\à?ÎŠüÇ,\Ò9\Û3jùk\ÚKÆB\à¬}l\ç\Ç\í{y\ðœ\à\Ë\Ù|D\ÝŸ\Ï\âd\×A¶r\Ç\ÖiVšHU\ÉJ oRf)%\Í\"9@\ÉHŠ¬Le/\ÌX\ÒÁ6`­\Ô,¡\ÝT\ÐJ*­t£\Óè¶¿ªM:Qu¿\çl\Þ\Û\rÿÇû~¿¿\ß\ïyhMP\éèº\ã\å	µ?®\Äy#\ãs{µÁÏ/·%9~)\ð\Ú?º\ëP{\Ê\å^8 €²\rS»#[L¯R¢\ÄÿüµG$Ž\"°ÿ\óO7mz¶\ñ)§¡¡ŸŸ.D5F5D\õ\Õ\Õ\Ý\Ý\Ö\Õ\Ö¬\ën\0§\ZggPúü\ï]y\Â\è\Öo~»\×8|œÿ\æa.œ«Ðœ\éÁº^Fi%8K:\éu\÷º\íÿÚµ\\\rœ7Lz-\æu(\é\n^¡	¡š\å\äœx¡92bUAp	9€w)e\rlÿC\à\ÑÁ^\Ý\ô\ìú\r«\Z0P]|\Ö\ÜÚ\Õ\ÕÝ?\Ñ\Ä\ñ»O-|s\ö¿|\òú3\ï\ï¿\ö\ï¡\áaH\ä9\ï\ã\ç¥dIä )\Òsl\Ï\Ó(\ÄD*jdlT\Ø×£ümy.[ø\ðOj\É\Ð\ëPÌS\Ù4\Â%]DT\Êq\Ò4b\"&B$A \ïAT\ãte\è\ì®G]\×\Î\Íþu\Óú\r«\Zj|°5DÀ(ø£ú\îzK±®¶q\õç¶Ÿ:»\ôÇ£7g2\Ó^\ÊJ}|Ý±\ÈGBWm\n:\ôø-&\n¡|üi\nV¥·oN_Y^±_8\÷\î{\ç\'\ß\ß\îHŽbÐ!Pþ±BŠK\Ë0\áGª\Ìc5Fž©\rU	\Å\Ù\Ü\ÐépX\rútaý\Æ\Zù\é®!Â\î\'GF\Æo<px\ãÆ\É\æ\æ\÷¯Ÿra\æ\ò\å\nË3#g\ÓÀn@\ZZ(agübI\r\r\åu\åu·ÿ\à|\ÞF®\ê8Z\ög\Ö¢\ã\éž©!¢eU%\ì5\à\'aH~V\'·\Ù=s<\ðÑ zs\á\Æ\r«\ë\ï\ÅSëš\õ^«ùþB\ã\ãu p,<Y*µ\÷\Ø\Ý{eñ±±\òqª\Ó\õ\ìH 84\ÓQtf³\ÇFB\äa&\à#\Í\Z&\êß{{y\Åþ\à\Øu\ìmA\×TKCWG0¢š\È`£$U5Ub\áG¬]£¬\âÈ£Bu\å\ê¹ÿ­\"Ð·\Z\×4<\'xPQ\ë$f\ä[\â;\ë\ï©=(\ö\ïD?\n|Pß²£\Òi{qFj¡I°4\Óùü\ô\ÌG7¯O{1\ï6Ê±²z\ö\Ú//\÷8O~µKg\Î\'U\\§p\Ä`ùC!¡ \âp\ñ$\ÌÊŠªúeWPKA\òz|D_%#\Ð[\ßxºqU\Ì]<þ§¯\òQ,\\-o±0\ð	\Ö\\\è\ó)vN©±þýÍ\ñ\Ê\ÌD%o«ª ÒŒ©üÉ}Û\ó\Ò\å\Ý;o\'t¶L5ª \öw|}ùœ¯£m¿8²dVÒ\ÇT}?A±\'i\âL($\0`2\ÓTxd\Ç²oY\\\n|£w·nx\î\é5\r\÷³¹\Ð=U»Åº\Æ_\Ä\îÂœv©T\Z<}\Ê\ÏÌ<ûú\ç\æ/\\UXVf\ç*Ê·nýr\Èûy\Ó\Ì?h$rQ6Á\ð)F%cU\ÐPÿ\ï?\ÖQ1Q\à¥c?L\è\ðý¹¬Š	~yÇ¥\äýzÆªþÂµ\Þ\0<þº¬y)!\ó\ngn«2Z\ñ`18þ\Ö\Â3«×¬ªOP\Ð=*j\öùt»Ûªøb>}\åú­s\è\Ô3¯L+yG75©\\¡¹,\íM³g~ü\Ñ?\È\\\0DT$\è\ò8É$\ØüÎ¯\ï0Ý·\ÚþNZ2\r!2\È«#¢IR€U	\ái\Ã\ð\é²ê€žž\Ë\ä/-~ž-\ð€µk¿_x~\ÕS\r°¹\è~\á!€«\í\0,š\ï]]1\ß]\Å\Î>\è\ìz±®\ê\í\å%Ut*\ÏÍµ©\ë\Î@f&{\éü\é\éy\ÎTdd\"¬(A04!e-50x\ë±O\ñ}«Ab§uiøVÃ=MEX\Ã²¯!\Å/z`2Àèº²¶]Ñ¥ÅKûkÄ«\à\×~\ñ<n¿\Ï}|B\Í\ápŽP\ÞÛºn8\ð]ú£\ÍÀi\Ë\n\öw£üÝŠ\Ê\\¥<1\r\Ðe#²\ñM\ç<a`ÜþQÒ08\"\Ï\ÜþÇ¿©&\ö\Ëg\Î\Ç%Ÿ\Ú\ñ(\ØjÀ\ñk\åHÃŽ\Ê\ÄÍŽe\êEd\ÜMrz:eÛ®/\\ºqqi[Íº+×®l;|trÂ·ºj£)fs\Ïm@Pú 3@8±fÿ[±\Ødk\Ñ[üNWžT\ì\ÜAq<KBN0vtŽ©<_)³œþi\ÄP(\òrL2\à/*X<²]\ÛÉ§Š¹}¯=«ZbIIüªŠ\Ë,§¹Z&C\ð\Ï\áû`€e\Å-E7šP\Ú5L§R\é\ÕÞ³o\ÜU\ÝÏµ«\'\'\Æ\ö\ì9\Ú\\£þ²U\×7\Ôwu\Ä\î®\É\Òh\'At:\ÚJ\Å1þ4>\'CHŠpj²,J\ö\ìF\ñÐœ¢(Ê\àÀv\ðKË¹ùþ|!\÷\Ùº9\÷~)Â±t²\Û3*šHD(\r\r£\á#Ã²Ìu€Z\ÞV.\ëü\î\×7]<vm\Ès²\Ù\\\Ê*Oµú\Õ;ü0¥\Øm	OøH(_E¹J£{Æ ¯\æ9\ÄSÀcSc¬%C¹á¡g#\Â\ÛJ&\Òx%ŸªsY7\ÈZ^{R7\ç+p\×\ßVHv\"\á8\Ê{»§!B\Æ\Ñø:\öJKº\â\'\Ë;xŸ\ö\æ\ÒøZ8\É8	+m\Û6|W\ô\òTO\ð5\Í<$¡`\Ã]>±p©\Ô\Ñ1º%º¥2šsLÒ©É²¯$C$\ÓÄxe\"²Ã»w:\âC¬fZ°°I§\ðFl\×\ÍÁ\Û\Ê&\íO\ð/|«œ\ô\Æ\éŽÍš \Ùé\'\öeuHdD2\ä_\ÕÁ\0Q\"OgRŠJR2PKV_ @r]5\Å\nt\åÿ\ònþ1M\æw\ì\ó\ô\ë\Ó\ç)`yÓºh\ÙS\ÊÚkÊ+\Í\äid$\'3a)¢K«Z%S(\nD-²\ðG\Òx.§\ìüq\ã\\1kY%w\ÎÙŠw\Ê\áe\\Ì²\Ä\ä\ì\Ï%\Û\ç\ó}ZÀ\å\ö\Ï\"~P©±\Ï\ëùüx>\ß\ÏS»-C){\Êg\Ó2\rÀg_$5\ÕB	\ë\ë6YA¡-f\\\ÅUf\0Ñ±Ë²\ð\Ð\ÂBj\äc\ÐÁ€\ó=RN>T\\&\ôt¿\ÈL\á/µJ{e\âr4$\Ñ\ðAU2@.di­ddthË·:`2AQo#2aY\Ìh¹tŠ|Žv:Z\á?V\ð<\Íýi@<M×ª@:¥ª\'rQq¥\çMw(°e\îJ\ß\è@\öçª$j\ZÈŒlo¶\î	|ü\÷wš\Ýúø]K\ntœ§OwŸ\Ó\î\ôiÀ«>Wp(#9\ÍÈg\Ä\ò_hS,jÀ\ÜÀLZdj\\\Ñ8#Ýh5\óbZ}|Ok\ñ\÷@lÒ\ã\n8¥M)0\çÏo:¬xvA,Š!Hšÿ\èTDi\ÓQX:buyµœ\è0ÕŸŒ\érŒs\'zc\Þ\ö:YÝ\"N>Y\nšÆú¡&\ðo 0¬\Î\Îe1µg(a!\ã\ãBG­J)!aco±«¹þÃ­»\Z1\ë£lP.vX!ÿg)œ\Ì!\Óe,W·\Ò\à\Ðpn\ÏwyVÀT7ú\ó§\Ñ;§bf\Ü\á Ç©\ç	\Ï\r €Š#\ô·1}.g\Î+°\ÌŒ1xg \î\âRLÒC&\ô%z;^§\ÍPJ·\ö­ûú5\ähs3FE)\èP\0\Ì\ålZp8\Æ\r(Á¬OÖ·\"B@qV6\Ãá«²EH2\Þÿ\ä·Ÿùaf£\áF§$¢ag® \çt\è{4`C\ç/\ê\r<»\Ãe·«\òH~\êK5^=Äw€û0\ÚY4Š3gZw\÷uX¢\"e||K]]>V\ÊûsÊþcV\Ò\ìy.jp­ø!ÀÀ\÷}Ñ¯\Þ^¥=ËµYK_/E¡¢\Z%\Ä^g\æÍŒ6³¢B\Þº~¡]zfw\ÚA8\íT 9!B=¢pšB\"E\ÇX·¥€¡©ºR\âoin\Òlq&4œ¿b\ë\Î\ÃG5DP:«º]¡\ê±L/€G\'\ò\\BE\Í\áp\ï\ñù¢\ï®\Ú\áZu\ß\n}X\ZDVPŸ\Î<ž\Í\ëqnÍ²s°V	Ôp\0\0ŽP\óMSu ø\å\Ä\êª\0\ä7ŸD-m`\Î·ZMžD\ô\ï\öÖººª§>}::\÷·©ºX×®\ÃG¹ººº\ñº\Û\ÒÐ{ÿÓ¢KB\ôiTz}®Aoµ+F\÷=pø\áªoYf1Ýut\Ãn\"°{K\òO0o ;\ä\òdNd9^+\ÓI\Zœx0^\Ô\ó m!·\à~>Ÿžt€¬\Ò\òk0°bÔË®*\ëg\0\çx\Ä:5U±stjjj¬¢%V\Õ\ÚÞ|\âYÌªe&0tP¥ú\'\ôd(¶š\Ô\ív£V\r5ù²±4<tP1q,sn³¢x\îlû\ás§\òš\"4fø µ²^\Ý\É\Ø%ü1\æk\'þ\Ä\ÈØ¡ý§§ßH\Î\õ\ô\ô\Ì}MOX§&\àcjtjbttÿFTL\ÛúA\îvšH¢S\Ï\Ì\É\ímvE\ÖjYRû\ÞÒ¯^[ý]\ï,fp\èjY\à€3ÈÜœ\Úaù\É\çpq\ç»q\ö\Ó=8s\âü{ Ve(À±\èe\ã\0CeùŽÿr1hl}}úZ\Í\Ä\\\î\Ç\Ì}=\ÑRŸœººŒ\æ\õQj?þþ\÷Ÿ»q\Ów^9]µs\ß\îcPº;\ÓUÀj\ÍK¹Â¢R_ \Ëz£0ÿ°\é\rf\ïÖ;+BP¬\Ü\Ù</°¹\Ê\åL.okÀyú\n<\èIf\òú}®A³d×©xDm	¹°\ðd\ÛXu\Å\Ó\é\Ô#\Ü:©®P«s\êC\Ö`?>\\«\ïUe\ï\Ó\î\ÅvV\íj>v$/\ÝZ`!\0Rh6\Ë\âÒ²xG4\Úf\óKYx\ïþ\âj\à\äPxš\à\ÜE{ =ž\Íi,\'\ð¡,zŸ\Ñv\Â\"c@­t!Á\"CRXf\\£µ\Õ\Z\Z`Ò·OøL<\ß\Ã\íþd*46¶Á[__ÿJú({\Ãs­wCUWWL@zrê sØ±Uu8\Ël\Ä`Ù»\ð\ó/\éIW7>»O\èE\Þd~a&\è¹\ó\íøXRbÁùAKJ ®2x\Îh\ÖBï­x;JAc¶²O\õ\íz4x&\'\'\ïßwE\"Ù¡Ph\ãzj\ôT¿\Èn@œ\í=Ÿ\Ì*\Û[_µ³«ª\n(a\ó\Ý-6\'\â,u\Ù\n\n\ì\÷ÎœŽÇ¢³\ö?Á;_£\É\õ\íž7z\à2F2*¢rC\é	i\05NÆ²9G\ò@/,\Å\ð\ðf\è\ã\äJ<>\âO\ÝMŠMN>ŸLD\"\ëB¡\õ\éM¥G\Z\\\õBk6DT\Ë\ö\â\à\ÚKJ\ô7b¯\ñÒ³¢}\ÍÕM\'z\õ_\Û^\â\Ã8@è£°§wš³2_Å\Z~Á0\Ó\å\èþ\Õ\Ãg\ñœ\\*\ö\÷>|7\Ñ\\:NüT\í\0\"º6dÀqºÆ\á&	7L€\ïIr±/\ïIûR\×b-\Õ\Õ\ÕÛ·Uy¡»\ï\Û\æÍø\Z/Š9\Â\Ó\ï\ò¬\×iBÍ±­¡D\"q\åh\àa^\ôok\ì[	ý&\èXwV\í À|gx3\óÏ\\Þ¯O\r£¯|\ÊSER§®@\õa9E\çA.!\Éø\ØXj®\ç\Ù\ã\Éû\ÉD\">O\ÄjjbjjA\óªhj\ZŠ\ÕY\Ý\õ-\ö[\ð\ì]ž\èU9-\ãYWëª\ÅLLL\Äþ}a^\ìC&kÓ©vy\nû\ßB-sGO\õº*={|Áh4\ZŒùsù%1\ßjŽ(ý\õ\÷ü\âý¶¿ü\ðPujÁE\êÄŽfŠB\Ò|o*ŽAt%#þ\Ä\Ü\Ý{\'\ÅS\ñGs©D¬¥EeR\Æv! \Ó\à\÷Š}\ëŒ_Žqv\áb\Ä7\Ûx5\Î|\Ñ`\ç\Â\Å\åe£P¬Š%Q>1q :4s\öúþ¿Ûº\ÛÁºÛ²2c\Æü\ô\Ó\ß:\Z{\Ån\0œ:\ëû\õ\æú\ï$Îš\Ø\n2\à?s\ã6 \õ-±V\"ªZ£V0;K²b3\Úxr\Ô?ºÿx\ò\ñ³x<9<p\íZyW(\ôV\Îý§\É4\ãœ>\ôF\ïJ!«µ¯0ªb-a6rqÀlz2	Ô°\ØÒ\èÛu ,\Ü\ÃBBaq\ÖzAFpP³¬YwÆÁþ\à\êL\ân\ñ\Øs·-\î®fxù¡p\éû\éùûžcp\Ñyyµ§ª\Ô\ç)\å1Þ®Ÿ±\ßrm;tø4@[M[\Ü\ÚV;|\æ\çG\ç\Íû\ñ\\À\Z\ZK\çø\Ù\ñ/z/Nb99yj »s¢aCžYe;5©\\\0TY[\ÙW\'\ZN©:CFV«\Ò\Ô[GFJM8\Ûj@\ìf\ê&ZX$5\ÈKÆª«yn]\Ï\Üâ»£œ^»`( ýDøŽžŒ\Í^\Û\Ýü8\Õ\ÔT\Ít4Ö«\ò×ž\ëÀûY>µS\÷Ÿ\\Ë£€\ì\Ì\çl\çovnMK\ÐCm\ïžP\rOÃ©\î	ÌÿZ:\ç\ì\Äxean6K(pÁ\óBŸL,3Ö·\ÚZM1v­\Õ&§§\'\ÏI&$$\ò\Õ<¡aS\"škº\Ï?6û\ïžB~\ónÿ5¯\r\Ð&^Ú+€¯\öcJvb\ÃY¹W\Î:Œ?:Z\ó\Ø\ß^Æ<\àÀÀû\ôL|œxÒ¯_>¿3É [®\è\Ñ>Ÿ\ëú€\Ê(¿­*\ÂB&\Ä0€\àIR6I\Ê\êl\\y«\Û×¢?œ³\Ëd²\Íy~\ÂÀ\ïB6f þ\é¹yÿ\È\ÜC2·°°°øÓ|\\MTù\0!:wø\ð*H\ËgÅ{6»ev¹Òo\î\É)8X;Z»\ßs³©!üŠ#·¿Ú(\Ó\â!\È\ÍY8R>œ\ðQl<Ù°(=\óuM¥w\Ô*mm·@.:,K¥\ÎS«+w\×\ÕI\ßq8Ý\÷\Ü&[Ÿ9¯09\óµT]62»xgqq\á\Ä?\á®\ä\÷ÿù°£Z.}\'?\ÂgÛœ54<>~>\Ë\0€m²\ö$±DzC\÷gD 2\ÃQi\ÙR5Ôffª\È\ád¡ b\è±\Ï\ZÃq\âA\È\ÑNü\ñ\Æ=(§<fadMF\Ò¡\ß?w\ç\Î\ÂÍ»KOjûŒ^e(±³øœús\ë<P\Ô3S>=\Û@^\ÖR]·\Ï\ï4hi\×)\\l)K\á\ñv%\ã\0\0 \0IDAT\0\Ý%n\ÂÀÍìœ¿V\âMHUoµ5\ÖP\Ít¢¹2¶\ä\Ê:<~3\ñ\É^gŒ\å\ç*~n~\Ä?¶x\ç\æ\ÝÑ§OûkY<¡(œný8)\êWù¬\Ä\çA<fsÁAW\ì\rNÔ\è\ð\õ³\Õuý«L=N\å¡6\æE€)\ãQ,¡hÎ\ÅR^\ë8Q\n€Š¿e\ÖYÏüK\çø\ñ#P\õ9\åÂ¶³œ\Ç3;=m\ó·L\Í-Bi:U;\ß\ã]q«P\Þ\nûqºX>\Þ\×\ã¡?·~?\ØO>\ØÏ\Ñ\Ú_\ä\öJ\ò\õ3\ä~9{«(¶zÃ­,Q€KºÂš%\r\ì 2\â€\÷\æ\æ\å×\ÎÏµ\áiû`.I8Ë¬1J#VvŒ0|\å\ê\éû?gY»\ðÌù\öž6\å­\ï\Ã=`nd\í\î\Ö\Æ\ò)\ñÂ»§!]«øp\å+\ÆÇùûœ·³\ãw>þ\ô\Ì\ï\Î|ú\ñ;\ìø5gU\òv\ò:~!3EG»ºt` X\î\Â\Ó\æ \â¬YB20¢D!°n\Ý~:·\ÈRX\Ì ©\÷! U\ZB4jŸ\Z\nU§ª«y€Ý¶o#\×Jüs\'ú¯\ÅË\÷>\ðCGV\òÑŒÌû²ÁÅ­_Á\ç\àûÿ:sújž¯¢«\ÉGW\ïÿ\ð«w#i\Þ\Û\ò9ûMnej©\ntn.|DVB\ÑKø`D\'7°:·\07RDÔR¿	\0Y\àÉ©eRµZ&Ku\Z\æ7\â\öbåŠ¡\éwºtii\÷o=v\\a·OI/ø0¯\ç\Â|9\ÜsÁa)Ø·W\ÉT¥l\Í\ÊÜ19p\ãÝ·G%\Ö\å\Ì$œ\Zh#t\èD.º\àø\0\ÑX6\"aÿUE§!»²;ÚQp\æ\è$N«\ë@°j3\ð\Ô*§T£ºLp\óv¹\Ü=²ø\à\Ï7Gû±i\éÀo¶\Ås[«}ŠV7\îu,\óQ\ñS\ì\ñ®¶Ð_¿>66\ñ`øÊz\ñ\È\"\å°X#ÚW&|Lv¿mb\r\ßûu\ò\Ø6;Nn\Çr{@)ŽÖÂ(\ábþµ#/,@Pee\Õ-(Øž]Ñt/\àV·\'Ô{	V\Ï\×>umn®\Ùd{Ì»\0RÿÒ}\Û<6Si©\ÏW]]\×\îb\Íø\ÈúO\ÄI-\óA<\ñ\ØN\Ûv\ÏSû=\ÃM\àÀ4Â¬B/\Ô%l\ÚtÿË·I\ñPTf2n\Z\"K\Å# (0ùÁÁ\'uÞO!\âS¡¡^€¢\É\ô\ðš¬\Ò\áh<7ªŒTžþ\ÉsjHª«µ€€\Ú\ç\óÿì³#x`%!\å\ì\ê\ï\ï­m\òZi\êC\ñ`yÁG>¯\î7²xOl\ÏÁkµ/<y>F\Äa€ÙŒEG€\"zR%\Ð%\ò²Ÿ}\óü\ô\õ\í\Â0-;8Ç+F1\ZL>\'ÐŸt6\ä\ãÒT\n¢9œú!£ª$\ÖHt.\0TÆš\Õ\Z\Ý\àýœ\Ä:Ïª\Ë\í«\öµ»Z1¥îœ\á.\"=i\×\î\÷ãSM\í§4Wñ¬£xšŸX>µµ9û~ù\âù£10!¡¶TT<\áÎ¬4°\ó[x\ÙRA\ò\ï\ßÔ¢9\ßm§b\ä£\Ó\ëh\ã\áºê®®b\ö\êêª®;ø\ê±u`Dš2\éÂ.B\Î\Ø\ËJ5Vh©r@\æ\èptŽ\ËRpr ;œaxvª«\ä\æ.¥²\Ôiq¡AŒ	;»r\Ö{GüN1¶7^\ÇG\Âx\èPø\Èiz\òü\ÅØgc\ZÚS©`sV&%W/J7Q\ô\Ý{\ß\ÈEsng§&\è\ôzCC<\"\Æ\ØRX\êZ\ê]M\ðºZ\êªK\àyQD8± p§¿\Çù\0±N\ÈbÉÂ^z\\^&J\æ3\Z\"\é./Fu¹ý<£\ÙiZ\ãbJm«}®ëÚspOÿ³\Ý\ä\'-}v\ïk\Ä\ò>¬ù`øªÝœÛ£a>\öll\ì\Ñ#\"R`C$flM&$)\'D§q\ðPJ\ê\'\ßG\Ö\rþ\ç)\É\"œ!7\rŽZ=\õ	cÀ\Ò\Â3&M\Z\ÞÊ?}(hhuR@€\Ð\n€B4H-%\õr:YD	\åZ VAœ+w\r7}>\äëmFu\Þ?\ro¥B¬Jþ°,NY*\ç\ÚW\ß;=ê\Ìÿ!\älC\È\ó8\Î\Ã\ß\É\Ìh:\ÕXŒ\É\Ìt:¡!q2$$=¥lHoµ\ri¡\Ï-\Ø\öX\ÑZœ¬T©\Ò.Òº(¥Ö³(j\Ùc]^\ô{¬/\\\õ\\pœ\îQ[\ï\ð\çûûýg\Òn]þPúªŽý\ä\÷üÿþþLÓ®#gjŸ\ë]®{\r\ï\Ï|R²Œ\òbe\ñâ³§\æE\Æ4UÕž\ß\Ùbr\ÞH\ð\Ë~U\ÓOœ\×\Í6xn\Þ\Ã2g\r\×@NA\ó\ñ\ñBa^£P\âK\õ\Ö×f\Z \ïýþø¹ø\Ät¡·9\èBH%\×\Ñ\ëS­`A.\\k#øs\îûÀ:z­GW/®\Ù\õ\÷C\ÍCù>ûž\ç$\ée9*@\Å;¶\å;¬ŽW¯[rL©ª\óÈ®_ÑWW\ð¬\ò\Ù\îÏ\ÌþŠº\ÍmD· ++/>{V7ba\nü\æ\èh{ûB \ÄR4w-\Í\É\Ó;\ßM\\\ð\é\ÜgŒ\ÓÁ.ú\ÛQ\ô\á\í\'®ýT=\ë\Ë\Ø\Ú>;~²#²mø\Çr\â*!\Ú4-=¹š\Êu\õ\Ü7&R¶,-ÝÚ»usg*\Õ\Ü<\ÒF\ð\è\ç+Z$#\ì¶m\ò:\×þ\õWø8-}5@ª^ÛªTÍ«\ÞU\á³kkm\ÔQ\ñ\Ù\ËD(\à¹X%\Óó³œ%Tl\ãn\ß\ê\Ú\Ô\ßIP\Ô1 5 d\'ufµv\"ø\ð\î<uœ1Y\0)\Ë\r\0ÿ\Ð\ås``\Óea\ñZW\Ñt\ñd(mµ\öŽ\à\ÐÓs3\ð\é\Zå¶TÕ/·ü[\õ<wÛNŸ¹üC€MµE|Xý³þ.\ìW>5¿\â\Ò\Ð5\Ì\'\óÉ\Î2Ÿ+ù2\0zŸ²\òâ©DN[\õ(µ\ñ\éR\Ì\ò!6\Äb€³¢O}øB\rY\r«Fu\r×2\ÍA\ôYTý\ð\ó>Ð£X\Ï\çÂ€\ð<\í\Ú>FD²\ÉÐ€H$I#\ëqÄ®®þRKW\Zù\Êm€Ç¶u6<}6AH\"!zŠ$¯\Ó	\Ømµù\Î\Î\ê\×œgÝ©]Å³u\Ìg\÷\äÁ|8²\Ì\\|Mh\Å<\'­šøÙžm4¶Z:R\î\ð^1\õ%²\ïL=\÷\ße\Üc°dûtáŸ\"×97xf *\Ç3¯\ôe\÷\Æ?\ñ\Ï\Ñxa\Ð&!Q4_r\È\ê\ïw§aH9\Ñ\é\r\Ý|ÍÎ\Î\Z9\ê8D h\\%IBE:}¬úu\×z\Ë\êq\òz\ÏGŠLS\Ý\öc PXÁIc%Ç5HW±ÒŒnif\ßoú­\Ä\é~\Å28UW\æ\Þz3\Ö\à\åJ0út\âgN;\ìÙ°vQ\Ôe\çù\çi€w\ëÂ+HH\î\ïo\Í66f[+ººZ»Ó;ªR[\òDŸH\"\ÖuL\ÖP5?->»\÷H¡º³\æ­h\ÖÓ©OÅ·\\<\ÏpfO\Ý\æ\ÒB¯`dø\ìÁœ\Ì\Ê\óg*\ÃQ<Ï \årûÉŽ|V6\0u4U	m\ð4<c%¡9\â~\à3cQ\Ï%\Ï\Æ\ËþS\Î¹ª\0(°<³\ÑQ\ßy\Üþg\ÅL\Åb2W\è\èþ\Æpœ°\Z[s\Ø\Ó\ö\ík	4²/×F$\èÌ³ºŽd\"LaÕ¢\ä\õ\Ú#U 7{\Õ*\ÚuÎµœb<v¯]uûlxQ\ö·\ö\Éù\ÅX\äŸL`m\'G\">*Y\r\ëœï°G\Ñ\Ö$\Ò5\ñ©z  o\Ù\öj4°\âK\ì\'*£_\Â1\'0µ\îÁ\0\ä[vDk3¿ü/ù\É\Û@H\â )£\å?6¡Ö®\ÉJ,aes§\õ+œ\Ý\Üh1\êhN%ú\"#\ÓL(ie#a5\0­RLqš;UUS\ã\òyW\ÜYÃ³f;v/š~:»\í\Þ@H\âD€P\Z°}º\ô\Ã\ËI\ð\à\ég\Â\nŠy\Z§o\ÞN\"/B\ÙH\ï5µ®kn~3¡\ßÝb\á\Ô?T|ŸU1@\Ñ0¥}\æ\Æ<¥\Ü\è¹\ê|\éÁ£Gw·øQZI¯\È\Û\åÂž\ä\ÈS±$\än³?gB\Ñ\Z6\ÓAÔµ/@£¥b\ê\Ø\ÐN\ä\óœHÓŒ,§Z\ïQ8\Ý^!\çnŸži\Ý\Ã\Õ\ïÅ³ÆŠÂ§iw\Ý&H¯ð§Š\'\Ðýù?ŸüY4E\Òb\ÒR\Éú\ä|Ö\è\É\Ã\Ð\0)\ZÓº!E©Ê\çÒ³	\à+\Ðq­0D=G<§ü\Ø1+8JøxE\rÓ¬\ä(y{ŒP¶i\\\r92BD\Ù\\B\âf\"S\ôÿd\Z9qa$u,?wh	B 0<\ÔNZw[©81?/\Ó\"dy\èhGU\Õûm\Çm¹>r\Ñ\ìq|\Ã|v€\ð\ê@øý\\|dP¢ÿú\í\Ï\ófúÈ°\0\Èl4H%y\ï\Ó¢+·cD\å\Â\à\"\Ó!CÕ7:4\àf4®û\å\ö.\ÆN|\ë\è?q^?wÿL\Ãa|ý|þ|@>}+ Êª\ór$g`CZ)±(Ú¢LX_HtY\È\ÎeÁRÅ¥\Ó}\Å\"ü\"M\n<EÑ€iX/\ÑiLºÐÿ&SœBŠ\Òqm\ÇýÄa\ç`>`>\ì\Þ^tøx9^£K\ì\ç;þ;?\ïK?}ùTI\Äú\ÆzRNúÚý\ìn\Zq676\Äb¿®ü\ð5&\ãN\ëø9\Z`\é\öÒ¬9`.»\ò\È\ï·\ä«\Ï\Î\Ë××Ÿ4¿0\ëC\Ì\Éú Kx\Å\rË¢0G\×\\\Ðä§Ch\ÑHif\à\"Vv\òB>/kmù6,±ù2\É\ZØ®F\Ç\Ê\ÐoK\ÍU5¿²\ÍyBgµ\\®;@š	øü~k\ÃGÀCªRoý= \ðË\Ê(\ó\ìIE \á/6,£\Ò\á$d\Ù\ëg1¢»\Ä\Û\ÔliA\óQ¡*\Æ\ë\èd/žd\õ1þÂ€\ö­n\ãm\ô\\£\ç<\ß\ßJ§£\çoÅ®«€OŠzsgÀ\É\Æ\\\'£DÈ¢h\É%H\nQÁ Fo\ö/\0\Zc0 QU7\ö\ÒaS±ñ±²°S5\Õ\ëÈžb;\äcüµ\ÚI@.\ÏìÙ\Édþ\Ï\Æ\ÕÅ¶m]a?7\"©N©¬\ÄP D?AÈÙ\à!Û\ËCÿ$\ÝÀ«2{\ìHY\0	^be\òb€}h~\ì m\×4­\×\ÎRž}h(V\rŽ\Û\ÃÚ­y)¶>¬}\È\Ã\Þv.e;®\ÑKÃ°ÐŸ\ï\ï\Ü{\ÏÁø?<·4@\ó`GR[·g#sº¬\ÙPH«,K;^4iŸSp\ç:mV\ã8Ÿ«rc>dES\Ëhú\Ï\ö#t\0+$&g`µu\âÄŸŒœ}\Ï\ÖMÝ¶e1ÆŠS\ÅfÒ\ñb\î\"@hpRÀG\Ø=\Ë ¹Þ²ECÙ Pl[Bs\è\Ù#C\ôPoHd\è®R€·]\\\íZ$«F \0\íB%\\\Û.\çd(ªÔ\Ïcþ<wü\Ïø:=GFs3©­%e\éC#\ó\ÕŸeTþûu[KPlq-}\×:Á\õ¹\È%/\r©\ê\áT²f\î§Ð\ÈÅY\Û\ÖeOÚ€Äi\Õÿž37\á@\ä\ÍhùnF \ëY\Ý\Ìj\"{D\ãº+³\ð:\í	Sš\â\èh,\×N±Ày&q\Û~£¯\Õ\ðŽ \Ò8>t€b.\Õb1\ËB±\\.\Ç3\Z\Õj5¢\÷\ÐÁ\Ýmmdv²8yq\ï\êÁk??^ú;\Â\÷@1¢¹AO\ÆiÕŽmË²\Ú[\Ã@!¹KF¬¯&%ß°\Ç6>x\Ç\òo-ÒX\×À 55UZ\Þ\×\á\ñ²Xa\ØB\Ó\Ã+72,\Ò\ïÿ­3\á\ÅU!Y\ÖÁE¬¥\Ó<\ÉS¢\íºF\å\î\ä­R»\Ê\àOQh4¬bÖŽŒI«\ØhxH	¶ ±!\0H\à\äl¥Ž\"Ú«UK¥/dR(V#~p\ðG»\è\ì§{Ÿ@ùü\Íü\Ï/­\×\ÂSp\Ä\Ñø\à8¡Q1\×\×3\Ú&PhKUX-.«oo,\ÛBa*\ð¬#o>B@\ã\óbRuIÒŸK¡g\"ýPa!^lg8ÿ\n\å6Ÿü_8ýtvQŠy\ò\îm¢š\nF4œ¬\ïZ*D¬@\È\á1\\\nŠ\ÊeG9­\Æ\èh\Ã@\ãxÍp\Âxr\õ\Î[~%K\ç\æ¥\éR]%ºp\Î\íÀ³k\0;ùªHÈ¢P\\Bþ\ôü\òÓn	L\ç\\€rÓb8gJÿ\Ú@mIø\ç/\äx2£P)IrÍ\ÙK 8\Þ+g>\÷\ÎD»&:\Õ5yq_Iv`#Œ³¯\à]Hjþ\Æúfvý7o^\ñ\ß_þ\åû¶)2<¶\åt\nw<3)&\rW\ó=\ÃOB\Ô\ë\\\ÞM\äÀB\÷ ]Žš=Um¥ãŽŽZ­ÆCÓD\ß;\Ô\Ûž8>3©%P®¶K|Ž: r\ÏúaÏ±\ö\ì\ôuv§+®=\Ç\×g\ßC\á0d4\àx*\Ã\Ç .j«\ð\êDr\å\É\×[2Á*\êÑ\ó8r\ñ¶f|?xŒv1¹O3\ä\ðÀ\ô«bT³e\Ù\\\ßK!pÓ¶,>¢_\Ïb\ÌYÿ\ÇûP\ïû,\çI!\î\\,0ÈŸg{Š«S,\×H\ä&Ac,80©\õÑ²TÁmú9F\Å	¿P\ï}\áù\ß\r­Dš`\æ\êx¬USjŠ\ã\Ç@¥\÷g[\\;üÁ:û}\ð\ä{n\æ?ü\ë\Æ8 \Ð$\ÊNŒ²ÅO\Ú&M\ô\õ/jiPi©·\ñRdnÙ­ ž¿v,µ0 \äm}_>ùoP·@aú×\átTÀ\è\Òû\è\Ì\ìþb<\ðG2TP\Ì\ÆD?\í;\'ÒÄ`H\ÆML\ð1&\ZSåºL}£F¡\å²xS£ \õŸ0\óü\ß\0Í\Æü, U­,\ÔxFep\ä\ð\ÞÐ³CgB=O!\Êï\Ïw\çoŸÿ}\äÀ)rü\Èàžž<c?XZ\ó=_OhqJQ\Ð\ëOŸrO(\Å[ÙŽ\ì.\ÎE\ædAr\n\÷{B<I\à(dêŸžw87WønŠ.\Ñ,KQ\é\öÿ`gp\Ç+VV%9\Ì\ÜNu4\à\â\Ã	\Ã\ð\rW¢Áo\ÉqXc\ô To(\öÑ»W\ëýW¯??Q.²©Þ\Ê7rl€rdm€\Z\òM\Z+:\ñÊý\ì\é@³ùý«;\ß\Ý\Ý}\óµ\î\Ï~ra¿Á\ð\\Žkaý\öO®K\'\r\Ï\õÓ§z\ÚSoO\î\Ï\ÄÓ\'¥W\ï-\éAt\ãÑ©²³6ùÜ(t\íÚ°|\È\Õs\ßh\Ó\Î\ZFV¥q\ÝúÏ¶	\ìq°±©\ã\é)xC\à\0U;Ï\ä\0S\Í\Ó\é8Ÿ \ì\Z& Jw=jO\Ô\ë\å-%ø\è\Ô\éb¹\\\ß &®€-µi;G\ð$²\Û\ã$Ë$)¶Z=r\â\è¹ùGw\ñBÀ\æ`§\ÜYg\÷£\Óý-\0tt}ÂB+l\á\Õ\Í¬\÷îŸqÜ·\Ú\Î\é«o}\"L]\í\óûŠÒŠ\éjiý\Ö\ÝU\Ô\ïkk^}\êú;8E±JÓ¢\õœ\Ý\Ð`\r<!o\"OC*²Pd\ö³¶a\ÝNsxËUÁs87m<\Ãf3\ñX\'6r]ž\Ü\è\0$(\åzy\ÂË§\\ø¡^.\ÕZ¹£ŠÔŠ\å \Ò\ÇJ¹\\uš\Æ \"Z­Q\\­\ïù\0dv\ë\óOWŸ\ó<\Åfg}2\èW\ëqa\Ïe£@ac¶47\ß0\÷\Ú\ë\Æh [\Î\é~\ë\òydø¶²ºŽxE\Í\Õ{«V\ð\ñÇf#h\ZkfØŸ\ôp¥\ÕEŠ)\Ñ&vv¯\Ï_w\Ûz$%\Ý}°\í\"\nª\àšd5-ªªÀC\Ñ\Ê\Ü\ð\ô`\Ïy\ç\Ã \ZS£S-./vO¯6N!h¯4M¹ £t ¡\Þ\\®KH\É`\à¿\Zù\õc\'\ÎF\Çv\ñÁ_\Ý\'\Ão!;\Ù\Å\æ\Û\çº\ñsóµ®_J\nc(\n&P	ÎGcnÐt>ŸDFÿh¡\Ø7qª\ï\ò»mÿ­\óûi#»âž±gn\Æ\ãQŒ\ö­Ò±q<¶:\Zgl73\á4X\âG*±ÁT\Ã\Ê^Hb@©Rš_^-$ÎºBi\Ð&D\Ë\î\n\òT»RSŽ*iH©Žú\Ö?¡\÷^;\ÔT=6\Z!À\Î=\ç{\îsF\âÔŒ©Z²{Œ³zF\Û\ÙÏ®\Â0=@\×\0#N\áx¡!¡©\Z £Oµn\ì¿\Ü\Ùh«Å¯¢\"BÀ\n\ìv+,F\ÂAS\0$\îâµb·/ÁB(\Ù\ì@A(\îs€O¥ŠL$<.QEŽ\Ëi·3\Z\Z\í\êw»I=a\ìij\Æk«id1j@\ZÐ¥£¥¡\Ü\ôûit-\Ê\Ü\á\ÌPD\è\ê\èz\Ê š\Úd\ñÑ Ÿ¿2Ma=\Þ\Úßº\ð8Ù¿¯*;­^w°\ñ\ì7{;\Ï\rOu@\")\ä€x³¶Ë·\ïOp\ç¢u\ÔB@\ëW\0\íÈ²ø\ÝÖª#Œ¢\è3FýA\ÑxEwQJ3\ôµK\ã&ŽkV¬W}©\áž\×\Z\ä\ê\ðT2\ð\n\ô\î\÷\×8EVÜ°$\04Ç°¡NtqÐ\ÇK«ABt\Þ}\ãÁ\ö»\àI|mž\÷Éof\\§RA³o®u\ÅGÚ€yÁb\ëS\ñË¥\äR\n\ðNA\ó1v\Âu\ðjº\Í>\ß[y¡&b\ÚEz\Â_ž<Jÿ¢\0\ËP?Ob\ê8\\\'*u²¹&žLŠ\0\Æ\Ä\0š\ÛIt\âäpúRC\ó;@×$E1\ëHfu\Þ9®IW3a«}17K<Dþq5\ç²\Ù\Þ==Cv¶\×>\Z­«K£\ð\ó.AJ\Í\é4q®¡ih²œÄ€\Ü\Z:b=ø\Úþ\á\'\é\ÅY(4\Ñ\È;®¬\ê\n\íH\ð¢2(\î?i6²\ÖØOŽ\Ü^E nXRI#£¬M}ý=D\ËÐ®Y\é\êp  \Ü9\îA~\0\Ñ\å\ä/UU\à¬l@X>\Ñ\ç\Ñ\â\ôrŠEa;µtLMý\íÏ®\\ù\ó°l±?dX8ŠLfuo,k\ì\r±	c\ç\éºh:]\ÄS\Ú^>ÿq\Ë9š\Ò\í\í\õO¶§1ÿ±\æ\ö\öntœw/=ý,CL\ò\×;\ìoÃP;.\ës\Ëú\Î\r\ÉX`k;5³\ôø\ò ù|V/9£$-Õ³û\Ù)eÀÁP\â\Ò\íu«C\r\Ê1-=È¶c\ëœeKlCT©0ï€Œ\Õ\ô °Š\ÐØ¬\ó8\åT\Ñ\Ödv<llo\ÅH\å+žŽ\â£\Ê\'=±}]]·\\s$v\"£\Ãe\á~\0	¶¯&·\Ó\èU\ß\rÈ\òiA0€»»!¥tH7\Ze\rÿ\áœs¹¢\n\"  \öÍ\ä\ò:9M{\Ôø\ö7.\Ù\ã\"\×\õø\ÂRxf\0€N\çŠ7j/¯n\î¯\Æ\ã¯>\ç\ÌDlùj\ÌAª0J\åù$\ðŒw\ôÇ×A\Z5\Îý\Ü\ðE¡ n\Þ\ÌAae;ü?XuMe@v\èN1©£S\Ã.\ö š5MHy³WN°¬x¯\ò£\'OzØŸÎ®[ Ž%S(@\Ú(·ú\Ö\Ï\Ð[\Ò%B\ç\ê[pP\Æy1Fº»#Hº\Äå¿\0\Õ&P-~T»=.Î¥\ôfEk7\ÆgZ\õ¶V\à^¶øü\Å·V\ä\ÆW{\Ï\r/\Å2\Ö>UiÙ#Ñ¹Dp\ô\Ã<ú\é\é\éZJ\èzÀÐ²Zµ²dv\èPŠmJ~¿êµ³(2\ÇM0YT\à\÷œø\"D\Å0ª*¯u]\èšLf\"\0\Í,<N\ñ09ª?Ët¬Ÿ\ëÛš\Å\ä:\rE\ï\"­H	Ywûù{\r\Ç\ÄÀ4tŽ\æ*i\ËJ\Ü\æ\"F°\Îj1¬h\ñž&»\Ì\áV·s1\Ç/\ZþmAAú­\áyub@x\ÐVÃ ;\ðS? Ðœ2v\óÆ¯ü\Å\àv[\Ön\Ë6fE\ÞF4[Ue\Ì\Â\âb!7kû4¿[¿z7F\âYC\'\ß?\Z6^<#=52\Ú9\n«û€prV°Æm0Ÿ³ª£\ÑtSúž\áÛt\Ïdhš±ÁvOw\÷yX¬b@vE\"Dyj\Å+s\ËYp\Äýµ¯%\ã\\Z¥M\õX@£ŒÓ;CÎ¯\õ¯\'þª!@È$_@9hÃ9Ðš\'\Øw\í\\þ\àZ\ã\0\0\çIDATþýYX\Þ[\à\âÂœ¶f°¹U1p\Ù(&g\ãV\Ý±¿\ñ\íÁEø9\Ïc\ËwCA£hš«l[¹D\ê\ÔÙ®q\Å+\ï5\Ù@B\òÐ¡ŸX F5\Øm\Ð\ÔÁW:€GF\ê¡ÔiŸœ~\í*Bz\ÇV®%2\áJ,dŽ\Ñ T`­\Þ\æ\ãg\ï\äw«1;yüžU4\ÐE\ãWX®®\ä}_®Žœ×¯! ¹t|}\á\ó\ó\ç°@@&K\Ç\íXZ\Ï\î,²Z\Ò«dÎ¶Y3l\Ê_\Ü\Ò) \Ê\ò\ôš\Ýüü\Ó«\ß\èÁKË¡\âp\Z\È¬8¶\ó9Uª¬\è\ê\ì\êKCl0\È\ö]\è©:]SSsŠY\'OG¬[º.l\éÆ®\Éº\ê\"\Ç\ó×K\Ìn²;ý!\â\\®0E\ï¿|y\ï;œ?Y6XJù\Ü \Ü\ê€ÿ16¿b¿\Ý\â\õ\á×¯^þ.²ª\ZPVË\ôzÒO¬Á_Sÿü\à\æÍccc+¿4¬)V³¢s\Û.Bqüµ=û\õ]¯\å\Õ\ðþM3\ë\Þ|Ž&\î~¢	\ÜYU<M@G\é5Uh\ÎF\êü¯ª9SSB@§K\ê\ÞB\"Í}A\ÎFþu·C@°G[#vœ#4»1¿Isè±ýY\ÈdR?þkOVP\ö\Ôm%?»7¶¶	\òxiø°\Ò·c4­ú|\å:V€\Ûh\ÂQ5z8)8ú \Z\ôÿ­\Þø:¿Ž³,\ß\õ\÷\ã\'þÀ¥Ê¯\Z\ÈLÉ?2\Ð\îNCP«YcqMvÜ­L\Ù\Õ\É8a\Ò&\Ìè°©\ì\â 1É:1³¡nlP,\î6ú`M³T£8\'7ûÐ\É$\ó¶\÷^A;{£		\á\Ã\÷{\îœ\çkjª\ïµ\â\Ò(HO=:7\à0\ò\Ô*%T6jµ¬J%\\­¢b\ñ\Ùû3A\ã7šA\Î\Ç\Ä\Æ>jld\r\rHaÈ\Ã({¬\ê/*­<Þþ\í¢G\æ>mœ\ÞzýúYB@x¡?\Ã®/R\à\ê:«ÓA§w0UyC)ºN\ÄH)\÷\çú&£ß\0k3«ýx\'\ïOQ<hä¬¬­\"®³H\ÉÅþ\ò­\Öcy®+ä¯E9ùr>cOøB\ZDR\Ä¥Én\î\Å4iÿNn\ö=ú_= \ê~\ß\îÓS>q{[Lü\Ï\ÚÄ²3\Ã({\Ø×¯6ª+\"zþüWHU\ãBú>â«\0\ôþ\Í\Ý}a\r41ŽX&\\Wý\0$2¯9¶M«\É\Ø$£05	URJ\Ä\çs4\'0\Ï:²i\÷\Ú\Î\ðœÀ¿\îRŽ`€~œJ+\Ë\æ|BS:\Ôê®\Êâ·ž\"\æ\Ó\å*\×dJµ\'ú:\ËÅ<\\\Õn\Ò\ét6G<·^v\í+jtACe\è:\0h\Ò\ö\Æ\nÇ¢\Å\ó?\ÙntWüÀln¹x\ÐËŠ\" J0µ~í@g×\ð2\ÐH¿šG *k\òûs\ó\0N=n·\É\íÞ¹{×¡Œb%¥BI2~r¶^R\ÅÁ¢j1q\Þ\Íÿt{\è¹ûœ}4üpk¶²\â}E6\Æû^\á¹ý¢t®º\"\È\ÚM\öl\Âjµ$\Þ\ÉPÁ\Þ\"²\êuúDua\ë1\Û\÷xF\ÄGF34J\ôC\ßZ{Z\î¥\ÇBŸ]\ÉxÛ¥B\Ê\\¡þ;\Ð\ìÔ¥\ÑY9Z\Õ.\ß\éP#ü\Ó\ß^\ÒV\Ñ\Þ\Þ\ïÙ¢P\ó!	\çù¡G}\ð\ÍW\Ý?®\r\æ£\ßB JÂ¥«N\ÄFý©\Zùj}}ú\÷;1\ëpAý\r\Z\Z\ê£yZA¿X¹)ý\Û\ê\×\ÔHÀÈœ\Îs\"¡Z\à×\é\ée\ÇÊ¬i1m]I(a(VO),h\ãC§±\ên\ã»h«Á³LY®B:\â\â\ÆX€œ\Ü\Ç\öw\Åã\Zû%u£Js36\\Œ\Ô\öÁ\0P\çP	\Ð	§7w\ÐZeq\Ì]$ª]Z\î>únpøLl\Ô1c\Ãd(0Apº\Z10aœ\Å\í\Ýy=\èÿû\çOb4W§c-é±ZjB\ÅItaþ\è\Û9ý$·#!`%±\är¶UI\Ó²\Ò@>Í\æf\ë6	u\ÖøxFÙnD\×zB\É7º=k€œLC®\Ô\åR\ÂF×­.tªý\\\ïT\Ë$w\Æe\êS#;7{vý«Uø\ÊM]\÷¡ù­\Ö\ð\í\Ñ\ÑT¡ TBªI\ëQ\È.ÝRÁš:\Òc:\Þ:Íº=F|4cKü(8cc8CAq\ÛB\ÝC\Éµ ®P­#\Ñ23ñ§\Õ\ÂÈºª\É\Æ\ò,\Û\éEOÀ0Ú¹Ðm£	\Ø7(;$³±®§8;£hd\ä{bIC±¬LGD0\áGgIA%u\Ê`Ž Sw^/g\Ô\Ó\ó\ëÀ~n±	Õ6\ßc\è[3\í\Ýù50b€_€QDA(¹Jh)k£\ôŠ\àš\Ý=z<8ü\ì\É_\é:¹ ÚŽ·f*\Ó]«Á\\3j·\ÎC\âc	i\àþ*­*fOE3&k\Õn\Óª*R\î\\{Vl&\0MQ>·\à{GEr@@Lq4Dl3OqúJÁ\È\Ú$e\n $T£ªŽ=hpjIl,\Îs\êþ®Àù\0w\Ä5¢\Z\ÎÀy>èŸ\à1I¥\È\å\ö¢Ò\Ã?\Ò\ÈUZ»\×>:r{7\ò,\Ì]­tAyÌ:\öq\ê	B\ZÑ=\ö·pO\ó	ž«? \î\í€\×WD<BŽù\öI±œ	\\\ó\ËI»\Âm\Ç\"ê¿©ÀmdkA\Ô\èf>\Ø\Èþ\öž\ÂÆ\ÄFf<§LIV\æ€* 5>mý€ãSj°Iž\nCY\ë+Îµeo·I\Þ\òeD\äD\ój\òc\è¿7V-¯²Á`\÷\ð\ëÁ°­N\È\ç\ó\é^¬}µ-\Ë\ï\ð\ë4*e£š(!žb­\÷8_\0_JPºÁ\ç\àM\Ñ\ß\á\ÓzÕŽUHÆ\\Êµx|#nTÌ\ìI#\âl$\ò[Ù³\îÿ@r\Æ	tTA\è]š©}L¬.!\Û\Å\ö\Öq\r\ì×¡r?TÀ\Ý4\Ó\â9G8\ìt:`,\Ø\ä6kib\Ä©ÃFX^1unM1<¢\ì\Z2s\r\ä9\×$\Z\ß\ãS22Ÿ§û\Åªüø£º\ö\êŸ\õž]Nl¢&\õ\ì€R>\"\r&9Erù<\ì¢F)]/n²±û\÷B\Ï18\Äã°*{k\ã\é8\ÇIf¥\Û\nfWtYPHIWgGl\ÐEp%- \öž\ÒZ»\Õir\ÇA\\Ï·¶Tr\ò\ËkK³ÑÝ²¹}\ß\ÙÉuÅ«\á}\Ö;BpžZ/\Ë1+\n\ÝgÀ\ð¡z^Ko€o²\ë&|·ï·Ñ|*\"rOwº\ò\ìZÈ\às9ž\0X€ÒßŽ;ý§Icm\'\Ú\Ï\":Ë© L\Åøµ?u¹\ÓX¶T\Äcÿý&šjO\\\çŸ`)Ej\Ã\Î\àv·7ÿ\ÊVe\r\É?-¥g\õI®\È>\Ø\Ê\ï\æo<ùQ\ê\á×±­M\ï?\é\n%ÔjyÑµ¡Á7ž\"}\\uP~G1\ô(TaZG¥\õ©ªÙ«žE\Ã\Ñl\Ò\ákœ°ŒQaªÌ¬.¥F\Ä\×\á\Ë\ö.]ŒPÿ Â¿%\"S{\ã\ê\âs²H\ê\Îþk\Ð0\ØK£H2¡&vb*t»\÷\Ü&=v8MdL9)Gp|p<:|\à?\Ø=\\Ÿùa/\Ö`KŒ3\Ï\õVUIŽ§	}8\óXHz\ôù\'§µµ`Év«)!W«·u\Ú\"A¢yª|7¥\àÀ\ö~.£H$\ç6A~6,z\×;¢\ß4š\Ï>­Ÿ\óøŒ¢7ŸÀüš\×Ì©jLúÁ\ôJ\Ð\r\'3¯7\öŸ\Úv\ìo\Ò\Ù7 \÷\õ\Ú\ëü`þ\à\'§®ù_s\×\ÒV\Æ\ïzs\ÜD»Í®gLDiUzck<5C	T\è£L\ÈNWØ«!Y¬h§,Žž\Î[e*\Ú¡¡øÒ\Ö>ÔŽm\nUŠ-X\Î[¡\ó0\æm¿\ïsÿxh°\í\ìü€E\ó\ç\Üs~\ç;\ßùÎ¹\÷ü>§0oj*9\n&²09\Í+9e\Ì=«%\'\Úüü~°&\í\ö\r\ã\Ñ\ÅM\Û/?\\\íû»X\ÅI\ÚÆ­§fD\î\Ì\Í\õM\î)~¢\×BÖ\Ê\ãcý·\Ë\ß\ïý\Ø\ô\'\ä\ç.úd\Ô7ÅÈŒVxp~\ðw\çþvv.7pbü\ì\'\Çÿ}v\àù«³\Çr\ã¹\rûu@uy\ÄTfFDWKžmÿ\Ï\ÚC,t!ÒŒÕŒ\÷J^dhe9¢\òG0\ÜqÐ§Ÿ\Ð±û¢\ÜjýPd¹œ»ùm£\n\r®`øÛ6\Ú?ùAùS;Ö~ÿX\ð\Ö\ÂØE¯M\ö>\ó¢\ÌXrµ &&Zš	N¶8A\Ï\ßO\çrÿx\õj|<wwý\Ö\Ù9\èýë¿ýx\ð¶yJt\ñ\r\í\ímŸ*}\â\Â\é`#>\ÄOÀÐ\ä|}Jµ·ÁdahGÖº¯cZS!~\õIª6­V\Û\É\"\Æ)\Þ*}d\Æ\Ï\rþù|\\\ñq\ãO©g\Èÿ@¥/\"{?\Üú\î?#An\î^£3\ÙjX\ÔO$Š\"\ä\Ä7Œqj\â\å\ñ\õ¹or\'¬\ßÊ|ú`\÷ø\Í_x\×|Tq\ñÁ¶p©)\Ìd\rHPµ\0Á(\ó*\Ê\ÉùQEµ»o=X~\è\åoi\ö¶ú\âî\\a\Æ\ëA¡%Y&j`B\Ú§J_\ÂÍ\ì-)\×b\Ö\Ý0N_n\å\Þ>ÿü/~\í\Ì\Ñ\Ãf?\Øst=ÁŸŒ\õ A4\r,A\í&js§0>0\÷V\î\ô\Ï\ëÿy\ó\ô\ô\é~\ØÈœº{£©{:^\öÃ§\ÆÀ\Ú\\bm{ž\í\à²\à\åfÿv\ÙPG<\Z\ÑJ\0(ª>t\äù§\öG¯]{ü\ôÁ7\ï7;\í©«3É©fÑpž/P_.;\Ë\æ\çss#\Ìxý\Ók3&_OqJ\0¢¶<.G\ã\ô<dH\Æüg0.dhX\åQ-\Õ\å6×®?}ø\ä\ç/\××l|w»\Ò8ýM·]\ÈS\à mBK8\ÜeÞ.f(»\Ø /!\Þ	F4¹\êRU»\\¿¿=\ð\éÀ\ñOº?²\Û\Õ\à\Ê|r8!R]^/\Õ\Î~|\õ\å\ó+²$\ß\Úÿû\ÌbT\Ê\ï\÷§{±X,\í$:=ýý}\ÇzX`z/gp\Ù\\8ÊU\ö\ÚoŸ\Æ^7©4¹.ü»\ò\ÚU ùX\Z\ð#\Â-m\å\í\âPÀ\Â\Ø6/QŸ²¢eÀØªF\È]cU\õV\Îù\ìE\áFX\ã¹m®\à\Ð%²\Üû\àe\Ö>-¯e0\ÌQY}\ó;\Ï(\ÜX\0+Rl\ÉÄjoŒ}\÷\ë]\Óô«¯þ\Ë]º\ö\ðy]Dh -¢-7Œ¹œ@°û¶\ÉG\ö»lxZ\ïEø)\àh~~exj\â\ê\n\0~Oü,A¹dm\ZA\Í]\Ê\\:¶{ lÀÿ45®5#œteþI¶e0k^\É$2\à#|-»t\î»\Õ\Õk\×~_\Øx\Ô\Ý\å¬\Â\ôcJj\"9£ ?\õw\èvvu\çÀK\Ós;NQ)cS\ðI$fý5B\è!ª&NhÖ¢vu\í\÷iXo`i\Üø,xUµ\Ù<\ó\è@H\õ` =e4	Ã·IBš¥¥ý\Ðý/w¬=0¬v-cQ&O(\ÈxÐxT~A\ó\"\÷eI€iA¬\Þü\r%\Ë+7ß0®D[ÀBù\ÌX$¢\È\ÔC\È$\ÊÀNj\"\ÌH\Ñ&ÕZB\r]*IŸ\n\á\Ð\Ê\Þ u\â^$\Å\Ô\Ó!i\Ô\÷ÑEÜ¥\Íÿ·ý0Oz\â§=\'\ÔV§`ªI\ÌdŠ$\ÒÉ\Z\èa\Å\ì$3g\ð -j54\ßÿª¢Pþ4U(\Ã~ Z2u\Æ2#Ft\Æ1Éÿ=\ðClh\Ú+LR\ä[N9\î!3<11::6À\Î¯\à8tC¡ú®\nùÁ\òcÏª©V\"\npy\ÉÓµDSg\ãJŠ§¿^\ÒU}\ïPf\÷-\Ê>eŠšSPlhú(/LfxI [4K\õ\í/+\î]ø\\\â©$\Ï^hcO\ÒüL²T\Â1(?¿?]é§ùsl\â\ÞE-\ê\ëÁ\å\åT\nº5\ò@²\r7/\÷VÌ\õ{Dª»E<û\åW\"¯\ç%9ž1WU¡xxi\ñ\r©-µÿ»@Q¡·B\Ö:Ü^K@wI¥E\Ó\è>\nÚš€c§0Dos\çt,ix)!Z\ó\Ú\Î*\çl\ç\ö\ïÀ@\"\è5{\è5#M¯À\ÅgEÚ\ÄkZj. \éLI\0û¡\Ù-\îÒý[B1­5\é(ÊfVb\ð\ÐS\ð\æ\Ò1KGMH§\Í4\Ä\È\Â!«­\è\êÁº\Ø=°\r\ìp±\Þ\è\÷K\ÔÌ&K3 É¢\Â,}\÷\\tX\Ò\É1:µ,\åzF\nU; Šªj©5\íÖº251¡`^JYWT°Š¢\è\Û\èwIQZ\Ñq\ñü\Z\Ï\ÂŒ]þ\Z$©eú\Óc\\o/i¹yŽ\êþAga«\Ä,m]G<;8²F2KøP3ýUû³ŠŠ0\ÛÚ5u az\ó1dA\ë®ÀŸLJ41FI\ë\ì<¿Ä9\ZÚ²\àH$9ª`-\÷v\ÆÁ\à²d€Š\ÓQÍ(C\ÂN4\r\Äd\Ò.¶R:×µÕ,XN+T\ç\ÚlŽL«\ã\Z\ö3N¶o~\Ý{A>¯m¬\ä\ó\Ð\0Š\ó£.\ð€;\Ï6a\ÍûOb{8F³1Ž(?\Þ%\ôPn€#;6³¥¥B1Gª§°¶D\ÞÆø4©L*g\ðEÙ¡<Œ\'&6\è>Öl5iU\'X+Z:\õJ€ú#X}¬;ÖŒuB¥l,\r\ée J\Æ»v	@Á\0üE_\×(21D²¥\÷j7yÁhüPzfY\ÝI\õ\×\ÊT_gš1vŽ 2Â²Y6À\Ù\ðj­«Ó¯	e0?s:\'ºÙAŠ;M}c«\ß\ä}Þ\ï)ªº\æMÛ9m«=­>V3:\Ê\Ð|`¥Á94\'mrÑk~Vo%Ž³\ßpÆŒ¡Oµ%Qj/P/\Ð4y\Û-ÌŒ\ò`?-\\Áž\nœP¿\ÙG\êO\Ã\ÍOknZsÝŠ\Ì4\Ë\Í\Ú:\à,uû\Ö\Í\nœ:\íw\ÆK\Ìv\Ö\0`(V\ãOIÐ\é-H§Óy\Þ\Ìqâ\×\Z\òZf£E¡¿ù¯\â\âbÀ©ž*\ñý\â\è:Ö»}Š&XW,\ÖxÚ²Ðšxd]^E\ê%\÷LKŸ\r\Þr\çßŸÅ\ÒevK\ÂH8VùZÜ±\ó\ô[Á­\×Ý¡obW\ÐÇ®Ó±±/rü>¶}*\ì\n\ÎamB\Å7Rþ\Ø\Æd\Û\îŒ\0\0\0\0IEND®B`','2021-02-23',1);
/*!40000 ALTER TABLE `questionnaires` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `delete_scores` BEFORE DELETE ON `questionnaires` FOR EACH ROW BEGIN
	delete from scores where scores.questionnaire_id=old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `questions_marketing`
--

DROP TABLE IF EXISTS `questions_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_marketing` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int unsigned NOT NULL,
  `question` varchar(256) NOT NULL DEFAULT '',
  `type` enum('BOOL','STRING','NUMBER','RATING') NOT NULL DEFAULT 'STRING',
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `questions_marketing_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_marketing`
--

LOCK TABLES `questions_marketing` WRITE;
/*!40000 ALTER TABLE `questions_marketing` DISABLE KEYS */;
INSERT INTO `questions_marketing` VALUES (16,14,'How much would you pay?','NUMBER'),(17,14,'Would you buy it?','BOOL'),(18,14,'How much would you suggest it to a friend?','RATING'),(19,14,'How would you name it?','STRING');
/*!40000 ALTER TABLE `questions_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_stats`
--

DROP TABLE IF EXISTS `questions_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(256) NOT NULL DEFAULT '',
  `type` enum('BOOL','STRING','NUMBER','RATING') NOT NULL DEFAULT 'STRING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_stats`
--

LOCK TABLES `questions_stats` WRITE;
/*!40000 ALTER TABLE `questions_stats` DISABLE KEYS */;
INSERT INTO `questions_stats` VALUES (1,'How old are you?','NUMBER'),(2,'What\'s your sex?','STRING'),(3,'Expertise level (1: low, 5 high)','RATING');
/*!40000 ALTER TABLE `questions_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies_marketing`
--

DROP TABLE IF EXISTS `replies_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies_marketing` (
  `questions_marketing_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`questions_marketing_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `replies_marketing_ibfk_1` FOREIGN KEY (`questions_marketing_id`) REFERENCES `questions_marketing` (`id`),
  CONSTRAINT `replies_marketing_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies_marketing`
--

LOCK TABLES `replies_marketing` WRITE;
/*!40000 ALTER TABLE `replies_marketing` DISABLE KEYS */;
INSERT INTO `replies_marketing` VALUES (16,1,'3333'),(16,6,'5345345'),(16,7,'6000'),(17,1,'false'),(17,6,'true'),(17,7,'true'),(18,1,'5'),(18,6,'2'),(18,7,'1'),(19,1,'ddf4-23'),(19,6,'fgdsfgfdg'),(19,7,'bollo-marca');
/*!40000 ALTER TABLE `replies_marketing` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `new_reply_marketing` AFTER INSERT ON `replies_marketing` FOR EACH ROW BEGIN
	if exists(select * from marketing_application.scores where new.user_id=user_id and questionnaire_id=(select questionnaire_id from questions_marketing where id=new.questions_marketing_id) ) then
		update scores set score=score+1 where new.user_id=user_id and questionnaire_id=(select questionnaire_id from questions_marketing where id=new.questions_marketing_id);
    else
		insert into scores values ( (select questionnaire_id from questions_marketing where id=new.questions_marketing_id),new.user_id, 1);
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `replies_stats`
--

DROP TABLE IF EXISTS `replies_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies_stats` (
  `questionnaire_id` int unsigned NOT NULL,
  `question_stats_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`questionnaire_id`,`question_stats_id`,`user_id`),
  KEY `question_stats_id` (`question_stats_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `replies_stats_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `replies_stats_ibfk_2` FOREIGN KEY (`question_stats_id`) REFERENCES `questions_stats` (`id`),
  CONSTRAINT `replies_stats_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies_stats`
--

LOCK TABLES `replies_stats` WRITE;
/*!40000 ALTER TABLE `replies_stats` DISABLE KEYS */;
INSERT INTO `replies_stats` VALUES (14,1,1,'45'),(14,1,6,'435'),(14,1,7,'64565'),(14,2,1,'male'),(14,2,7,'ggg'),(14,3,1,'3'),(14,3,6,'3'),(14,3,7,'5');
/*!40000 ALTER TABLE `replies_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `new_reply_stats` AFTER INSERT ON `replies_stats` FOR EACH ROW BEGIN
	if exists(select * from marketing_application.scores where new.user_id=user_id and questionnaire_id=new.questionnaire_id) then
		update scores set score=score+2 where new.user_id=user_id  and questionnaire_id=new.questionnaire_id;
	else
		insert into scores values ( new.questionnaire_id,new.user_id, 2);
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `questionnaire_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`questionnaire_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (14,1,10),(14,6,8),(14,7,10);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `banned` float NOT NULL DEFAULT '0',
  `isAdmin` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','user','example@example.com',0,0),(2,'banned','banned','example@example.com',1,0),(3,'admin','admin','admin@admin.com',0,1),(6,'user2','user','example@example.com',0,0),(7,'user3','user','example@example.com',0,0),(8,'user4','user','example@example.com',0,0),(9,'user5','user','example@example.com',0,0),(10,'user6','user','example@example.com',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-23 18:47:16
