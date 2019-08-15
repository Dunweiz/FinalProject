SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `shamedb` ;
CREATE SCHEMA IF NOT EXISTS `shamedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `shamedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role` VARCHAR(100) NULL,
  `active` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `complex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `complex` ;

CREATE TABLE IF NOT EXISTS `complex` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `image_url` VARCHAR(45) NULL,
  `num_units` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile` ;

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `display_name` VARCHAR(45) NULL,
  `image_url` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `complex_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_profile_user1_idx` (`user_id` ASC),
  INDEX `fk_user_profile_complex1_idx` (`complex_id` ASC),
  CONSTRAINT `fk_user_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile_complex1`
    FOREIGN KEY (`complex_id`)
    REFERENCES `complex` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `complaint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `complaint` ;

CREATE TABLE IF NOT EXISTS `complaint` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `resolved_date` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `is_resolved` VARCHAR(45) NULL,
  `res_desc` VARCHAR(45) NULL,
  `user_profile_id` INT NOT NULL,
  `complex_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_complaint_user_profile1_idx` (`user_profile_id` ASC),
  INDEX `fk_complaint_complex1_idx` (`complex_id` ASC),
  CONSTRAINT `fk_complaint_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_complaint_complex1`
    FOREIGN KEY (`complex_id`)
    REFERENCES `complex` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_profile_id` VARCHAR(45) NULL,
  `text` VARCHAR(45) NULL,
  `comment_date` VARCHAR(45) NULL,
  `Vote` VARCHAR(45) NULL,
  `complaint_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_complaint1_idx` (`complaint_id` ASC),
  CONSTRAINT `fk_comment_complaint1`
    FOREIGN KEY (`complaint_id`)
    REFERENCES `complaint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image` ;

CREATE TABLE IF NOT EXISTS `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(45) NULL,
  `complaint_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_complaint1_idx` (`complaint_id` ASC),
  CONSTRAINT `fk_image_complaint1`
    FOREIGN KEY (`complaint_id`)
    REFERENCES `complaint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `complex_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_complex_idx` (`complex_id` ASC),
  CONSTRAINT `fk_contact_complex`
    FOREIGN KEY (`complex_id`)
    REFERENCES `complex` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_complex_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_complex_rating` ;

CREATE TABLE IF NOT EXISTS `user_complex_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `last_update` VARCHAR(45) NULL,
  `rating` VARCHAR(45) NULL,
  `complex_id` INT NOT NULL,
  `user_profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_complex_rating_complex1_idx` (`complex_id` ASC),
  INDEX `fk_user_complex_rating_user_profile1_idx` (`user_profile_id` ASC),
  CONSTRAINT `fk_user_complex_rating_complex1`
    FOREIGN KEY (`complex_id`)
    REFERENCES `complex` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_complex_rating_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO aptshamer@localhost;
 DROP USER aptshamer@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'aptshamer'@'localhost' IDENTIFIED BY 'aptshamer';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'aptshamer'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `active`) VALUES (1, 'testuser', 'testuser', 'user', true);

COMMIT;

