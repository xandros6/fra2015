-- Adding BLM and MAF

insert into fra_country(id,iso3,countryarea,landarea,name,ctype) values (99900001,'MAF', 5.44,  5.44, 'Saint Martin (French part)', 'FRA');
insert into fra_status (id, status) values (9998, 'empty');
insert into fra_survey (id , country_id,status_id) values (9998, 99900001, 9998);

insert into fra_country(id,iso3,countryarea,landarea,name,ctype) values (99900002,'BLM', 2.1,  2.1, 'Saint Barthelemy', 'FRA');
insert into fra_status (id, status) values (9997, 'empty');
insert into fra_survey (id , country_id,status_id) values (9997, 99900002, 9997);


