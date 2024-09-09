SELECT k.kunden_name, k.email, SUM(b.bestellsumme) AS gesamtumsatz
FROM kunden k
JOIN bestellungen b ON k.kunden_id = b.kunden_id
WHERE b.bestelldatum >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY k.kunden_name, k.email;
