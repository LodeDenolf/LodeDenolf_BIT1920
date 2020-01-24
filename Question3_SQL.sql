-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema exam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `exam` ;

-- -----------------------------------------------------
-- Table `exam`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam`.`gene` (
  `gene_id` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `description_gene` VARCHAR(400) NULL,
  `chromsome` CHAR(2) NULL,
  PRIMARY KEY (`gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam`.`mutation` (
  `mutation_id` INT NOT NULL,
  `gene_id` INT NULL,
  `start` VARCHAR(45) NULL,
  `end` VARCHAR(45) NULL,
  PRIMARY KEY (`mutation_id`),
  INDEX `gene_id_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `gene_id`
    FOREIGN KEY (`gene_id`)
    REFERENCES `exam`.`gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam`.`syndrome` (
  `syndrome_id` INT NOT NULL,
  `name_syndrome` VARCHAR(45) NULL,
  `description_syndrome` VARCHAR(400) NULL,
  `mutation_id` INT NULL,
  `gene_id` INT NULL,
  PRIMARY KEY (`syndrome_id`),
  INDEX `mutation_id_idx` (`mutation_id` ASC) VISIBLE,
  INDEX `gene_id_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `mutation_id`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `exam`.`mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gene_id`
    FOREIGN KEY (`gene_id`)
    REFERENCES `exam`.`gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam`.`patient` (
  `patient_id` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `syndrome_id` INT NULL,
  `gender` ENUM("M", "V") NULL,
  `age_at_diagnosis` INT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `syndrome_id_idx` (`syndrome_id` ASC) VISIBLE,
  CONSTRAINT `syndrome_id`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `exam`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
