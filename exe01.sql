-- Crie um banco de dados para um serviço de um Games Online.
-- O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. 
-- O sistema trabalhará com as informações dos personagens do jogo.
-- O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas.

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
CREATE TABLE tb_classes (
id BIGINT AUTO_INCREMENT,
nomeclasse VARCHAR(255),
raca VARCHAR(255),
PRIMARY KEY(id)
);
-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
-- Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
CREATE TABLE tb_personagens (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255),
poderataque BIGINT,
poderdefesa BIGINT,
genero VARCHAR(255),
tb_classes_id BIGINT,
PRIMARY KEY(id),
CONSTRAINT fk_personagens_classes
FOREIGN KEY (tb_classes_id) REFERENCES tb_classes(id)
);

-- Insira 5 registros na tabela tb_classes.
INSERT INTO tb_classes(nomeclasse, raca)
VALUES("Mago","Elfo"),
("Ferreiro","Anão"),
("Saqueador","Fada"),
("Mago","Elfo Negro"),
("Guerreiro","Orc");

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
INSERT INTO tb_personagens(nome, poderataque, poderdefesa, genero, tb_classes_id)
VALUES("Castiel", 10000, 2000,"Masculino", 1),
("Ambrose",5500,8700,"Feminino", 1),
("Balthazar",6800,9000,"Masculino", 4),
("Atlantis",1900,1200,"Feminino", 2),
("Meeren",5700,1500,"Feminino", 4),
("Gandalf", 9000, 1740,"Masculino", 5),
("Saruman",2500, 3000, "Masculino",2),
("Pierce",3957,1500, "Masculino",3);

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT * FROM tb_personagens WHERE poderataque > 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

SELECT * FROM tb_personagens WHERE poderdefesa BETWEEN 1000 AND 2000 ORDER BY poderdefesa ASC;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT * FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes,
-- onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).

SELECT tb_personagens.id, nome, poderataque, poderdefesa, genero, tb_classes.nomeclasse, tb_classes.raca
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id
WHERE tb_classes_id = 4;