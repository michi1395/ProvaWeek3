--Band
CREATE TABLE Band (
	ID int IDENTITY (1,1) NOT NULL,
	Nome nvarchar(100) NOT NULL,
	NComponenti int NOT NULL,
	CONSTRAINT PK_Band PRIMARY KEY (ID)
)

--Album
CREATE TABLE Album (
	ID int IDENTITY (1,1) NOT NULL,
	Titolo nvarchar(100) NOT NULL,
	AnnoUscita int NOT NULL,
	CasaDiscografica nvarchar(100) NOT NULL,
	Genere nvarchar(50) NOT NULL,
	Distribuzione nvarchar(50) NOT NULL,
	BandID int NOT NULL,
	CONSTRAINT PK_Album PRIMARY KEY (ID),
	CONSTRAINT FK_Album_Band FOREIGN KEY (BandID) REFERENCES Band(ID),
	CONSTRAINT CK_Genere CHECK (Genere IN ('Classico','Jazz','Pop','Rock','Metal')),
	CONSTRAINT CK_Distribuzione CHECK (Distribuzione IN ('CD','Vinile','Streaming'))
)

--Brano
CREATE TABLE Brano (
	ID int IDENTITY (1,1) NOT NULL,
	Titolo nvarchar(100) NOT NULL,
	Durata time NOT NULL,
	AlbumID int NOT NULL,
	CONSTRAINT PK_Brano PRIMARY KEY (ID),
	CONSTRAINT FK_Brano_Album FOREIGN KEY (AlbumID) REFERENCES Album(ID),
)

--BranoAlbum
CREATE TABLE BranoAlbum (
	IDBrano int NOT NULL,
	IDAlbum int NOT NULL,
	CONSTRAINT PK_AlbumBrano PRIMARY KEY (IDBrano,IDAlbum),
	CONSTRAINT FK_IDAlbum_Album FOREIGN KEY (IDAlbum) REFERENCES Album(ID),
	CONSTRAINT FK_IDBrano_Brano FOREIGN KEY (IDBrano) REFERENCES Brano(ID),
)