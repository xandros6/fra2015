-- https://github.com/geosolutions-it/fra2015/issues/336

INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES ((select max(id) from fra_entry_item)+1,null,5,'13.3',4,'String',(select id from fra_entry where variable='13a'));
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES ((select max(id) from fra_entry_item)+1,null,6,'13.3',4,'String',(select id from fra_entry where variable='13a'));
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES ((select max(id) from fra_entry_item)+1,null,7,'13.3',4,'String',(select id from fra_entry where variable='13a'));
INSERT INTO fra_entry_item (id,columnname,columnnumber,rowname,rownumber,type,entry_id) VALUES ((select max(id) from fra_entry_item)+1,null,8,'13.3',4,'String',(select id from fra_entry where variable='13a'));

-- https://github.com/geosolutions-it/fra2015/issues/308

/*Adding missing attributes to the country table*/
ALTER TABLE fra_country ADD name_en character varying(255);
ALTER TABLE fra_country ADD name_es character varying(255);
ALTER TABLE fra_country ADD name_fr character varying(255);

/*Fill the 'name_es'*/
UPDATE fra_country SET name_es='Afganistán' WHERE iso3='AFG';
UPDATE fra_country SET name_es='Albania' WHERE iso3='ALB';
UPDATE fra_country SET name_es='Argelia' WHERE iso3='DZA';
UPDATE fra_country SET name_es='Samoa Americana' WHERE iso3='ASM';
UPDATE fra_country SET name_es='Andorra' WHERE iso3='AND';
UPDATE fra_country SET name_es='Angola' WHERE iso3='AGO';
UPDATE fra_country SET name_es='Anguila' WHERE iso3='AIA';
UPDATE fra_country SET name_es='Antigua y Barbuda' WHERE iso3='ATG';
UPDATE fra_country SET name_es='Argentina' WHERE iso3='ARG';
UPDATE fra_country SET name_es='Armenia' WHERE iso3='ARM';
UPDATE fra_country SET name_es='Aruba' WHERE iso3='ABW';
UPDATE fra_country SET name_es='Australia' WHERE iso3='AUS';
UPDATE fra_country SET name_es='Austria' WHERE iso3='AUT';
UPDATE fra_country SET name_es='Azerbaiyán' WHERE iso3='AZE';
UPDATE fra_country SET name_es='Bahamas' WHERE iso3='BHS';
UPDATE fra_country SET name_es='Bahrein' WHERE iso3='BHR';
UPDATE fra_country SET name_es='Bangladesh' WHERE iso3='BGD';
UPDATE fra_country SET name_es='Barbados' WHERE iso3='BRB';
UPDATE fra_country SET name_es='Belarús' WHERE iso3='BLR';
UPDATE fra_country SET name_es='Bélgica' WHERE iso3='BEL';
UPDATE fra_country SET name_es='Belice' WHERE iso3='BLZ';
UPDATE fra_country SET name_es='Benin' WHERE iso3='BEN';
UPDATE fra_country SET name_es='Bermudas' WHERE iso3='BMU';
UPDATE fra_country SET name_es='Bhután' WHERE iso3='BTN';
UPDATE fra_country SET name_es='Bolivia' WHERE iso3='BOL';
UPDATE fra_country SET name_es='Bosnia y Herzegovina' WHERE iso3='BIH';
UPDATE fra_country SET name_es='Botswana' WHERE iso3='BWA';
UPDATE fra_country SET name_es='Brasil' WHERE iso3='BRA';
UPDATE fra_country SET name_es='Islas Vírgenes Británicas' WHERE iso3='VGB';
UPDATE fra_country SET name_es='Brunei Darussalam' WHERE iso3='BRN';
UPDATE fra_country SET name_es='Bulgaria' WHERE iso3='BGR';
UPDATE fra_country SET name_es='Burkina Faso' WHERE iso3='BFA';
UPDATE fra_country SET name_es='Burundi' WHERE iso3='BDI';
UPDATE fra_country SET name_es='Camboya' WHERE iso3='KHM';
UPDATE fra_country SET name_es='Camerún' WHERE iso3='CMR';
UPDATE fra_country SET name_es='Canadá' WHERE iso3='CAN';
UPDATE fra_country SET name_es='Cabo Verde' WHERE iso3='CPV';
UPDATE fra_country SET name_es='Islas Caimán' WHERE iso3='CYM';
UPDATE fra_country SET name_es='República Centroafricana' WHERE iso3='CAF';
UPDATE fra_country SET name_es='Chad' WHERE iso3='TCD';
UPDATE fra_country SET name_es='Chile' WHERE iso3='CHL';
UPDATE fra_country SET name_es='China' WHERE iso3='CHN';
UPDATE fra_country SET name_es='Colombia' WHERE iso3='COL';
UPDATE fra_country SET name_es='Comoras' WHERE iso3='COM';
UPDATE fra_country SET name_es='Congo' WHERE iso3='COG';
UPDATE fra_country SET name_es='Islas Cook' WHERE iso3='COK';
UPDATE fra_country SET name_es='Costa Rica' WHERE iso3='CRI';
UPDATE fra_country SET name_es='Côte d''Ivoire' WHERE iso3='CIV';
UPDATE fra_country SET name_es='Croacia' WHERE iso3='HRV';
UPDATE fra_country SET name_es='Cuba' WHERE iso3='CUB';
UPDATE fra_country SET name_es='Chipre' WHERE iso3='CYP';
UPDATE fra_country SET name_es='República Checa' WHERE iso3='CZE';
UPDATE fra_country SET name_es='República Popular Democrática de Corea' WHERE iso3='PRK';
UPDATE fra_country SET name_es='República Democrática del Congo' WHERE iso3='COD';
UPDATE fra_country SET name_es='Dinamarca' WHERE iso3='DNK';
UPDATE fra_country SET name_es='Djibouti' WHERE iso3='DJI';
UPDATE fra_country SET name_es='Dominica' WHERE iso3='DMA';
UPDATE fra_country SET name_es='República Dominicana' WHERE iso3='DOM';
UPDATE fra_country SET name_es='Ecuador' WHERE iso3='ECU';
UPDATE fra_country SET name_es='Egipto' WHERE iso3='EGY';
UPDATE fra_country SET name_es='El Salvador' WHERE iso3='SLV';
UPDATE fra_country SET name_es='Guinea Ecuatorial' WHERE iso3='GNQ';
UPDATE fra_country SET name_es='Eritrea' WHERE iso3='ERI';
UPDATE fra_country SET name_es='Estonia' WHERE iso3='EST';
UPDATE fra_country SET name_es='Etiopía' WHERE iso3='ETH';
UPDATE fra_country SET name_es='Islas Feroe' WHERE iso3='FRO';
UPDATE fra_country SET name_es='Islas Malvinas (Falkland Islands)' WHERE iso3='FLK';
UPDATE fra_country SET name_es='Fiji' WHERE iso3='FJI';
UPDATE fra_country SET name_es='Finlandia' WHERE iso3='FIN';
UPDATE fra_country SET name_es='Francia' WHERE iso3='FRA';
UPDATE fra_country SET name_es='Guayana Francesa' WHERE iso3='GUF';
UPDATE fra_country SET name_es='Polinesia Francesa' WHERE iso3='PYF';
UPDATE fra_country SET name_es='Gabón' WHERE iso3='GAB';
UPDATE fra_country SET name_es='Gambia' WHERE iso3='GMB';
UPDATE fra_country SET name_es='Georgia' WHERE iso3='GEO';
UPDATE fra_country SET name_es='Alemania' WHERE iso3='DEU';
UPDATE fra_country SET name_es='Ghana' WHERE iso3='GHA';
UPDATE fra_country SET name_es='Gibraltar' WHERE iso3='GIB';
UPDATE fra_country SET name_es='Grecia' WHERE iso3='GRC';
UPDATE fra_country SET name_es='Groenlandia' WHERE iso3='GRL';
UPDATE fra_country SET name_es='Granada' WHERE iso3='GRD';
UPDATE fra_country SET name_es='Guadalupe' WHERE iso3='GLP';
UPDATE fra_country SET name_es='Guam' WHERE iso3='GUM';
UPDATE fra_country SET name_es='Guatemala' WHERE iso3='GTM';
UPDATE fra_country SET name_es='Guernesey' WHERE iso3='GGY';
UPDATE fra_country SET name_es='Guinea' WHERE iso3='GIN';
UPDATE fra_country SET name_es='Guinea-Bissau' WHERE iso3='GNB';
UPDATE fra_country SET name_es='Guyana' WHERE iso3='GUY';
UPDATE fra_country SET name_es='Haití' WHERE iso3='HTI';
UPDATE fra_country SET name_es='Santa Sede' WHERE iso3='VAT';
UPDATE fra_country SET name_es='Honduras' WHERE iso3='HND';
UPDATE fra_country SET name_es='Hungría' WHERE iso3='HUN';
UPDATE fra_country SET name_es='Islandia' WHERE iso3='ISL';
UPDATE fra_country SET name_es='India' WHERE iso3='IND';
UPDATE fra_country SET name_es='Indonesia' WHERE iso3='IDN';
UPDATE fra_country SET name_es='Irán (República Islámica del)' WHERE iso3='IRN';
UPDATE fra_country SET name_es='Iraq' WHERE iso3='IRQ';
UPDATE fra_country SET name_es='Irlanda' WHERE iso3='IRL';
UPDATE fra_country SET name_es='Isla de Man' WHERE iso3='IMN';
UPDATE fra_country SET name_es='Israel' WHERE iso3='ISR';
UPDATE fra_country SET name_es='Italia' WHERE iso3='ITA';
UPDATE fra_country SET name_es='Jamaica' WHERE iso3='JAM';
UPDATE fra_country SET name_es='Japón' WHERE iso3='JPN';
UPDATE fra_country SET name_es='Jersey' WHERE iso3='JEY';
UPDATE fra_country SET name_es='Jordania' WHERE iso3='JOR';
UPDATE fra_country SET name_es='Kazajstán' WHERE iso3='KAZ';
UPDATE fra_country SET name_es='Kenya' WHERE iso3='KEN';
UPDATE fra_country SET name_es='Kiribati' WHERE iso3='KIR';
UPDATE fra_country SET name_es='Kuwait' WHERE iso3='KWT';
UPDATE fra_country SET name_es='Kirguistán' WHERE iso3='KGZ';
UPDATE fra_country SET name_es='República Democrática Popular Lao' WHERE iso3='LAO';
UPDATE fra_country SET name_es='Letonia' WHERE iso3='LVA';
UPDATE fra_country SET name_es='Líbano' WHERE iso3='LBN';
UPDATE fra_country SET name_es='Lesotho' WHERE iso3='LSO';
UPDATE fra_country SET name_es='Liberia' WHERE iso3='LBR';
UPDATE fra_country SET name_es='Jamahiriya Árabe Libia' WHERE iso3='LBY';
UPDATE fra_country SET name_es='Liechtenstein' WHERE iso3='LIE';
UPDATE fra_country SET name_es='Lituania' WHERE iso3='LTU';
UPDATE fra_country SET name_es='Luxemburgo' WHERE iso3='LUX';
UPDATE fra_country SET name_es='Madagascar' WHERE iso3='MDG';
UPDATE fra_country SET name_es='Malawi' WHERE iso3='MWI';
UPDATE fra_country SET name_es='Malasia' WHERE iso3='MYS';
UPDATE fra_country SET name_es='Maldivas' WHERE iso3='MDV';
UPDATE fra_country SET name_es='Malí' WHERE iso3='MLI';
UPDATE fra_country SET name_es='Malta' WHERE iso3='MLT';
UPDATE fra_country SET name_es='Islas Marshall' WHERE iso3='MHL';
UPDATE fra_country SET name_es='Martinica' WHERE iso3='MTQ';
UPDATE fra_country SET name_es='Mauritania' WHERE iso3='MRT';
UPDATE fra_country SET name_es='Mauricio' WHERE iso3='MUS';
UPDATE fra_country SET name_es='Mayotte' WHERE iso3='MYT';
UPDATE fra_country SET name_es='México' WHERE iso3='MEX';
UPDATE fra_country SET name_es='Micronesia (Estados Federados de)' WHERE iso3='FSM';
UPDATE fra_country SET name_es='Moldova' WHERE iso3='MDA';
UPDATE fra_country SET name_es='Mónaco' WHERE iso3='MCO';
UPDATE fra_country SET name_es='Mongolia' WHERE iso3='MNG';
UPDATE fra_country SET name_es='Montenegro' WHERE iso3='MNE';
UPDATE fra_country SET name_es='Montserrat' WHERE iso3='MSR';
UPDATE fra_country SET name_es='Marruecos' WHERE iso3='MAR';
UPDATE fra_country SET name_es='Mozambique' WHERE iso3='MOZ';
UPDATE fra_country SET name_es='Myanmar' WHERE iso3='MMR';
UPDATE fra_country SET name_es='Namibia' WHERE iso3='NAM';
UPDATE fra_country SET name_es='Nauru' WHERE iso3='NRU';
UPDATE fra_country SET name_es='Nepal' WHERE iso3='NPL';
UPDATE fra_country SET name_es='Países Bajos' WHERE iso3='NLD';
UPDATE fra_country SET name_es='Antillas Neerlandesas' WHERE iso3='ANT';
UPDATE fra_country SET name_es='Nueva Caledonia' WHERE iso3='NCL';
UPDATE fra_country SET name_es='Nueva Zelandia' WHERE iso3='NZL';
UPDATE fra_country SET name_es='Nicaragua' WHERE iso3='NIC';
UPDATE fra_country SET name_es='Níger' WHERE iso3='NER';
UPDATE fra_country SET name_es='Nigeria' WHERE iso3='NGA';
UPDATE fra_country SET name_es='Niue' WHERE iso3='NIU';
UPDATE fra_country SET name_es='Islas Norfolk' WHERE iso3='NFK';
UPDATE fra_country SET name_es='Islas Marianas Septentrionales' WHERE iso3='MNP';
UPDATE fra_country SET name_es='Noruega' WHERE iso3='NOR';
UPDATE fra_country SET name_es='Territorio Palestino Ocupado' WHERE iso3='PSE';
UPDATE fra_country SET name_es='Omán' WHERE iso3='OMN';
UPDATE fra_country SET name_es='Pakistán' WHERE iso3='PAK';
UPDATE fra_country SET name_es='Palau' WHERE iso3='PLW';
UPDATE fra_country SET name_es='Panamá' WHERE iso3='PAN';
UPDATE fra_country SET name_es='Papua Nueva Guinea' WHERE iso3='PNG';
UPDATE fra_country SET name_es='Paraguay' WHERE iso3='PRY';
UPDATE fra_country SET name_es='Perú' WHERE iso3='PER';
UPDATE fra_country SET name_es='Filipinas' WHERE iso3='PHL';
UPDATE fra_country SET name_es='Pitcairn' WHERE iso3='PCN';
UPDATE fra_country SET name_es='Polonia' WHERE iso3='POL';
UPDATE fra_country SET name_es='Portugal' WHERE iso3='PRT';
UPDATE fra_country SET name_es='Puerto Rico' WHERE iso3='PRI';
UPDATE fra_country SET name_es='Qatar' WHERE iso3='QAT';
UPDATE fra_country SET name_es='República de Corea' WHERE iso3='KOR';
UPDATE fra_country SET name_es='Reunión' WHERE iso3='REU';
UPDATE fra_country SET name_es='Rumania' WHERE iso3='ROU';
UPDATE fra_country SET name_es='Federación de Rusia' WHERE iso3='RUS';
UPDATE fra_country SET name_es='Rwanda' WHERE iso3='RWA';
UPDATE fra_country SET name_es='Saint Barthelemy' WHERE iso3='BLM';
UPDATE fra_country SET name_es='Santa Elena' WHERE iso3='SHN';
UPDATE fra_country SET name_es='Saint Kitts y Nevis' WHERE iso3='KNA';
UPDATE fra_country SET name_es='Santa Lucía' WHERE iso3='LCA';
UPDATE fra_country SET name_es='Saint Martin' WHERE iso3='MAF';
UPDATE fra_country SET name_es='Saint-Pierre y Miquelon' WHERE iso3='SPM';
UPDATE fra_country SET name_es='San Vicente y las Granadinas' WHERE iso3='VCT';
UPDATE fra_country SET name_es='Samoa' WHERE iso3='WSM';
UPDATE fra_country SET name_es='San Marino' WHERE iso3='SMR';
UPDATE fra_country SET name_es='Santo Tomé y Príncipe' WHERE iso3='STP';
UPDATE fra_country SET name_es='Arabia Saudita' WHERE iso3='SAU';
UPDATE fra_country SET name_es='Senegal' WHERE iso3='SEN';
UPDATE fra_country SET name_es='Serbia' WHERE iso3='SRB';
UPDATE fra_country SET name_es='Seychelles' WHERE iso3='SYC';
UPDATE fra_country SET name_es='Sierra Leona' WHERE iso3='SLE';
UPDATE fra_country SET name_es='Singapur' WHERE iso3='SGP';
UPDATE fra_country SET name_es='Eslovaquia' WHERE iso3='SVK';
UPDATE fra_country SET name_es='Eslovenia' WHERE iso3='SVN';
UPDATE fra_country SET name_es='Islas Salomón' WHERE iso3='SLB';
UPDATE fra_country SET name_es='Somalia' WHERE iso3='SOM';
UPDATE fra_country SET name_es='Sudáfrica' WHERE iso3='ZAF';
UPDATE fra_country SET name_es='Sudán del Sur' WHERE iso3='SSD';
UPDATE fra_country SET name_es='España' WHERE iso3='ESP';
UPDATE fra_country SET name_es='Sri Lanka' WHERE iso3='LKA';
UPDATE fra_country SET name_es='Sudán' WHERE iso3='SDN';
UPDATE fra_country SET name_es='Suriname' WHERE iso3='SUR';
UPDATE fra_country SET name_es='Islas Svalbard y Jan Mayen' WHERE iso3='SJM';
UPDATE fra_country SET name_es='Swazilandia' WHERE iso3='SWZ';
UPDATE fra_country SET name_es='Suecia' WHERE iso3='SWE';
UPDATE fra_country SET name_es='Suiza' WHERE iso3='CHE';
UPDATE fra_country SET name_es='República Árabe Siria' WHERE iso3='SYR';
UPDATE fra_country SET name_es='Tayikistán' WHERE iso3='TJK';
UPDATE fra_country SET name_es='Tailandia' WHERE iso3='THA';
UPDATE fra_country SET name_es='ex República Yugoslava de Macedonia' WHERE iso3='MKD';
UPDATE fra_country SET name_es='Timor-Leste' WHERE iso3='TLS';
UPDATE fra_country SET name_es='Togo' WHERE iso3='TGO';
UPDATE fra_country SET name_es='Tokelau' WHERE iso3='TKL';
UPDATE fra_country SET name_es='Tonga' WHERE iso3='TON';
UPDATE fra_country SET name_es='Trinidad y Tabago' WHERE iso3='TTO';
UPDATE fra_country SET name_es='Túnez' WHERE iso3='TUN';
UPDATE fra_country SET name_es='Turquía' WHERE iso3='TUR';
UPDATE fra_country SET name_es='Turkmenistán' WHERE iso3='TKM';
UPDATE fra_country SET name_es='Islas Turcas y Caicos' WHERE iso3='TCA';
UPDATE fra_country SET name_es='Tuvalu' WHERE iso3='TUV';
UPDATE fra_country SET name_es='Uganda' WHERE iso3='UGA';
UPDATE fra_country SET name_es='Ucrania' WHERE iso3='UKR';
UPDATE fra_country SET name_es='Emiratos Árabes Unidos' WHERE iso3='ARE';
UPDATE fra_country SET name_es='Reino Unido' WHERE iso3='GBR';
UPDATE fra_country SET name_es='República Unida de Tanzanía' WHERE iso3='TZA';
UPDATE fra_country SET name_es='Estados Unidos de América' WHERE iso3='USA';
UPDATE fra_country SET name_es='Islas Vírgenes (EE.UU.)' WHERE iso3='VIR';
UPDATE fra_country SET name_es='Uruguay' WHERE iso3='URY';
UPDATE fra_country SET name_es='Uzbekistán' WHERE iso3='UZB';
UPDATE fra_country SET name_es='Vanuatu' WHERE iso3='VUT';
UPDATE fra_country SET name_es='Venezuela (República Bolivariana de)' WHERE iso3='VEN';
UPDATE fra_country SET name_es='Viet Nam' WHERE iso3='VNM';
UPDATE fra_country SET name_es='Islas Wallis y Futuna' WHERE iso3='WLF';
UPDATE fra_country SET name_es='Sahara Occidental' WHERE iso3='ESH';
UPDATE fra_country SET name_es='Yemen' WHERE iso3='YEM';
UPDATE fra_country SET name_es='Zambia' WHERE iso3='ZMB';
UPDATE fra_country SET name_es='Zimbabwe' WHERE iso3='ZWE';

/*Fill the 'name_fr'*/
UPDATE fra_country SET name_fr='Afghanistan' WHERE iso3='AFG';
UPDATE fra_country SET name_fr='Albanie' WHERE iso3='ALB';
UPDATE fra_country SET name_fr='Algérie' WHERE iso3='DZA';
UPDATE fra_country SET name_fr='Samoa américaines' WHERE iso3='ASM';
UPDATE fra_country SET name_fr='Andorre' WHERE iso3='AND';
UPDATE fra_country SET name_fr='Angola' WHERE iso3='AGO';
UPDATE fra_country SET name_fr='Anguilla' WHERE iso3='AIA';
UPDATE fra_country SET name_fr='Antigua-et-Barbuda' WHERE iso3='ATG';
UPDATE fra_country SET name_fr='Argentine' WHERE iso3='ARG';
UPDATE fra_country SET name_fr='Arménie' WHERE iso3='ARM';
UPDATE fra_country SET name_fr='Aruba' WHERE iso3='ABW';
UPDATE fra_country SET name_fr='Australie' WHERE iso3='AUS';
UPDATE fra_country SET name_fr='Autriche' WHERE iso3='AUT';
UPDATE fra_country SET name_fr='Azerbaïdjan' WHERE iso3='AZE';
UPDATE fra_country SET name_fr='Bahamas' WHERE iso3='BHS';
UPDATE fra_country SET name_fr='Bahreïn' WHERE iso3='BHR';
UPDATE fra_country SET name_fr='Bangladesh' WHERE iso3='BGD';
UPDATE fra_country SET name_fr='Barbade' WHERE iso3='BRB';
UPDATE fra_country SET name_fr='Bélarus' WHERE iso3='BLR';
UPDATE fra_country SET name_fr='Belgique' WHERE iso3='BEL';
UPDATE fra_country SET name_fr='Belize' WHERE iso3='BLZ';
UPDATE fra_country SET name_fr='Bénin' WHERE iso3='BEN';
UPDATE fra_country SET name_fr='Bermudes' WHERE iso3='BMU';
UPDATE fra_country SET name_fr='Bhoutan' WHERE iso3='BTN';
UPDATE fra_country SET name_fr='Bolivie' WHERE iso3='BOL';
UPDATE fra_country SET name_fr='Bosnie-Herzégovine' WHERE iso3='BIH';
UPDATE fra_country SET name_fr='Botswana' WHERE iso3='BWA';
UPDATE fra_country SET name_fr='Brésil' WHERE iso3='BRA';
UPDATE fra_country SET name_fr='Îles Vierges britanniques' WHERE iso3='VGB';
UPDATE fra_country SET name_fr='Brunéi Darussalam' WHERE iso3='BRN';
UPDATE fra_country SET name_fr='Bulgarie' WHERE iso3='BGR';
UPDATE fra_country SET name_fr='Burkina Faso' WHERE iso3='BFA';
UPDATE fra_country SET name_fr='Burundi' WHERE iso3='BDI';
UPDATE fra_country SET name_fr='Cambodge' WHERE iso3='KHM';
UPDATE fra_country SET name_fr='Cameroun' WHERE iso3='CMR';
UPDATE fra_country SET name_fr='Canada' WHERE iso3='CAN';
UPDATE fra_country SET name_fr='Cap-Vert' WHERE iso3='CPV';
UPDATE fra_country SET name_fr='Îles Caïmanes' WHERE iso3='CYM';
UPDATE fra_country SET name_fr='République centrafricaine' WHERE iso3='CAF';
UPDATE fra_country SET name_fr='Tchad' WHERE iso3='TCD';
UPDATE fra_country SET name_fr='Chili' WHERE iso3='CHL';
UPDATE fra_country SET name_fr='Chine' WHERE iso3='CHN';
UPDATE fra_country SET name_fr='Colombie' WHERE iso3='COL';
UPDATE fra_country SET name_fr='Comores' WHERE iso3='COM';
UPDATE fra_country SET name_fr='Congo' WHERE iso3='COG';
UPDATE fra_country SET name_fr='Îles Cook' WHERE iso3='COK';
UPDATE fra_country SET name_fr='Costa Rica' WHERE iso3='CRI';
UPDATE fra_country SET name_fr='Côte d''Ivoire' WHERE iso3='CIV';
UPDATE fra_country SET name_fr='Croatie' WHERE iso3='HRV';
UPDATE fra_country SET name_fr='Cuba' WHERE iso3='CUB';
UPDATE fra_country SET name_fr='Chypre' WHERE iso3='CYP';
UPDATE fra_country SET name_fr='République tchèque' WHERE iso3='CZE';
UPDATE fra_country SET name_fr='République populaire démocratique de Corée' WHERE iso3='PRK';
UPDATE fra_country SET name_fr='République démocratique du Congo' WHERE iso3='COD';
UPDATE fra_country SET name_fr='Danemark' WHERE iso3='DNK';
UPDATE fra_country SET name_fr='Djibouti' WHERE iso3='DJI';
UPDATE fra_country SET name_fr='Dominique' WHERE iso3='DMA';
UPDATE fra_country SET name_fr='République dominicaine' WHERE iso3='DOM';
UPDATE fra_country SET name_fr='Équateur' WHERE iso3='ECU';
UPDATE fra_country SET name_fr='Égypte' WHERE iso3='EGY';
UPDATE fra_country SET name_fr='El Salvador' WHERE iso3='SLV';
UPDATE fra_country SET name_fr='Guinée équatoriale' WHERE iso3='GNQ';
UPDATE fra_country SET name_fr='Érythrée' WHERE iso3='ERI';
UPDATE fra_country SET name_fr='Éstonie' WHERE iso3='EST';
UPDATE fra_country SET name_fr='Éthiopie' WHERE iso3='ETH';
UPDATE fra_country SET name_fr='Îles Féroé' WHERE iso3='FRO';
UPDATE fra_country SET name_fr='Îles Falkland (Malvinas)' WHERE iso3='FLK';
UPDATE fra_country SET name_fr='Fidji' WHERE iso3='FJI';
UPDATE fra_country SET name_fr='Finlande' WHERE iso3='FIN';
UPDATE fra_country SET name_fr='France' WHERE iso3='FRA';
UPDATE fra_country SET name_fr='Guyane française' WHERE iso3='GUF';
UPDATE fra_country SET name_fr='Polynésie française' WHERE iso3='PYF';
UPDATE fra_country SET name_fr='Gabon' WHERE iso3='GAB';
UPDATE fra_country SET name_fr='Gambie' WHERE iso3='GMB';
UPDATE fra_country SET name_fr='Géorgie' WHERE iso3='GEO';
UPDATE fra_country SET name_fr='Allemagne' WHERE iso3='DEU';
UPDATE fra_country SET name_fr='Ghana' WHERE iso3='GHA';
UPDATE fra_country SET name_fr='Gibraltar' WHERE iso3='GIB';
UPDATE fra_country SET name_fr='Grèce' WHERE iso3='GRC';
UPDATE fra_country SET name_fr='Groenland' WHERE iso3='GRL';
UPDATE fra_country SET name_fr='Grenade' WHERE iso3='GRD';
UPDATE fra_country SET name_fr='Guadeloupe' WHERE iso3='GLP';
UPDATE fra_country SET name_fr='Guam' WHERE iso3='GUM';
UPDATE fra_country SET name_fr='Guatemala' WHERE iso3='GTM';
UPDATE fra_country SET name_fr='Guernesey' WHERE iso3='GGY';
UPDATE fra_country SET name_fr='Guinée' WHERE iso3='GIN';
UPDATE fra_country SET name_fr='Guinée-Bissau' WHERE iso3='GNB';
UPDATE fra_country SET name_fr='Guyana' WHERE iso3='GUY';
UPDATE fra_country SET name_fr='Haïti' WHERE iso3='HTI';
UPDATE fra_country SET name_fr='Saint-Siège' WHERE iso3='VAT';
UPDATE fra_country SET name_fr='Honduras' WHERE iso3='HND';
UPDATE fra_country SET name_fr='Hongrie' WHERE iso3='HUN';
UPDATE fra_country SET name_fr='Islande' WHERE iso3='ISL';
UPDATE fra_country SET name_fr='Inde' WHERE iso3='IND';
UPDATE fra_country SET name_fr='Indonésie' WHERE iso3='IDN';
UPDATE fra_country SET name_fr='Iran (République islamique d'')' WHERE iso3='IRN';
UPDATE fra_country SET name_fr='Iraq' WHERE iso3='IRQ';
UPDATE fra_country SET name_fr='Irlande' WHERE iso3='IRL';
UPDATE fra_country SET name_fr='Île de Man' WHERE iso3='IMN';
UPDATE fra_country SET name_fr='Israël' WHERE iso3='ISR';
UPDATE fra_country SET name_fr='Italie' WHERE iso3='ITA';
UPDATE fra_country SET name_fr='Jamaïque' WHERE iso3='JAM';
UPDATE fra_country SET name_fr='Japon' WHERE iso3='JPN';
UPDATE fra_country SET name_fr='Jersey' WHERE iso3='JEY';
UPDATE fra_country SET name_fr='Jordanie' WHERE iso3='JOR';
UPDATE fra_country SET name_fr='Kazakhstan' WHERE iso3='KAZ';
UPDATE fra_country SET name_fr='Kenya' WHERE iso3='KEN';
UPDATE fra_country SET name_fr='Kiribati' WHERE iso3='KIR';
UPDATE fra_country SET name_fr='Koweït' WHERE iso3='KWT';
UPDATE fra_country SET name_fr='Kirghizistan' WHERE iso3='KGZ';
UPDATE fra_country SET name_fr='République démocratique populaire lao' WHERE iso3='LAO';
UPDATE fra_country SET name_fr='Lettonie' WHERE iso3='LVA';
UPDATE fra_country SET name_fr='Liban' WHERE iso3='LBN';
UPDATE fra_country SET name_fr='Lesotho' WHERE iso3='LSO';
UPDATE fra_country SET name_fr='Libéria' WHERE iso3='LBR';
UPDATE fra_country SET name_fr='Jamahiriya arabe libyenne' WHERE iso3='LBY';
UPDATE fra_country SET name_fr='Liechtenstein' WHERE iso3='LIE';
UPDATE fra_country SET name_fr='Lituanie' WHERE iso3='LTU';
UPDATE fra_country SET name_fr='Luxembourg' WHERE iso3='LUX';
UPDATE fra_country SET name_fr='Madagascar' WHERE iso3='MDG';
UPDATE fra_country SET name_fr='Malawi' WHERE iso3='MWI';
UPDATE fra_country SET name_fr='Malaisie' WHERE iso3='MYS';
UPDATE fra_country SET name_fr='Maldives' WHERE iso3='MDV';
UPDATE fra_country SET name_fr='Mali' WHERE iso3='MLI';
UPDATE fra_country SET name_fr='Malte' WHERE iso3='MLT';
UPDATE fra_country SET name_fr='Îles Marshall' WHERE iso3='MHL';
UPDATE fra_country SET name_fr='Martinique' WHERE iso3='MTQ';
UPDATE fra_country SET name_fr='Mauritanie' WHERE iso3='MRT';
UPDATE fra_country SET name_fr='Maurice' WHERE iso3='MUS';
UPDATE fra_country SET name_fr='Mayotte' WHERE iso3='MYT';
UPDATE fra_country SET name_fr='Mexique' WHERE iso3='MEX';
UPDATE fra_country SET name_fr='Micronésie (États fédérés de)' WHERE iso3='FSM';
UPDATE fra_country SET name_fr='Moldova' WHERE iso3='MDA';
UPDATE fra_country SET name_fr='Monaco' WHERE iso3='MCO';
UPDATE fra_country SET name_fr='Mongolie' WHERE iso3='MNG';
UPDATE fra_country SET name_fr='Monténégro' WHERE iso3='MNE';
UPDATE fra_country SET name_fr='Montserrat' WHERE iso3='MSR';
UPDATE fra_country SET name_fr='Maroc' WHERE iso3='MAR';
UPDATE fra_country SET name_fr='Mozambique' WHERE iso3='MOZ';
UPDATE fra_country SET name_fr='Myanmar' WHERE iso3='MMR';
UPDATE fra_country SET name_fr='Namibie' WHERE iso3='NAM';
UPDATE fra_country SET name_fr='Nauru' WHERE iso3='NRU';
UPDATE fra_country SET name_fr='Népal' WHERE iso3='NPL';
UPDATE fra_country SET name_fr='Pays-Bas' WHERE iso3='NLD';
UPDATE fra_country SET name_fr='Antilles néerlandaises' WHERE iso3='ANT';
UPDATE fra_country SET name_fr='Nouvelle-Calédonie' WHERE iso3='NCL';
UPDATE fra_country SET name_fr='Nouvelle-Zélande' WHERE iso3='NZL';
UPDATE fra_country SET name_fr='Nicaragua' WHERE iso3='NIC';
UPDATE fra_country SET name_fr='Niger' WHERE iso3='NER';
UPDATE fra_country SET name_fr='Nigéria' WHERE iso3='NGA';
UPDATE fra_country SET name_fr='Nioué' WHERE iso3='NIU';
UPDATE fra_country SET name_fr='Île Norfolk' WHERE iso3='NFK';
UPDATE fra_country SET name_fr='Îles Mariannes septentrionales' WHERE iso3='MNP';
UPDATE fra_country SET name_fr='Norvège' WHERE iso3='NOR';
UPDATE fra_country SET name_fr='Territoire palestinien occupé' WHERE iso3='PSE';
UPDATE fra_country SET name_fr='Oman' WHERE iso3='OMN';
UPDATE fra_country SET name_fr='Pakistan' WHERE iso3='PAK';
UPDATE fra_country SET name_fr='Palaos' WHERE iso3='PLW';
UPDATE fra_country SET name_fr='Panama' WHERE iso3='PAN';
UPDATE fra_country SET name_fr='Papouasie-Nouvelle-Guinée' WHERE iso3='PNG';
UPDATE fra_country SET name_fr='Paraguay' WHERE iso3='PRY';
UPDATE fra_country SET name_fr='Pérou' WHERE iso3='PER';
UPDATE fra_country SET name_fr='Philippines' WHERE iso3='PHL';
UPDATE fra_country SET name_fr='Pitcairn' WHERE iso3='PCN';
UPDATE fra_country SET name_fr='Pologne' WHERE iso3='POL';
UPDATE fra_country SET name_fr='Portugal' WHERE iso3='PRT';
UPDATE fra_country SET name_fr='Porto Rico' WHERE iso3='PRI';
UPDATE fra_country SET name_fr='Qatar' WHERE iso3='QAT';
UPDATE fra_country SET name_fr='République de Corée' WHERE iso3='KOR';
UPDATE fra_country SET name_fr='Réunion' WHERE iso3='REU';
UPDATE fra_country SET name_fr='Roumanie' WHERE iso3='ROU';
UPDATE fra_country SET name_fr='Fédération de Russie' WHERE iso3='RUS';
UPDATE fra_country SET name_fr='Rwanda' WHERE iso3='RWA';
UPDATE fra_country SET name_fr='Saint-Barthélemy' WHERE iso3='BLM';
UPDATE fra_country SET name_fr='Sainte-Hélène' WHERE iso3='SHN';
UPDATE fra_country SET name_fr='Saint-Kitts-et-Nevis' WHERE iso3='KNA';
UPDATE fra_country SET name_fr='Sainte-Lucie' WHERE iso3='LCA';
UPDATE fra_country SET name_fr='Saint-Martin' WHERE iso3='MAF';
UPDATE fra_country SET name_fr='Saint-Pierre-et-Miquelon' WHERE iso3='SPM';
UPDATE fra_country SET name_fr='Saint-Vincent-et-les Grenadines' WHERE iso3='VCT';
UPDATE fra_country SET name_fr='Samoa' WHERE iso3='WSM';
UPDATE fra_country SET name_fr='Saint-Marin' WHERE iso3='SMR';
UPDATE fra_country SET name_fr='Sao Tomé-et-Principe' WHERE iso3='STP';
UPDATE fra_country SET name_fr='Arabie saoudite' WHERE iso3='SAU';
UPDATE fra_country SET name_fr='Sénégal' WHERE iso3='SEN';
UPDATE fra_country SET name_fr='Serbie' WHERE iso3='SRB';
UPDATE fra_country SET name_fr='Seychelles' WHERE iso3='SYC';
UPDATE fra_country SET name_fr='Sierra Leone' WHERE iso3='SLE';
UPDATE fra_country SET name_fr='Singapour' WHERE iso3='SGP';
UPDATE fra_country SET name_fr='Slovaquie' WHERE iso3='SVK';
UPDATE fra_country SET name_fr='Slovénie' WHERE iso3='SVN';
UPDATE fra_country SET name_fr='Îles Salomon' WHERE iso3='SLB';
UPDATE fra_country SET name_fr='Somalie' WHERE iso3='SOM';
UPDATE fra_country SET name_fr='Afrique du Sud' WHERE iso3='ZAF';
UPDATE fra_country SET name_fr='Soudan du Sud' WHERE iso3='SSD';
UPDATE fra_country SET name_fr='Espagne' WHERE iso3='ESP';
UPDATE fra_country SET name_fr='Sri Lanka' WHERE iso3='LKA';
UPDATE fra_country SET name_fr='Soudan' WHERE iso3='SDN';
UPDATE fra_country SET name_fr='Suriname' WHERE iso3='SUR';
UPDATE fra_country SET name_fr='Îles Svalbard et Jan Mayen' WHERE iso3='SJM';
UPDATE fra_country SET name_fr='Swaziland' WHERE iso3='SWZ';
UPDATE fra_country SET name_fr='Suède' WHERE iso3='SWE';
UPDATE fra_country SET name_fr='Suisse' WHERE iso3='CHE';
UPDATE fra_country SET name_fr='République arabe syrienne' WHERE iso3='SYR';
UPDATE fra_country SET name_fr='Tadjikistan' WHERE iso3='TJK';
UPDATE fra_country SET name_fr='Thaïlande' WHERE iso3='THA';
UPDATE fra_country SET name_fr='Ex-République yougoslave de Macédoine' WHERE iso3='MKD';
UPDATE fra_country SET name_fr='Timor-Leste' WHERE iso3='TLS';
UPDATE fra_country SET name_fr='Togo' WHERE iso3='TGO';
UPDATE fra_country SET name_fr='Tokélaou' WHERE iso3='TKL';
UPDATE fra_country SET name_fr='Tonga' WHERE iso3='TON';
UPDATE fra_country SET name_fr='Trinité-et-Tobago' WHERE iso3='TTO';
UPDATE fra_country SET name_fr='Tunisie' WHERE iso3='TUN';
UPDATE fra_country SET name_fr='Turquie' WHERE iso3='TUR';
UPDATE fra_country SET name_fr='Turkménistan' WHERE iso3='TKM';
UPDATE fra_country SET name_fr='Îles Turques et Caïques' WHERE iso3='TCA';
UPDATE fra_country SET name_fr='Tuvalu' WHERE iso3='TUV';
UPDATE fra_country SET name_fr='Ouganda' WHERE iso3='UGA';
UPDATE fra_country SET name_fr='Ukraine' WHERE iso3='UKR';
UPDATE fra_country SET name_fr='Émirats arabes unis' WHERE iso3='ARE';
UPDATE fra_country SET name_fr='Royaume-Uni' WHERE iso3='GBR';
UPDATE fra_country SET name_fr='République-Unie de Tanzanie' WHERE iso3='TZA';
UPDATE fra_country SET name_fr='États-Unis d''Amérique' WHERE iso3='USA';
UPDATE fra_country SET name_fr='Îles Vierges américaines' WHERE iso3='VIR';
UPDATE fra_country SET name_fr='Uruguay' WHERE iso3='URY';
UPDATE fra_country SET name_fr='Ouzbékistan' WHERE iso3='UZB';
UPDATE fra_country SET name_fr='Vanuatu' WHERE iso3='VUT';
UPDATE fra_country SET name_fr='Venezuela (République bolivarienne du)' WHERE iso3='VEN';
UPDATE fra_country SET name_fr='Viet Nam' WHERE iso3='VNM';
UPDATE fra_country SET name_fr='Îles Wallis et Futuna' WHERE iso3='WLF';
UPDATE fra_country SET name_fr='Sahara occidental' WHERE iso3='ESH';
UPDATE fra_country SET name_fr='Yémen' WHERE iso3='YEM';
UPDATE fra_country SET name_fr='Zambie' WHERE iso3='ZMB';
UPDATE fra_country SET name_fr='Zimbabwe' WHERE iso3='ZWE';

/*Fill the 'name_en'*/
Update fra_country SET name_en=name;

/*Make NOT NULL newly created locale attributes*/
ALTER TABLE fra_country ALTER COLUMN name_en SET NOT NULL;
ALTER TABLE fra_country ALTER COLUMN name_es SET NOT NULL;
ALTER TABLE fra_country ALTER COLUMN name_fr SET NOT NULL;

-- https://github.com/geosolutions-it/fra2015/issues/326

ALTER TABLE fra_status RENAME COLUMN previoussurveyreview TO previouspendingfix;
