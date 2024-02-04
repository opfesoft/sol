ALTER TABLE `creature_addon` ADD COLUMN `maxAggroRadius` FLOAT UNSIGNED DEFAULT NULL AFTER `isLarge`;
ALTER TABLE `creature_template_addon` ADD COLUMN `maxAggroRadius` FLOAT UNSIGNED DEFAULT NULL AFTER `isLarge`;
