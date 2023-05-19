create database milestone2_Ver5;
 
 use milestone2_ver5;
 
 CREATE TABLE `company` (
  `NAME` varchar(40) NOT NULL,
  `LOCATION` varchar(45) NOT NULL,
  `PHONE` bigint NOT NULL,
  PRIMARY KEY (`NAME`)
);

CREATE TABLE `Products` (
  `NAME` varchar(45) NOT NULL,
  `TYPE` varchar(6) NOT NULL,
  `BARCODE` int NOT NULL,
  `DOSE` varchar(10) NOT NULL,
  `Product_ID` int NOT NULL,
  `SELLING_PRICE` double NOT NULL,
  `PRODUCTION_DATE` date NOT NULL,
  `EXPIRATION_DATE` date NOT NULL,
  `QUANTITY` int NOT NULL,
  PRIMARY KEY (`Product_ID`,`BARCODE`),
  UNIQUE KEY `BARCODE_UNIQUE` (`BARCODE`)
);

CREATE TABLE `adminstrator` (
  `SSN` bigint NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `PHONE` int NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `SALARY` int NOT NULL,
  PRIMARY KEY (`PASSWORD`,`SSN`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`)
);

CREATE TABLE `warehouses` (
  `Supplied_Company` varchar(45) NOT NULL,
  `WAREHOUSE_NAME` varchar(45) NOT NULL,
  `MANAGERSSN` bigint NOT NULL,
  `WAREHOUSE_ID` int NOT NULL,
  PRIMARY KEY (`WAREHOUSE_ID`),
  KEY `MANAGERSSN_idx` (`MANAGERSSN`),
  KEY `Supplied_Company_idx` (`Supplied_Company`),
  CONSTRAINT `Supplied_Company` FOREIGN KEY (`Supplied_Company`) REFERENCES `company` (`NAME`),
  CONSTRAINT `MANAGERSSN` FOREIGN KEY (`MANAGERSSN`) REFERENCES `adminstrator` (`SSN`)
);


CREATE TABLE `customer` (
  `Customer_ID` bigint NOT NULL,
  `Customer_Name` varchar(45) NOT NULL,
  `PHONE` bigint NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `PASS_WORD` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`Customer_ID`,`PASS_WORD`)
  
);

CREATE TABLE `dependent` (
  `ASSN_ID` bigint NOT NULL,
  `dependent_name` varchar(40) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `B_Date` date NOT NULL,
  `Relationship` varchar(45) NOT NULL,
  KEY `ESSN_ID_idx` (`ASSN_ID`),
  CONSTRAINT `ASSN_ID` FOREIGN KEY (`ASSN_ID`) REFERENCES `adminstrator` (`SSN`)
);

CREATE TABLE `Manages` (
  `company_name` varchar(40) NOT NULL,
  `User_SSN` bigint NOT NULL,
  PRIMARY KEY (`company_name`,`User_SSN`),
  KEY `User_SSN_idx` (`User_SSN`),
  CONSTRAINT `company_name` FOREIGN KEY (`company_name`) REFERENCES `company` (`NAME`),
  CONSTRAINT `User_SSN` FOREIGN KEY (`User_SSN`) REFERENCES `adminstrator` (`SSN`)
);

CREATE TABLE `Stores` (
  `WareH_ID` int NOT NULL,
  `P_ID` int NOT NULL,
  `PRODUCT_BARCODE` int NOT NULL,
  PRIMARY KEY (`WareH_ID`,`P_ID`,`PRODUCT_BARCODE`),
  KEY `PRODUCT_BARCODE_idx` (`PRODUCT_BARCODE`),
  KEY `P_ID_idx` (`P_ID`),
  CONSTRAINT `P_ID` FOREIGN KEY (`P_ID`) REFERENCES `Products` (`Product_ID`),
  CONSTRAINT `PRODUCT_BARCODE` FOREIGN KEY (`PRODUCT_BARCODE`) REFERENCES `Products` (`BARCODE`),
  CONSTRAINT `WareH_ID` FOREIGN KEY (`WareH_ID`) REFERENCES `warehouses` (`WAREHOUSE_ID`)
);

CREATE TABLE `location` (
  `WH_number` int NOT NULL,
  `WH_location` varchar(45) NOT NULL,
  PRIMARY KEY (`WH_number`,`WH_location`),
  CONSTRAINT `WH_number` FOREIGN KEY (`WH_number`) REFERENCES `warehouses` (`WAREHOUSE_ID`)
);

CREATE TABLE `Admin_login` (
  `Admin_SSN` bigint NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`Admin_SSN`,`password`),
  KEY `password_idx` (`password`),
  CONSTRAINT `password` FOREIGN KEY (`password`) REFERENCES `adminstrator` (`PASSWORD`),
  CONSTRAINT `Admin_SSN` FOREIGN KEY (`Admin_SSN`) REFERENCES `adminstrator` (`SSN`)
);

ALTER TABLE customer
ADD unique(PASS_WORD);


ALTER TABLE customer
ADD UNIQUE (Customer_ID);


CREATE TABLE `Customer_login` (
  `Cust_ID` bigint NOT NULL,
  `Cust_password` varchar(45) NOT NULL,
  PRIMARY KEY (`Cust_password`,`CUST_ID`),
  KEY `password_idx` (`Cust_password`),
  KEY `CUST_ID_idx` (`CUST_ID`),
  CONSTRAINT `CUST_ID` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `Cust_password` FOREIGN KEY (`Cust_password`) REFERENCES `customer` (`PASS_WORD`)
);


CREATE TABLE `Orders`(
`Order_ID` int auto_increment ,
`Cust_ID` bigint not null ,
`Cust_name` varchar(45) not null , 
`Product__id` int not null ,
`Product_name` varchar(45) not null ,
`QUANTITY` int not null ,
`price` double not null ,
`order_date` varchar(45) not null ,
primary key(`Order_ID`) ,
foreign key (`Cust_ID`) references Customer(`Customer_ID`),
foreign key (`Product__id`) references Products(`Product_ID`)
);
alter table orders
auto_increment=100;

INSERT INTO `customer` VALUES 
(1,'Syed Ibrahim',188075566,'M','ibrahim','1995-12-23'),
(2,'suryansh',129078943,'F','surya','1972-03-02'),
(3,'Suleman',114789342,'M','rootEDTax3','1971-04-20'), -- delete
(4,'Tont Stark',118043687,'M','To@45ark','2002-12-01'),
(5,'Marwan ahmed','117964872','M','Marwan76Ahmed','1994-9-29'),
(6,'Jamala omar','101534814','F','Jamala360bird','1999-3-31'),
(7,'Aminah Mahdi','100476825','F','Skateboardxxpassword','1989-12-4'),
(8,'Faris Hamad','136578216','M','darkNightxx999','2001-2-11'),
(9,'Khalaf jammel','194732948','M','Burj_camera','2000-11-19'),
(10,'Najia ali','1434785236','F','Naj@4758','1999-5-21'),
-- new
(11,'Dion Rosaire', '0593289052', 'F','DJ5329J','1980-2-6'),
(12,'Xavier Alison', '0812940581', 'M' , 'OPIT325', '1993-10-10'),
(13, 'Tel Molly', '0415432852', 'M' , 'LMG@$993', '1999-1-5'), -- delete
(14, 'Edwyn Blanch', '057432895' , 'M' , '5324MR@5', '1987-9-19'),
(15, 'Hannah Caroline', '058399128' , 'F' , 'UR$$$$SR', '1980-3-5'),
(16, 'Kalin Haven' , '058195032' , 'F', 'KALHVN99@@' , '1996-9-10'),
(17, 'Gergina Katee' , '053748971' , 'F', 'mkgGOE9090', '2002-10-9'),
(18, 'Randell Glen' , '012849023' , 'F', 'RANCONAN245', '1994-12-12'), -- delete
(19, 'Alva Durante' , '058239842' , 'F', 'DURETAR@_$%', '2002-1-7'), -- delete
(20, 'Slavka Aston' , '058669501' , 'F', 'RUSSIA_44$', '1993-6-16'),
(21, 'Rylan Goff' , '064567122' , 'M' , 'GOFFY_##@@rrt4', '2001-7-22'),
(22, 'Paolo Cotton' , '056983415' , 'M' , 'COTTON99_6', '1996-6-9'),
(23, 'Sheila Hancock' , '053892142' , 'F', 'LUFFY_BOA', '1987-4-12'), -- delete
(24, 'Rononoa Zoro', '063401246' , 'M' , 'Where_am_i' , '1998-6-6'), 
(25, 'Marco Vanbasten' , '058239144' , 'M' , 'Milan_24', '1975-10-24');


INSERT INTO `company` VALUES 
('Cipla','Mumbai',12903),
('Med_City','Nellore',1011436783),
('Pfizer','United State',45128746),
('rush','Switzerland',12462158),
('Sun Pharma','Mysore',128907844),
('GlaxoSmithKline','United State',198107),
('Novartis','Switzerland',498264),
('AbbVie','United State',975310),
('Shanghai Pharmaceuticals Holding','China',513829),
('Takeda','Japan',196171013);

INSERT INTO `Products` VALUES
('Imatib' , 'Tablet' , 1001 , '400mg', 1 , 60 , '2020-03-15','2023-02-10','10'),
('Okacet' , 'Tablet' , 1002 , '750mg', 2 , 45 , '2021-11-12','2023-11-12','15'),
('Caltrate' , 'Tablet' , 1003 , '600mg', 3 , 57 , '2019-10-09','2022-12-15','30'),
('ChapStick Lip' , 'Balm' , 1004 , '0.15 oz' , 4 , 49 , '2022-05-11','2024-06-04','13'),
('Wild' , 'Roll' , 1005 , '50ml' , 5 , 17 , '2021-07-10','2023-10-10','10'),
('Dazolik 50s' , 'Tablet' , 1006 , '500mg' , 6 , 332 , '2020-09-05','2022-10-13','5'),
('crizanlizumab' , 'Balm' , 1007 , '10ml' , 7 , 220 , '2019-8-11','2025-10-5','15'),
('febuxostat' , 'Tablet' , 1008 , '40mg' , 8 , 221 , '2020-12-04','2024-7-18','18'),
('Daraprim' , 'Tablet' , 1009 , '25mg' , 9 , 222 , '2021-08-09','2028-11-03','7'),
('Revital' , 'Balm' , 1010 , '0.19 oz' , 10 ,223, '2017-11-16','2023-01-26','7'),
-- new
('Busulfan' , 'Tablet', 1011, '500mg' , 11, 252, '2018-7-5', '2024-6-12', '10'),
('Emicizumab' , 'Tablet' , 1012, '750mg' , 12, 59, '2020-2-20', '2023-3-3' , '8'),
('Methylphenidate' , 'Tablet' ,1013 , '300mg', 13 , 69, '2019-7-11' , '2026-1-2', '15'),
('Hydromorphone' , 'Balm' , 1014 , '15ml' , 14, 120 , '2019-3-7' , '2023-5-3' , '6'),
('Clobazam' , 'Tablet' , 1015, '1000mg' , 15, 300, '2021-1-21' , '2022-12-26' , '9'),
('Ampicillin' , 'Tablet' , 1016 , '700mg' , 16, 225, '2017-12-4' , '2024-5-5' , '10'),
('Bleomycin' , 'Tablet' , 1017, '250mg' , 17, 40, '2019-9-8' , '2023-11-5' , '5'),
('Famciclovir' , 'Tablet' , 1018, '400mg' , 18, 80, '2020-2-16' , '2027-1-25' , '6'),
('Phenytoin' , 'Tablet' , 1019, '800mg' , 19, 111, '2022-2-16' , '2024-7-5' , '10'),
('Tretinoin ' , 'Balm' , 1020, '0.22 oz' , 20, 150, '2021-11-8' , '2025-12-3' , '16'),
('Voxelotor ' , 'Tablet' , 1021, '900mg' , 21, 130, '2020-12-6' , '2023-9-9' , '4'),
('Methylphenidate' , 'Tablet' ,1022 , '300mg', 22 , 69, '2019-7-11' , '2026-1-2', '15'),
('Omeprazole ' , 'Tablet' , 1023, '100mg' , 23, 450, '2019-7-19' , '2025-8-22' , '8'),
('Dapsone ' , 'Roll' , 1024, '0.25 oz' , 24, 250, '2017-2-15' , '2023-6-20' , '6'),
('Codeine  ' , 'Tablet' , 1025, '350mg' , 25, 90, '2019-1-17' , '2024-3-10' , '13'),
('Labetalol  ' , 'Roll' , 1026, '60ml' , 26, 95, '2018-7-2' , '2022-4-10' , '12'),
('Codeine  ' , 'Tablet' , 1027, '350mg' , 27, 90, '2019-1-17' , '2024-3-10' , '13'),
('Granisetron  ' , 'Tablet' , 1028, '1000mg' , 28, 40, '2019-3-7' , '2025-1-10' , '7'),
('Enalapril  ' , 'Balm' , 1029, '30ml' , 29, 80, '2020-8-4' , '2025-10-10' , '8'),
('Amikacin  ' , 'Tablet' , 1030, '200mg' , 30, 160, '2020-9-14' , '2024-11-10' , '9'),
('Muromonab' , 'Tablet' , 1031, '300mg' , 31, 320, '2021-12-16' , '2026-2-10' , '2'),
('Codeine  ' , 'Tablet' , 1032, '350mg' , 32, 90, '2019-1-17' , '2024-3-10' , '13'),
('Mesna  ' , 'Tablet' , 1033, '50mg' , 33, 64, '2017-3-10' , '2023-3-10' , '5'),
('Methylphenidate' , 'Tablet' ,1034 , '300mg', 34 , 69, '2019-7-11' , '2026-1-2', '15'),
('Mitotane  ' , 'Tablet' , 1035, '500mg' , 35, 85, '2020-5-24' , '2024-12-10' , '25');

INSERT INTO `adminstrator` VALUES
(2200004030 , 'Basil Adnan Alsadah ' , '2002-12-18', 'M' , 'Saudi Arabia, Qatif' , 574584165 , 'StudentBasil' , '9500'),
(2200004380 , 'Mohammed Saad Alsaleh ' , '2001-11-04' , 'M' , 'Kingdom of Saudi Arabia, Dammam, Al Shati Al Gharbi' , 540085266, 'StudentMohammed', '10500'),
(2200006455 , 'Mustafa Darweesh Al baraghithi ' , '2000-01-15' , 'M' , 'Kingdom of Saudi Arabia, Dammam, Al Faisaliah , Road 5' ,548846255 , 'StudentMustafa', '12000'),
(2200006461 , 'Nour-Allah Mohammed Esmat Bek ' , '2001-05-15' , 'M' , 'Kingdom of Saudi Arabia, Dammam, Faiha' , 554412785 , 'StudentNour-Allah', '7850'),
(2210040062 , 'Ryan Abdullatif Aldoghan ','1998-05-05','M','Kingdom of Saudi Arabia, Al Khobar, North',568445235,'StudentRyan', '10000'),
(2190003554 , 'Faisal Mesaad Almadi' , '1999-1-18' , 'M' , 'Kingdom of Saudi Arabia, Dammam', 536296214 , 'StudentFaisal', '5000'),
-- new
(2180002025 , 'Mona Adel' , '1987-5-7','F','Kingdom of Saudi Arabia, Ryadh',554892124,'StudentMona', '14500'),
(2200009180,  'Laila Ahmad','2000-10-26','F','Kingdom of Saudi Arabia, Jeddah',568203107,'StudentLaila', '6850'), 
(2210000149, 'Zainah Bander','1982-8-16','F','Kingdom of Saudi Arabia, Ryadh',562001485,'StudentZainah', '9200'),  
(2190000098, 'Dallal Mohammed','1991-11-14','F','Kingdom of Saudi Arabia, Khobar ' , 556432879 , 'StudentDallal', '11400'),
(2200007788, 'Rami Sabbagh' , '1971-4-15', 'M' ,'Syria', 966423087, 'StudentRami', '3500'),
(2200002387, 'Osama Al-fateh', '1988-10-10', 'M' , 'Sudan', 096215567, 'StudentOsama', '7500'), 
(2200009856, 'Lorax Al-abdullah', '1993-12-25', 'M' , 'Turkey', 033455965, 'StudentLorax', '9900'), -- delete
(2200002750, 'Claire Farron', '1990-5-13', 'F', 'France', 156793928, 'StudentClaire', '21000'),
(2200007610, 'Thancred Waters', '1999-9-19', 'M', 'USA', 994458751, 'StudentThancred', '10000'), 
(2200003333, 'Mahmood Rashiid', '2000-11-1', 'M', 'Iraq', 112206435, 'StudentMahmood', '7300'), -- delete
(2200008414, 'Squall Lionheart', '1986-1-10', 'M', 'Japan', 578945872, 'StudentSquall', '15000'), 
(2200001105, 'Kayley Wilf', '1991-9-7', 'F', 'England', 523785124 , 'StudentKayley', '5800'),
(2200006432, 'Renza Caden', '1992-8-12', 'F', 'Spain' , 346782344, 'StudentRenza', '8950'),
(2200009875, 'Mikki Austin', '1980-1-29', 'F', 'Italy', 758241000, 'StudentMikki', '9000')
;



INSERT INTO `warehouses` VALUES
('Cipla','A1',2200004030,1),
('Med_City','A2',2200004030,2),
('Pfizer','B1',2200006455,3),
('rush','B2',2200006455,4),
('Sun Pharma','C1',2200006461,5),
('GlaxoSmithKline','C2',2210040062,6),
('Novartis','D1',2210040062,7),
('AbbVie','D2',2200006455,8),
('Shanghai Pharmaceuticals Holding','E1',2200004030,9),
('Takeda','E2',2200006455,10);

INSERT INTO `dependent` VALUES
(2180002025,'Ali','M','2005-05-13','son'),
(2180002025,'Sameer','F','2009-12-04','son'),
(2210000149,'Anwar','M','2021-07-11','son'),
(2180002025,'Khalid','M','2015-02-4','son'),
(2190000098,'Talah','F','2012-08-14','daughter'),
(2190000098,'Mustafa','M','2006-11-23','son'),
(2190000098,'Noura','F','2009-12-11','daughter'),
(2200007788,'Akram','M','2017-04-18','son'),
(2200002750,'Hamed','M','2019-09-12','son'),
(2200002750,'Amina','F','2011-12-7','daughter'),
-- new
(2200007788, 'Jihad', 'M' , '2009-3-28', 'son'),
(2200001105, 'Drew' , 'M' , '2010-6-1' , 'son'),
(2200006432, 'Lacie' , 'F', '2013-12-13', 'daughter'),
(2200009875, 'Oakley' , 'M' , '2017-2-1', 'son'),
(2180002025, 'Lizzie' , 'F' , '2017-6-9' , 'daughter'),
(2200007788, 'Rem' , 'F', '2006-4-3', 'daughter'),
(2200007788, 'Emilia', 'F', '2004-8-8', 'daughter'),
(2200002750, 'Hope' , 'M' , '2015-7-7', 'son'),
(2200001105, 'Charles' , 'M' , '2013-2-25', 'son'),
(2200009875, 'James' , 'M' , '2002-4-11', 'son');


INSERT INTO `admin_login` VALUES
(2200004030 , 'StudentBasil'),
(2200004380 , 'StudentMohammed'),
(2200006455 , 'StudentMustafa'),
(2200006461 , 'StudentNour-Allah'),
(2210040062 , 'StudentRyan'),
(2190003554 , 'StudentFaisal'),
(2180002025 , 'StudentMona'),
(2200009180,  'StudentLaila'), 
(2210000149, 'StudentZainah'),  
(2190000098, 'StudentDallal'),
(2200007788, 'StudentRami'),
(2200002387, 'StudentOsama'), 
(2200009856, 'StudentLorax'),
(2200002750, 'StudentClaire'),
(2200007610, 'StudentThancred'), 
(2200003333, 'StudentMahmood'),
(2200008414, 'StudentSquall'), 
(2200001105, 'StudentKayley'),
(2200006432, 'StudentRenza'),
(2200009875, 'StudentMikki');

INSERT INTO `stores` VALUES
(1 , 1 , 1001),
(2 , 2 , 1002),
(3 , 3 , 1003),
(4 , 4 , 1004),
(5 , 5 , 1005),
(6 , 6 , 1006),
(7 , 7 , 1007),
(8 , 8 , 1008),
(9 , 9 , 1009),
(10 , 10 , 1010),
(1 , 11 , 1011),
(1 , 12 , 1012),
(4 , 13 , 1013),
(6 , 14 , 1014),
(2 , 15 , 1015),
(7 , 16 , 1016),
(3 , 17 , 1017),
(8 , 18 , 1018),
(9 , 19 , 1019),
(10 , 20 , 1020),
(6 , 21 , 1021),
(2 , 22 , 1022),
(2 , 23 , 1023),
(1 , 24 , 1024),
(1 , 25 , 1025),
(5 , 26 , 1026),
(7 , 27 , 1027),
(6 , 28 , 1028),
(8 , 29 , 1029),
(10 , 30 , 1030),
(9 , 31 , 1031),
(9 , 32 , 1032),
(8 , 33 , 1033),
(3 , 34 , 1034),
(7 , 35 , 1035);


INSERT INTO `Manages` VALUES
('Cipla' , 2200004030),
('Med_City' , 2200004380),
('Pfizer' , 2200006455),
('rush' , 2200006461),
('Sun Pharma' , 2210040062),
('GlaxoSmithKline' , 2190003554),
('Novartis' , 2180002025),
('AbbVie' , 2200009180),
('Shanghai Pharmaceuticals Holding' , 2210000149),
('Takeda' , 2190000098),
('Cipla' ,2180002025),
('Med_City' ,2200009180), 
('Sun Pharma' ,2210000149),  
('GlaxoSmithKline' ,2190000098),
('Takeda' ,2200007788),
('Cipla' ,2200002387), 
('rush' ,2200009856),
('rush' ,2200002750),
('Takeda' ,2200007610), 
('Cipla' ,2200003333),
('Pfizer' ,2200008414), 
('Sun Pharma' ,2200001105),
('Novartis' ,2200006432),
('AbbVie' ,2200009875);

INSERT INTO `customer_login` VALUES
(1 , 'ibrahim'),
(2 , 'surya'),
(3 , 'rootEDTax3'),
(4 , 'To@45ark'),
(5 , 'Marwan76Ahmed'),
(6 , 'Jamala360bird'),
(7 , 'Skateboardxxpassword'),
(8 , 'Skateboardxxpassword'),
(9 , 'Burj_camera'),
(10 , 'Naj@4758'),
(11, 'DJ5329J'),
(12, 'OPIT325'),
(13, 'LMG@$993'),
(14, '5324MR@5'),
(15, 'UR$$$$SR'),
(16, 'KALHVN99@@'),
(17, 'mkgGOE9090'),
(18, 'RANCONAN245'),
(19, 'DURETAR@_$%'),
(20, 'RUSSIA_44$'),
(21, 'GOFFY_##@@rrt4'),
(22, 'COTTON99_6'),
(23, 'LUFFY_BOA'),
(24, 'Where_am_i'), 
(25, 'Milan_24');

INSERT INTO `location` VALUES
(1 , 'Mumbai'),
(2 , 'Mumbai'),
(3 , 'United State'),
(4 , 'United State'),
(5 , 'Switzerland'),
(6 , 'Mysore'),
(7 , 'Switzerland'),
(8 , 'Japan'),
(9 , 'United State'),
(10 , 'Mysore');

insert into `orders` values
(100,9,'Khalaf jammel',3,'Caltrate',1,57,'2022/05/11 21:40'),
(101,19,'Alva Durante',9,'Daraprim',1,222,'2022/05/13 14:38'),
(102,9,'Khalaf jammel',13,'Methylphenidate',2,138,'2022/05/13 14:39'),
(103,13,'Tel Molly',2,'Okacet',3,135,'2022/05/13 14:40'),
(104,7,'Aminah Mahdi',5,'Wild',2,34,'2022/05/13 14:41'),
(105,24,'Rononoa Zoro',5,'Wild',3,51,'2022/05/13 15:10'),
(106,4,'Tont Stark',10,'Revital',2,446,'2022/05/13 21:01'),
(107,4,'Tont Stark',32,'Codeine  ',1,90,'2022/05/13 21:01'),
(108,17,'Gergina Katee',4,'ChapStick Lip',5,245,'2022/05/13 21:02'),
(109,21,'Rylan Goff',22,'Methylphenidate',6,414,'2022/05/13 21:07'),
(110,25,'Marco Vanbasten',3,'Caltrate',6,342,'2022/05/13 21:08'),
(111,25,'Marco Vanbasten',1,'Imatib',2,120,'2022/05/13 21:08');

-- we added 10 tuples for each table by default.

-- query #1: INSERT 10 new values for admin, 15 for customer, 10 for dependent, 25 for products.
-- Delete 2 tuples from admin, 5 rows from customer,
-- Update Admin salary,
-- Update product price in a specific warehouse.

DELETE FROM `adminstrator`
WHERE NAME = 'Lorax Al-abdullah' OR NAME = 'Mahmood Rashiid';

DELETE FROM `customer`
WHERE Customer_Name = 'Suleman' OR Customer_Name = 'Tel Molly' OR Customer_Name = 'Randell Glen'
OR Customer_Name = 'Alva Durante' OR Customer_Name = 'Sheila Hancock';

UPDATE `adminstrator`
SET `SALARY` = `SALARY` * 0.9
WHERE Gender = 'F';

UPDATE `adminstrator`
SET `SALARY` = `SALARY` * 1.1
WHERE Gender = 'M';

UPDATE `Products`
SET `SELLING_PRICE` = `SELLING_PRICE` * 1.1
WHERE `Product_ID` IN (SELECT `P_ID`
FROM `Stores` WHERE `WareH_ID` = 1);


-- query #2: Adminstators that works in US companies and have salaries between 8000 and 12000


CREATE VIEW US_Admins_With_Specific_Salary AS
SELECT `adminstrator`.`NAME` , SALARY
FROM adminstrator
WHERE ADDRESS = 'USA' AND SALARY > 8000 AND SALARY < 12000;


-- query #3: list the info for all admins
CREATE VIEW admin_info AS
SELECT * FROM adminstrator;


-- query #4: list the info for all customers
CREATE VIEW customer_info AS
SELECT * FROM customer;


-- query #5: select admins name and ssn and show which company he works for


CREATE VIEW admins_manages_company AS
select NAME,User_SSN,Company_NAME
from `adminstrator`, `Manages`
WHERE User_SSN = SSN ;


-- query #6: retrieve the names of admins who have dependents(use nested queries to solve)


CREATE VIEW admin_who_have_dependent AS
select NAME,dependent_name
from adminstrator Inner JOIN Dependent
where SSN=ASSN_ID ;


-- query #7: retrieve the name, type, barcode, and product_id of every product that exists in the warehouses (use JOIN)


CREATE VIEW products_in_each_warehouse AS
select NAME,TYPE,BARCODE,Product_ID
from Products INNER JOIN Stores
where P_ID = Product_ID AND PRODUCT_BARCODE=BARCODE ;


-- query #8: for each company, retrieve the count(number of admins in the company), avarage, min,and max
  -- salary for the admins that works there
  
   
 CREATE VIEW company_salaries AS
select Company_name, count(SSN) AS "TOTAL_ADMINS", min(SALARY) , max(SALARY), AVG(SALARY) 
from adminstrator,manages inner join company
where company_NAME=company.NAME and User_SSN=SSN
GROUP BY Company_name;


-- query #9: count the number of products that are in each Switzerland warehouse


CREATE VIEW number_of_products_in_swissWHs AS
select `WareH_ID` AS 'SWISS_WH_NUMBER' , count(*) AS 'NUMBER_OF_PRODUCTS_IN_IT'
from `Stores`
WHERE `WareH_ID` = 5 OR `WareH_ID` = 7
GROUP BY `WareH_ID`;


-- query #10: for each warehouse that has more thae 5 products, retrieve the warehouse name and id, the supporting
-- company, and the number of admins that manages the warehouse


CREATE VIEW warehouses_that_has_more_than_five_products AS
select `WareH_ID` AS 'WH_ID' ,  `WAREHOUSE_NAME` , `Supplied_Company`  , 
count(DISTINCT P_ID) AS 'NUMBER_OF_PRODUCTS_IN_IT' , count(DISTINCT `MANAGERSSN`) AS 'NUMBER_OF_ADMINS'
from `warehouses`, `Stores` , `adminstrator` , `company`
WHERE `WAREHOUSE_ID` = `WareH_ID`
GROUP BY `WareH_ID` 
HAVING count(DISTINCT P_ID) > 5; 


-- query #11: Show a text if there are enough quantity of products
ALTER TABLE `milestone2_ver5`.`products` 
CHANGE COLUMN `TYPE` `TYPE_` VARCHAR(6) NOT NULL ;

ALTER TABLE `milestone2_ver5`.`products` 
CHANGE COLUMN `NAME` `NAME_` VARCHAR(45) NOT NULL ;


SELECT NAME_,Product_ID , type_ , SELLING_PRICE ,
CASE 
WHEN QUANTITY<5 THEN "There Is less than 5"
WHEN QUANTITY>5 THEN "There Is More than 5"
ELSE "There Is enough Quantity "
END
from products;
-- query #12: retrieve customer name, phone , id , and password for those who are females and their age is 18+
CREATE VIEW customers_who_are_adults AS
select `Customer_Name`, `PHONE` , `Customer_ID` , `PASS_WORD` , `Gender` , `DOB`
from customer
where `Gender` = 'F' and `DOB` > 2021-1-1;

-- query #13: retrieve the name and SSN of admins who do not have dependents

CREATE VIEW adminstrators_who_do_not_have_dependents AS
select adminstrator.NAME , SSN
from adminstrator 
where NOT EXISTS (
SELECT *
from Dependent
where SSN = ASSN_ID);


-- query #14: retrieve the customers name, phone, gender, DOB , and company name and address
-- for each company.
CREATE VIEW company_customers_details AS
select customer_Name , customer.PHONE , Gender, DOB , comp_name , LOCATION
from customer inner join company
where comp_name=company.NAME ;


-- query #15: retrieve a list of admins who have dependents who are boys(sons)

CREATE VIEW adminstartor_with_son AS
select adminstrator.NAME, dependent_name , `Relationship` , `B_Date` , Dependent.`Gender`
from adminstrator INNER JOIN Dependent
where SSN=ASSN_ID and `Relationship` = 'son' and `B_Date` > '2012-1-1'
ORDER BY adminstrator.NAME;




