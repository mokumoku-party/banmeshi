SET CHARSET utf8mb4;
CREATE DATABASE IF NOT EXISTS banmeshi DEFAULT CHARACTER SET utf8mb4;

USE banmeshi;

CREATE TABLE ingredient (`id` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, `amount` INT NOT NULL, `unit` ENUM('quantity','grams') NOT NULL, `user_name` VARCHAR(255) NOT NULL, PRIMARY KEY(id));

CREATE TABLE cooked_food(`id` INT AUTO_INCREMENT NOT NULL, `user_name` VARCHAR(255) NOT NULL, `recipe_id` INT, PRIMARY KEY(id) );

CREATE TABLE recipe (`id` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(255), `ingredient` VARCHAR(1000), `serving` INT NOT NULL, `recipe_url` VARCHAR(511), PRIMARY KEY(id) );

INSERT INTO recipe (name, ingredient, serving, recipe_url) VALUES ('カレー', '{"name": "にんじん", "amount":1, "unit": 0},{"name": "玉ねぎ": "amount": 1, "unit": 0}, {"name": "じゃがいも", "amount": 4, "unit": 0}, {"name": "牛肉", "amount": 200, "unit": 1}','4','hoge.com');

INSERT INTO cooked_food (user_name, recipe_id) VALUES ('晩飯部','1');

INSERT INTO ingredient (name, amount, unit, user_name) VALUES ('にんじん','2','quantity','晩飯部');