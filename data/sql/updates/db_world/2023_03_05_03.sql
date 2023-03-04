--
DELETE FROM `spell_group` WHERE `id`=1001 AND `spell_id`=25661;
INSERT INTO `spell_group` (`id`, `spell_id`, `special_flag`) VALUES
(1001,25661,0);
