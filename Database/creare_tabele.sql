CREATE TABLE Locatii (
    locatie_id INT IDENTITY PRIMARY KEY,
    oras NVARCHAR(100) NOT NULL,
    judet NVARCHAR(100) NOT NULL
);

CREATE TABLE Users (
    user_id INT IDENTITY PRIMARY KEY,
    nume NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    telefon NVARCHAR(20),
    rol NVARCHAR(20) NOT NULL CHECK (rol IN ('client', 'meserias'))
);

CREATE TABLE Meseriasi (
    meserias_id INT PRIMARY KEY,
    experienta_ani INT NOT NULL,
    tarif_orar DECIMAL(10,2) NOT NULL,
    activ BIT NOT NULL DEFAULT 1,
    locatie_id INT NOT NULL,
    CONSTRAINT fk_meserias_user FOREIGN KEY (meserias_id)
        REFERENCES Users(user_id),
    CONSTRAINT fk_meserias_locatie FOREIGN KEY (locatie_id)
        REFERENCES Locatii(locatie_id)
);

CREATE TABLE Categorii (
    categorie_id INT IDENTITY PRIMARY KEY,
    nume NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Meserias_Categorii (
    meserias_id INT NOT NULL,
    categorie_id INT NOT NULL,
    CONSTRAINT pk_meserias_categorii PRIMARY KEY (meserias_id, categorie_id),
    CONSTRAINT fk_mc_meserias FOREIGN KEY (meserias_id)
        REFERENCES Meseriasi(meserias_id),
    CONSTRAINT fk_mc_categorie FOREIGN KEY (categorie_id)
        REFERENCES Categorii(categorie_id)
);

CREATE TABLE Cereri (
    cerere_id INT IDENTITY PRIMARY KEY,
    client_id INT NOT NULL,
    meserias_id INT NOT NULL,
    categorie_id INT NOT NULL,
    data_creare DATETIME NOT NULL DEFAULT GETDATE(),
    status NVARCHAR(20) NOT NULL CHECK (status IN ('noua', 'acceptata', 'finalizata')),
    CONSTRAINT fk_cerere_client FOREIGN KEY (client_id)
        REFERENCES Users(user_id),
    CONSTRAINT fk_cerere_meserias FOREIGN KEY (meserias_id)
        REFERENCES Meseriasi(meserias_id),
    CONSTRAINT fk_cerere_categorie FOREIGN KEY (categorie_id)
        REFERENCES Categorii(categorie_id)
);

CREATE TABLE Recenzii (
    recenzie_id INT IDENTITY PRIMARY KEY,
    cerere_id INT NOT NULL UNIQUE,
    meserias_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comentariu NVARCHAR(500),
    data_recenzie DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT fk_recenzie_cerere FOREIGN KEY (cerere_id)
        REFERENCES Cereri(cerere_id),
    CONSTRAINT fk_recenzie_meserias FOREIGN KEY (meserias_id)
        REFERENCES Meseriasi(meserias_id)
);
