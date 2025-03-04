DROP SCHEMA IF EXISTS RIF_RISTORANTE;

CREATE SCHEMA RIF_RISTORANTE;

USE RIF_RISTORANTE;

-- CREAZIONE TAB MENU

CREATE TABLE MENU(
ID_PIATTO INT PRIMARY KEY AUTO_INCREMENT
, NOME_PIATTO VARCHAR(25)
, CATEGORIA_PIATTO VARCHAR(15)
, PREZZO DECIMAL(10,2)
);
-- CREAZIONE TAB INGREDIENTE
CREATE TABLE INGREDIENTE(
ID_INGREDIENTE INT PRIMARY KEY AUTO_INCREMENT
, NOME_INGREDIENTE VARCHAR(25)
, CATEGORIA_INGREDIENTE VARCHAR(15)
, QUNATITA_KG DECIMAL(10,4)
);

-- CREAZIONE TABELLA RICETTA
CREATE TABLE RICETTA(
ID_RICETTA INT PRIMARY KEY, 
 ID_PIATTO INT
, ID_INGREDIENTE INT
, QUANTITA DECIMAL(10,2)
-- , CONSTRAINT PK_IDPIATTO_IDINGREDIENTE PRIMARY KEY (ID_PIATTO, ID_INGREDIENTE)
, CONSTRAINT FK_MENU_RICETTA FOREIGN KEY (ID_PIATTO) REFERENCES MENU (ID_PIATTO)
, CONSTRAINT FK_INGREDIENTE_RICETTA FOREIGN KEY (ID_INGREDIENTE) REFERENCES INGREDIENTE (ID_INGREDIENTE)
);

-- CREAZIONE TABELLA FORNITORE

CREATE TABLE FORNITORE(
ID_FORNITORE INT PRIMARY KEY AUTO_INCREMENT
, NOME_FORNITORE VARCHAR(25)
, INDIRIZZO VARCHAR(50)
, TELEFONO VARCHAR(13)
, P_IVA VARCHAR(15)  
);

-- CREAZIONE TABELLA TESTATA_ORDINE

CREATE TABLE TESTATA_ORDINE(
ID_ORDINE INT PRIMARY KEY
, ID_FORNITORE INT
, DATA_ORDINE DATE
, CONSTRAINT FK_FORNITORE_TESTATA FOREIGN KEY (ID_FORNITORE) REFERENCES FORNITORE (ID_FORNITORE)
);

CREATE TABLE ORDINE_DETTAGLIO(
ID_ORDINE INT
, ID_LINEA_ORDINE INT
, ID_INGREDIENTE INT
, QUANTITA_ORDINE_KG DECIMAL(10,4)
, PREZZO_UNITARIO DECIMAL(10,2)
, PREZZO_TOTALE DECIMAL(10,2)
, CONSTRAINT PK_DETTAGLIO_ORDINE PRIMARY KEY (ID_ORDINE, ID_LINEA_ORDINE)
, CONSTRAINT FK_TESTATA_DETTAGLIO FOREIGN KEY (ID_ORDINE) REFERENCES TESTATA_ORDINE (ID_ORDINE)
, CONSTRAINT FK_INGREDIENTE_DETTAGLIO FOREIGN KEY (ID_INGREDIENTE) REFERENCES INGREDIENTE (ID_INGREDIENTE)
);
-- popolamento tabella MENU

INSERT INTO MENU (NOME_PIATTO, CATEGORIA_PIATTO, PREZZO) VALUES
('Spaghetti Carbonara', 'Primo', 8.50),
('Risotto alla Milanese', 'Primo', 9.00),
('Pizza Margherita', 'Pizza', 7.50),
('Lasagna', 'Primo', 10.00),
('Insalata Mista', 'Contorno', 4.50),
('Tiramisu', 'Dolce', 6.00),
('Gelato Artigianale', 'Dolce', 5.50),
('Pollo alla Griglia', 'Secondo', 12.00),
('Frittura di Pesce', 'Secondo', 15.00),
('Zuppa di Verdure', 'Primo', 7.00);


-- popolamento tabella INGREDIENTE
INSERT INTO INGREDIENTE (NOME_INGREDIENTE, CATEGORIA_INGREDIENTE, QUNATITA_KG) VALUES
('Farina', 'Base', 100.00),
('Uova', 'Base', 50.00),
('Burro', 'Base', 30.00),
('Zucchero', 'Base', 25.00),
('Latte', 'Base', 40.00),
('Pomodoro', 'Vegetale', 70.00),
('Mozzarella', 'Latticino', 60.00),
('Basilico', 'Spezia', 5.00),
('Riso', 'Base', 80.00),
('Zafferano', 'Spezia', 1.00),
('Pollo', 'Carne', 50.00),
('Pesce', 'Carne', 40.00),
('Verdure', 'Vegetale', 60.00),
('Caffè', 'Spezia', 10.00),
('Cioccolato', 'Base', 20.00),
('Panna', 'Latticino', 30.00),
('Lievito', 'Base', 15.00),
('Aglio', 'Spezia', 10.00),
("Olio d'Oliva", 'Base', 100.00),
('Aceto', 'Base', 20.00),
('Pepe', 'Spezia', 5.00),
('Sale', 'Spezia', 25.00),
('Carote', 'Vegetale', 40.00),
('Patate', 'Vegetale', 50.00),
('Fagioli', 'Vegetale', 30.00);

-- Popolamento della tabella RICETTA
INSERT INTO RICETTA (ID_RICETTA, ID_PIATTO, ID_INGREDIENTE, QUANTITA) VALUES
(1, 1, 1, 0.2),
(2, 1, 2, 0.1),
(3, 1, 5, 0.2),
(4, 1, 6, 0.3),
(5, 2, 9, 0.4),
(6, 2, 10, 0.02),
(7, 2, 5, 0.2),
(8, 2, 6, 0.1),
(9, 3, 1, 0.3),
(10, 3, 7, 0.5),
(11, 3, 8, 0.1),
(12, 3, 6, 0.3),
(13, 4, 1, 0.3),
(14, 4, 2, 0.2),
(15, 4, 6, 0.4),
(16, 4, 7, 0.1),
(17, 5, 14, 0.05),
(18, 5, 15, 0.03),
(19, 5, 16, 0.02),
(20, 5, 17, 0.02),
(21, 6, 3, 0.4),
(22, 6, 4, 0.3),
(23, 6, 5, 0.3),
(24, 6, 6, 0.2),
(25, 7, 18, 0.5),
(26, 7, 19, 0.3),
(27, 7, 20, 0.2),
(28, 7, 21, 0.1),
(29, 8, 11, 0.4),
(30, 8, 12, 0.3),
(31, 8, 13, 0.2),
(32, 8, 6, 0.2),
(33, 9, 5, 0.5),
(34, 9, 12, 0.3),
(35, 9, 6, 0.2),
(36, 9, 20, 0.2),
(37, 10, 9, 0.4),
(38, 10, 6, 0.3),
(39, 10, 23, 0.2),
(40, 10, 24, 0.2);

-- Popolamento della tabella FORNITORE
INSERT INTO FORNITORE (NOME_FORNITORE, INDIRIZZO, TELEFONO, P_IVA) VALUES
('Fornitore 1', 'Via Roma 1', '1234567890', 'IT12345678901'),
('Fornitore 2', 'Via Milano 2', '0987654321', 'IT09876543210'),
('Fornitore 3', 'Via Napoli 3', '1122334455', 'IT11223344550'),
('Fornitore 4', 'Via Torino 4', '6677889900', 'IT66778899000'),
('Fornitore 5', 'Via Firenze 5', '5566778899', 'IT55667788990'),
('Fornitore 6', 'Via Venezia 6', '4433221100', 'IT44332211000'),
('Fornitore 7', 'Via Genova 7', '1100110011', 'IT11001100110'),
('Fornitore 8', 'Via Bologna 8', '9998887776', 'IT99988877760'),
('Fornitore 9', 'Via Bari 9', '1231231234', 'IT12312312340'),
('Fornitore 10', 'Via Verona 10', '3213213210', 'IT32132132100');

-- Popolamento della tabella TESTATA_ORDINE
INSERT INTO TESTATA_ORDINE (ID_ORDINE, ID_FORNITORE, DATA_ORDINE) VALUES
(1, 1, '2024-01-01'),
(2, 1, '2024-01-02'),
(3, 1, '2024-01-03'),
(4, 2, '2024-01-04'),
(5, 2, '2024-01-05'),
(6, 2, '2024-01-06'),
(7, 3, '2024-01-07'),
(8, 3, '2024-01-08'),
(9, 3, '2024-01-09'),
(10, 4, '2024-01-10'),
(11, 4, '2024-01-11'),
(12, 4, '2024-01-12'),
(13, 5, '2024-01-13'),
(14, 5, '2024-01-14'),
(15, 5, '2024-01-15'),
(16, 6, '2024-01-16'),
(17, 6, '2024-01-17'),
(18, 6, '2024-01-18'),
(19, 6, '2024-01-19'),
(20, 6, '2024-01-20'),
(21, 6, '2024-01-21'),
(22, 7, '2024-01-22'),
(23, 7, '2024-01-23'),
(24, 7, '2024-01-24'),
(25, 8, '2024-01-25'),
(26, 8, '2024-01-26'),
(27, 8, '2024-01-27'),
(28, 9, '2024-01-28'),
(29, 9, '2024-01-29'),
(30, 9, '2024-01-30'),
(31, 10, '2024-01-31'),
(32, 10, '2024-02-01'),
(33, 10, '2024-02-02'),
(34, 10, '2024-02-03'),
(35, 10, '2024-02-04'),
(36, 10, '2024-02-05');

-- Popolamento della tabella ORDINE_DETTAGLIO
INSERT INTO ORDINE_DETTAGLIO (ID_ORDINE, ID_LINEA_ORDINE, ID_INGREDIENTE, QUANTITA_ORDINE_KG, PREZZO_UNITARIO, PREZZO_TOTALE) VALUES
(1, 1, 1, 10.00, 2.50, 25.00),
(1, 2, 2, 5.00, 3.00, 15.00),
(2, 1, 3, 20.00, 1.50, 30.00),
(2, 2, 4, 15.00, 2.00, 30.00),
(3, 1, 5, 25.00, 1.20, 30.00),
(3, 2, 6, 30.00, 1.00, 30.00),
(4, 1, 7, 10.00, 4.00, 40.00),
(4, 2, 8, 3.00, 5.00, 15.00),
(5, 1, 9, 5.00, 3.00, 15.00),
(5, 2, 10, 2.00, 10.00, 20.00),
(6, 1, 1, 7.00, 8.00, 56.00),
(6, 2, 2, 3.00, 4.00, 12.00),
(7, 1, 3, 6.00, 9.00, 54.00),
(7, 2, 4, 4.00, 3.50, 14.00),
(8, 1, 5, 9.00, 6.00, 54.00),
(8, 2, 6, 8.00, 5.00, 40.00),
(9, 1, 7, 10.00, 2.50, 25.00),
(9, 2, 8, 5.00, 3.00, 15.00),
(10, 1, 11, 7.00, 4.00, 28.00),
(10, 2, 10, 6.00, 5.00, 30.00),
(10, 3, 12, 8.00, 3.50, 28.00),
(11, 1, 2, 12.00, 2.50, 30.00),
(11, 2, 3, 6.00, 3.00, 18.00),
(12, 1, 4, 8.00, 4.00, 32.00),
(12, 2, 5, 10.00, 3.20, 32.00),
(13, 1, 6, 5.00, 2.50, 12.50),
(13, 2, 12, 9.00, 3.00, 27.00),
(14, 1, 12, 4.00, 1.50, 6.00),
(14, 2, 9, 11.00, 2.80, 30.80),
(15, 1, 10, 6.00, 4.50, 27.00),
(15, 2, 1, 3.00, 5.00, 15.00),
(15, 3, 2, 7.00, 3.20, 22.40),
(16, 1, 1, 15.00, 2.50, 37.50),
(16, 2, 2, 8.00, 3.00, 24.00),
(17, 1, 3, 12.00, 1.50, 18.00),
(17, 2, 4, 5.00, 2.00, 10.00),
(18, 1, 5, 9.00, 1.20, 10.80),
(18, 2, 6, 11.00, 1.00, 11.00),
(19, 1, 7, 6.00, 4.00, 24.00),
(19, 2, 8, 7.00, 5.00, 35.00),
(20, 1, 9, 10.00, 3.00, 30.00),
(20, 2, 10, 4.00, 10.00, 40.00),
(20, 3, 11, 5.00, 8.00, 40.00),
(21, 1, 12, 7.00, 4.00, 28.00),
(21, 2, 3, 6.00, 9.00, 54.00),
(21, 3, 4, 4.00, 3.50, 14.00),
(21, 4, 5, 8.00, 6.00, 48.00),
(22, 1, 6, 9.00, 5.00, 45.00),
(22, 2, 7, 10.00, 2.50, 25.00),
(23, 1, 8, 12.00, 3.00, 36.00),
(23, 2, 9, 14.00, 4.00, 56.00),
(24, 1, 12, 11.00, 1.50, 16.50),
(24, 2, 1, 13.00, 3.50, 45.50),
(24, 3, 2, 9.00, 2.50, 22.50),
(25, 1, 3, 10.00, 3.00, 30.00),
(25, 2, 4, 15.00, 4.00, 60.00),
(25, 3, 12, 12.00, 2.50, 30.00),
(26, 1, 12, 14.00, 3.00, 42.00),
(26, 2, 2, 16.00, 1.50, 24.00),
(27, 1, 2, 13.00, 4.50, 58.50),
(27, 2, 1, 9.00, 2.80, 25.20),
(28, 1, 3, 5.00, 4.00, 20.00),
(28, 2, 1, 6.00, 5.00, 30.00),
(29, 1, 2, 7.00, 3.20, 22.40),
(29, 2, 1, 8.00, 2.50, 20.00),
(30, 1, 2, 15.00, 3.00, 45.00),
(30, 2, 3, 10.00, 1.50, 15.00),
(30, 3, 4, 8.00, 2.00, 16.00),
(31, 1, 5, 9.00, 1.20, 10.80),
(31, 2, 6, 7.00, 1.00, 7.00),
(32, 1, 7, 6.00, 4.00, 24.00),
(32, 2, 8, 5.00, 5.00, 25.00),
(33, 1, 9, 12.00, 3.00, 36.00),
(33, 2, 10, 13.00, 10.00, 130.00),
(34, 1, 11, 7.00, 8.00, 56.00),
(34, 2, 12, 6.00, 4.00, 24.00),
(35, 1, 3, 5.00, 9.00, 45.00),
(35, 2, 4, 4.00, 3.50, 14.00),
(36, 1, 4, 12.00, 4.00, 48.00),
(36, 2, 12, 8.00, 2.50, 20.00),
(36, 3, 11, 10.00, 3.00, 30.00),
(36, 4, 10, 5.00, 1.50, 7.50),
(36, 5, 9, 15.00, 3.20, 48.00);

