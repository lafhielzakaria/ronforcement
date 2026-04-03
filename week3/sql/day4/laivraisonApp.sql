CREATE miseEnSitSql;
USE miseEnSitSql;
CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    type ENUM('client', 'livreur') NOT NULL
);
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    note_moy DECIMAL(3,2) DEFAULT 0.00
);
CREATE TABLE plats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    categorie VARCHAR(50),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);
CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    livreur_id INT,
    restaurant_id INT NOT NULL,
    statut ENUM('en_attente', 'en_preparation', 'en_livraison', 'livre', 'annule') DEFAULT 'en_attente',
    total DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (livreur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);
CREATE TABLE lignes_commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    plat_id INT NOT NULL,
    quantite INT NOT NULL,
    prix_unit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES commandes(id) ON DELETE CASCADE,
    FOREIGN KEY (plat_id) REFERENCES plats(id)
);
INSERT INTO utilisateurs (nom, email, type) VALUES
('Alice Martin', 'alice@email.com', 'client'),
('Bob Bernard', 'bob@email.com', 'client'),
('Charlie Coursier', 'charlie@livreur.fr', 'livreur'),
('Diane Rapide', 'diane@livreur.fr', 'livreur');
INSERT INTO restaurants (nom, ville, note_moy) VALUES
('Le Petit Bistro', 'Paris', 4.5),
('Sushi Zen', 'Lyon', 4.2),
('Pizza Roma', 'Marseille', 3.8);
INSERT INTO plats (restaurant_id, nom, prix, categorie) VALUES
(1, 'Entrecôte Frites', 18.50, 'Plat'),
(1, 'Mousse au Chocolat', 6.00, 'Dessert'),
(2, 'Plateau Mixte 12pcs', 15.00, 'Japonais'),
(2, 'Soupe Miso', 3.50, 'Entrée'),
(3, 'Pizza Margherita', 12.00, 'Pizza'),
(3, 'Tiramisu', 7.00, 'Dessert');
INSERT INTO commandes (client_id, livreur_id, restaurant_id, statut, total) VALUES
(1, 3, 3, 'livre', 31.00);
INSERT INTO lignes_commande (commande_id, plat_id, quantite, prix_unit) VALUES
(1, 5, 2, 12.00),
(1, 6, 1, 7.00);
INSERT INTO commandes (client_id, livreur_id, restaurant_id, statut, total) VALUES
(2, 4, 1, 'en_preparation', 18.50);
INSERT INTO lignes_commande (commande_id, plat_id, quantite, prix_unit) VALUES
(2, 1, 1, 18.50);
/*1*/ select r.nom  , count(c.restaurant_id) as commandsCount from restaurants r left join commandes c on r.id = c.restaurant_id GROUP by c.restaurant_id;
 /*2*/SELECT u.nom, COUNT(c.id) AS totalLivred FROM utilisateurs u
LEFT JOIN commandes c ON u.id = c.livreur_id where c.statut = 'livre'
GROUP BY u.id, u.nom;
/*3*/ 
SELECT nom 
FROM utilisateurs 
WHERE id IN (
    SELECT client_id 
    FROM commandes 
    WHERE total > 30
);

/*4*/ 
SELECT nom 
FROM restaurants 
WHERE id NOT IN (
    SELECT DISTINCT restaurant_id 
    FROM commandes
);

/*5*/ 
SELECT r.nom, COUNT(c.id) AS OrdersCount, SUM(c.total) AS TotalRevenue
FROM restaurants r
JOIN commandes c ON r.id = c.restaurant_id
GROUP BY r.id, r.nom
HAVING OrdersCount > 3 AND TotalRevenue > 80;

/*6*/ 
SELECT u.nom, SUM(c.total) AS TotalSpent
FROM utilisateurs u
JOIN commandes c ON u.id = c.client_id
GROUP BY u.id, u.nom
ORDER BY TotalSpent DESC;

/*7*/ 
SELECT u.nom 
FROM utilisateurs u
WHERE u.role = 'livreur' 
AND EXISTS (
    SELECT 1 
    FROM notations n 
    WHERE n.livreur_id = u.id 
    AND n.note > 4
);

/*8*/ 
EXPLAIN SELECT * FROM commandes WHERE total > 50;