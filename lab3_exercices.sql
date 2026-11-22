-- base de donnees: bibliotheque :
USE bibliotheque;
-- 1 Ouvrages récents : DONT LE ROLE EST DE RECUPERER LES OUVRAGE EN LES LIMIT DANS LES 3 RECENTS
SELECT * 
FROM ouvrage 
ORDER BY id DESC LIMIT 3;
-- 2 Auteurs à nom long: telle que l'affichage des auteurs dont le nom contient au moins cinq caractères
SELECT * 
FROM auteur 
WHERE CHAR_LENGTH(nom) >= 5;
-- 3 Abonnés hors domaine:affichage de abonne dont leur email ne terminent ni par '%@example.com' ni par '%@test.org
SELECT nom, email 
FROM abonne 
WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';
-- 4 Emprunts en retard:sélectionnez les emprunts dont la date de fin prévue est inferieur à currentdate et dont date_retour_effective est NULL
SELECT * 
FROM emprunt 
WHERE date_fin_prevue < '2026-11-22' AND date_retour_effective IS NULL;
-- 5 Statistiques par auteur : pour chaque auteur, indiquez le nombre total d'ouvrages et le nombre d'ouvrages disponibles
SELECT a.id, a.nom, COUNT(o.id) 
AS total_ouvrages, SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles 
FROM auteur a JOIN ouvrage o ON a.id = o.auteur_id GROUP BY a.id, a.nom;