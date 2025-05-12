CREATE TABLE vlasnik (
    idVlasnik INT IDENTITY(1,1) PRIMARY KEY,
    nazivVlasnika NVARCHAR(100),
    adresaVlasnika NVARCHAR(200)
);

CREATE TABLE marka (
	idMarke INT IDENTITY(1,1) PRIMARY KEY,
	nazivMarke NVARCHAR(100),
	modelMarke NVARCHAR(100)
);


CREATE TABLE vozilo (
    idVozilo INT IDENTITY(1,1) PRIMARY KEY,
    nazivVozila NVARCHAR(100),
    idMarke INT CONSTRAINT FK_vozilo1 FOREIGN KEY (idMarke) REFERENCES marka(idMarke),
    serijskiBrojVozila NVARCHAR(50),
    idVlasnik INT CONSTRAINT FK_vozilo2 FOREIGN KEY (idVlasnik) REFERENCES vlasnik(idVlasnik),
);


CREATE TABLE serviser (
    idServiser INT IDENTITY(1,1) PRIMARY KEY,
    nazivServisera NVARCHAR(100)
);

CREATE TABLE servis (
    idServis INT IDENTITY(1,1) PRIMARY KEY,
    idVozilo INT CONSTRAINT FK_servis1 FOREIGN KEY (idVozilo) REFERENCES vozilo(idVozilo),
    datumServisa DATE,
    idServiser INT CONSTRAINT FK_servis2 FOREIGN KEY (idServiser) REFERENCES serviser(idServiser),
    brojRadnihSati INT,
    iznos DECIMAL(10,2),
);