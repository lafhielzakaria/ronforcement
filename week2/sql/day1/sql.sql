CREATE DATABASE livraisonApp;
USE livraisonApp;

-- Table: utilisateurs
CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    email VARCHAR(191) UNIQUE, -- FIX HERE
    type ENUM('client', 'livreur', 'admin'),
    created_at DATE
);

-- Table: restaurants
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    ville VARCHAR(255),
    note_moy FLOAT
);

-- Table: plats
CREATE TABLE plats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    nom VARCHAR(255),
    prix DECIMAL(10,2),
    categorie VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
        ON DELETE CASCADE
);

-- Table: commandes
CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    livreur_id INT,
    restaurant_id INT,
    statut ENUM('en_attente', 'en_cours', 'livree', 'annulee'),
    total DECIMAL(10,2),
    created_at DATETIME,
    FOREIGN KEY (client_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (livreur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

-- Table: lignes_commande
CREATE TABLE lignes_commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT,
    plat_id INT,
    quantite INT,
    prix_unit DECIMAL(10,2),
    FOREIGN KEY (commande_id) REFERENCES commandes(id)
        ON DELETE CASCADE,
    FOREIGN KEY (plat_id) REFERENCES plats(id)
);

-- Table: notations
CREATE TABLE notations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT,
    note INT,
    commentaire TEXT,
    FOREIGN KEY (commande_id) REFERENCES commandes(id)
        ON DELETE CASCADE
);
INSERT INTO utilisateurs (nom, email, type, created_at) VALUES
('Zakaria Lafhiel', 'zakaria@gmail.com', 'client', '2026-01-10'),
('Ahmed Benali', 'ahmed@gmail.com', 'livreur', '2026-01-12'),
('Sara Amrani', 'sara@gmail.com', 'client', '2026-01-15'),
('Youssef Tazi', 'youssef@gmail.com', 'livreur', '2026-01-18'),
('Admin User', 'admin@gmail.com', 'admin', '2026-01-01');
INSERT INTO restaurants (nom, ville, note_moy) VALUES
('Pizza Napoli', 'Casablanca', 4.5),
('Tacos House', 'Rabat', 4.2),
('Burger King', 'Casablanca', 4.0),
('Sushi Time', 'Marrakech', 4.7);
INSERT INTO plats (restaurant_id, nom, prix, categorie) VALUES
(1, 'Pizza Margherita', 50.00, 'Pizza'),
(1, 'Pizza 4 Fromages', 65.00, 'Pizza'),
(2, 'Tacos Poulet', 45.00, 'Tacos'),
(2, 'Tacos Viande', 55.00, 'Tacos'),
(3, 'Cheeseburger', 40.00, 'Burger'),
(3, 'Double Burger', 60.00, 'Burger'),
(4, 'Sushi Mix', 120.00, 'Sushi');
INSERT INTO commandes (client_id, livreur_id, restaurant_id, statut, total, created_at) VALUES
(1, 2, 1, 'livree', 115.00, '2026-03-01 12:30:00'),
(3, 4, 2, 'en_cours', 100.00, '2026-03-02 14:00:00'),
(1, 2, 3, 'en_attente', 60.00, '2026-03-03 18:20:00');
INSERT INTO lignes_commande (commande_id, plat_id, quantite, prix_unit) VALUES
(1, 1, 1, 50.00),
(1, 2, 1, 65.00),
(2, 3, 2, 45.00),
(3, 6, 1, 60.00);
INSERT INTO notations (commande_id, note, commentaire) VALUES
(1, 5, 'Très bon service !'),
(2, 4, 'Livraison rapide'),
(3, 3, 'En attente...');*/
/*
1. Afficher le nom et l'email de tous les utilisateurs de type 'client'
2. Afficher tous les plats dont le prix est inférieur à 15€, triés du moins cher au plus cher
3. Compter le nombre de commandes par statut ('livré', 'en cours', 'annulé')
4. Afficher les 3 restaurants avec la meilleure note moyenne (ORDER BY + LIMIT)
5. Calculer le chiffre d'affaires total et le panier moyen de toutes les commandes livrées
6. Afficher tous les plats dont le nom contient le mot 'poulet' (LIKE)
7. Afficher le nom du client et le total pour chaque commande (INNER JOIN commandes +
utilisateurs)
8. Afficher le nom du restaurant et le nombre de commandes reçues, même pour les
restaurants sans commande (LEFT JOIN)
9. Lister toutes les commandes livrées avec le nom du client, le nom du livreur et le nom du
restaurant
10.Afficher les plats commandés au moins une fois avec leur quantité totale vendue (JOIN +
GROUP BY + SUM)
11. Trouver les clients qui ont commandé plus de 3 fois, avec leur nombre de commandes
(JOIN + GROUP BY + HAVING)
12.BONUS : Afficher le top 3 des livreurs les mieux notés (jointure sur notations +
commandes + utilisateurs)

*/
/*1*/select u.nom , email from utilisateurs u join commandes c on u.id = c.client_id;
/*2*/ select p.nom from plats p join restaurants r on r.id = p.restaurant_id where p.prix < 50 order by p.prix asc;
/*3*/select statut , count(statut) from commandes group by statut;
/*4*/select nom from restaurants order by note_moy desc limit 3;
/*5*/select sum(total),avg(total) from commandes where statut = "livree";
/*6*/select nom from plats where nom like "%poulet%";
/*7*/ select u.nom , c.total from utilisateurs u join commandes c on c.client_id = u.id;
/*8*/select r.nom , count(c.id) from restaurants r  left join commandes c on c.restaurant_id = r.id group by r.nom;
/*9*/select u.nom as livreur_name , user.nom as client_name from commandes c join utilisateurs u on c.livreur_id = u.id join utilisateurs user on user.id = c.client_id where statut = "livree";
/*10*/select p.nom , sum(l.quantite) from lignes_commande l join plats p on p.id = plat_id group by p.nom; 
/*11. Trouver les clients qui ont commandé plus de 3 fois, avec leur nombre de commandes
(JOIN + GROUP BY + HAVING)*/
/*11*/select u.nom , count(c.id) as commands_count from utilisateurs u join commandes c on c.client_id = u.id group by u.nom order by count(c.id) desc;
/*12*/select u.nom from commandes c join utilisateurs u on u.id = c.livreur_id join notations n on n.commande_id = c.id group by c.livreur_id order by n.note desc;