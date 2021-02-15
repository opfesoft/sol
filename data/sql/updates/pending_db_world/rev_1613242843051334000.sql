INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1613242843051334000');

/* Adjust Position and remove piece of Ham from Reese Langston
   Source: https://wow.gamepedia.com/Reese_Langston
*/

UPDATE `creature_equip_template` SET `ItemID2` = 0 WHERE `CreatureID` = 1327;
UPDATE `creature` SET `position_x` = -8606, `position_y` = 383.926, `position_z` = 102.924, `orientation` = 3.79168 WHERE `guid` = 79751;
