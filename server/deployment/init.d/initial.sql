SET CHARSET utf8mb4;
CREATE DATABASE IF NOT EXISTS banmeshi DEFAULT CHARACTER SET utf8mb4;

USE banmeshi;

CREATE TABLE ingredient (`id` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, `amount` INT NOT NULL, `unit` ENUM('unknown', 'quantity','grams') NOT NULL, `user_name` VARCHAR(255) NOT NULL,`created_at` BIGINT NOT NULL ,PRIMARY KEY(id));

CREATE TABLE cooked_food(`id` INT AUTO_INCREMENT NOT NULL, `user_name` VARCHAR(255) NOT NULL, `recipe_id` INT,`created_at` BIGINT NOT NULL , PRIMARY KEY(id) );

CREATE TABLE recipe (`id` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(255), `serving` INT NOT NULL, `recipe_url` VARCHAR(511), PRIMARY KEY(id) );

CREATE TABLE ingredients_for_recipe(`id` INT AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, `amount` INT NOT NULL, `unit` ENUM('unknown','quantity','grams') NOT NULL, `recipe_id` INT NOT NULL, PRIMARY KEY(id));

INSERT INTO recipe (name, serving, recipe_url) VALUES ('カレー','4','hoge.com');

INSERT INTO cooked_food (user_name, recipe_id, created_at) VALUES ('晩飯部','1', 949974600);

INSERT INTO ingredient (name, amount, unit, user_name, created_at) VALUES ('にんじん','2','quantity','晩飯部', 949974600);

INSERT INTO ingredients_for_recipe(name, amount, unit, recipe_id) VALUES ('にんじん','1','quantity',1);
INSERT INTO ingredients_for_recipe(name, amount, unit, recipe_id) VALUES ('たまねぎ','1','quantity',1);
INSERT INTO ingredients_for_recipe(name, amount, unit, recipe_id) VALUES ('じゃがいも','4','quantity',1);
INSERT INTO ingredients_for_recipe(name, amount, unit, recipe_id) VALUES ('牛肉','200','grams',1);