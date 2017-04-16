voitures = LOAD 'liste_voiture/part-m-00000' USING PigStorage(';')
as
(
	marque: chararray, model_dossier: chararray, model_commercial: chararray, designation_commercial: chararray, type_carburant: chararray, hybrid: chararray, puissance_administrative: float, puissance_maximal: float, type_boite_nb_rapp: chararray, consomation_urbaine: float, conso_mixte: float, conso_extra_urbaine: float, co2: int, masse_ordre_marche_mini: float, carrosserie: chararray, gamme: chararray
);

-- Trie des elements qui nous interessent
-- Lire à partir de la 2ème ligne

voitures = FOREACH voitures GENERATE 
	designation_commercial, type_boite_nb_rapp, (masse_ordre_marche_mini / (puissance_maximal * 1,35)) as model_force
;

-- Stockage du résultat dans un fichier Qui serra réutiliser plus tard

STORE voitures INTO 'liste_voiture_force' USING PigStorage(';');