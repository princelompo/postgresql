-- ============================================
-- Schéma fil rouge : boutique en ligne
-- ============================================

DROP TABLE IF EXISTS order_items, orders, products, customers, categories CASCADE;

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ville VARCHAR(80),
    date_inscription DATE DEFAULT CURRENT_DATE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix NUMERIC(10,2) NOT NULL CHECK (prix >= 0),
    stock INT DEFAULT 0 CHECK (stock >= 0),
    category_id INT REFERENCES categories(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    date_commande TIMESTAMP DEFAULT NOW(),
    statut VARCHAR(20) DEFAULT 'en_attente'
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT REFERENCES products(id),
    quantite INT NOT NULL CHECK (quantite > 0),
    prix_unitaire NUMERIC(10,2) NOT NULL
);

-- Données de test
INSERT INTO categories (nom) VALUES ('Informatique'), ('Livres'), ('Maison');

INSERT INTO customers (nom, email, ville) VALUES
('Alice Dupont', 'alice@mail.com', 'Paris'),
('Bob Martin', 'bob@mail.com', 'Lyon'),
('Claire Petit', 'claire@mail.com', 'Marseille'),
('David Moreau', 'david@mail.com', 'Paris');

INSERT INTO products (nom, prix, stock, category_id) VALUES
('Laptop Pro 15', 1200.00, 10, 1),
('Souris sans fil', 25.50, 100, 1),
('Clavier mécanique', 89.90, 40, 1),
('SQL pour les nuls', 29.99, 50, 2),
('Clean Code', 39.90, 30, 2),
('Lampe LED', 19.99, 200, 3);

INSERT INTO orders (customer_id, statut) VALUES
(1, 'payee'), (1, 'expediee'), (2, 'en_attente'), (3, 'payee'), (4, 'annulee');

INSERT INTO order_items (order_id, product_id, quantite, prix_unitaire) VALUES
(1, 1, 1, 1200.00), (1, 2, 2, 25.50),
(2, 4, 3, 29.99),
(3, 3, 1, 89.90),
(4, 5, 2, 39.90), (4, 6, 1, 19.99),
(5, 2, 1, 25.50);