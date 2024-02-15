-- Seuraavat vaiheet myyntitapahtumaan asti demonstroivat kuinka lisäsin itse tietoa tietokantaan.
-- Scriptit voi suorittaa sellaisenaan järjestyksessä. Jokaisen kohdan alla on SELECT-scripti, jolla voi tarkastaa tiedon menneen perille.

-- Toimipisteen lisääminen tietokantaan
USE autokauppa;
INSERT INTO toimipiste (nimi, osoite)
VALUES ("Jannen Auto Kerava", "Seppolantie 420, 04200 Kerava");

SELECT * FROM toimipiste
ORDER BY toimipiste_id desc;

-- Uuden auton lisääminen auto-tauluun
USE autokauppa;
INSERT INTO auto (merkki, malli, vuosimalli, kilometrit, reknro, huoltotarve, hinta, toimipiste_id)
VALUES ("Citroen", "C3", 2020, 42000, "SAN-619", "Huollettu 29.4.2023", 14000, 4);

SELECT * FROM auto
ORDER BY auto_id desc;

-- Myyjän lisääminen tietokantaan
USE autokauppa;
INSERT INTO myyja (nimi, puhelinnumero, sahkoposti, toimipiste_id)
VALUES ("Sami Taalasmaa", "050 420 6969", "sami.taalasmaa@jannenauto.fi", 4);

SELECT * FROM myyja
ORDER BY myyja_id desc;

-- Uuden asiakkaan lisääminen
USE autokauppa;
INSERT INTO asiakas (nimi, puhelinnumero, sahkoposti)
VALUES ("Wilhelm Sigma", "050 549 4114", "wilhelm.sigma@mail.com");

SELECT * FROM asiakas
ORDER BY asiakas_id desc;

-- Ostotapahtuman lisääminen
USE autokauppa;
INSERT INTO ostotapahtumat (auto_id, ostohinta, ostopvm)
VALUES (11, 11900, "1.2.2023");

SELECT * FROM ostotapahtumat
ORDER BY ostotapahtumat_id desc;

-- Myyntitapahtuman lisääminen
USE autokauppa;
INSERT INTO myyntitapahtumat (auto_id, myyja_id, asiakas_id, myyntihinta, myyntipvm)
VALUES (11, 10, 11, 15500, "15.5.2023");

SELECT * FROM myyntitapahtumat
ORDER BY myyntitapahtumat_id desc;

--------------------------------------------

-- Myyjän nettomyynti, provisiopalkka
SELECT
myyja.myyja_id,
myyja.nimi,
IFNULL(SUM(myyntihinta),0) AS "Nettomyynnit",
SUM(myyntihinta - ostohinta) AS "Myyntivoitto",
SUM((myyntihinta - ostohinta) * 0.09) AS "Provisio"
FROM autokauppa.myyntitapahtumat
RIGHT JOIN myyja ON myyntitapahtumat.myyja_id = myyja.myyja_id
INNER JOIN ostotapahtumat ON myyntitapahtumat.auto_id = ostotapahtumat.auto_id
GROUP BY myyja.myyja_id
ORDER BY myyja.myyja_id;


-- Liikevoiton laskeminen
SELECT
myyntitapahtumat_id,
ostohinta,
myyntihinta,
myyntihinta - ostohinta AS "Liikevoitto €",
myyntitapahtumat.auto_id,
CONCAT(auto.merkki," ", auto.malli," ", auto.vuosimalli," ", auto.reknro) AS "Auto", 
myyja.myyja_id,
myyja.nimi AS "Myyjän nimi"
FROM autokauppa.myyntitapahtumat
INNER JOIN ostotapahtumat ON myyntitapahtumat.auto_id = ostotapahtumat.auto_id
INNER JOIN myyja ON myyntitapahtumat.myyja_id = myyja.myyja_id
INNER JOIN auto ON myyntitapahtumat.auto_id = auto.auto_id;


-- Koko autokaupan myynti
SELECT
SUM(myyntihinta) AS "Kokonaismyynti €",
SUM(myyntihinta - ostohinta) AS "Myyntivoitto €"
FROM autokauppa.myyntitapahtumat
INNER JOIN ostotapahtumat ON myyntitapahtumat.auto_id = ostotapahtumat.auto_id;


-- Autokauppojen myynti eriteltynä
SELECT
toimipiste.nimi AS "Autokauppa",
SUM(myyntihinta) AS "Myynti €",
SUM(myyntihinta - ostohinta) AS "Myyntivoitto €"
FROM autokauppa.myyntitapahtumat
INNER JOIN ostotapahtumat ON myyntitapahtumat.auto_id = ostotapahtumat.auto_id
INNER JOIN auto ON myyntitapahtumat.auto_id = auto.auto_id
INNER JOIN toimipiste ON auto.toimipiste_id = toimipiste.toimipiste_id
GROUP BY toimipiste.nimi;