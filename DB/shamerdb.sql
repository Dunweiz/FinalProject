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
  `username` VARCHAR(40) NOT NULL,
  `password` VARCHAR(400) NOT NULL,
  `role` VARCHAR(20) NULL,
  `enabled` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `complex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `complex` ;

CREATE TABLE IF NOT EXISTS `complex` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(200) NULL,
  `state` CHAR(2) NULL,
  `zip` CHAR(5) NULL,
  `image_url` VARCHAR(2000) NULL,
  `num_units` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile` ;

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `complex_id` INT NOT NULL,
  `email` VARCHAR(250) NULL,
  `first_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(30) NULL,
  `display_name` VARCHAR(200) NULL,
  `image_url` VARCHAR(2000) NULL,
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
  `complex_id` INT NOT NULL,
  `user_profile_id` INT NOT NULL,
  `title` VARCHAR(200) NULL,
  `description` TEXT NULL,
  `is_resolved` TINYINT(1) NULL,
  `created_date` DATETIME NULL,
  `resolved_date` DATETIME NULL,
  `resolution_description` TEXT NULL,
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
  `complaint_id` INT NOT NULL,
  `user_profile_id` INT NOT NULL,
  `text` TEXT NULL,
  `comment_date` DATETIME NULL,
  `vote` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_complaint1_idx` (`complaint_id` ASC),
  INDEX `fk_comment_user_profile1_idx` (`user_profile_id` ASC),
  CONSTRAINT `fk_comment_complaint1`
    FOREIGN KEY (`complaint_id`)
    REFERENCES `complaint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image` ;

CREATE TABLE IF NOT EXISTS `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `complaint_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
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
  `complex_id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `phone` VARCHAR(25) NULL,
  `email` VARCHAR(250) NULL,
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
  `user_profile_id` INT NOT NULL,
  `complex_id` INT NOT NULL,
  `comment` TEXT NULL,
  `last_update` DATETIME NULL,
  `rating` INT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`) VALUES (1, 'testuser', 'testuser', 'user', true);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`) VALUES (2, 'Ryan', 'ryan', 'user', true);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`) VALUES (3, 'Dunwei', 'dunwei', 'admin', true);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`) VALUES (4, 'Hatle', 'hatle', 'user', true);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`) VALUES (5, 'Chana', 'chana', 'user', true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `complex`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (1, 'SomeApartment', '123 Main', 'Chicago', 'IL', '60201', 'https://sgcweb.s3.wasabisys.com/bdcnetwork/s3fs-public/styles/content_display_image/public/Indie%20Apartments%20copy.jpg?itok=5-cykb0O', 500);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (2, 'The Landings', '301 S Williams Street', 'Denver', 'CO', '80209', 'https://siouxfalls.business/wp-content/uploads/2017/07/IMG_Jul6201753752PM-1024x695.jpg', 200);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (3, 'The Commons', '282 S Logan Street', 'Denver', 'CO', '80209', 'https://ocbj.media.clients.ellingtoncms.com/img/photos/2018/06/05/Rimrock-Apartments_t670.jpg?b3f6a5d7692ccc373d56e40cf708e3fa67d9af9d', 40);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (4, 'The Uncommons', '691 W Hampden Avenue', 'Englewood', 'CO', '80110', 'https://cdn.vox-cdn.com/thumbor/u2VxfDNZGeYg_mtU8zaZOHN7czE=/0x0:1921x1081/1820x1213/filters:focal(808x388:1114x694):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/54665147/Broadway_and_Magnolia_apartments_1.0.jpg', 300);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (5, 'Village Place Homes', '598 W Kenyon Av', 'Englewood', 'CO', '80110', 'https://1bht2ni6oc-flywheel.netdna-ssl.com/wp-content/uploads/2018/03/o0bswKvrIrLgnHGh2Oqe5YuQqKwXUW2mrbyq3mU-d1Q-1024x682.jpg', 250);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (6, 'Lake Gardens Pointe', '12098 E Mississippi Ave', 'Aurora', 'CO', '80112', 'https://finance-commerce.com/files/2016/09/Jefferson-at-Plymouth2.jpg', 100);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (7, 'Oaks Crossing', '5600 S Parker Rd', 'Aurora', 'CO', '80015', 'https://images1.apartments.com/i2/HWeQEvtGdgkGVmxvrJcUaUyi9TfDh08HPizPPrtG3Mo/117/west-fourplex-homes-austin-tx-primary-photo.jpg', 4);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (8, 'Ridge Place Court', '6101 S Prescott', 'Littleton', 'CO', '80120', 'https://mhpmag.com/wp-content/uploads/2018/08/6203-09-N.-Ravenswood.jpg', 25);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (9, 'Creek Square Crossing', '398 W Caley Dr', 'Littleton', 'CO', '80120', 'https://milehighcre.com/wp-content/uploads/2018/09/Belle-Creek-750x375.jpg', 75);
INSERT INTO `complex` (`id`, `name`, `street`, `city`, `state`, `zip`, `image_url`, `num_units`) VALUES (10, 'Park Village Landing', '16550 Keystone Blvd', 'Parker', 'CO', '80134', 'https://bloximages.chicago2.vip.townnews.com/southernchestercountyweeklies.com/content/tncms/assets/v3/editorial/9/68/968140fa-8262-11e9-bd7c-e3ef4e4c3c0d/5cef0a30a1948.image.jpg?resize=1200%2C695', 190);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `user_profile` (`id`, `user_id`, `complex_id`, `email`, `first_name`, `last_name`, `display_name`, `image_url`) VALUES (1, 1, 1, 'test@email.com', 'test', 'user', 'testuser', 'http://www.google.com');
INSERT INTO `user_profile` (`id`, `user_id`, `complex_id`, `email`, `first_name`, `last_name`, `display_name`, `image_url`) VALUES (2, 2, 2, 'coolpages@gmail.com', 'Cool', 'Pages', 'Randy', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy1deWezmcXMbXewBhXO_3q7O7YgBKUM8O703t3pbA3LK--5ZU');
INSERT INTO `user_profile` (`id`, `user_id`, `complex_id`, `email`, `first_name`, `last_name`, `display_name`, `image_url`) VALUES (3, 3, 3, 'sherlockholmes@hotmail.com', 'Sherlock', 'Holmes', 'Sherlock', 'https://previews.123rf.com/images/antonbrand/antonbrand1106/antonbrand110600069/9701517-cartoon-sherlock-holmes-with-a-magnifying-glass-isolated-on-white.jpg');
INSERT INTO `user_profile` (`id`, `user_id`, `complex_id`, `email`, `first_name`, `last_name`, `display_name`, `image_url`) VALUES (4, 4, 1, 'gonefishin@gmail.com', 'Gone', 'Fishin', 'GoneFishin', 'https://cdn.shopify.com/s/files/1/0065/4917/6438/products/a-woman-fixes-a-chair-for-free-and-fishing-boat-on-the-lake-background_1080x.jpg?v=1540441143');
INSERT INTO `user_profile` (`id`, `user_id`, `complex_id`, `email`, `first_name`, `last_name`, `display_name`, `image_url`) VALUES (5, 5, 2, 'psychfizz@yahoo.com', 'Psych', 'Fizz', 'PsychedelicFizzbuzz', 'https://www.clipartmax.com/png/middle/64-644163_female-woman-cartoon-avatar-%D0%BF%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D0%BA%D0%B0-%D0%BD%D0%B0-%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB-gif.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `complaint`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (1, 1, 1, 'Poop in the Elevator', 'This is gross.It\'s been here 3 days', false, '2019-02-12', NULL, NULL);
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (2, 1, 2, 'Blocked Potty', 'The toilet is blocked and we cannot bathe the children until it is cleared. ', false, '2019-02-19', NULL, NULL);
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (3, 2, 3, 'Flying Cockroaches', 'I have way too many roommates who pay no rent. They also fly, how gross is that?', false, '2019-03-01', NULL, NULL);
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (4, 3, 4, 'Kitchen Sink ', 'There\'s way too much hair in there and it backs up', false, '2019-03-08', NULL, NULL);
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (5, 4, 5, 'Hot Plumber Needed', ' When I\'m in the shower I turn on the water and I get hot. Could some nice repairman fix my pipes so I don\'t always get hot? ', false, '2019-03-15', NULL, NULL);
INSERT INTO `complaint` (`id`, `complex_id`, `user_profile_id`, `title`, `description`, `is_resolved`, `created_date`, `resolved_date`, `resolution_description`) VALUES (6, 5, 1, 'Smelly Man', 'This is to let you know there is a bad smell coming from the man next door.', false, '2019-03-16', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (1, 1, 2, 'he\'s right, still poop', '2019-02-25', -1);
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (2, 1, 1, 'at least it stopped smelling, now it\'s petrified', '2019-02-27', -1);
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (3, 1, 2, 'I\'ve invited my friends over to see it since they\'ve seen a lot of fossils in the area', '2019-03-03', -1);
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (4, 2, 3, 'my toilet is also blocked, but we usually bathe in the bathtub', '2019-02-28', -1);
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (5, 2, 4, 'strangely, my tub is backing up with brown water', '2019-03-05', -1);
INSERT INTO `comment` (`id`, `complaint_id`, `user_profile_id`, `text`, `comment_date`, `vote`) VALUES (6, 2, 5, 'at least the brown water isn\'t in your kitchen sink like mine', '2019-03-15', -1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `image`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (1, 1, 'https://lh3.googleusercontent.com/ePMv1RtUbs2NlLRy5HhlQzIdXaCMGa4eFW22143Ts8aehqJRmfLEAE7QoVW-13RgtACjARw=s85');
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (2, 1, 'http://www.thefossilforum.com/uploads/monthly_03_2010/post-1836-12677677858118_thumb.jpg');
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (3, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP1zb7LqZNPVCu1HhZZZyMYfQ5hXLaUsRoW_wHqqVucVfRZeWO');
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (4, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqnoqTq8VznIFC-Op5vUTLo0kfYX04yBghXZxQDYyxz6swVrTM2g');
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (5, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSreE1aXQLODjDv3KqTfV3TBJMG4q7vFQ0zM-afQ2ZJQHFRJFh3');
INSERT INTO `image` (`id`, `complaint_id`, `image_url`) VALUES (6, 3, 'https://askentomologists.files.wordpress.com/2015/07/306014_4882687660226_1530880296_n.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `contact` (`id`, `complex_id`, `name`, `phone`, `email`) VALUES (1, 1, 'Manager', '312-555-5555', 'manager@apartment.com');
INSERT INTO `contact` (`id`, `complex_id`, `name`, `phone`, `email`) VALUES (2, 2, 'Manager', '303-555-1111', 'manager@thelandings.com');
INSERT INTO `contact` (`id`, `complex_id`, `name`, `phone`, `email`) VALUES (3, 2, 'Leasing Agent', '303-555-2222', 'info@thecommons.com');
INSERT INTO `contact` (`id`, `complex_id`, `name`, `phone`, `email`) VALUES (4, 3, 'Maintenance', '303-555-3333', 'maintenance@theuncommons.com');
INSERT INTO `contact` (`id`, `complex_id`, `name`, `phone`, `email`) VALUES (5, 4, 'Grounds', '303-555-4444', 'grounds@home.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_complex_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `shamedb`;
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (1, 1, 1, 'what a great place', '2019/08/15', 5);
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (2, 1, 1, 'Wow, the siding is so dirty and moldy', '2019/02/10', 3);
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (3, 2, 2, 'There are so many bugs in my apartment, I feel ike I have multiple roommates', '2019/03/15', 3);
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (4, 3, 3, 'This place smells like weed all the time', '2019/04/20', 5);
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (5, 4, 4, 'My neighbors blast music, and it\'s not even good music. Management never responds to complaints', '2019/05/16', 2);
INSERT INTO `user_complex_rating` (`id`, `user_profile_id`, `complex_id`, `comment`, `last_update`, `rating`) VALUES (6, 5, 5, 'Maintenance trucks always block the driveway', '2019/06/25', 4);

COMMIT;

