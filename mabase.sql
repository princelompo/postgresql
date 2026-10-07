CREATE TABLE ETUDIANTS (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE DEFAULT CURRENT_DATE,
    moyenne NUMERIC(4,2) CHECK (moyenne >= 0 AND moyenne <= 20),
    admis BOOLEAN DEFAULT FALSE
);

INSERT INTO ETUDIANTS (id, nom, prenom, email, date_inscription, moyenne, admis) VALUES  
(1, 'Dupont', 'Alice', 'alice.dupont@email.com', DEFAULT, 15.00, TRUE),
(2, 'Martin', 'Bob', 'bob.martin@email.com', DEFAULT, 7.99, FALSE),
(3, 'Petit', 'Claire', 'claire.petit@email.com', DEFAULT, 18.00, TRUE),
(4, 'Moreau', 'David', 'david.moreau@email.com', DEFAULT, 16.00, TRUE),
(5, 'Lemoine', 'Emma', 'emma.lemoine@email.com', DEFAULT, 14.00, TRUE),
(6, 'Rousseau', 'François', 'françois.rousseau@email.com', DEFAULT, 17.00, TRUE),
(7, 'Blanc', 'Hélène', 'hélène.blanc@email.com', DEFAULT, 19.00, TRUE),
(8, 'Garnier', 'Isabelle', 'isabelle.garnier@email.com', DEFAULT, 9.00, FALSE),
(9, 'Lefevre', 'Julien', 'julien.lefevre@email.com', DEFAULT, 8.00, FALSE),
(10, 'Morel', 'Karine', 'karine.morel@email.com', DEFAULT, 16.00, TRUE);