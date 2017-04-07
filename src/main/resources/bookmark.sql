-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bookmark
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_isbn` varchar(255) DEFAULT NULL,
  `book_note` varchar(255) DEFAULT NULL,
  `book_page` int(11) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'返璞归真','B00H9XEF7K','《返璞归真：纯粹的基督教》是C.S.路易斯在第二次世界大战期间，应邀到英国广播公司发表的战时系列讲话。在这本书中，路易斯用通俗的语言、生动的类比、缜密的推理，阐述了“各个时代几乎所有的基督徒都共同持守的信仰”。本书被公认为是路易斯最受欢迎的著作，并被誉为二十世纪最重要的宗教著作之一。',272,'C.S.路易斯'),(2,'魔鬼家书','B00QPX1ZEG','《魔鬼家书》，亦译《地狱来信》，是一本纯粹想象的通信集。通信的双方，一个是位高的“私酷鬼”副部长，另一个是初级的试探鬼——“瘟木鬼”，二者乃叔侄关系。二鬼以书信方式交流诱惑人的伎俩，恶毒地揭露人性中的丑陋与“疮疤”。不过，两个鬼虽表面惺惺作态，暗地里却也尔虞我诈，渴望最终能够“吞噬”对方。\r\n书中，C.S.路易斯展开想象，绘声绘色地描绘魔鬼的语调，以魔鬼之口对人之本性进行深度挖掘，让人在捧腹后亦自省，透视自己意识中的真实动机，认清自己的本来面目。',91,'C.S.路易斯'),(3,'24个比利','B01G9OS638','1977年，美国俄亥俄州连续强暴案嫌犯比利？米利根被警方逮捕，但是他对自己犯下的罪行居然毫无记忆。事实上，在他体内总共有24个人格存在，这些人格不仅在性格上，甚至连智商、年龄、国籍、语言、性别等方面也都不尽相同。这些不可思议的人格，到底是如何产生的呢？他到底是个欺骗公众的骗子，或只是个不幸的受害者？',448,'丹尼尔·凯斯'),(4,'比利战争','B01G8MHZ6K','多重人格分裂纪实小说《24个比利》续作，全美封禁，不得出版。比利是美国历史上犯下重罪但因多重人格分裂而被判无罪的嫌疑犯。1979 年，比利被判转往专收精神异常罪犯的“人间地狱”利玛医院。在那里，医师不相信他是多重人格分裂，对他施以电击疗法，强迫他服用各种镇静剂，阻碍了他的人格融合。比利如何幸存？初步融合成功的人格，何时才能重获自由？',352,'丹尼尔·凯斯'),(5,'恶意','B01LEPWBRO','畅销书作家出国前夜在家中被杀，凶手很快落网，对罪行供认不讳……小说甫一开始，案件便告侦结。在彻查被害人与凶手的过去之后，加贺警官面对看似平淡无奇的案件，却感到如坠万丈深渊一般无边的寒意。',280,'东野圭吾'),(6,'Heidi','B011K7GM3U','《海蒂》是一本经典的青少年读物，一百多年来畅销不衰。纯洁善良的小主人公海蒂待人真诚友好，使性格古怪的爷爷重新焕发出生命活力；使体弱多病的克拉拉战胜了病魔；使双目失明的老奶奶心中充满了温暖，海蒂那充满生气，热爱生活的精神，将欢乐和纯真带给每一个人的品德，像阿尔卑斯山上玫瑰色的朝霞一样给人以希望和温馨。《海蒂》已成为一本经典性的青少年读物，跻身于世界畅销书的行列，并多次被改编成漫画和动画作品。',217,'Johanna Spyri'),(7,'梦幻花','B01HB734GQ','《梦幻花》突破了东野圭吾之前的写作手法，是作者费思量的迷人之作。正如东野圭吾所说：从来没有像这次 这样在一部作品中花这么多的时间去思考。东野圭吾以简单质朴的语言诉说人性贪婪的执念，与亲情、爱情、恩情等等人类美好的情感杂糅在一起，用严谨的逻辑推 理使之融为一炉。',308,'东野圭吾'),(8,'演讲的力量','B01JZ91MYO','《演讲的力量》TED 作为全球最顶尖的演讲平台，在观众中发挥着越来越大的影响力。那么，TED演讲为什么总能一开口就吸引住观众？不知名的演讲者为何能在18分钟，鼓舞全 场？而我们，如何能做到？ 克里斯•安德森，TED的掌门人和演讲教练，15年来他参与并指导了上千场TED演讲，与比尔•盖茨、诺奖得主丹尼尔•卡尼曼、超级畅销作家肯•罗宾逊等 无数优秀演讲者深入合作，总结了第一手公开演讲实战经验。他把自己与TED团队的公开演讲经验，都写进在了这本书——《演讲的力量》。',336,'安德森'),(9,'人类简史:从动物到上帝','B00NSGUFCQ','从来没有哪部人类简史能像牛津博士尤瓦尔写的这般生动自然。这位全球瞩目的新锐历史学家化身为曲艺精湛的评书表演者，将十万年前至21世纪的人类发展史向每一位读者绘声绘色的娓娓道来。',440,'尤瓦尔·赫拉利'),(10,'没有个性的人','B01EY0DOAY','《没有个性的人》\r\n是穆齐尔未完成的遗作，一部“精神长篇小说”，在二十世纪现代派文学中具有重要地位。\r\n一九九九年，应德国贝塔斯曼文学家出版社和慕尼黑文学之家的要求，有作家、评论家和德语语言文学专家各三十三名组成的评委会评出了一份二十世纪最重要的德语长篇小说名单，位居榜首的就是《没有个性的人》。',975,'Robert Musil'),(11,'14号门','B01E3GOVRO','《14号门》，是近三年来美国亚马逊上口碑最好的恐怖小说，席卷整个欧美，受到众多科幻与恐怖小说书评网站一致赞赏！人类之所以恐惧，是因为害怕失去。《14号门》是一部真正好看的悬疑小说，一流的悬疑，极致的恐怖，近乎完美的阅读体验。',318,'彼得•克莱斯'),(12,'银河系搭车客指南','B00SIT980S','突如其来的寂静笼罩了地球。这事实上比噪音更加可怕。有一会儿，什么也没有发生。\r\n巨大的飞船一动不动地挂在空中，覆盖了地球上的每个国家。\r\n在黯然退场之前，地球首先被改造成了最终极的声音重放器件，这是有史以来建造过的最伟大的播音系统。但伴之而来的不是演奏会，不是音乐，没有开场号曲，而仅仅是一条简短的信息。',548,'Douglas Adams'),(13,'波拉尼奥作品集：荒野侦探','B00KM0KWLA','十七岁的墨西哥法学院学生马德罗热爱诗歌，时常逃课参与诗歌班的讨论。在那里认识了自命为“本能现实主义诗人”的贝拉诺和利马。他们与其他诗人和艺术家为伍，在酒吧争论诗歌，大麻、酒精、性爱样样不缺。该诗派的精神领袖——女诗人蒂纳赫罗——据传多年前在墨西哥城北面的索诺拉沙漠失踪了。一半为了理想，一半为了躲避仇家，他们决定深入沙漠寻找她的踪迹，同行的还有妓女鲁佩。',599,'罗贝托·波拉尼奥'),(14,'源氏物语','B01BV8P4BY','世界上第一部长篇小说，日本的《红楼梦》',1568,'紫式部'),(15,'罗生门','B01931T5ZW','本书收录了日本文学巨擘芥川龙之介的中短篇小说共二十一篇。其中，以《罗生门》《竹林中》为代表，从独特叙述视角和叙事结构出发，冷峻地观照了“他人即地狱”的彼时日本社会心理。这种畸形的个体心理逐渐演变成为一种习惯性的社会心理，发人深思。此外，以《地狱变》为代表的作品则表现了“为艺术的艺术”的孤独者的人生悲歌。通过自我毁灭的方式来达成“艺术至上”的理想，这沉痛代价的背后是孤独灵魂的痛苦咆哮。总而言之，芥川的小说题材丰富、形式多样，好以古观今，尤擅从禅宗哲学来解构故事，鞭笞人性。实属佳作，深刻而冷峻。',243,'芥川龙之介'),(16,'容忍与自由','B0111IOLJU','本书所选篇目展现了胡适深刻、犀利的思想观点，也侧面展现了他在纷繁时事中的人格魅力。涵盖其从青年至晚年的各类文章，读者也可从中发现他思想上的转变，特别是“容忍与自由”，胡适年岁月大，越觉得“容忍比自由还更重要”。\r\n由于涵盖面广，内容丰富，使得本书的可读性大大提升。这些白话演讲和文章都十分浅显易懂，展现了胡适的睿智，使读者了解胡适思想的同时，能帮助读者理解那时学术界的状态，了解当时的世界和中国。',181,'胡适');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `library_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`library_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,1,1),(2,1,10),(3,1,16),(4,1,3);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `note_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(255) DEFAULT NULL,
  `note_page` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,1,1,'2017-04-07 09:03:47','测试数据',24);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `progress_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,1,1,'2017-04-07 09:04:12',37),(2,10,1,'2017-04-07 09:01:12',1);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL,
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jirair','123456',NULL,'2017-04-07 08:59:29','2017-04-07 08:22:13');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-07 17:52:27
