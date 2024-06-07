ALTER TABLE `creature_addon` RENAME COLUMN `isLarge` TO `addonFlags`;
ALTER TABLE `creature_template_addon` RENAME COLUMN `isLarge` TO `addonFlags`;
ALTER TABLE `creature_addon` MODIFY `addonFlags` INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE `creature_template_addon` MODIFY `addonFlags` INT(10) UNSIGNED NOT NULL DEFAULT 0;
