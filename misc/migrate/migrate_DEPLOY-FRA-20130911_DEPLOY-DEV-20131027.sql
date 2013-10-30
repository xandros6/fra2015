-- https://github.com/geosolutions-it/fra2015/issues/300

ALTER TABLE fra_status ADD lastacceptancerequest bigint;
ALTER TABLE fra_status ADD lastpendingfixsubmit bigint;
ALTER TABLE fra_status ADD laststatusaccepted bigint;

-- https://github.com/geosolutions-it/fra2015/issues/323

INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90005,'','','','textarea',903,9);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90006,'','','','textarea',904,10);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90007,'','','','textarea',905,11);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90008,'','','','textarea',906,12);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90009,'','','','textarea',907,13);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90010,'','','','textarea',908,14);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90011,'','','','textarea',909,15);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90012,'','','','textarea',910,16);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90013,'','','','textarea',911,17);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90014,'','','','textarea',912,20);
INSERT INTO fra_entry(id, description, name, title, type, variable, question_id) VALUES (90015,'','','','textarea',913,21);

-- https://github.com/geosolutions-it/fra2015/issues/286

ALTER TABLE fra_user ADD preventcontributorsemails boolean NOT NULL DEFAULT FALSE;


