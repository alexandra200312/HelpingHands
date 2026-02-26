-- procedura de complexitate minim 4
CREATE PROCEDURE sp_raport_cereri_pe_categorii
AS
BEGIN
    SELECT 
        c.nume AS categorie,
        COUNT(cer.cerere_id) AS cereri_finalizate
    FROM Cereri cer
    JOIN Categorii c ON cer.categorie_id = c.categorie_id
    JOIN Meseriasi m ON cer.meserias_id = m.meserias_id
    WHERE cer.status = 'finalizata'
    GROUP BY c.nume;
END;

-- apelare procedura
EXEC sp_raport_cereri_pe_categorii;

-- procedura de complexitate minim 6
CREATE PROCEDURE sp_top_meseriasi_recomandati
    @min_cereri INT,
    @rating_min FLOAT,
    @min_experienta INT
AS
BEGIN
    SELECT u.nume,
           COUNT(c.cerere_id) cereri_finalizate,
           AVG(CAST(r.rating AS FLOAT)) rating_mediu
    FROM Meseriasi m
    JOIN Users u ON m.meserias_id = u.user_id
    JOIN Cereri c ON m.meserias_id = c.meserias_id AND c.status = 'finalizata'
    JOIN Recenzii r ON c.cerere_id = r.cerere_id
    WHERE m.experienta_ani >= @min_experienta
    GROUP BY u.nume
    HAVING COUNT(c.cerere_id) >= @min_cereri
       AND AVG(CAST(r.rating AS FLOAT)) >= @rating_min;
END;

-- apelare procedura
EXEC sp_top_meseriasi_recomandati 
    @min_cereri = 2,
    @rating_min = 3.5,
    @min_experienta = 3;

-- procedura de complexitate minim 7
CREATE PROCEDURE sp_meseriasi_pe_oras_categorie_rating
    @oras NVARCHAR(100),
    @categorie NVARCHAR(100),
    @rating_min FLOAT
AS
BEGIN
    SELECT 
        u.nume,
        l.oras,
        c.nume AS categorie,
        COUNT(r.recenzie_id) AS nr_recenzii,
        AVG(CAST(r.rating AS FLOAT)) AS rating_mediu
    FROM Meseriasi m
    JOIN Users u ON m.meserias_id = u.user_id
    JOIN Locatii l ON m.locatie_id = l.locatie_id
    JOIN Meserias_Categorii mc ON m.meserias_id = mc.meserias_id
    JOIN Categorii c ON mc.categorie_id = c.categorie_id
    JOIN Recenzii r ON m.meserias_id = r.meserias_id
    WHERE 
        l.oras = @oras
        AND c.nume = @categorie
        AND m.activ = 1
    GROUP BY 
        u.nume, l.oras, c.nume
    HAVING 
        AVG(CAST(r.rating AS FLOAT)) >= @rating_min;
END;

-- apelare procedura
EXEC sp_meseriasi_pe_oras_categorie_rating
    @oras = 'Bucuresti',
    @categorie = 'Electrician',
    @rating_min = 3.5;



