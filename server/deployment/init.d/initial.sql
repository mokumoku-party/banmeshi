SET CHARSET UTF8MB4;
CREATE DATABASE IF NOT EXISTS banmeshi DEFAULT CHARACTER SET utf8mb4;

use banmeshi;

create table ingredient (`id` int AUTO_INCREMENT NOT NULL, `name` VARCHAR(255) NOT NULL, amount int NOT NULL, unit ENUM('quantity','grams') NOT NULL, `user_name` VARCHAR(255) NOT NULL,  PRIMARY KEY(id));

create table cooked_food(`id` int AUTO_INCREMENT NOT NULL, `user_name` VARCHAR(255) NOT NULL, recipe_id int, PRIMARY KEY(id) );

create table recipe (`id` int AUTO_INCREMENT NOT NULL, name VARCHAR(255), ingredient VARCHAR(1000), serving int NOT NULL, recipe_url VARCHAR(511), PRIMARY KEY(id) );

INSERT INTO recipe (name, ingredient, serving, recipe_url) values ('カレー', '{"name": "にんじん", "amount":1, "unit": 0},{"name": "玉ねぎ": "amount": 1, "unit": 0}, {"name": "じゃがいも", "amount": 4, "unit": 0}, {"name": "牛肉", "amount": 200, "unit": 1}','4','hoge.com');

INSERT INTO cooked_food (user_name, recipe_id) values ('晩飯部','1');

INSERT INTO ingredient (name, amount, unit, user_name) values ('にんじん','2','quantity','晩飯部');