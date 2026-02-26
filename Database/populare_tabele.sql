INSERT INTO Locatii VALUES
('Bucuresti', 'Bucuresti'),
('Cluj-Napoca', 'Cluj');

select * from Locatii;

INSERT INTO Users (nume, email, telefon, rol) VALUES
('Popescu Ion', 'ion@email.com', '0711111111', 'client'),
('Ionescu Maria', 'maria@email.com', '0722222222', 'client'),
('Vasilescu Andrei', 'andrei@email.com', '0733333333', 'meserias'),
('Stan Cristian', 'cristian@email.com', '0744444444', 'meserias'),
('Georgescu Paul', 'paul@email.com', '0755555555', 'meserias');

select * from Users;

INSERT INTO Meseriasi VALUES
(3, 5, 80, 1, 1),
(4, 7, 100, 1, 1),
(5, 10, 120, 1, 2);

select * from Meseriasi;

INSERT INTO Categorii (nume) VALUES
('Instalator'),
('Electrician');

select * from Categorii;

INSERT INTO Meserias_Categorii VALUES
(3, 1),
(3, 2),
(4, 1),
(5, 2);

select * from Meserias_Categorii;

INSERT INTO Cereri (client_id, meserias_id, categorie_id, status) VALUES
(1, 3, 1, 'finalizata'),
(2, 3, 2, 'finalizata'),
(1, 4, 1, 'finalizata'),
(2, 5, 2, 'finalizata');

select * from Cereri;

INSERT INTO Recenzii (cerere_id, meserias_id, rating, comentariu) VALUES
(1, 3, 5, 'Foarte bun'),
(2, 3, 4, 'Bun'),
(3, 4, 2, 'Sub asteptari'),
(4, 5, 3, 'Acceptabil');

select * from Recenzii;

INSERT INTO Locatii (oras, judet) VALUES
('Timisoara', 'Timis'),
('Iasi', 'Iasi'),
('Brasov', 'Brasov');

INSERT INTO Users (nume, email, telefon, rol) VALUES
('Radu Mihai', 'mihai@email.com', '0766666666', 'client'),
('Dumitrescu Ana', 'ana@email.com', '0777777777', 'client'),
('Marinescu Vlad', 'vlad@email.com', '0788888888', 'meserias'),
('Popa Alexandru', 'alex@email.com', '0799999999', 'meserias'),
('Ilie Sorin', 'sorin@email.com', '0700000000', 'meserias');

INSERT INTO Meseriasi (meserias_id, experienta_ani, tarif_orar, activ, locatie_id) VALUES
(8, 3, 70, 1, 3),  
(9, 12, 150, 1, 4), 
(10, 2, 60, 1, 5); 

INSERT INTO Categorii (nume) VALUES
('Zugrav'),
('Tamplar');

INSERT INTO Meserias_Categorii VALUES
(8, 3),   -- Vlad -> Zugrav
(9, 1),   -- Alexandru -> Instalator
(9, 4),   -- Alexandru -> Tamplar
(10, 2);  -- Sorin -> Electrician

INSERT INTO Cereri (client_id, meserias_id, categorie_id, status) VALUES
(6, 3, 1, 'finalizata'),
(7, 3, 2, 'finalizata'),
(6, 4, 1, 'finalizata'),
(7, 5, 2, 'finalizata'),
(1, 8, 3, 'finalizata'),
(2, 9, 1, 'finalizata'),
(6, 9, 4, 'finalizata'),
(7, 10, 2, 'finalizata');

INSERT INTO Recenzii (cerere_id, meserias_id, rating, comentariu, data_recenzie) VALUES
(5, 3, 3, 'Acceptabil', DATEADD(day, -10, GETDATE())),
(6, 3, 2, 'Calitate slaba', DATEADD(day, -5, GETDATE())),
(7, 4, 5, 'Excelent', DATEADD(day, -7, GETDATE())),
(8, 5, 4, 'Bun', DATEADD(day, -3, GETDATE())),
(9, 8, 5, 'Foarte bun', DATEADD(day, -2, GETDATE())),
(10, 9, 4, 'Profesional', DATEADD(day, -6, GETDATE())),
(11, 9, 2, 'Probleme', DATEADD(day, -1, GETDATE())),
(12, 10, 3, 'Acceptabil', DATEADD(day, -4, GETDATE()));

INSERT INTO Users (nume, email, telefon, rol) VALUES
('Ionescu Daniel', 'daniel@email.com', '0710000001', 'meserias'),
('Marin Costel', 'costel@email.com', '0710000002', 'meserias'),
('Petrescu Alin', 'alin@email.com', '0710000003', 'meserias'),
('Stoica Florin', 'florin@email.com', '0710000004', 'meserias'),
('Dobre Razvan', 'razvan@email.com', '0710000005', 'meserias');

INSERT INTO Meseriasi (meserias_id, experienta_ani, tarif_orar, activ, locatie_id) VALUES
(11, 4, 75, 1, 1),
(12, 6, 90, 1, 1),
(13, 10, 130, 1, 1),
(14, 2, 65, 1, 1),
(15, 8, 110, 1, 1);

INSERT INTO Meserias_Categorii VALUES
(11, 1),
(12, 1),
(12, 2),
(13, 2),
(14, 1),
(15, 2);

INSERT INTO Cereri (client_id, meserias_id, categorie_id, status) VALUES
(1, 11, 1, 'finalizata'),
(2, 11, 1, 'finalizata'),
(6, 12, 2, 'finalizata'),
(7, 12, 2, 'finalizata'),
(1, 13, 2, 'finalizata'),
(2, 13, 2, 'finalizata'),
(6, 14, 1, 'finalizata'),
(7, 14, 1, 'finalizata'),
(1, 15, 2, 'finalizata'),
(2, 15, 2, 'finalizata');

INSERT INTO Recenzii (cerere_id, meserias_id, rating, comentariu, data_recenzie) VALUES
(13, 11, 5, 'Foarte bun', DATEADD(day, -15, GETDATE())),
(14, 11, 4, 'Bun', DATEADD(day, -10, GETDATE())),

(15, 12, 3, 'Acceptabil', DATEADD(day, -12, GETDATE())),
(16, 12, 2, 'Sub asteptari', DATEADD(day, -5, GETDATE())),

(17, 13, 5, 'Excelent', DATEADD(day, -20, GETDATE())),
(18, 13, 4, 'Foarte bun', DATEADD(day, -8, GETDATE())),

(19, 14, 4, 'Bun', DATEADD(day, -7, GETDATE())),
(20, 14, 3, 'Mediu', DATEADD(day, -3, GETDATE())),

(21, 15, 5, 'Profesional', DATEADD(day, -6, GETDATE())),
(22, 15, 2, 'Calitate slaba', DATEADD(day, -1, GETDATE()));

select * from Recenzii;

INSERT INTO Users (nume, email, telefon, rol) VALUES
('Toma Adrian', 'toma.adrian@email.com', '0711112222', 'meserias'),
('Enache Mihnea', 'mihnea.enache@email.com', '0711113333', 'meserias');

select * from Users;

INSERT INTO Meseriasi (meserias_id, experienta_ani, tarif_orar, activ, locatie_id) VALUES
(16, 9, 120, 1, 1),  -- Toma Adrian
(17, 6, 95, 1, 1);   -- Enache Mihnea

select * from Meseriasi;

INSERT INTO Meserias_Categorii VALUES
(16, 1), -- Instalator
(17, 2); -- Electrician

select * from Meserias_Categorii;

INSERT INTO Cereri (client_id, meserias_id, categorie_id, status) VALUES
(1, 16, 1, 'finalizata'),
(2, 16, 1, 'finalizata'),
(6, 16, 1, 'finalizata');

INSERT INTO Cereri (client_id, meserias_id, categorie_id, status) VALUES
(1, 17, 2, 'finalizata'),
(2, 17, 2, 'finalizata'),
(7, 17, 2, 'finalizata');

INSERT INTO Recenzii (cerere_id, meserias_id, rating, comentariu, data_recenzie) VALUES
(23, 16, 5, 'Excelent', DATEADD(day, -20, GETDATE())),
(24, 16, 4, 'Foarte bun', DATEADD(day, -10, GETDATE())),
(25, 16, 2, 'Calitate in scadere', GETDATE());

INSERT INTO Recenzii (cerere_id, meserias_id, rating, comentariu, data_recenzie) VALUES
(29, 17, 5, 'Profesional', DATEADD(day, -18, GETDATE())),
(30, 17, 4, 'Bun', DATEADD(day, -9, GETDATE())),
(31, 17, 2, 'Nemultumit', GETDATE());

select * from Recenzii;