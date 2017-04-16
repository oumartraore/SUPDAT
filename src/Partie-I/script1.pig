voitures = LOAD 'mars-2014-complete.csv' USING PigStorage(';')
as
(
	marque: chararray, model_dossier: chararray, model_commercial: chararray, designation_commercial: chararray, cnit: chararray, 
	tvv: chararray, type_carburant: chararray, hybrid: chararray, puissance_administrative: int, puissance_maximal: float,
	boite_rapport: chararray, consomation_urbaine: float, e: float, conso_extra_urbaine: float, conso_mixte: float, 
	co2: int, co_typ_1: float, hc: float, nox: float, hcnox: float, ptcl: float, masse_ordre_marche_mini: float, masse_orda_max: int, 
	champsv9: chararray, date_maj: chararray, carrosserie: chararray, gamme: chararray
);

r = rank voitures;

n = filter r by ($0 > 1);

-- Trie des elements qui nous interessent

voitures_liste = FOREACH n GENERATE 
	marque, model_dossier, model_commercial, designation_commercial, type_carburant, hybrid, puissance_administrative, puissance_maximal,
	boite_rapport, consomation_urbaine, conso_mixte, conso_extra_urbaine, co2, masse_ordre_marche_mini, carrosserie, gamme
;

-- Stockage du résultat dans un fichier Qui serra réutiliser plus tard

STORE voitures_liste INTO 'liste_voitures' USING PigStorage(';');