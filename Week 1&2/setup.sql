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