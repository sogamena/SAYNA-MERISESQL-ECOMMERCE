# Créer une base de donnée

CREATE DATABASE sqlcommerce;


# Créer une table Utilisateur

CREATE TABLE utilisateuradmin (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomutilisateur VARCHAR(255),
  	motdepasse VARCHAR(255),
  	role VARCHAR(255)
);


# Créer une table catégorie

CREATE TABLE categorie (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomcategorie VARCHAR(255),
  	descriptioncategorie VARCHAR(255),
  	utilisateuradmin_id INT,
    FOREIGN KEY (utilisateuradmin_id) REFERENCES utilisateuradmin(id)
);


# Créer une table produit

CREATE TABLE produit (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomproduit VARCHAR(255),
  	descriptionproduit VARCHAR(255),
  	prix VARCHAR(255),
  	stock VARCHAR(255),
  	categorie_id INT,
  	FOREIGN KEY (categorie_id) REFERENCES categorie(id)
);

-- Créer une table client

CREATE TABLE client (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomclient VARCHAR(255),
  	email VARCHAR(255),
  	adresselivraison VARCHAR(255),
  	numtelephone VARCHAR(15)
);


-- Créer une table commande


CREATE TABLE commande (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datecommande DATETIME,
  	etatcommande VARCHAR(50),
  	client_id INT,
  	FOREIGN KEY (client_id) REFERENCES client(id)
);


# Créer une table produitcommande


CREATE TABLE produitcommande (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  	quantite VARCHAR(255),
    produit_id INT,
  	commande_id INT,
  	FOREIGN KEY (produit_id) REFERENCES produit(id),
  	FOREIGN KEY (commande_id) REFERENCES commande(id)
);


-- Ajout admin

INSERT INTO utilisateuradmin(nomutilisateur,motdepasse,role) VALUES
	('Davida','passwords','admin');
  
INSERT INTO categorie(nomcategorie, descriptioncategorie, utilisateuradmin_id) VALUES
  ('Electronique','Appareils et systèmes fonctionnant grâce a des composants électroniques',1),
  ('Fruits','Produits naturels délicieux et nutritifs',1),
  ('Légumes','Eléments essentiels d\'une alimentation',1),
  ('Fourniture de Bureau','Articles nécessaires pour les activités professionnels et éducatives',1),
  ('Vêtements et accessoirs','Articles portées sur le corps',1);

 
SELECT * FROM categorie;
 
 
 -- Ajout des produits
 
INSERT INTO produit(nomproduit, descriptionproduit, prix, stock, categorie_id) VALUES
  ('Smartphones','Téléphones mobile dotés de fonctionnalités avancées', '150000Ar','50 pièces',1),
  ('Ordinateur','Dispositif éléctronique capable d\éxecuter divers tâche','500000Ar','25 pieèces',1),
  ('Tablette','Appareils portable qui se situe entre les smartphone et les ordinateur portable', '200000Ar','10 pièces',1),
  ('Appareil photo', 'Dispositif électronique utilisés pour capturer des images ou vidéo','20 pièces','800000Ar',1);

  
INSERT INTO produit(nomproduit, descriptionproduit, prix, stock, categorie_id) VALUES
  ('Mangue','Fruits tropicaux sucrés et crémeux','3000Ar','60kg',2),
  ('Orange', 'Acidulés, source élevé de vitamine C','2000Ar', '20kg',2);
  
  
INSERT INTO produit(nomproduit, descriptionproduit, prix, stock, categorie_id) VALUES
  ('Bananas', 'Fruits doux et énergétiques, riche en potassium','1500Ar','10 kg',2),
  ('Cahier','Livres à pages blanche et lignées pour écrire','1500Ar', '20 paquets',3),
  ('Crayons','Pour dessiner ou écrire','500Ar','2 Boites',3),
  ('Gommes', 'Pour effacer le crayon','300Ar', '15 pièces',3),
  ('Chemise','Vêtements à manches pour le haut du corps','20000Ar','2 Bal',5),
  ('Robes','Vêtements d\'une seule pièce','20000Ar','3 pièces',5),
  ('Jupes','Forme de tube','15000Ar','10 pièces',5),
  ('Cravates','Autour du cou, souvent avec des costumes','5000 Ar', '20 pièces',5);
  
# Affiche toutes les produits

SELECT * FROM produit;
# Affiche les produits et les catégorie

SELECT produit.nomproduit, categorie.nomcategorie FROM produit JOIN categorie WHERE produit.categorie_id=categorie.id;

# Insertion clients

INSERT INTO client (nomclient, email, adresselivraison, numtelephone)
VALUES
    ('Kwesi', 'kwesi@example.com', 'Tanambao 5','+261340000000'),
    ('Isabel', 'isabel@example.com', 'Barikadimy', '+261330000000'),
    ('Idriss','idriss@example.com', 'Mangarano II', '+261320000000'),
    ('Marc','marc@example.com', 'Andranomadio', '+261341111111'),
    ('Ntsay','ntsay@example.com', 'Tanambao 2', '+261331111111'),
    ('Jean', 'jean@example.com', 'Mangarano I', '+261321111111'),
    ('Andry','andry@example.com', 'Toamasina', '+261332200000'),
    ('Hery', 'hery@example.com', 'Mangarano II', '+261332200000'),
    ('Ratsiraka', 'ratsiraka@example.com', 'Tomasina', '+261322200000');

#Affiche toutes les clients

SELECT * FROM client;


#Ajouts des commandes

INSERT INTO commande(datecommande, etatcommande, client_id) VALUES
  ('2023-10-15 10:25','En cours',1),
  ('2023-10-13 14:25', 'Livré',1),
  ('2023-10-17 08:30', 'En attente',3),
  ('2023-10-15 10:28', 'En cours',4),
  ('2023-10-15 10:20','En cours',5),
  ('2023-10-13 14:25', 'Livré',6),
  ('2023-10-16 08:30', 'En attente',7),
  ('2023-10-15 10:27', 'Annulé',4),
  ('2023-10-14 09:30', 'Livré',8),
  ('2023-10-15 10:30', 'En attente',9);
   
   
#Affiches toutes les commandes

SELECT * FROM commande;

#Insertion produitcommande
    
INSERT INTO produitcommande(quantite, produit_id,commande_id) VALUES
  ('3',1,1),
  ('1',2,1),
  ('1',3,1),
  ('1',4,1),
  ('3 kg',5,4),
  ('2 kg',6,4),
  ('1',7,5),
  ('2 paquets',8,5),
  ('2 Boite',9,6),
  ('5 pièces',10,6),
  ('1 Bal',11,7),
  ('1',12,9),
  ('3',13,9),
  ('10',14,7),
  ('3 kg',5,8),
  ('1',3,2),
  ('1',1,2),
  ('1',2,2);

#Compte le nombre de commande

SELECT COUNT(id) FROM produitcommande;

# Affiche nom cliet date commande état commande

SELECT client.id, client.nomclient ,commande.datecommande,commande.etatcommande FROM commande JOIN client WHERE commande.client_id = client.id;

#Affiche le nom du client, date commande, état commande, nom produit , quantité

SELECT produitcommande.id, client.nomclient ,commande.datecommande,commande.etatcommande,produit.nomproduit,produitcommande.quantite FROM commande, produitcommande, produit JOIN client WHERE commande.client_id = client.id AND produitcommande.commande_id=commande.id and produit.id=produitcommande.produit_id;


# Recherche nombre commande annuler ou en cours

SELECT * FROM commande WHERE commande.etatcommande = "Annulé" OR commande.etatcommande = "En cours";

# Nombre produit vendu

SELECT SUM(quantite) FROM produitcommande;

# Nombre produit reste

SELECT produit.stock, produitcommande.quantite FROM produit INNER JOIN produitcommande WHERE produitcommande.id = produit.id;

# Je vois une erreur sur stock

#Je modifie les erreur

UPDATE produit SET stock = 10 WHERE stock = "800000Ar";  

UPDATE produit SET stock = "25 pièces" WHERE stock = "25 pieèces"; 


# verfication de modification

SELECT produit.stock, produitcommande.quantite FROM produit JOIN produitcommande WHERE produitcommande.id = produit.id;

# Ajout colonne resteStock

ALTER TABLE produit ADD COLUMN resteStock INT

#Verifier l'ajout du resteStock

SELECT * FROM produit;

# Supprime colonne resteStock

ALTER TABLE produit DROP COLUMN resteStock;

#Affiche les noms du clients, des produits, des catégorie, date commande, état commande et quantité

SELECT produitcommande.id, client.nomclient ,produit.nomproduit,categorie.nomcategorie,commande.datecommande,commande.etatcommande,produitcommande.quantite FROM commande, produitcommande, produit, categorie, client WHERE commande.client_id = client.id AND produitcommande.commande_id=commande.id and produit.id=produitcommande.produit_id and produit.categorie_id=categorie.id;

















