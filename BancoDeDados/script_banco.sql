SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUsuarios` VARCHAR(40) NULL ,
  `nome` VARCHAR(60) NULL ,
  PRIMARY KEY (`idUsuarios`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`Feeds`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Feeds` (
  `feedURL` VARCHAR(120) NULL ,
  `nome` VARCHAR(45) NULL ,
  `descricao` VARCHAR(45) NULL ,
  `idioma` VARCHAR(45) NULL ,
  PRIMARY KEY (`feedURL`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios_has_Feeds`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Usuarios_has_Feeds` (
  `idUsuarios` VARCHAR(40) NOT NULL ,
  `feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`idUsuarios`, `feedURL`) ,
  INDEX `fk_Usuarios_has_Feeds_Feeds1` (`feedURL` ASC) ,
  INDEX `fk_Usuarios_has_Feeds_Usuarios` (`idUsuarios` ASC) ,
  CONSTRAINT `fk_Usuarios_has_Feeds_Usuarios`
    FOREIGN KEY (`idUsuarios` )
    REFERENCES `mydb`.`Usuarios` (`idUsuarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Feeds_Feeds1`
    FOREIGN KEY (`feedURL` )
    REFERENCES `mydb`.`Feeds` (`feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacoes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Publicacoes` (
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
    REFERENCES `mydb`.`Feeds` (`feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categorias_Por_Publicacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categorias_Por_Publicacao` (
  `categoria` VARCHAR(30) NOT NULL ,
  `Publicacoes_idPublicacoes` INT NOT NULL ,
  `Publicacoes_Feeds_feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_feedURL`) ,
  INDEX `fk_Categorias_Por_Publicacao_Publicacoes1` (`Publicacoes_idPublicacoes` ASC, `Publicacoes_Feeds_feedURL` ASC) ,
  CONSTRAINT `fk_Categorias_Por_Publicacao_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_feedURL` )
    REFERENCES `mydb`.`Publicacoes` (`idPublicacoes` , `Feeds_feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Lidos` (
  `foiLido` TINYINT(1) NULL ,
  `Publicacoes_idPublicacoes` INT NOT NULL ,
  `Publicacoes_Feeds_feedURL` VARCHAR(120) NOT NULL ,
  PRIMARY KEY (`Publicacoes_idPublicacoes`, `Publicacoes_Feeds_feedURL`) ,
  CONSTRAINT `fk_Lidos_Publicacoes1`
    FOREIGN KEY (`Publicacoes_idPublicacoes` , `Publicacoes_Feeds_feedURL` )
    REFERENCES `mydb`.`Publicacoes` (`idPublicacoes` , `Feeds_feedURL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
