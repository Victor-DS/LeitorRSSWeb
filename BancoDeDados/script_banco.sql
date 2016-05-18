SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `ProjetoLPIIIDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `ProjetoLPIIIDB` ;

-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Usuarios` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Usuarios` (
  `idUsuarios` VARCHAR(40) NULL ,
  `nome` VARCHAR(60) NULL ,
  PRIMARY KEY (`idUsuarios`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Feeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Feeds` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Feeds` (
  `idFeed` INT NOT NULL AUTO_INCREMENT ,
  `feedURL` VARCHAR(200) NULL ,
  `nome` VARCHAR(45) NULL ,
  `descricao` VARCHAR(45) NULL ,
  `idioma` VARCHAR(45) NULL ,
  PRIMARY KEY (`idFeed`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Usuarios_has_Feeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Usuarios_has_Feeds` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Usuarios_has_Feeds` (
  `idUsuarios` VARCHAR(40) NOT NULL ,
  `idFeed` INT NOT NULL ,
  PRIMARY KEY (`idUsuarios`, `idFeed`) ,
  INDEX `fk_Usuarios_has_Feeds_Feeds1` (`idFeed` ASC) ,
  INDEX `fk_Usuarios_has_Feeds_Usuarios` (`idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Feeds_Usuarios`
    FOREIGN KEY (`idUsuarios` )
    REFERENCES `ProjetoLPIIIDB`.`Usuarios` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Feeds_Feeds1`
    FOREIGN KEY (`idFeed` )
    REFERENCES `ProjetoLPIIIDB`.`Feeds` (`feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Publicacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Publicacoes` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Publicacoes` (
  `idPublicacoes` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(145) NULL ,
  `link` VARCHAR(200) NULL ,
  `data` TIMESTAMP NULL ,
  `autor` VARCHAR(45) NULL ,
  `descricao` VARCHAR(500) NULL ,
  `conteudo` VARCHAR(1000) NULL ,
  `Feeds_idFeed` INT NOT NULL ,
  PRIMARY KEY (`idPublicacoes`, `Feeds_idFeed`) ,
  INDEX `fk_Publicacoes_Feeds1` (`Feeds_idFeed` ASC) ,
  CONSTRAINT `fk_Publicacoes_Feeds1`
    FOREIGN KEY (`Feeds_idFeed` )
    REFERENCES `ProjetoLPIIIDB`.`Feeds` (`feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Categorias_Por_Publicacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Categorias_Por_Publicacao` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Categorias_Por_Publicacao` (
  `categoria` VARCHAR(30) NOT NULL ,
  `Publicacoes_idPublicacoes` INT NOT NULL ,
  `Publicacoes_Feeds_idFeed` INT NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_idFeed`) ,
  INDEX `fk_Categorias_Por_Publicacao_Publicacoes1` (`Publicacoes_idPublicacoes` ASC, `Publicacoes_Feeds_idFeed` ASC) ,
  CONSTRAINT `fk_Categorias_Por_Publicacao_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_idFeed` )
    REFERENCES `ProjetoLPIIIDB`.`Publicacoes` (`idPublicacoes` , `Feeds_idFeed` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Lidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Lidos` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Lidos` (
  `foiLido` TINYINT(1) NULL ,
  `Publicacoes_idPublicacoes` INT NOT NULL ,
  `Publicacoes_Feeds_idFeed` INT NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_idFeed`) ,
  CONSTRAINT `fk_Lidos_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_idFeed` )
    REFERENCES `ProjetoLPIIIDB`.`Publicacoes` (`idPublicacoes` , `Feeds_idFeed` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
