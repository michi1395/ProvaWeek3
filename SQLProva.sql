--1.	Scrivere una query che restituisca i titoli degli album di Franco Battiato

SELECT 
b.Nome AS [Band]
,a.Titolo AS [Titolo Album]
,a.CasaDiscografica AS [Casa Discografica]
,a.Genere
,a.AnnoUscita
FROM Album a
inner join Band b
on b.ID=a.BandID
where b.Nome='Franco Battiato'

--2.	Selezionare tutti gli album editi dalla casa editrice nell’anno specificato; 

SELECT
*
FROM Album a
where a.CasaDiscografica='Island Records' and a.AnnoUscita=1980

--3.	Scrivere una query che restituisca tutti i titoli delle canzoni dei U2 appartenenti ad album pubblicati prima del 1990; 

SELECT
b.Nome AS [Band]
, br.Titolo AS [Titolo Canzone]
, a.Titolo AS [Album]
, a.AnnoUscita AS [Anno di uscita]
, a.Genere
FROM Band b
inner join Album a
on b.ID=a.BandID
inner join BranoAlbum ba
on a.ID=ba.IDAlbum
inner join Brano br
on ba.IDBrano=br.ID
where b.Nome='U2' and a.AnnoUscita<1990

--4.	Individuare tutti gli album in cui è contenuta la canzone “Imagine”; 

SELECT 
b.Titolo AS [Brano]
,b.Durata AS [Durata]
,a.Titolo AS [Album]
,a.AnnoUscita AS [Anno Uscita]

FROM Brano b
inner join BranoAlbum ba
on b.ID=ba.IDBrano
inner join Album a
on ba.IDAlbum=a.ID
where b.Titolo='Imagine'

-- 5.	Restituire il numero totale di canzoni eseguite dai Pooh;
SELECT
count(distinct br.Titolo) AS [Numero brani]
FROM Band b
inner join Album a
on b.ID=a.BandID
inner join BranoAlbum ba
on a.ID=ba.IDAlbum
inner join Brano br
on ba.IDBrano=br.ID
where b.Nome='Pooh'
group by b.Nome



--6.	Contare per ogni album, la somma dei minuti dei brani contenuti 

SELECT
a.Titolo AS [Album]
,sum(br.Durata) as [Totale minuti] --problemi con la durata..ho un time
FROM Album a
inner join BranoAlbum ba
on a.ID=ba.IDAlbum
inner join Brano br
on ba.IDBrano=br.ID
group by a.Titolo


--Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso. 
CREATE VIEW AlbumDati AS
SELECT
	B.Nome AS [Band]
	, a.Titolo AS [Titolo Album]
	, a.AnnoUscita AS [Anno di uscita]
	, a.CasaDiscografica AS [Casa discografica]
	,a.Genere AS [Genere]
	, a.Distribuzione AS [Distribuzione]
	,br.Titolo AS [Titolo Brano]
	,br.Durata AS [Durata]
	FROM Band b
	inner join Album a
	on b.ID=a.BandID
	inner join BranoAlbum ba
	on a.ID=ba.IDAlbum
	inner join Brano br
	on ba.IDBrano=br.ID

-- Richiamo funzione
SELECT *
FROM dbo.ufnGenereMusicale ('Pop')

--Stored Procedure

EXEC sp_CercaCanzone @Titolo='Imagine'


