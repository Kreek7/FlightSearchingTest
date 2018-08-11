--- Tworzenie bazy danych ---
USE master
GO
IF DB_ID('Hotel_pod_lipami') IS NULL
CREATE DATABASE Hotel_pod_lipami
GO
USE Hotel_pod_lipami
GO
--- Usuwanie tabel ----
IF OBJECT_ID('Rabaty', 'U') IS NOT NULL
DROP TABLE Rabaty
IF OBJECT_ID('Rezerwacje', 'U') IS NOT NULL
DROP TABLE Rezerwacje
IF OBJECT_ID('Uslugi', 'U') IS NOT NULL
DROP TABLE Uslugi
IF OBJECT_ID('sposob_platnosci', 'U') IS NOT NULL
DROP TABLE sposob_platnosci
IF OBJECT_ID('Pokoje', 'U') IS NOT NULL
DROP TABLE Pokoje
IF OBJECT_ID('Goscie', 'U') IS NOT NULL
DROP TABLE Goscie
GO


CREATE TABLE Goscie

(
	ID INT CONSTRAINT PK_Gosc PRIMARY KEY,
	Imie VARCHAR(250) NOT NULL,
	Nazwisko VARCHAR(250) NOT NULL,
	Pesel CHAR(11) NOT NULL,
	Telefon INT NOT NULL,
	
)




CREATE TABLE Pokoje

(
	nr_pokoju INT CONSTRAINT PK_Pokoj PRIMARY KEY,
	dla_ilu_osob INT NOT NULL,
	cena INT NOT NULL
	



)


CREATE TABLE sposob_platnosci

(
	ID INT CONSTRAINT PK_platnosc PRIMARY KEY,
	sposob_platnosci VARCHAR(250) NOT NULL
	
	




)




CREATE TABLE USLUGI
(
 	id_uslugi INT CONSTRAINT PK_Usluga PRIMARY KEY,
	cena FLOAT NOT NULL,
	nazwa_uslugi VARCHAR (250) NOT NULL



)

CREATE TABLE Rezerwacje

(
	ID INT CONSTRAINT PK_Rezerwacja PRIMARY KEY,
	id_goscia INT CONSTRAINT FK_Gosc REFERENCES Goscie(ID),
	nr_pokoju INT CONSTRAINT FK_Pokoj REFERENCES Pokoje(nr_pokoju),
	sposob_platnosci int CONSTRAINT FK_platnosc REFERENCES sposob_platnosci(ID),
	id_uslugi INT CONSTRAINT FK_Usluga REFERENCES Uslugi(id_uslugi),
	data_od DATE NOT NULL,
	data_do DATE NOT NULL,
	ilosc_dni INT NOT NULL,
	
   


)

CREATE TABLE RABATY
(
	nr_rabatu INT CONSTRAINT PK_Rabat PRIMARY KEY,
	nr_rezerwacji INT CONSTRAINT FK_Rezerwacja REFERENCES Rezerwacje(ID),
	wysokosc_rabatu NUMERIC (3,2)


)


--- Wpisywanie danych do tabeli ---
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (1,'Szymon','Gawrysiak', 95112700656, 726437390)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (2,'Damian','Kostrzewa', 92112345846, 512754890)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (3,'Justyna','Stachowiak', 77102435560, 812413390)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (4,'Dariusz','Ma³ecki', 86111019220, 630430625)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (5,'Genofewa','Bury', 45112824132, 522633777)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (6,'Adam','Stasiak', 95102927661, 512390888)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (7,'Milena','Wolska', 88091388763, 883645915)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (8,'Stanis³aw','Kotys', 55091012348, 513410887)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (9,'Daniel','Maækowiak', 82103089456, 622484312)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (10,'Sebastian','Kuciñski', 90101785330, 667889455)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (11,'Sylwia','Wieczorek', 67052867555, 665482900)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (12,'Marek','Kajetañczyk', 72110130874, 601655874)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (13,'Aleksandra','Ziomkowska', 94201038654, 887665443)
INSERT INTO Goscie(ID,Imie,Nazwisko, Pesel, Telefon ) VALUES (14,'Pawe³','Domeracki', 8505143220, 638876495)

INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (200, 3,300)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (201, 1,150)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (202, 2,250)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (203, 4,400)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (204, 3,280)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (205, 2,220)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (206, 4,320)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (207, 1,200)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (208, 1,170)
INSERT INTO Pokoje(nr_pokoju, dla_ilu_osob,cena ) VALUES (209, 2,300)


INSERT INTO sposob_platnosci(ID,sposob_platnosci) VALUES (1,'Gotówka')
INSERT INTO sposob_platnosci(ID,sposob_platnosci) VALUES (2,'BLIK')
INSERT INTO sposob_platnosci(ID,sposob_platnosci) VALUES (3,'Bony podarunkowe')
INSERT INTO sposob_platnosci(ID,sposob_platnosci) VALUES (4,'Przedp³ata na konto bankowe')
INSERT INTO sposob_platnosci(ID,sposob_platnosci) VALUES (5,'Karta p³atnicza')


INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (1,15,'Dostep do internetu')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (2,10,'Przechowywanie baga¿y')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (3,70,'Garaz')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (4,30,'Przechowywanie w pokoju zwierzat')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (5,120,'Sala konferencyjna')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (6,30,'Sniadanie')
INSERT INTO USLUGI(id_uslugi,cena,nazwa_uslugi ) VALUES (7,5,'Dostep do telefonu')





INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (2,3,200,1,6,'20180317','20180320',4)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (3,5,204,2,5,'20180401','20180402',2)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (4,6,202,5,7,'20180323','20180331',9)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (5,10,208,3,null,'20180324','20180324',1)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (6,2,207,1,3,'20180501','20180505',5)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (7,3,206,4,2,'20180520','20180522',2)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (8,3,202,5,null,'20180317','20180319',3)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (9,3,202,3,3,'20180331','20180401',2)
INSERT INTO Rezerwacje(ID,id_goscia,nr_pokoju,sposob_platnosci,id_uslugi,data_od,data_do,ilosc_dni) VALUES (10,2,200,1,6,'20180317','20180320',4)

INSERT INTO RABATY(nr_rabatu, nr_rezerwacji , wysokosc_rabatu ) VALUES (100330,3,2.00)
INSERT INTO RABATY(nr_rabatu, nr_rezerwacji , wysokosc_rabatu ) VALUES (150897,5,9.50)
INSERT INTO RABATY(nr_rabatu, nr_rezerwacji , wysokosc_rabatu ) VALUES (230433,6,7.50)
INSERT INTO RABATY(nr_rabatu, nr_rezerwacji , wysokosc_rabatu ) VALUES (340851,9,3.50)
INSERT INTO RABATY(nr_rabatu, nr_rezerwacji , wysokosc_rabatu ) VALUES (575996,7,8.40)


GO
-- Tworzenie raportów
IF OBJECT_ID('Odwiedzane_pokoje', 'V') IS NOT NULL
DROP VIEW Odwiedzane_pokoje
GO
CREATE VIEW Odwiedzane_pokoje AS 
(
	SELECT nr_pokoju, count(nr_pokoju) as 'rezerwacja' from Rezerwacje group by nr_pokoju
)

GO
IF OBJECT_ID('Rabaty_widok', 'V') IS NOT NULL
DROP VIEW Rabaty_widok
GO
CREATE VIEW Rabaty_widok AS 
(
	select ilosc_dni, wysokosc_rabatu  from Rezerwacje inner join RABATY  on RABATY.nr_rezerwacji = Rezerwacje.ID
)

GO

IF OBJECT_ID('Pierwsza_wizyta', 'V') IS NOT NULL
DROP VIEW Pierwsza_wizyta
GO
CREATE VIEW Pierwsza_wizyta AS 
(
	select min(a.data_od) as 'pierwsza_wizyta', a.id_goscia from Rezerwacje a inner join Rezerwacje b on b.id_goscia = a.id_goscia group by a.data_od, a.id_goscia 
)

GO


IF OBJECT_ID('Rezerwacja_per_sposob_platnosci', 'P') IS NOT NULL
DROP PROCEDURE Rezerwacja_per_sposob_platnosci
GO
CREATE PROCEDURE Rezerwacja_per_sposob_platnosci(@platnosc INT) AS (
	SELECT * FROM Rezerwacje
	WHERE sposob_platnosci = @platnosc
)


GO
IF OBJECT_ID('usluga_per_data', 'P') IS NOT NULL
DROP PROCEDURE usluga_per_data
GO
CREATE PROCEDURE usluga_per_data (@Data DATE, @iduslugi INT) AS (
	SELECT U.data_od as 'Data_rezerwacji:' FROM Rezerwacje U
	JOIN Uslugi G on U.id_uslugi = G.id_uslugi
	WHERE data_od >= @Data and @iduslugi=G.id_uslugi
)

GO

SELECT * FROM Odwiedzane_pokoje
SELECT * FROM Rabaty_widok
SELECT * FROM Pierwsza_wizyta

exec Rezerwacja_per_sposob_platnosci 5 
exec usluga_per_data '2018-03-17', 5

