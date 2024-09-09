SELECT kategorie, SUM(gesamtbetrag)
FROM produkte
JOIN bestellungen ON produkte.produkt_id = bestellpositionen.produkt_id
JOIN bestellpositionen ON bestellpositionen.bestell_id = bestellungen.bestell_id
WHERE YEAR(bestellungen.bestelldatum) = 2023
GROUP BY kategorie;
