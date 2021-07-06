CREATE TABLE IF NOT EXISTS `funcoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE IF NOT EXISTS `cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `integrantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `cursos_id` INT NULL,
  `funcoes_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `cursos_id_idx` (`cursos_id` ASC) VISIBLE,
  INDEX `funcoes_id_idx` (`funcoes_id` ASC) VISIBLE,
  CONSTRAINT `cursos_id`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `funcoes_id`
    FOREIGN KEY (`funcoes_id`)
    REFERENCES `funcoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


INSERT INTO cursos (nome) VALUES ("Computação");
INSERT INTO cursos (nome) VALUES ("Mecânica");

INSERT INTO funcoes (nome) VALUES ("Direção");
INSERT INTO funcoes (nome) VALUES ("Assessoria");

INSERT INTO integrantes (nome, cpf, cursos_id, funcoes_id) VALUES ("Sarah", "123.623.535-00", 1, 2);
INSERT INTO integrantes (nome, cpf, cursos_id, funcoes_id) VALUES ("Maike", "156.673.047-32", 1, 2);

SELECT * 
FROM cursos;

SELECT * 
FROM funcoes;

SELECT *
FROM integrantes;


SELECT integrantes.id, integrantes.nome, integrantes.cpf, cursos.nome as curso, funcoes.nome as funcao
FROM integrantes
INNER JOIN cursos ON integrantes.cursos_id=cursos.id
INNER JOIN funcoes ON integrantes.funcoes_id=funcoes.id;