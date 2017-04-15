-- Recuperation de tous les champs du fichiers csv

voitures = LOAD 'hdfs://localhost:9000/liondata/mars-2014-complete.csv' USING PigStorage(';')
as
(
	marque: chararray, model_dossier: chararray, model_commercial: chararray, designation_commercia: chararray, cnit: chararray, 
	tvv: chararray, type_carburant: chararray, hybrid: chararray, puissance_administrative: int, puissance_maximal: float,
	type_boite: chararray, consomation_urbaine: float, e: float, conso_extra_urbaine: float, conso_mixte: float, 
	co2: int, co_typ_1: float, hc: float, nox: float, hcnox: float, ptcl: float, masse_ordre_marche_mini: int, masse_orda_max: int, 
	champsv9: chararray, date_maj: chararray, carrosserie: chararray, gamme: chararray
);

-- Trie des elements qui nous interessent

voitures = FOREACH voitures GENERATE 
	marque, model_dossier, model_commercial, designation_commercia, type_carburant, hybrid, puissance_administrative, puissance_maximal,
	consomation_urbaine, conso_mixte, conso_extra_urbaine, co2, masse_ordre_marche_mini, carrosserie, gamme
;

-- Stockage du résultat dans un fichier Qui serra réutiliser plus tard

-- STORE voitures INTO 'hdfs://localhost:9000/lionoutput/liste_voitures.txt’ using PigStorage(';');

dump voitures;
