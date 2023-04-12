CREATE DATABASE keyboardwarrior;

USE keyboardwarrior;

CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (email)
);

CREATE TABLE competitions (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    duration INT(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE levels (
    id INT(11) NOT NULL AUTO_INCREMENT,
    competition_id INT(11) NOT NULL,
    level_number INT(11) NOT NULL,
    text VARCHAR(5000) NOT NULL,
    duration INT(11) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (competition_id) REFERENCES competitions(id)
);

CREATE TABLE scores (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    competition_id INT(11) NOT NULL,
    level_id INT(11) NOT NULL,
    score INT(11) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (competition_id) REFERENCES competitions(id),
    FOREIGN KEY (level_id) REFERENCES levels(id)
);
