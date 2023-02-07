-- CreateTable
CREATE TABLE `Product` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` TEXT NOT NULL,
    `price` INTEGER UNSIGNED NOT NULL,
    `images` JSON NOT NULL,
    `stock_status` VARCHAR(191) NOT NULL,
    `stock_quantity` INTEGER UNSIGNED NOT NULL,
    `on_sale` BOOLEAN NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_first_name` VARCHAR(191) NOT NULL,
    `customer_last_name` VARCHAR(191) NOT NULL,
    `customer_address` VARCHAR(191) NOT NULL,
    `customer_postcode` VARCHAR(6) NOT NULL,
    `customer_city` VARCHAR(191) NOT NULL,
    `customer_email` VARCHAR(191) NOT NULL,
    `customer_phone` VARCHAR(20) NOT NULL,
    `order_total` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderItem` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER UNSIGNED NOT NULL,
    `qty` INTEGER UNSIGNED NOT NULL,
    `item_price` INTEGER UNSIGNED NOT NULL,
    `item_total` INTEGER UNSIGNED NOT NULL,
    `order_id` INTEGER UNSIGNED NOT NULL,

    UNIQUE INDEX `OrderItem_order_id_key`(`order_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `OrderItem` ADD CONSTRAINT `OrderItem_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItem` ADD CONSTRAINT `OrderItem_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
