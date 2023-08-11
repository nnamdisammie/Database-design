-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mangata_gallo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mangata_gallo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mangata_gallo` DEFAULT CHARACTER SET utf8 ;
USE `Mangata_gallo` ;

-- -----------------------------------------------------
-- Table `Mangata_gallo`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_gallo`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_gallo`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_gallo`.`DeliveryAddress` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NOT NULL,
  `PostCode` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_gallo`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_gallo`.`Shipping` (
  `Ship ID` INT NOT NULL,
  `Ship Date` DATE NOT NULL,
  `ShipMode` VARCHAR(45) NOT NULL,
  `AddressID INT` INT NOT NULL,
  `ShipCost` DECIMAL NOT NULL,
  PRIMARY KEY (`Ship ID`),
  INDEX `Address_fk_id_idx` (`AddressID INT` ASC) VISIBLE,
  CONSTRAINT `Address_fk_id`
    FOREIGN KEY (`AddressID INT`)
    REFERENCES `Mangata_gallo`.`DeliveryAddress` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_gallo`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_gallo`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `AmountInStock` INT NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Subcategory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mangata_gallo`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mangata_gallo`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `OrderPriority` VARCHAR(45) NOT NULL,
  `Discount` DECIMAL NOT NULL,
  `Ship` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customer_fk_id_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `product_fk_id_idx` (`ProductID` ASC) VISIBLE,
  INDEX `Shipping_fk_id_idx` (`Ship` ASC) VISIBLE,
  CONSTRAINT `customer_fk_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Mangata_gallo`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_fk_id`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Mangata_gallo`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Shipping_fk_id`
    FOREIGN KEY (`Ship`)
    REFERENCES `Mangata_gallo`.`Shipping` (`Ship ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
