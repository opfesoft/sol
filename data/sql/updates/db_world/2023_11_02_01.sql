UPDATE `smart_scripts` SET `action_param5` = 0 WHERE `action_type` = 69 AND `action_param5` > 0;
UPDATE `smart_scripts` SET `target_type` = 8 WHERE `action_type` = 69 AND `target_type` != 8 AND (ABS(`target_x`) > 50 OR ABS(`target_y`) > 50 OR ABS(`target_z`) > 50);
