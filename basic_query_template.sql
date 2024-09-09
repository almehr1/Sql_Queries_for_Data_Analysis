SELECT kunden.name AS kundenname, AVG(bestellungen.stückzahl * bestellungen.preis) AS durchschnittliche_bestellsumme
FROM bestellungen
INNER JOIN kunden ON bestellungen.kunde_id = kunden.kunden_id
GROUP BY kunden.name;
