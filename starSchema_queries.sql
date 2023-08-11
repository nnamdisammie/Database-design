-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mangata_StarSchema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mangata_StarSchema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mangata_StarSchema` DEFAULT CHARACTER SET utf8 ;
USE `Mangata_StarSchema` ;

-- -----------------------------------------------------
-- Table `Mangata_StarSchema`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_StarSchema`.`Products` (
  `ProductKey` INT NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Subcategory` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ProductKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_StarSchema`.`Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_StarSchema`.`Time` (
  `TimeKey` INT NOT NULL,
  `FullDate` DATE NOT NULL,
  `Year` INT NOT NULL,
  `Quarter` VARCHAR(45) NOT NULL,
  `Month` INT NOT NULL,
  `Event` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`TimeKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_StarSchema`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_StarSchema`.`Location` (
  `LocationKey` INT NOT NULL,
  `Continent` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_StarSchema`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_StarSchema`.`Sales` (
  `Saleskey` INT NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Cost` DECIMAL NOT NULL,
  `Shipping` DECIMAL NOT NULL,
  `Quantity` INT NOT NULL,
  `Location` INT NOT NULL,
  `ProductKey` INT NOT NULL,
  `TimeKey` INT NOT NULL,
  PRIMARY KEY (`Saleskey`),
  INDEX `product_fk_idx` (`ProductKey` ASC) VISIBLE,
  INDEX `time_fk_idx` (`TimeKey` ASC) VISIBLE,
  INDEX `location_fk_idx` (`Location` ASC) VISIBLE,
  CONSTRAINT `product_fk`
    FOREIGN KEY (`ProductKey`)
    REFERENCES `Mangata_StarSchema`.`Products` (`ProductKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `time_fk`
    FOREIGN KEY (`TimeKey`)
    REFERENCES `Mangata_StarSchema`.`Time` (`TimeKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_fk`
    FOREIGN KEY (`Location`)
    REFERENCES `Mangata_StarSchema`.`Location` (`LocationKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
