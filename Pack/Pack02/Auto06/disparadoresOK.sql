/*disparador ok*/
INSERT INTO musician (m_name,born,died,born_in,living_in) VALUES ('Ana','02-JAN-48',null,2,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (42,'Ana','02-JAN-48',null,2,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (90,'Ana','02-JAN-48',null,2,3);

INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (27,'John','17-NOV-97',null,2);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (28,'John','02-JAN-48',null,4);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (29,'John','02-JAN-48',null,9);

INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,3,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,3,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (32,15,'guitar','jazz');

INSERT INTO composer (comp_no,comp_is) VALUES (14,3);
INSERT INTO composer (comp_no,comp_is) VALUES (15,15);
INSERT INTO composer (comp_no,comp_is) VALUES (16,5);

DELETE FROM musician WHERE m_no= 4;

UPDATE musician SET m_name= 'Ana' WHERE m_no= 1;
UPDATE musician SET living_in= 3 WHERE m_no= 1;
UPDATE musician SET died= '02-JAN-99' WHERE m_no= 1;