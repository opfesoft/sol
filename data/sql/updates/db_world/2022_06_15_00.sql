--
DELETE FROM `spell_group` WHERE `spell_id` IN (8042,20005);
INSERT INTO `spell_group` (`id`, `spell_id`, `special_flag`) VALUES
(1014,8042,0),
(1014,20005,0);
