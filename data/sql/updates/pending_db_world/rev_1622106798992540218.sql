INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1622106798992540218');

-- Noblegarden items:
-- 6833: White Tuxedo Shirt
-- 6835: Black Tuxedo Pants
-- 7806: Lollipop
-- 7807: Candy Bar
-- 7808: Chocolate Square
-- 7809: Easter Dress
-- 19028: Elegant Dress

-- Creatures who drop Noblegarden items:
-- 423: Redridge Mongrel
-- 2020: Bloodfeather Wind Witch
-- 3197: Burning Blade Fanatic
-- 3448: Tonga Runetotem
DELETE FROM `creature_loot_template` WHERE `entry` IN (423, 2020, 3197, 3448) AND `item` IN (6833, 6835, 7806, 7807, 7808, 7809, 19028);
