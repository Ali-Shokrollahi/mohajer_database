-- Users table --
CREATE TABLE `Users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `bio` VARCHAR(255) NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `join_date` DATETIME NOT NULL,
    `status` ENUM('active','deactive') NOT NULL
);
ALTER TABLE
    `Users` ADD PRIMARY KEY(`id`);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `Users` ADD UNIQUE `users_phone_number_unique`(`phone_number`);

-- Contact table --
CREATE TABLE `Contacts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `full_name` VARCHAR(255) NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `created_date` DATETIME NOT NULL,
    `status` ENUM('unread','read') NOT NULL
);
ALTER TABLE
    `Contacts` ADD PRIMARY KEY(`id`);


CREATE TABLE `Category`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL
);
ALTER TABLE
    `Category` ADD PRIMARY KEY(`id`);
CREATE TABLE `Posts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `summary` VARCHAR(255) NULL,
    `content` TEXT NOT NULL,
    `created_date` DATETIME NOT NULL,
    `updated_date` DATETIME NOT NULL,
    `status` ENUM('draft','published','banned') NOT NULL,
    `owner_id` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL
);
ALTER TABLE
    `Posts` ADD PRIMARY KEY(`id`);