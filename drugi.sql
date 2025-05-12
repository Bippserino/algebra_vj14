CREATE TABLE proizvod(
	idProizvoda INT IDENTITY(1,1) PRIMARY KEY,
	nazivProizvoda NVARCHAR(100),
	kolicina INT,
	popustNaProizvod DECIMAL(3,2)
);

CREATE TABLE kupac(
	idKupca INT IDENTITY(1,1) PRIMARY KEY,
	nazivKupca NVARCHAR(100),
	imeKupca NVARCHAR(100),
	prezimeKupca NVARCHAR(100),
	telefonKupca NVARCHAR(20),
);

CREATE TABLE prodavac(
	idProdavaca INT IDENTITY(1,1) PRIMARY KEY,
	imeProdavaca NVARCHAR(100),
	prezimeProdavaca NVARCHAR(100)
);

CREATE TABLE racun (
	idRacuna INT IDENTITY(1,1) PRIMARY KEY,
	idProdavaca INT CONSTRAINT FK_racun1 FOREIGN KEY (idProdavaca) REFERENCES prodavac(idProdavaca),
	idKupca INT CONSTRAINT FK_racun2 FOREIGN KEY (idKupca) REFERENCES kupac(idKupca),
	vrijemeKupnje DATETIME,
	popustNaRacun DECIMAL(3,2)
);

CREATE TABLE stavkaRacuna(
	idStavke INT IDENTITY(1,1) PRIMARY KEY,
	idRacuna INT CONSTRAINT FK_stavkaRacuna1 FOREIGN KEY (idRacuna) REFERENCES racun(idRacuna),
	idProizvoda INT CONSTRAINT FK_stavkaRacuna2 FOREIGN KEY (idProizvoda) REFERENCES proizvod(idProizvoda),
	kolicina INT,
	cijenaStavke DECIMAL(10,2),
);