SELECT k.Name, COUNT(b.Bestellnummer) AS Anzahl_Bestellungen
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.KundenID
WHERE YEAR(b.Bestelldatum) = 2023
GROUP BY k.Name
ORDER BY Anzahl_Bestellungen DESC;
