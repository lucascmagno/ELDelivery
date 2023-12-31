-- MySQL Script generated by MySQL Workbench
-- Thu Nov 16 15:39:19 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ELDelivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ELDelivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ELDelivery` DEFAULT CHARACTER SET utf8 ;
USE `ELDelivery` ;

-- -----------------------------------------------------
-- Table `ELDelivery`.`uf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`uf` (
  `iduf` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`iduf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`cidade` (
  `idcidade` INT NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`bairro` (
  `idbairro` INT NOT NULL AUTO_INCREMENT,
  `bairro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbairro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`logradouro` (
  `idlogradouro` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlogradouro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `uf_iduf` INT NOT NULL,
  `cidade_idcidade` INT NOT NULL,
  `bairro_idbairro` INT NOT NULL,
  `logradouro_idlogradouro` INT NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`idendereco`),
  INDEX `fk_endereco_uf_idx` (`uf_iduf` ASC),
  INDEX `fk_endereco_cidade1_idx` (`cidade_idcidade` ASC),
  INDEX `fk_endereco_bairro1_idx` (`bairro_idbairro` ASC),
  INDEX `fk_endereco_logradouro1_idx` (`logradouro_idlogradouro` ASC),
  CONSTRAINT `fk_endereco_uf`
    FOREIGN KEY (`uf_iduf`)
    REFERENCES `ELDelivery`.`uf` (`iduf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cidade1`
    FOREIGN KEY (`cidade_idcidade`)
    REFERENCES `ELDelivery`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_bairro1`
    FOREIGN KEY (`bairro_idbairro`)
    REFERENCES `ELDelivery`.`bairro` (`idbairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_logradouro1`
    FOREIGN KEY (`logradouro_idlogradouro`)
    REFERENCES `ELDelivery`.`logradouro` (`idlogradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `imagem` BLOB NULL,
  `descricao` TEXT NULL,
  `valor` DOUBLE NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`avaliacao` (
  `idavaliacao` INT NOT NULL AUTO_INCREMENT,
  `quantidade_estrela` INT NULL,
  PRIMARY KEY (`idavaliacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`restaurante` (
  `idrestaurante` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(14) NOT NULL,
  `nome_restaurante` VARCHAR(50) NOT NULL,
  `descricao` TEXT NULL,
  `horario_funcionamento` VARCHAR(45) NULL,
  `endereco_idendereco` INT NOT NULL,
  `produto_idproduto` INT NOT NULL,
  `avaliacao_idavaliacao` INT NOT NULL,
  PRIMARY KEY (`idrestaurante`),
  INDEX `fk_restaurante_endereco1_idx` (`endereco_idendereco` ASC),
  INDEX `fk_restaurante_produto1_idx` (`produto_idproduto` ASC),
  INDEX `fk_restaurante_avaliacao1_idx` (`avaliacao_idavaliacao` ASC),
  CONSTRAINT `fk_restaurante_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `ELDelivery`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurante_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `ELDelivery`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurante_avaliacao1`
    FOREIGN KEY (`avaliacao_idavaliacao`)
    REFERENCES `ELDelivery`.`avaliacao` (`idavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`veiculo` (
  `idveiculo` INT NOT NULL AUTO_INCREMENT,
  `tipo_veiculo` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `ano` YEAR NOT NULL,
  `chassi` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idveiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`Entregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`Entregador` (
  `idEntregador` INT NOT NULL AUTO_INCREMENT,
  `nome_entregador` VARCHAR(50) NOT NULL,
  `cnh` VARCHAR(12) NOT NULL,
  `veiculo_idveiculo` INT NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  `avaliacao_idavaliacao` INT NOT NULL,
  PRIMARY KEY (`idEntregador`),
  INDEX `fk_Entregador_veiculo1_idx` (`veiculo_idveiculo` ASC),
  INDEX `fk_Entregador_endereco1_idx` (`endereco_idendereco` ASC),
  INDEX `fk_Entregador_avaliacao1_idx` (`avaliacao_idavaliacao` ASC),
  CONSTRAINT `fk_Entregador_veiculo1`
    FOREIGN KEY (`veiculo_idveiculo`)
    REFERENCES `ELDelivery`.`veiculo` (`idveiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entregador_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `ELDelivery`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entregador_avaliacao1`
    FOREIGN KEY (`avaliacao_idavaliacao`)
    REFERENCES `ELDelivery`.`avaliacao` (`idavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(50) NOT NULL,
  `email` VARCHAR(75) NOT NULL,
  `contato` VARCHAR(14) CHARACTER SET 'ascii' NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`idClientes`),
  INDEX `fk_Clientes_endereco1_idx` (`endereco_idendereco` ASC),
  CONSTRAINT `fk_Clientes_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `ELDelivery`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`cupom_desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`cupom_desconto` (
  `idcupom_desconto` INT NOT NULL AUTO_INCREMENT,
  `nome_cupom` VARCHAR(45) NOT NULL,
  `desconto_reais` DOUBLE NOT NULL,
  PRIMARY KEY (`idcupom_desconto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`metodo_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`metodo_pagamento` (
  `idmetodo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmetodo_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ELDelivery`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ELDelivery`.`venda` (
  `idvenda` INT NOT NULL AUTO_INCREMENT,
  `restaurante_idrestaurante` INT NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `descricao` VARCHAR(75) NULL,
  `metodo_pagamento_idmetodo_pagamento` INT NOT NULL,
  `cupom_desconto_idcupom_desconto` INT NOT NULL,
  `valor_venda` DOUBLE NOT NULL,
  `data_venda` DATETIME NOT NULL,
  PRIMARY KEY (`idvenda`),
  INDEX `fk_venda_restaurante1_idx` (`restaurante_idrestaurante` ASC),
  INDEX `fk_venda_Clientes1_idx` (`Clientes_idClientes` ASC),
  INDEX `fk_venda_metodo_pagamento1_idx` (`metodo_pagamento_idmetodo_pagamento` ASC),
  INDEX `fk_venda_cupom_desconto1_idx` (`cupom_desconto_idcupom_desconto` ASC),
  CONSTRAINT `fk_venda_restaurante1`
    FOREIGN KEY (`restaurante_idrestaurante`)
    REFERENCES `ELDelivery`.`restaurante` (`idrestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `ELDelivery`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_metodo_pagamento1`
    FOREIGN KEY (`metodo_pagamento_idmetodo_pagamento`)
    REFERENCES `ELDelivery`.`metodo_pagamento` (`idmetodo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_cupom_desconto1`
    FOREIGN KEY (`cupom_desconto_idcupom_desconto`)
    REFERENCES `ELDelivery`.`cupom_desconto` (`idcupom_desconto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
