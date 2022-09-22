drop database if exists `computer`;
create database `computer`;
use `computer`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `name` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` varchar(255),
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL default 'active',
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;
 
 
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;
 
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  
	foreign key (user_id) references user(id),
	foreign key (role_id) references roles(id)
);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `name` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL default 'active',
  `description` varchar(255) NOT NULL,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `name` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL default 'active',
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
`id` int unsigned NOT NULL auto_increment unique,
`name` varchar(255) NOT NULL,
`code` varchar(50) NOT NULL,
`title` varchar(255) NOT NULL,
`description` varchar(500) NOT NULL,
`characteristic` varchar(300) NOT NULL,
`img_link` varchar(255) NOT NULL,
`price` DECIMAL(15,0),
  `status` varchar(20) NOT NULL default 'active',
`new_price` DECIMAL(15,0) AS ( price * (100-discount) / 100 ),
`discount` tinyint unsigned NOT NULL,
`quantity` decimal(10,2),
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

) AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `product_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  
	foreign key (product_id) references product(id),
	foreign key (tag_id) references tag(id)
);

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  
	foreign key (product_id) references product(id),
	foreign key (category_id) references category(id)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `user_id` int unsigned NOT NULL,
  `total` DECIMAL(15,0) NOT NULL,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
	foreign key (user_id) references user(id)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `user_id` int unsigned NOT NULL,
  `shipping` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(15,0) NOT NULL,
  `note` varchar(255),
  `buyer_name` varchar(255) NOT NULL,
  `status` varchar(20),
  `mobile` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
	foreign key (user_id) references user(id)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `cart_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `price` DECIMAL(15,0) NOT NULL,
  `discount` tinyint unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
	foreign key (cart_id) references cart(id),
	foreign key (product_id) references product(id)
    
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id`  int unsigned NOT NULL auto_increment unique,
  `product_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `price` DECIMAL(15,0) NOT NULL,
  `discount` tinyint unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
	foreign key (product_id) references product(id),
	foreign key (order_id) references orders(id)
    
) AUTO_INCREMENT=1;
