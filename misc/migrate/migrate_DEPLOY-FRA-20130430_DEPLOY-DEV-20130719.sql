alter table fra_user add column cansubmit boolean;
alter TABLE fra_status alter COLUMN "message" type varchar(4000);

UPDATE fra_entry_item SET rowname='1a;1.1'  WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1a;1.2'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1a;1.2'  WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.6'  WHERE columnnumber=1 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1a;1.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.6'  WHERE columnnumber=2 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.7'  WHERE columnnumber=1 AND rownumber=6 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.7'  WHERE columnnumber=2 AND rownumber=6 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.8'  WHERE columnnumber=1 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');
UPDATE fra_entry_item SET rowname='1b;1.8'  WHERE columnnumber=2 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '9x');

UPDATE fra_entry_item SET rowname='2a;2.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2a;2.1'  WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2a;2.2'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2a;2.2'  WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2a;2.3'  WHERE columnnumber=1 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2a;2.3'  WHERE columnnumber=2 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2c;2.5'  WHERE columnnumber=1 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');
UPDATE fra_entry_item SET rowname='2c;2.5'  WHERE columnnumber=2 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '21x');

UPDATE fra_entry_item SET rowname='3a;3.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3a;3.1'  WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3c;3.4'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3c;3.4'  WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.5'  WHERE columnnumber=1 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.5'  WHERE columnnumber=2 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.6'  WHERE columnnumber=1 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.6'  WHERE columnnumber=2 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.6'  WHERE columnnumber=1 AND rownumber=5 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3d;3.6'  WHERE columnnumber=2 AND rownumber=5 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.8'  WHERE columnnumber=1 AND rownumber=6 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.8'  WHERE columnnumber=2 AND rownumber=6 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.9'  WHERE columnnumber=1 AND rownumber=7 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.9'  WHERE columnnumber=2 AND rownumber=7 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
--32
UPDATE fra_entry_item SET rowname='3e;3.10f,3.10o,3.11f,3.11o'  WHERE columnnumber=1 AND rownumber=8 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.10f,3.10o,3.11f,3.11o'  WHERE columnnumber=2 AND rownumber=8 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.12' WHERE columnnumber=1 AND rownumber=9 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
UPDATE fra_entry_item SET rowname='3e;3.12' WHERE columnnumber=2 AND rownumber=9 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '35');
  
UPDATE fra_entry_item SET rowname='4a;4.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '48');
UPDATE fra_entry_item SET rowname='4a;4.1'  WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '48');
UPDATE fra_entry_item SET rowname='4a;4.2'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '48');
UPDATE fra_entry_item SET rowname='4a;4.2'  WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '48');

UPDATE fra_entry_item SET rowname='5a;5.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '60');
UPDATE fra_entry_item SET rowname='5a;5.1'  WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '60');
UPDATE fra_entry_item SET rowname='5b;5.2'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '60');
UPDATE fra_entry_item SET rowname='5b;5.2'  WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '60');

UPDATE fra_entry_item SET rowname='6;6.1'   WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '71');
UPDATE fra_entry_item SET rowname='6;6.1'   WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '71');
UPDATE fra_entry_item SET rowname='6;6.2'   WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '71');
UPDATE fra_entry_item SET rowname='6;6.2'   WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '71');

UPDATE fra_entry_item SET rowname='7;7.1.1' WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '83');
UPDATE fra_entry_item SET rowname='7;7.1.1' WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '83');
--50
UPDATE fra_entry_item SET rowname='8a;8.1,8.1.1,8.2,8.2.1' WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '95');
UPDATE fra_entry_item SET rowname='8a;8.1,8.1.1,8.2,8.2.1' WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '95');
UPDATE fra_entry_item SET rowname='8b;8.3'    WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '95');
UPDATE fra_entry_item SET rowname='8b;8.3'    WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '95');

UPDATE fra_entry_item SET rowname='9;9.1'     WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '900');

UPDATE fra_entry_item SET rowname='12;12.1'   WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '116');
UPDATE fra_entry_item SET rowname='12;12.1.1' WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '116');

UPDATE fra_entry_item SET rowname='14a;14.1'  WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '126');
UPDATE fra_entry_item SET rowname='14a;14.3'  WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '126');

UPDATE fra_entry_item SET rowname='15;15.1.1,15.1.2,15.1.3'      WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '131');

UPDATE fra_entry_item SET rowname='16a;16.1.1,16.1.2,16.1.3,16.2'WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '136');
UPDATE fra_entry_item SET rowname='16b;16.2.1,16.2.2,16.2.3'     WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '136');

UPDATE fra_entry_item SET rowname='18a;18.1' WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');
UPDATE fra_entry_item SET rowname='18a;18.1' WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');
UPDATE fra_entry_item SET rowname='18a;18.2' WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');
UPDATE fra_entry_item SET rowname='18a;18.2' WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');
UPDATE fra_entry_item SET rowname='18a;18.3' WHERE columnnumber=1 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');
UPDATE fra_entry_item SET rowname='18a;18.3' WHERE columnnumber=2 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '149');

UPDATE fra_entry_item SET rowname='18b;18.4' WHERE columnnumber=1 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.4' WHERE columnnumber=2 AND rownumber=1 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.5' WHERE columnnumber=1 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.5' WHERE columnnumber=2 AND rownumber=2 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.6' WHERE columnnumber=1 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.6' WHERE columnnumber=2 AND rownumber=3 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.7' WHERE columnnumber=1 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.7' WHERE columnnumber=2 AND rownumber=4 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.8' WHERE columnnumber=1 AND rownumber=5 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');
UPDATE fra_entry_item SET rowname='18b;18.8' WHERE columnnumber=2 AND rownumber=5 AND entry_id = (SELECT id FROM fra_entry WHERE variable = '151');




update fra_entry_item set rowname='8.3' where id in (select ei.id from fra_entry e, fra_entry_item ei where ei.entry_id=e.id and variable='8b' and columnnumber=3);
update fra_entry_item set rowname='7.1.1' where id in (select ei.id from fra_entry e, fra_entry_item ei where ei.entry_id=e.id and variable='7' and question_id=7 and rowname is null);

UPDATE fra_entry SET type='static_table' WHERE variable='9' AND question_id=9 AND type='table';
INSERT INTO fra_entry (id,description,name,title,type,variable,question_id) VALUES (90002,null,null,null,'table','900',9);
INSERT INTO fra_entry (id,description,name,title,type,variable,question_id) VALUES (90003,null,null,null,'static_table','901',9);
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES (90102,null,2,'9;9.1',1,'String',90002);
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES (90101,null,1,null,1,'String',90003);
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES (170301,null,1,null,3,'String',(select id from fra_entry where variable='141'));
DELETE from fra_entry_item where entry_id in (select id from fra_entry where variable='151') and rownumber=0 and columnnumber=0;

-- !!!!!!
update fra_entry_item set type='Number' where entry_id in (select id from fra_entry where variable='4a');
update fra_entry_item set type='Number' where entry_id in (select id from fra_entry where variable='21a' or variable='21b');

