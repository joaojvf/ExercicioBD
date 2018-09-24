-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema exemplo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exemplo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exemplo` DEFAULT CHARACTER SET utf8 ;
USE `exemplo` ;

-- -----------------------------------------------------
-- Table `exemplo`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  `senha` VARCHAR(50) NULL,
  `email` VARCHAR(145) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exemplo`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`empresa` (
  `cnpj` VARCHAR(45) NOT NULL,
  `razao_social` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `senha` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exemplo`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`endereco` (
  `cod` INT(11) NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  `numero` INT(11) NOT NULL,
  `cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_endereco_cliente_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_endereco_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `exemplo`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exemplo`.`ordem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`ordem_de_servico` (
  `numero` INT(11) NOT NULL AUTO_INCREMENT,
  `data_solicitacao` DATE NULL DEFAULT NULL,
  `prazo_entrega` INT(11) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_ordem_de_servico_cliente1_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_ordem_de_servico_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `exemplo`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exemplo`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`servico` (
  `cod_servico` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `tempo_medio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_servico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exemplo`.`servico_has_ordem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplo`.`servico_has_ordem_de_servico` (
  `id_os_servico` INT(11) NOT NULL AUTO_INCREMENT,
  `servico_id_servico` INT(11) NOT NULL,
  `ordem_de_servico_numero` INT(11) NOT NULL,
  `quantidade` INT(11) NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `prazo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_os_servico`, `servico_id_servico`, `ordem_de_servico_numero`),
  INDEX `fk_servico_has_ordem_de_servico_ordem_de_servico1_idx` (`ordem_de_servico_numero` ASC),
  INDEX `fk_servico_has_ordem_de_servico_servico1_idx` (`servico_id_servico` ASC),
  CONSTRAINT `fk_servico_has_ordem_de_servico_ordem_de_servico1`
    FOREIGN KEY (`ordem_de_servico_numero`)
    REFERENCES `exemplo`.`ordem_de_servico` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_ordem_de_servico_servico1`
    FOREIGN KEY (`servico_id_servico`)
    REFERENCES `exemplo`.`servico` (`cod_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
