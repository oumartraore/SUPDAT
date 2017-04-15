voitures = LOAD 'hdfs://localhost:9000/liondata/mars-2014-complete.csv' USING PigStorage(';')
as
(
	marque:chararray
);

voitures_marques = FOREACH voitures GENERATE 
	marque
;

-- STORE voitures_marques INTO 'hdfs://localhost:9000/lionoutput/liste_voitures.txt';
STORE voitures_marques INTO '/vagrant/liste_voitures.txt';

dump voitures_marques;


