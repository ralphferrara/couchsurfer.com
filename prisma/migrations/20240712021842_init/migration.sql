-- CreateTable
CREATE TABLE `users` (
    `id_user` INTEGER NOT NULL AUTO_INCREMENT,
    `fid_media` INTEGER NULL,
    `user_status` VARCHAR(191) NOT NULL DEFAULT 'PC',
    `user_level` INTEGER NOT NULL DEFAULT 0,
    `user_username` VARCHAR(191) NOT NULL,
    `user_gender` VARCHAR(191) NULL DEFAULT 'M',
    `user_dob` DATETIME(3) NULL,
    `user_city` VARCHAR(191) NULL,
    `user_state` VARCHAR(191) NULL,
    `user_postal` VARCHAR(191) NULL,
    `user_country` VARCHAR(191) NULL,
    `user_latitude` DOUBLE NOT NULL DEFAULT 0.0,
    `user_longitude` DOUBLE NOT NULL DEFAULT 0.0,
    `user_joined` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_login` DATETIME(3) NOT NULL,
    `user_bio` VARCHAR(191) NULL,

    UNIQUE INDEX `users_user_username_key`(`user_username`),
    PRIMARY KEY (`id_user`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `media` (
    `id_media` INTEGER NOT NULL AUTO_INCREMENT,
    `fid_user` INTEGER NULL,
    `fid_area` INTEGER NULL,
    `fid_folder` INTEGER NULL,
    `media_status` VARCHAR(191) NOT NULL DEFAULT 'QUE',
    `media_type` VARCHAR(191) NULL,
    `media_area` VARCHAR(191) NULL,
    `media_timestamp` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `media_meta` VARCHAR(191) NULL,
    `media_error` VARCHAR(191) NOT NULL DEFAULT 'MEROK',

    PRIMARY KEY (`id_media`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `connections` (
    `id_connection` INTEGER NOT NULL AUTO_INCREMENT,
    `fid_user` INTEGER NULL,
    `fid_recipient` INTEGER NULL,
    `fid_area` INTEGER NULL,
    `connection_status` VARCHAR(191) NULL,
    `connection_area` VARCHAR(191) NOT NULL DEFAULT 'USER',
    `connection_type` VARCHAR(191) NULL,
    `connection_timestamp` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `connection_completed` DATETIME(3) NULL,

    PRIMARY KEY (`id_connection`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `media` ADD CONSTRAINT `media_fid_user_fkey` FOREIGN KEY (`fid_user`) REFERENCES `users`(`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `connections` ADD CONSTRAINT `connections_fid_user_fkey` FOREIGN KEY (`fid_user`) REFERENCES `users`(`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;
