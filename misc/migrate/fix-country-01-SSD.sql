-- Adding South Sudan Country

insert into fra_country(id,countryarea,iso3,landarea,name,ctype) values (99940764, 64433, 'SSD', 64433, 'South Sudan', 'FRA');
insert into fra_status (id, status) values (9999, 'empty');
insert into fra_survey (id , country_id,status_id) values (9999, 99940764, 9999);

