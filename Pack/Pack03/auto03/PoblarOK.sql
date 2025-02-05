insert into room_type values ('double','Fabulously appointed double room.');
insert into room_type values ('family','Superior appartment for up to 3 people.');
insert into room_type values ('single','Luxury accomodation suitable for one person.');
insert into room_type values ('twin','Superb room with two beds.');


insert into rate values ('double',1,56.00);
insert into rate values ('double',2,72.00);
insert into rate values ('family',1,56.00);
insert into rate values ('family',2,72.00);
insert into rate values ('family',3,84.00);
insert into rate values ('single',1,48.00);
insert into rate values ('twin',1,50.00);
insert into rate values ('twin',2,72.00);


insert into room values (1,'double',2);
insert into room values (2,'double',2);
insert into room values (3,'single',1);
insert into room values (4,'double',2);
insert into room values (5,'double',2);
insert into room values (6,'double',2);
insert into room values (7,'family',3);
insert into room values (8,'double',2);
insert into room values (9,'double',2);
insert into room values (10,'double',2);
insert into room values (11,'double',2);



insert into guest values (1,'Tom','Watson','West Bromwich East');
insert into guest values (2,'Hilary','Benn','Leeds Central');
insert into guest values (3,'Dawn','Butler','Brent Central');
insert into guest values (4,'Mary','Creagh','Wakefield');
insert into guest values (5,'Jon','Cruddas','Dagenham and Rainham');
insert into guest values (6,'Wayne','David','Caerphilly');
insert into guest values (7,'Jack','Dromey','Birmingham, Erdington');
insert into guest values (8,'Maria','Eagle','Garston and Halewood');
insert into guest values (9,'Frank','Field','Birkenhead');
insert into guest values (10,'Helen','Jones','Warrington North');


insert into booking values (1,'2016-11-09',1,1,1,'double',2,'16:00');
insert into booking values (2,'2016-11-15',2,2,1,'single',1,'13:00');
insert into booking values (3,'2016-11-07',3,3,1,'double',2,'21:00');
insert into booking values (4,'2016-11-08',4,4,2,'double',3,'14:00');
insert into booking values (5,'2016-11-11',5,5,1,'double',3,'13:00');
insert into booking values (6,'2016-11-12',6,6,2,'family',3,'17:00');
insert into booking values (7,'2016-11-08',7,7,2,'double',1,'15:00');
insert into booking values (8,'2016-11-09',8,8,2,'double',4,'12:00');
insert into booking values (9,'2016-11-09',9,9,1,'double',4,'20:00');
insert into booking values (10,'2016-11-09',10,10,2,'double',5,'21:00');


insert into extra values (101,1,'Breakfast x 7',4.26);
insert into extra values (202,2,'Breakfast x 2',4.04);
insert into extra values (303,3,'Phone Calls £4.69',90.00);
insert into extra values (404,4,'Breakfast x 12',90.00);
insert into extra values (505,5,'Phone Calls £3.19',72.00);
insert into extra values (606,6,'Breakfast x 1',26.00);
insert into extra values (707,7,'Phone Calls £0.70',3.93);
insert into extra values (808,8,'Breakfast x 8',36.00);
insert into extra values (909,9,'Breakfast x 10',46.00);
insert into extra values (1010,10,'Phone Calls £3.56',3.932);
