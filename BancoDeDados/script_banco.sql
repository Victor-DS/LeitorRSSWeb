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
  `feedURL` VARCHAR(120) NULL ,
  `nome` VARCHAR(45) NULL ,
  `descricao` VARCHAR(45) NULL ,
  `idioma` VARCHAR(45) NULL ,
  PRIMARY KEY (`feedURL`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoLPIIIDB`.`Usuarios_has_Feeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetoLPIIIDB`.`Usuarios_has_Feeds` ;

CREATE  TABLE IF NOT EXISTS `ProjetoLPIIIDB`.`Usuarios_has_Feeds` (
  `idUsuarios` VARCHAR(40) NOT NULL ,
  `feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`idUsuarios`, `feedURL`) ,
  INDEX `fk_Usuarios_has_Feeds_Feeds1` (`feedURL` ASC) ,
  INDEX `fk_Usuarios_has_Feeds_Usuarios` (`idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Feeds_Usuarios`
    FOREIGN KEY (`idUsuarios` )
    REFERENCES `ProjetoLPIIIDB`.`Usuarios` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Feeds_Feeds1`
    FOREIGN KEY (`feedURL` )
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
  `idPublicacoes` INT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NULL ,
  `link` VARCHAR(45) NULL ,
  `data` TIMESTAMP NULL ,
  `autor` VARCHAR(45) NULL ,
  `descricao` VARCHAR(45) NULL ,
  `conteudo` VARCHAR(45) NULL ,
  `Feeds_feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`idPublicacoes`, `Feeds_feedURL`) ,
  INDEX `fk_Publicacoes_Feeds1` (`Feeds_feedURL` ASC) ,
  CONSTRAINT `fk_Publicacoes_Feeds1`
    FOREIGN KEY (`Feeds_feedURL` )
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
  `Publicacoes_Feeds_feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_feedURL`) ,
  INDEX `fk_Categorias_Por_Publicacao_Publicacoes1` (`Publicacoes_idPublicacoes` ASC, `Publicacoes_Feeds_feedURL` ASC) ,
  CONSTRAINT `fk_Categorias_Por_Publicacao_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_feedURL` )
    REFERENCES `ProjetoLPIIIDB`.`Publicacoes` (`idPublicacoes` , `Feeds_feedURL` )
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
  `Publicacoes_Feeds_feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_feedURL`) ,
  CONSTRAINT `fk_Lidos_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_feedURL` )
    REFERENCES `ProjetoLPIIIDB`.`Publicacoes` (`idPublicacoes` , `Feeds_feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
