create database FORMULA1;
use formula1;

create table Principal(
DOB date,
principal_id varchar(5) primary key,
HireYear year,
nationality varchar(20),
last_name varchar(20),
first_name varchar(20)
);

create table driver(
DOB date,
driver_id varchar(5) primary key,
nationality varchar(20),
first_name varchar(20),
last_name varchar(20)
);

create table manages(
principal_id varchar(5),
driver_id varchar(5),
foreign key (principal_id) references Principal(principal_id),
foreign key (driver_id) references Driver(driver_id)
);

create table driverchampionship_stats(
position int primary key,
driver_id varchar(5),
foreign key (driver_id) references driver(driver_id),
No_of_races int,
poles int,
podiums int,
wins int,
points int
);

create table constructor(
constructor_name varchar(20) primary key,
year_established year,
nationality varchar(20),
principal_id varchar(5),
foreign key (principal_id) references principal(principal_id)
);

create table constructorchampionship(
position int primary key,
team varchar(20),
foreign key (team) references constructor(constructor_name),
points int
);

create table plays_for(
constructor_name varchar(20),
foreign key (constructor_name) references constructor(constructor_name),
driver_id varchar(5),
foreign key (driver_id) references driver(driver_id)
);

create table race(
  raceID varchar(5) primary key,
  held_on date,
  circuit varchar(50),
  GP varchar(50),
  city varchar(20)
);

create table racestats(
  GP varchar(50) primary key,
  DOTD varchar(5),
  foreign key (DOTD) references driver(driver_id),
  fastest_lap_driver varchar(5),
  foreign key (fastest_lap_driver) references driver(driver_id)
);

create table Positions(
	GP varchar(50),
    foreign key (GP) references racestats(GP),
    position int,
    driver_id varchar(5),
    foreign key (driver_id) references driver(driver_id),
    points int,
    primary key (Position,GP)
);
				
create table participates(
  constructor_name varchar(20),
  foreign key (constructor_name) references constructor(constructor_name),
  raceID varchar(5),
  foreign key (raceID) references race(raceID)
);


insert into principal values ('1973-11-16','p1','2005','GBR','Horner','Christian'),
							('1972-01-12','p2','2013','GER','Wolff','Toto'),
                            ('1968-05-28','p3','2017','FRA','Vasseur','Frederic'),
                            ('1976-01-28','p4','2024','JAP','Komatsu','Ayao'),
                            ('1962-01-12','p5','2023','FRA','Famin','Bruno'),
                            ('1971-02-22','p6','2023','ITA','Stella','Andrea'),
                            ('1972-03-18','p7','2022','LUX','Krack','Mike'),
                            ('1979-06-20','p8','2023','GBR','Vowles','James'),
                            ('1977-04-28','p9','2024','FRA','Mekies','Laurent'),
                            ('1974-11-23','p10','2022','ITA','Bravi','Alessandro');


insert into driver values 	('1997-09-30','D1','NED','Max','Verstappen'),
							('1985-01-07','D2','GBR','Lewis','Hamilton'),
                            ('1994-09-01','D3','ESP','Carlos','Sainz'),
                            ('1981-07-29','D4','ESP','Fernando','Alonso'),
                            ('1997-10-16','D5','MON','charles','leclerc'),
                            ('1999-11-13','D6','GBR','lando','norris'),
                            ('2001-04-06','D7','AUS','oscar','piastri'),
                            ('1990-01-26','D8','MEX','sergio','perez'),
                            ('1998-10-19','D9','CAN','lance','stroll'),
                            ('1989-01-26','D10','FIN','valterri','bottas'),
                            ('1998-02-15','D11','GBR','george','russell'),
							('1987-08-19','D12','GER','nico','Hulkenberg'),
                            ('1996-03-23','D13','THA','alex','albon'),
                            ('1999-05-30','D14','CHI','zhou','guanyu'),
                            ('1992-10-05','D15','DEN','kevin','magnussen'),
                            ('1989-07-01','D16','AUS','daniel','ricciardo'),
                            ('1996-09-17','D17','FRA','ocon','esteban'),
                            ('2001-05-11','D18','JAP','yuki','tsunoda'),
                            ('1996-02-07','D19','FRA','gasly','pierre'),
                            ('2000-12-31','D20','USA','logan','sargeant'),
							('2005-05-08','D21','GBR','ollie','bearman'),
                            ('2002-02-11','D22','NZ','liam','lawson'),
                            ('1999-03-22','D23','GER','mick','schumacher'),
                            ('1996-06-25','D24','BRA','pietro','fittipaldi'),
                            ('2002-01-13','D25','DEN','frederik','vesti');

insert into manages values  ('p1','D1'),
							('p2','D2'),
                            ('p3','D3'),
                            ('p7','D4'),
                            ('p3','D5'),
                            ('p6','D6'),
                            ('p6','D7'),
                            ('p1','D8'),
                            ('p7','D9'),
                            ('p10','D10'),
                            ('p2','D11'),
                            ('p4','D12'),
                            ('p8','D13'),
                            ('p10','D14'),
                            ('p4','D15'),
                            ('p9','D16'),
                            ('p5','D17'),
                            ('p9','D18'),
                            ('p5','D19'),
                            ('p8','D20'),
                            ('p3','D21'),
                            ('p1','D22'),
                            ('p2','D23'),
                            ('p4','D24'),
                            ('p8','D25'),
							('p4','D21'),
							('p9','D22'),
							('p8','D23'),
							('p3','D24'),
							('p2','D25');
                            
insert into driverchampionship_stats values (1,'D1',2,2,2,2,51),
											(2,'D8',2,0,2,0,36),
                                            (3,'D5',2,0,1,0,28),
                                            (4,'D11',2,0,0,0,18),
                                            (5,'D7',2,0,0,0,16),
                                            (6,'D3',1,0,1,0,15),
                                            (7,'D4',2,0,0,0,12),
                                            (8,'D6',2,0,0,0,12),
                                            (9,'D2',2,0,0,0,8),
                                            (10,'D21',2,0,0,0,6),
                                            (11,'D12',2,0,0,0,1),
                                            (12,'D9',2,0,0,0,1),
                                            (13,'D13',2,0,0,0,0),
                                            (14,'D14',2,0,0,0,0),
                                            (15,'D15',2,0,0,0,0),
                                            (16,'D16',2,0,0,0,0),
                                            (17,'D17',2,0,0,0,0),
                                            (18,'D18',2,0,0,0,0),
                                            (19,'D20',2,0,0,0,0),
                                            (20,'D10',2,0,0,0,0),
                                            (21,'D19',2,0,0,0,0);
                                            
insert into constructor values ('RedBull','2005','AST','p1'),
								('Mercedes','1954','GER','p2'),
                                ('Ferrari','1950','ITA','p3'),
                                ('McLaren','1966','GBR','p6'),
                                ('Aston Martin','1959','GBR','p7'),
                                ('Sauber','2024','SWI','p10'),
                                ('RB','2024','ITA','p9'),
                                ('Alpine','2021','FRA','p5'),
                                ('HAAS','2016','USA','p4'),
                                ('Williams','1975','GBR','p8');
					
insert into constructorchampionship values (1,'RedBull',87),
										   (2,'Ferrari',49),
                                           (3,'McLaren',28),
                                           (4,'Mercedes',26),
                                           (5,'Aston Martin',13),
                                           (6,'HAAS',1),
                                           (7,'Williams',0),
                                           (8,'Sauber',0),
                                           (9,'RB',0),
                                           (10,'Alpine',0);

insert into plays_for values ('RedBull','D1'),
							 ('Mercedes','D2'),
                             ('Ferrari','D3'),
                             ('Aston Martin','D4'),
                             ('Ferrari','D5'),
                             ('McLaren','D6'),
                             ('McLaren','D7'),
							 ('RedBull','D8'),
                             ('Aston Martin','D9'),
                             ('Sauber','D10'),
                             ('Mercedes','D11'),
                             ('HAAS','D12'),
                             ('Williams','D13'),
							 ('Sauber','D14'),
                             ('HAAS','D15'),
                             ('RB','D16'),
                             ('Alpine','D17'),
                             ('RB','D18'),
                             ('Alpine','D19'),
							 ('Williams','D20'),
                             ('Ferrari','D21'),
                             ('RedBull','D22'),
                             ('Mercedes','D23'),
                             ('HAAS','D24'),
                             ('Williams','D25'),
							 ('HAAS','D21'),
                             ('RB','D22'),
                             ('Williams','D23'),
                             ('Ferrari','D24'),
                             ('Mercedes','D25');
                             
insert into race values ('R1','2024-03-02','bahrain International circuit','bahrain gp','bahrain'),
						('R2','2024-03-10','jeddah corniche circuit','saudi arabia gp','jeddah');
                        
insert into racestats values ('bahrain gp','D3','D1'),
							 ('saudi arabia gp','D21','D5');
                             
insert into Positions values ('bahrain gp',1,'D1',26),
					('bahrain gp',2,'D8',18),
                    ('bahrain gp',3,'D3',15),
                    ('bahrain gp',4,'D5',12),
                    ('bahrain gp',5,'D11',10),
                    ('bahrain gp',6,'D6',8),
                    ('bahrain gp',7,'D2',6),
                    ('bahrain gp',8,'D7',4),
                    ('bahrain gp',9,'D4',2),
                    ('bahrain gp',10,'D9',1),
                    ('bahrain gp',11,'D14',0),
                    ('bahrain gp',12,'D15',0),
                    ('bahrain gp',13,'D16',0),
                    ('bahrain gp',14,'D18',0),
                    ('bahrain gp',15,'D13',0),
                    ('bahrain gp',16,'D12',0),
                    ('bahrain gp',17,'D17',0),
                    ('bahrain gp',18,'D19',0),
                    ('bahrain gp',19,'D10',0),
                    ('bahrain gp',20,'D20',0),
                    ('saudi arabia gp',1,'D1',25),
                    ('saudi arabia gp',2,'D8',18),
                    ('saudi arabia gp',3,'D5',16),
                    ('saudi arabia gp',4,'D7',12),
                    ('saudi arabia gp',5,'D4',10),
                    ('saudi arabia gp',6,'D11',8),
                    ('saudi arabia gp',7,'D21',6),
                    ('saudi arabia gp',8,'D6',4),
                    ('saudi arabia gp',9,'D2',2),
                    ('saudi arabia gp',10,'D12',1),
                    ('saudi arabia gp',11,'D13',0),
                    ('saudi arabia gp',12,'D15',0),
                    ('saudi arabia gp',13,'D17',0),
                    ('saudi arabia gp',14,'D18',0),
                    ('saudi arabia gp',15,'D20',0),
                    ('saudi arabia gp',16,'D16',0),
                    ('saudi arabia gp',17,'D10',0),
                    ('saudi arabia gp',18,'D14',0),
                    ('saudi arabia gp',19,'D9',0),
                    ('saudi arabia gp',20,'D19',0);
                    
insert into participates values ('RedBull','R1'),
					('Ferrari','R1'),
                    ('McLaren','R1'),
                    ('Mercedes','R1'),
                    ('Aston Martin','R1'),
                    ('HAAS','R1'),
                    ('Williams','R1'),
                    ('Sauber','R1'),
                    ('RB','R1'),
                    ('Alpine','R1'),
                    ('RedBull','R2'),
					('Ferrari','R2'),
                    ('McLaren','R2'),
                    ('Mercedes','R2'),
                    ('Aston Martin','R2'),
                    ('HAAS','R2'),
                    ('Williams','R2'),
                    ('Sauber','R2'),
                    ('RB','R2'),
                    ('Alpine','R2');