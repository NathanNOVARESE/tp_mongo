CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO utilisateurs (nom, email) VALUES 
('Alice Cyber', 'alice@ynov.com'),
('Bob Security', 'bob@ynov.com'),
('Charlie Docker', 'charlie@ynov.com'),
('David Root', 'david@ynov.com');